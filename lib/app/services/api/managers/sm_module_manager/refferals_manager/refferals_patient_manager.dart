import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/establishment_data/pay_rates/pay_rates_finance_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/refferals/patient_refferal_repo.dart';

Future<List<PatientModel>> getPatientReffrealsData({
  required BuildContext context,
  required int pageNo,
  required int nbrOfRows,
  required String isIntake,
  required String isArchived
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
      path: PatientRefferalsRepo.getPatientRefferals(pageNo: pageNo, nbrOfRows: nbrOfRows, isIntake: isIntake, isArchived: isArchived),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        String formatedTime =  DateFormat.jm().format( DateTime.parse(item['pt_refferal_date']));
        itemsData.add(PatientModel(
          ptTime: formatedTime,
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
          intakeTime: item['intake_time'] != null ? DateTime.tryParse(item['intake_time']) : null,
          isArchieved: item['is_archieved'] ?? false,
          archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
          insuranceId: item['insurance_id'] ?? 0,
          createdAt: DateTime.parse(item['created_at']),
          ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
          ptImgUrl: item['pt_img_url'] ?? '',

          service: ServiceModel(
            srvId: item['service']['srv_id'],
            srvName: item['service']['srv_name'],
            srvCode: item['service']['srv_code'],
          ),

          primaryDiagnosis: DiagnosisModel(
            dgnId: item['primaryDiagnosis']['dgn_id'],
            dgnName: item['primaryDiagnosis']['dgn_name'],
            dgnCode: item['primaryDiagnosis']['dgn_code'],
          ),

          secondaryDiagnoses: (item['secondaryDiagnoses'] as List).map((d) {
            return DiagnosisModel(
              dgnId: d['dgn_id'],
              dgnName: d['dgn_name'],
              dgnCode: d['dgn_code'],
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
        ));
      }
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
          ptTime: formatedTime,
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
          intakeTime: item['intake_time'] != null ? DateTime.tryParse(item['intake_time']) : null,
          isArchieved: item['is_archieved'] ?? false,
          archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
          insuranceId: item['insurance_id'] ?? 0,
          createdAt: DateTime.parse(item['created_at']),
          ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
          ptImgUrl: item['pt_img_url'] ?? '',

          service: ServiceModel(
            srvId: item['service']['srv_id'],
            srvName: item['service']['srv_name'],
            srvCode: item['service']['srv_code'],
          ),

          primaryDiagnosis: DiagnosisModel(
            dgnId: item['primaryDiagnosis']['dgn_id'],
            dgnName: item['primaryDiagnosis']['dgn_name'],
            dgnCode: item['primaryDiagnosis']['dgn_code'],
          ),

          secondaryDiagnoses: (item['secondaryDiagnoses'] as List).map((d) {
            return DiagnosisModel(
              dgnId: d['dgn_id'],
              dgnName: d['dgn_name'],
              dgnCode: d['dgn_code'],
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
    required bool isIntake,
    required bool isArchived}) async {
  try {
    var response = await Api(context).patch(
      path: PatientRefferalsRepo.getPatientRefferalsWithId(id: patientId),
      data: {
        "is_intake": isIntake,
        "is_archieved": isArchived
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