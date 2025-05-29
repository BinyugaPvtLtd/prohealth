import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/constants/app_config.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/establishment_data/pay_rates/pay_rates_finance_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/patient_insurances_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../../base64/encode_decode_base64.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/refferals/patient_refferal_repo.dart';
///get
Future<List<PatientModel>> getPatientReffrealsData({
  required BuildContext context,
  required int pageNo,
  required int nbrOfRows,
  required String isIntake,
  required String isArchived,
  required String isScheduled ,
  required String searchName,
  required String marketerId,
  required String referralSourceId,
  required String pcpId,
}) async {
  List<PatientModel> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientRefferals(pageNo: pageNo, nbrOfRows: nbrOfRows, isIntake: isIntake, isArchived: isArchived, isScheduled: isScheduled, searchName: searchName, marketerId: marketerId, referralSourceId: referralSourceId, pcpId: pcpId, ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
      //  String formatedTime =  DateFormat.jm().format( DateTime.parse(item['pt_refferal_date']));
        // print(item.containsKey('pt_img_url')); // Should be true
        // print(item['pt_img_url']);             // Should not be null

        itemsData.add(PatientModel(
          isScheduler: item['isScheduler']??false,
          schedulerTime: item['schedulerTime'] != null ?convertIsoToDayMonthYear(item['schedulerTime']):'--',
          is_selfPay: item['is_selfPay']??false,
          fk_rpti_id: item['fk_rpti_id']??0,
          isPotential: item['potential_duplicate'] ?? false,
          thresould: item['threshold']??0,
        //  ptTime: formatedTime,
          ptId: item['pt_id'],
          ptFirstName: item['pt_first_name'] ?? '',
          ptLastName: item['pt_last_name'] ?? '',
          ptContactNo: item['pt_contact_no'] ?? '',
          ptZipCode: item['pt_zip_code'] ?? '',
          ptChartNo: item['pt_chart_no'] ?? 0,
          ptSummary: item['pt_summary'] ?? '',
          ptRefferalDate: convertIsoToDayMonthYear(item['pt_refferal_date']),
          fkSrvId: item['fk_srv_id'] ?? 0,
          fkPtPrimaryDiagnosis: item['fk_pt_primary_diagnosis'] ?? 0,
          fkPtSecondaryDiagnosis: List<int>.from(item['fk_pt_secondary_diagnosis'] ?? []),
          fkPtRefferalSource: item['fk_pt_refferal_source'] ?? 0,
          fkPtPcp: item['fk_pt_pcp'] ?? 0,
          fkPtMarketer: item['fk_pt_marketer'] ?? 0,
          fkPtDiscplines: List<int>.from(item['fk_pt_discplines'] ?? []),
          ptCoverageArea: item['pt_coverage_area'] ?? 0,
          isIntake: item['is_intake'] ?? false,
          intakeTime:  item['intake_time']?.toString(), // != null ? DateTime.tryParse(item['intake_time']) : null,
          isArchieved: item['is_archieved'] ?? false,
          archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
         // insuranceId: item['insurance_id'] ?? 0,
          createdAt: DateTime.parse(item['created_at']),
          ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
         // ptImgUrl: item['pt_img_url'] ?? '',
          ptImgUrl: item['pt_img_url']?.toString() ?? '',
          fkempIdArchieved: item['fk_emp_id_archived'] ?? 0,
          documentName: item['document_name'] ?? "",
          service: ServiceModel(
            srvId: item['service']['srv_id'],
            srvName: item['service']['srv_name'],
            srvCode: item['service']['srv_code'],
          ),
          patientDiagnoses: (item['patientDiagnoses'] as List).map((d) {
            return PatientDiagnosesModel(
              rpt_dgn_id: d['dgn_id']??0,
              dgnName: d['dgn_name']??'',
              dgnCode: d['dgn_code']??'',
              fk_pt_id: d['fk_pt_id']??0,
              fk_dgn_id: d['fk_dgn_id']??0,
              rpt_pdgm: d['rpt_pdgm']??false,
              rpt_isPrimary: d['rpt_isPrimary']??false,
              color: d['color']??0,
            );
          }).toList(),

          referralSource: ReferralSourceModel(
            refSourceId: item['referralSource']['ref_source_id'],
            sourceName: item['referralSource']['source_name'],
            description: item['referralSource']['description'],
            referralSourceImgUrl: item['referralSource']['referral_source_img_url'],
          ),

          pcp: PCPModel(
            phyId: item['pcp']['phy_id'],
            phyFirstName: item['pcp']['phy_first_name'],
            phyLastName: item['pcp']['phy_last_name'],
            phyPicoNo: item['pcp']['phy_pico_no'],
            phyPicoStatus: item['pcp']['phy_pico_status'],
            phyEmail: item['pcp']['phy_email'],
            phyContact: item['pcp']['phy_contact'],
          ),

          marketer: MarketerModel(
            employeeId: item['marketer']['employeeId'] ?? 0,
            code: item['marketer']['code'] ?? '',
            firstName: item['marketer']['firstName'] ?? '',
            lastName: item['marketer']['lastName'] ?? '',
            expertise: item['marketer']['expertise'] ?? '',
            gender: item['marketer']['gender'] ?? '',
            imgurl: item['marketer']['imgurl'] ?? '',
            regOfficId: item['marketer']['regOfficId'] ?? '',
            onboardingStatus: item['marketer']['onboardingStatus'] ?? '',
            userId: item['marketer']['userId'] ?? 0,
            ssnNbr: item['marketer']['SSNNbr'] ?? '',
            address: item['marketer']['address'] ?? '',
            cityId: item['marketer']['cityId'] ?? 0,
            dateOfBirth: DateTime.parse(item['marketer']['dateOfBirth']),
            departmentId: item['marketer']['departmentId'] ?? 0,
            emergencyContact: item['marketer']['emergencyContact'] ?? '',
            employeeTypeId: item['marketer']['employeeTypeId'] ?? 0,
            employment: item['marketer']['employment'] ?? '',
            personalEmail: item['marketer']['personalEmail'] ?? '',
            primaryPhoneNbr: item['marketer']['primaryPhoneNbr'] ?? '',
            secondryPhoneNbr: item['marketer']['secondryPhoneNbr'] ?? '',
            service: item['marketer']['service'] ?? '',
            status: item['marketer']['status'] ?? '',
            workEmail: item['marketer']['workEmail'] ?? '',
            workPhoneNbr: item['marketer']['workPhoneNbr'] ?? '',
            companyId: item['marketer']['companyId'] ?? 0,
            createdAt:DateTime.parse(item['marketer']['createdAt']),
            resumeurl: item['marketer']['resumeurl'] ?? '',
            covreage: item['marketer']['covreage'] ?? '',
            approved: item['marketer']['approved']??false,
            terminationFlag: item['marketer']['terminationFlag'],
            zoneId: item['marketer']['zoneId'] ?? 0,
            countryId: item['marketer']['countryId'] ?? 0,
            checkDate: DateTime.parse(item['marketer']['checkDate']),
            dateofResignation: DateTime.parse(item['marketer']['dateofResignation']),
            dateofTermination: DateTime.parse(item['marketer']['dateofTermination']),
            finalAddress: item['marketer']['finalAddress'] ?? '',
            finalPayCheck: (item['marketer']['finalPayCheck'] ?? 0).toDouble(),
            grossPay: (item['marketer']['grossPay'] ?? 0).toDouble(),
            materials: item['marketer']['materials'] ?? '',
            methods: item['marketer']['methods'] ?? '',
            netPay: (item['marketer']['netPay'] ?? 0).toDouble(),
            reason: item['marketer']['reason'] ?? '',
            rehirable: item['marketer']['rehirable'] ?? '',
            type: item['marketer']['type'] ?? '',
            dateofHire:  DateTime.parse(item['marketer']['dateofHire']),
            position: item['marketer']['position'] ?? '',
            driverLicenceNbr: item['marketer']['driverLicenceNbr'] ?? '',
            race: item['marketer']['race'] ?? '',
            rating: item['marketer']['rating'] ?? '',
            signatureURL: item['marketer']['signatureURL'] ?? '',
            countyId: item['marketer']['countyId'] ?? 0,
            active: item['marketer']['active'],
            summary: item['marketer']['summary'] ?? '',
          ),
          disciplines: (item['disciplines'] as List).map((d) {
            return DisciplineModel(
              employeeTypeId: d['employeeTypeId'],
              employeeType: d['employeeType'],
              color: d['color'],
              abbreviation: d['abbreviation'],
              departmentId: d['DepartmentId'],
            );
          }).toList(),

            insurance: (item['patientInsurance'] as List).map((d){
              return InsuranceModel(
                  rptiId: d['rpti_id'],
                  fkptId: d['fk_pt_id'],
                  policy: d['rpti_policy'],
                  insuranceProvider: d['rpti_insurance_provider'],
                  insurancePlan: d['rpti_insurance_plan'],
                  eligibility: d['rpti_eligibility'],
                  authorization: d['rpti_authorization'],
                  time: d['']);
            }).toList()
          // insurance: (item['patientInsurance'] as List).map((i) {
          //   return InsuranceModel(
          //     rptiId: item['patientInsurance']['rpti_id'] ?? 0,
          //     fkptId: i['fk_pt_id'] ?? 0,
          //     policy: i['rpti_policy'] ?? "",
          //     insuranceProvider: i['rpti_insurance_provider'] ?? "",
          //     insurancePlan: i['rpti_insurance_plan']?? "",
          //     eligibility: i['rpti_eligibility']?? false,
          //     authorization: i['rpti_authorization']?? false,
          //     time: i['rpti_last_checked_time']?? "");
          // }).toList(),

        ));
      //  print("RPTI ID ::::::::::::::::::: ${item['patientInsurance']['rpti_id'].runtimeType}");
      }
      // 👇 Add this line to print total fetched records
      print("/////////Total records fetched from API: ${itemsData.length}");
    } else {
      print("patient referrals error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}


/// Eye button manager passing pt_id
Future<PatientModel> getPatientReffrealsDataUsingId({
  required BuildContext context,
  required int patientId
}) async {
  var itemsData;
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientRefferalsWithId(id: patientId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var item = response.data;
        String formatedTime =  DateFormat.jm().format( DateTime.parse(item['pt_refferal_date']));
        itemsData = PatientModel(
            isScheduler: item['isScheduler']??false,
            schedulerTime: item['schedulerTime'] != null ?convertIsoToDayMonthYear(item['schedulerTime']):'--',
          is_selfPay: item['is_selfPay']??false,
          fk_rpti_id: item['fk_rpti_id']??0,
          isPotential: item['potential_duplicate'] ?? false,
          thresould: item['threshold']??0,
        //  ptTime: formatedTime,
          ptId: item['pt_id'],
          ptFirstName: item['pt_first_name'] ?? '',
          ptLastName: item['pt_last_name'] ?? '',
          ptContactNo: item['pt_contact_no'] ?? '',
          ptZipCode: item['pt_zip_code'] ?? '',
          ptChartNo: item['pt_chart_no'] ?? 0,
          ptSummary: item['pt_summary'] ?? '',
          ptRefferalDate: convertIsoToDayMonthYear(item['pt_refferal_date']),
          fkSrvId: item['fk_srv_id'] ?? 0,
          fkPtPrimaryDiagnosis: item['fk_pt_primary_diagnosis'] ?? 0,
          fkPtSecondaryDiagnosis: List<int>.from(item['fk_pt_secondary_diagnosis'] ?? []),
          fkPtRefferalSource: item['fk_pt_refferal_source'] ?? 0,
          fkPtPcp: item['fk_pt_pcp'] ?? 0,
          fkPtMarketer: item['fk_pt_marketer'] ?? 0,
          fkPtDiscplines: List<int>.from(item['fk_pt_discplines'] ?? []),
          ptCoverageArea: item['pt_coverage_area'] ?? 0,
          isIntake: item['is_intake'] ?? false,
          intakeTime: item['intake_time'], // != null ? DateTime.tryParse(item['intake_time']) : null,
          isArchieved: item['is_archieved'] ?? false,
          archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
        //  insuranceId: item['insurance_id'] ?? 0,
          createdAt: DateTime.parse(item['created_at']),
          ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
          ptImgUrl: item['pt_img_url'] ?? '',
          fkempIdArchieved: item['fk_emp_id_archived'] ?? 0,
          documentName: item['document_name'] ?? "",
          service: ServiceModel(
            srvId: item['service']['srv_id'],
            srvName: item['service']['srv_name'],
            srvCode: item['service']['srv_code'],
          ),
          patientDiagnoses: (item['patientDiagnoses'] as List).map((d) {
            return PatientDiagnosesModel(
              rpt_dgn_id: d['dgn_id']??0,
              dgnName: d['dgn_name']??'',
              dgnCode: d['dgn_code']??'',
              fk_pt_id: d['fk_pt_id']??0,
              fk_dgn_id: d['fk_dgn_id']??0,
              rpt_pdgm: d['rpt_pdgm']??false,
              rpt_isPrimary: d['rpt_isPrimary']??false,
              color: d['color']??0,
            );
          }).toList(),

          referralSource: ReferralSourceModel(
            refSourceId: item['referralSource']['ref_source_id'],
            sourceName: item['referralSource']['source_name'],
            description: item['referralSource']['description'],
            referralSourceImgUrl: item['referralSource']['referral_source_img_url'],
          ),

          pcp: PCPModel(
            phyId: item['pcp']['phy_id'],
            phyFirstName: item['pcp']['phy_first_name'],
            phyLastName: item['pcp']['phy_last_name'],
            phyPicoNo: item['pcp']['phy_pico_no'],
            phyPicoStatus: item['pcp']['phy_pico_status'],
            phyEmail: item['pcp']['phy_email'],
            phyContact: item['pcp']['phy_contact'],
          ),

          marketer: MarketerModel(
            employeeId: item['marketer']['employeeId'] ?? 0,
            code: item['marketer']['code'] ?? '',
            firstName: item['marketer']['firstName'] ?? '',
            lastName: item['marketer']['lastName'] ?? '',
            expertise: item['marketer']['expertise'] ?? '',
            gender: item['marketer']['gender'] ?? '',
            imgurl: item['marketer']['imgurl'] ?? '',
            regOfficId: item['marketer']['regOfficId'] ?? '',
            onboardingStatus: item['marketer']['onboardingStatus'] ?? '',
            userId: item['marketer']['userId'] ?? 0,
            ssnNbr: item['marketer']['SSNNbr'] ?? '',
            address: item['marketer']['address'] ?? '',
            cityId: item['marketer']['cityId'] ?? 0,
            dateOfBirth: DateTime.parse(item['marketer']['dateOfBirth']),
            departmentId: item['marketer']['departmentId'] ?? 0,
            emergencyContact: item['marketer']['emergencyContact'] ?? '',
            employeeTypeId: item['marketer']['employeeTypeId'] ?? 0,
            employment: item['marketer']['employment'] ?? '',
            personalEmail: item['marketer']['personalEmail'] ?? '',
            primaryPhoneNbr: item['marketer']['primaryPhoneNbr'] ?? '',
            secondryPhoneNbr: item['marketer']['secondryPhoneNbr'] ?? '',
            service: item['marketer']['service'] ?? '',
            status: item['marketer']['status'] ?? '',
            workEmail: item['marketer']['workEmail'] ?? '',
            workPhoneNbr: item['marketer']['workPhoneNbr'] ?? '',
            companyId: item['marketer']['companyId'] ?? 0,
            createdAt:DateTime.parse(item['marketer']['createdAt']),
            resumeurl: item['marketer']['resumeurl'] ?? '',
            covreage: item['marketer']['covreage'] ?? '',
            approved: item['marketer']['approved'],
            terminationFlag: item['marketer']['terminationFlag'],
            zoneId: item['marketer']['zoneId'] ?? 0,
            countryId: item['marketer']['countryId'] ?? 0,
            checkDate: DateTime.parse(item['marketer']['checkDate']),
            dateofResignation: DateTime.parse(item['marketer']['dateofResignation']),
            dateofTermination: DateTime.parse(item['marketer']['dateofTermination']),
            finalAddress: item['marketer']['finalAddress'] ?? '',
            finalPayCheck: (item['marketer']['finalPayCheck'] ?? 0).toDouble(),
            grossPay: (item['marketer']['grossPay'] ?? 0).toDouble(),
            materials: item['marketer']['materials'] ?? '',
            methods: item['marketer']['methods'] ?? '',
            netPay: (item['marketer']['netPay'] ?? 0).toDouble(),
            reason: item['marketer']['reason'] ?? '',
            rehirable: item['marketer']['rehirable'] ?? '',
            type: item['marketer']['type'] ?? '',
            dateofHire:  DateTime.parse(item['marketer']['dateofHire']),
            position: item['marketer']['position'] ?? '',
            driverLicenceNbr: item['marketer']['driverLicenceNbr'] ?? '',
            race: item['marketer']['race'] ?? '',
            rating: item['marketer']['rating'] ?? '',
            signatureURL: item['marketer']['signatureURL'] ?? '',
            countyId: item['marketer']['countyId'] ?? 0,
            active: item['marketer']['active'],
            summary: item['marketer']['summary'] ?? '',
          ),
          disciplines: (item['disciplines'] as List).map((d) {
            return DisciplineModel(
              employeeTypeId: d['employeeTypeId'],
              employeeType: d['employeeType'],
              color: d['color'],
              abbreviation: d['abbreviation'],
              departmentId: d['DepartmentId'],
            );
          }).toList(),

            insurance: (item['patientInsurance'] as List).map((d){
              return InsuranceModel(
                  rptiId: d['rpti_id'],
                  fkptId: d['fk_pt_id'],
                  policy: d['rpti_policy'],
                  insuranceProvider: d['rpti_insurance_provider'],
                  insurancePlan: d['rpti_insurance_plan'],
                  eligibility: d['rpti_eligibility'],
                  authorization: d['rpti_authorization'],
                  time: d['rpti_last_checked_time'] ?? "");
            }).toList()

          // insurance: (item['patientInsurance'] as List).map((i) {
          //   return InsuranceModel(
          //       rptiId: item['patientInsurance']['rpti_id'] ?? 0,
          //       fkptId: i['fk_pt_id'] ?? 0,
          //       policy: i['rpti_policy'] ?? "",
          //       insuranceProvider: i['rpti_insurance_provider'] ?? "",
          //       insurancePlan: i['rpti_insurance_plan']?? "",
          //       eligibility: i['rpti_eligibility']?? false,
          //       authorization: i['rpti_authorization']?? false,
          //       time: i['rpti_last_checked_time']?? "");
          // }).toList(),
        );
    
    } else {
      print("patient referrals prefill error");
    }
    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

/// referal patient patch
Future<ApiData> updateReferralPatient(
{
    required BuildContext context,
    required int patientId,
     bool? isIntake,
     bool? isArchived,
    required bool isUpdatePatiendData,
     String? firstName,
     String? lastName,
     String? contactNo,
     String? zipCode,
     String? summary,
     int? serviceId,
     int? insuranceId,
  List<int>? disciplineIds,
    }) async {
  try {
    var response = await Api(context).patch(
      path: PatientRefferalsRepo.getPatientRefferalsWithId(id: patientId),
      data: isUpdatePatiendData == false? {
        "is_intake": isIntake,
        "is_archieved": isArchived,
      } : {
        "pt_first_name": firstName,
        "pt_last_name": lastName,
        "pt_contact_no": contactNo,
        "pt_zip_code": zipCode,
        "pt_summary": summary,
        "fk_srv_id":serviceId,
        "fk_pt_discplines":disciplineIds,
         "fk_rpti_id":insuranceId
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient updated ");
      // orgDocumentGet(context);
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!);
    } else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}


/// Services master
Future<List<ServicePatientReffralsData>> getReferealsServiceList({
  required BuildContext context,
}) async {
  List<ServicePatientReffralsData> itemsData = [];

  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getReffrealsServiceData(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(ServicePatientReffralsData(
            serviceId: item['srv_id']??0,
            serviceName: item['srv_name']??'',
            serviceCode: item['srv_code']??''));
      }
    } else {
      print("patient referrals Services error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

/// employee clinical
Future<List<EmployeeClinicalData>> getEmployeeClinicalInReffreals({
  required BuildContext context,
}) async {
  List<EmployeeClinicalData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getReffrealsEmployeeClinicalType(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(EmployeeClinicalData(
            emptypeId: item['employeeTypeId'] ?? 0,
            empType: item['employeeType'] ?? '',
            color: item['color'] ?? '',
            abbreviation: item['abbreviation'] ?? '',
            deptId: item['DepartmentId'] ?? 0
            ));
      }
    } else {
      print("patient referrals employee type error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}


/// insurance patient
Future<List<PatientInsurancesData>> getReffrealsPatientInsurance({
  required BuildContext context,
}) async {
  List<PatientInsurancesData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getReffrealsInsurance(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientInsurancesData(
            insurance_id: item['insurance_id']??0,
            insurance_policy: item['insurance_policy']??'',
            insurance_provider: item['insurance_provider']??'',
            insurance_plan: item['insurance_plan']??''

        ));
      }
    } else {
      print("patient referrals insurance error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

/// Insurance patient prefill
Future<PatientInsurancesData> getReffrealsPatientInsurancePrefill({
  required BuildContext context,
  required int insuranceId
}) async {
  var itemsData;
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getReffrealsInsuranceWithId(id: insuranceId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
        itemsData = PatientInsurancesData(
            insurance_id: response.data['insurance_id']??0,
            insurance_policy: response.data['insurance_policy']??'',
            insurance_provider: response.data['insurance_provider']??'',
            insurance_plan: response.data['insurance_plan']??''

        );

    } else {
      print("patient referrals insurance prefill error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}


///  patient documents
Future<List<PatientDocumentsData>> getReffrealsPatientDocuments({
  required BuildContext context,
  required int patientId
}) async {
  List<PatientDocumentsData> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientDocument(patientId: patientId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientDocumentsData(
            rptd_id: item['rptd_id']??0,
            fk_pt_id: item['fk_pt_id']??0,
            rptd_url: item['rptd_url']??'',
            rptd_created_at: convertIsoToDayMonthYear(item['rptd_created_at'])??'',
            rptd_created_by: item['rptd_id']??0, documentName: item['document_name']??"--",
            rptd_document_type: item['rptd_document_type'] ?? 0,
            rptd_content: item['rptd_content'] ?? ""
        ));
      }
      }
    else {
      print("patient Document error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}
///patient-document/patient/{patientId}/{documentType}
Future<List<PatientDocumentsData>> getReffrealsPatientDocumentsByDocType({
  required BuildContext context,
  required int patientId,
  required int documentType,
}) async {
  List<PatientDocumentsData> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate).toLocal(); // toLocal() if you want local timezone

    // Format date and time separated by a comma
    DateFormat dateFormat = DateFormat('yyyy-MM-dd, HH:mm:ss');

    // Format the datetime
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientDocumentByDocType(patientId: patientId,documentType: documentType),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientDocumentsData(
            rptd_id: item['rptd_id']??0,
            fk_pt_id: item['fk_pt_id']??0,
            rptd_url: item['rptd_url']??'',
            rptd_created_at: convertIsoToDayMonthYear(item['rptd_created_at'])??'',
            rptd_created_by: item['rptd_id']??0, documentName: item['document_name']??"--",
            rptd_document_type: item['rptd_document_type'] ?? 0,
            rptd_content: item['rptd_content'] ?? ""
        ));
      }
    }
    else {
      print("patient Document error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

///patient document billing attachment
Future<List<PatientDocumentsBillingData>> getReffrealsPatientDocumentsBillingAttachment({
  required BuildContext context,
  required int patientId,
}) async {
  List<PatientDocumentsBillingData> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientDocumentByDocType(patientId: patientId,documentType: AppConfig.billingAttachment),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientDocumentsBillingData(
            rptd_id: item['rptd_id']??0,
            fk_pt_id: item['fk_pt_id']??0,
            rptd_url: item['rptd_url']??'',
            rptd_created_at: convertIsoToDayMonthYear(item['rptd_created_at'])??'',
            rptd_created_by: item['rptd_id']??0, documentName: item['document_name']??"--",
            rptd_document_type: item['rptd_document_type'] ?? 0,
            rptd_content: item['rptd_content'] ?? ""
        ));
      }
    }
    else {
      print("patient Document error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

///patient document F2f get
Future<List<PatientDocumentsFtwoFData>> getReffrealsPatientDocumentsFaceTwoFace({
  required BuildContext context,
  required int patientId,
}) async {
  List<PatientDocumentsFtwoFData> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientDocumentF2FIntake(patientId: patientId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        //  String formatedTime =  DateFormat.jm().format( DateTime.parse(item['pt_refferal_date']));
        // print(item.containsKey('pt_img_url')); // Should be true
        // print(item['pt_img_url']);             // Should not be null

        itemsData.add(PatientDocumentsFtwoFData(
            f2f_id: item['f2f_id'] ?? 0,
            fk_pt_id: item['fk_pt_id'] ?? 0,
            rptd_F2FDate: item['rptd_F2FDate'] ?? "",
            fk_marketerId: item['fk_marketerId'] ?? 0,
            rptd_visitNote: item['rptd_visitNote'],
            rptd_F2Fappointment: item['rptd_F2Fappointment'],
            documentName: item['documentName'] ?? "",
            rptd_created_at: item['rptd_created_at'] ?? "",
            rptd_content: item['rptd_content'] ?? "",
            rptd_created_by: item['rptd_created_by'] ?? 0,

            documents: (item['documents'] as List).map((d){
              return FTwoFDocumentsModel(
                  f2f_doc_id: d['f2f_doc_id'] ?? 0,
                  fk_f2f_id: d['fk_f2f_id'] ?? 0,
                  f2f_doc_url: d['f2f_doc_url'] ?? "",
                  f2f_doc_name: d['f2f_doc_name'] ?? "",
                  f2f_doc_content: d['f2f_doc_content'] ?? "",
                  f2f_doc_created_at: d['f2f_doc_created_at'] ?? "",
                  f2f_doc_created_by: d['f2f_doc_created_by'] ?? 0,);
            }).toList(),
        ));
        //  print("RPTI ID ::::::::::::::::::: ${item['patientInsurance']['rpti_id'].runtimeType}");
      }
      // 👇 Add this line to print total fetched records
      print("/////////Total records fetched from API: ${itemsData.length}");
    } else {
      print("patient referrals error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

///patient document Consent
Future<List<PatientDocumentsConsentData>> getReffrealsPatientDocumentsConsent({
  required BuildContext context,
  required int patientId,
  required int doctypeId,
}) async {
  List<PatientDocumentsConsentData> itemsData = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getPatientDocumentByDocType(patientId: patientId,documentType: doctypeId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientDocumentsConsentData(
            rptd_id: item['rptd_id']??0,
            fk_pt_id: item['fk_pt_id']??0,
            rptd_url: item['rptd_url']??'',
            rptd_created_at: convertIsoToDayMonthYear(item['rptd_created_at'])??'',
            rptd_created_by: item['rptd_id']??0, documentName: item['document_name']??"--",
            rptd_document_type: item['rptd_document_type'] ?? 0,
            rptd_content: item['rptd_content'] ?? ""

        ));
      }
    }
    else {
      print("patient Document error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

/// Add Patient documents
Future<ApiData> postReferralPatientDocuments(
    {
      required BuildContext context,
      required int fk_pt_id,
      required String document_name,
      //required int rptd_created_by,
      int? rptd_document_type,
      required String rptd_content,

    }) async {
  try {
    var response = await Api(context).post(
      path: PatientRefferalsRepo.addPatientDocument(),
      data: {
        "fk_pt_id": fk_pt_id,
        "document_name": document_name,
        "rptd_document_type": rptd_document_type,
        "rptd_content": rptd_content,
      }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Document added ");
      // orgDocumentGet(context);
      var uploadResponse = response.data;
      int rptd_id = uploadResponse['rptd_id'];
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!,
          rptd_id: rptd_id);
    } else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}


/// delete document
Future<ApiData> deletePatientDocument(
    {
      required BuildContext context,
      required int docId,
    }) async {
  try {
    var response = await Api(context).delete(
        path: PatientRefferalsRepo.deletePatientDocument(id: docId),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Document deleted ");
      // orgDocumentGet(context);
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!);
    } else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}

/// delete document
Future<ApiData> deleteFTwoFDocument(
    {
      required BuildContext context,
      required int id,
    }) async {
  try {
    var response = await Api(context).delete(
      path: PatientRefferalsRepo.deleteF2FDocument(id: id),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("F2F Document deleted ");
      // orgDocumentGet(context);
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!);
    } else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}
/// patient document upload base64
Future<ApiData> uploadPatientReffrelsDocuments({
  required BuildContext context,
  required int rptd_id,
  required dynamic documentFile,
  required String documentName,
  String? expiryDate
}) async {
  try {
    String documents = await
    AppFilePickerBase64.getEncodeBase64(
        bytes: documentFile);
    print("File :::${documents}" );
    var response = await Api(context).post(
      path: PatientRefferalsRepo.attachPatientDocument(rptd_id: rptd_id),
      data: {
        'base64':documents,
        "documentName":documentName
      },
    );
    print("Response ${response.toString()}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Documents uploded intake");
      // orgDocumentGet(context);
      //var uploadResponse = response.data;
     // int documentId = uploadResponse['employeeDocumentId'];
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage! );
    } else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}


/// Marketer data
Future<List<PatientMarketerData>> getMarketerWithDeptId({
  required BuildContext context,
  required int deptId
}) async {
  List<PatientMarketerData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getMarketerIdWithData(deptId: deptId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientMarketerData(
            employeeId: item['employeeId']??0,
            firstName: item['firstName']??'--',
            lastName: item['lastName']??'--',
            departmentId: item['departmentId']??0, employeeTypeId: item['employeeTypeId']??0
        ));
      }
    }
    else {
      print("Marketer data error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}
