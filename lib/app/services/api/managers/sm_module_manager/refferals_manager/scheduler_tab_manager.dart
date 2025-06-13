import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/refferals/patient_refferal_repo.dart';


class PatientSchedulerManager {
  Future<List<PatientModels>> getToBeSchedulerData({
    required BuildContext context,

  }) async {
    List<PatientModels> itemsData = [];

    String convertIsoToDayMonthYear(String isoDate) {
      DateTime dateTime = DateTime.parse(isoDate);
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      return dateFormat.format(dateTime);
    }

    try {
      final response = await Api(context).get(
        path: PatientRefferalsRepo.gettobescheduler(

        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        for (var item in response.data) {
          itemsData.add(PatientModels(
            ptId: item['pt_id'] ?? 0,
            ptFirstName: item['pt_first_name'] ?? '',
            ptLastName: item['pt_last_name'] ?? '',
            ptContactNo: item['pt_contact_no'] ?? '',
            ptZipCode: item['pt_zip_code'] ?? '',
            ptChartNo: item['pt_chart_no'] ?? 0,
            ptSummary: item['pt_summary'] ?? '',
            ptRefferalDate: convertIsoToDayMonthYear(item['pt_refferal_date']),
            ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
            ptImgUrl: item['pt_img_url'] ?? '',
            fkSrvId: item['fk_srv_id'] ?? 0,
            fkPtPrimaryDiagnosis: item['fk_pt_primary_diagnosis'] ?? 0,
            fkPtSecondaryDiagnosis: List<int>.from(item['fk_pt_secondary_diagnosis'] ?? []),
            fkPtRefferalSource: item['fk_pt_refferal_source'] ?? 0,
            fkPtPcp: item['fk_pt_pcp'] ?? 0,
            fkPtMarketer: item['fk_pt_marketer'] ?? 0,
            fkPtDiscplines: List<int>.from(item['fk_pt_discplines'] ?? []),
            ptCoverageArea: item['pt_coverage_area'] ?? 0,
            isIntake: item['is_intake'] ?? false,
            intakeTime: item['intake_time'],
            isArchieved: item['is_archieved'] ?? false,
            archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
            createdAt: DateTime.parse(item['created_at']),
            // fk_rpti_id: item['fk_rpti_id'] ?? 0,
            // is_selfPay: item['is_selfPay'] ?? false,
            // fkempIdArchieved: item['fkempIdArchieved'] ?? 0,
            // documentName: item['documentName'] ?? '',
            // isScheduler: item['isScheduler'] ?? false,
            // schedulerTime: item['schedulerTime'] ?? '',
            isPotential: item['is_potential_duplicate'] ?? false,
            thresould: item['threshold'] ?? 0,

            service: item['service'] != null
                ? ServiceModels(
              srvId: item['service']['srvId'] ?? 0,
              srvName: item['service']['srvName'] ?? '',
              srvCode: item['service']['srvCode'] ?? '',
            )
                : ServiceModels(srvId: 0, srvName: '', srvCode: ''),

            patientDiagnoses: (item['patientDiagnoses'] as List?)?.map((d) {
              return PatientDiagnosesModels(
                rptDgnId: d['dgn_id'] ?? 0,
                dgnName: d['dgn_name'] ?? '',
                dgnCode: d['dgn_code'] ?? '',
                fkPtId: d['fk_pt_id'] ?? 0,
                fkDgnId: d['fk_dgn_id'] ?? 0,
                rptPdgm: d['rpt_pdgm'] ?? false,
                rptIsPrimary: d['rpt_isPrimary'] ?? false,
                color: d['color'] ?? 0,
              );
            }).toList() ??
                [],

            referralSource: item['referralSource'] != null
                ? ReferralSourceModel(
              refSrcId: item['referralSource']['refSrcId'] ?? 0,
              refSrcName: item['referralSource']['refSrcName'] ?? '',
            )
                : ReferralSourceModel(refSrcId: 0, refSrcName: ''),

            pcp: item['pcp'] != null
                ? PCPModels(
              pcpId: item['pcp']['pcpId'] ?? 0,
              pcpName: item['pcp']['pcpName'] ?? '',
            )
                : PCPModels(pcpId: 0, pcpName: ''),

            marketer: item['marketer'] != null
                ? MarketerModels(
              marketerId: item['marketer']['marketerId'] ?? 0,
              marketerName: item['marketer']['marketerName'] ?? '',
            )
                : MarketerModels(marketerId: 0, marketerName: ''),

            insurance: (item['patientInsurance'] as List?)?.map((i) {
              return InsuranceModels(
                rptiId: i['rpti_id'],
                fkPtId: i['fk_pt_id'],
                policy: i['rpti_policy'],
                insuranceProvider: i['rpti_insurance_provider'],
                insurancePlan: i['rpti_insurance_plan'],
                eligibility: i['rpti_eligibility'],
                authorization: i['rpti_authorization'],
                time: i['rpti_last_checked_time'],
              );
            }).toList() ??
                [],

            // disciplines: (item['disciplines'] as List?)?.map((d) {
            //   return DisciplineModels(
            //     dscpId: d['dscp_id'],
            //     dscpName: d['dscp_name'],
            //   );
            // }).toList() ??
            //     [],
          ));

        }
        print("✔ Total records fetched from API: ${itemsData.length}");
      } else {
        print("❌ Error while fetching patient referrals data.");
      }

      return itemsData;
    } catch (e) {
      print("❌ Exception in getPatientReferralsData: $e");
      return itemsData;
    }
  }







  ///scheduler tab
///
  Future<List<PatientModelss>> getSchedulerData({
    required BuildContext context,
  }) async {
    List<PatientModelss> itemsData = [];

    String convertIsoToDayMonthYear(String isoDate) {
      DateTime dateTime = DateTime.parse(isoDate);
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      return dateFormat.format(dateTime);
    }

    try {
      final response = await Api(context).get(
        path: PatientRefferalsRepo.getscheduler(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        for (var item in response.data) {
          itemsData.add(PatientModelss(
            ptId: item['pt_id'] ?? 0,
            ptFirstName: item['pt_first_name'] ?? '',
            ptLastName: item['pt_last_name'] ?? '',
            ptContactNo: item['pt_contact_no'] ?? '',
            ptZipCode: item['pt_zip_code'] ?? '',
            ptChartNo: item['pt_chart_no'] ?? 0,
            ptSummary: item['pt_summary'] ?? '',
            ptRefferalDate: convertIsoToDayMonthYear(item['pt_refferal_date']),
            ptDateOfBirth: DateTime.parse(item['pt_date_of_birth']),
            ptImgUrl: item['pt_img_url'] ?? '',
            fkSrvId: item['fk_srv_id'] ?? 0,
            fkPtPrimaryDiagnosis: item['fk_pt_primary_diagnosis'] ?? 0,
            fkPtSecondaryDiagnosis: List<int>.from(item['fk_pt_secondary_diagnosis'] ?? []),
            fkPtRefferalSource: item['fk_pt_refferal_source'] ?? 0,
            fkPtPcp: item['fk_pt_pcp'] ?? 0,
            fkPtMarketer: item['fk_pt_marketer'] ?? 0,
            fkPtDiscplines: List<int>.from(item['fk_pt_discplines'] ?? []),
            ptCoverageArea: item['pt_coverage_area'] ?? 0,
            isIntake: item['is_intake'] ?? false,
            intakeTime: item['intake_time'] ?? '',
            isArchieved: item['is_archieved'] ?? false,
            archievedTime: item['archieved_time'] != null ? DateTime.tryParse(item['archieved_time']) : null,
            createdAt: DateTime.parse(item['created_at']),
            isPotential: item['is_potential_duplicate'] ?? false,
            thresould: item['threshold'] ?? 0,
            service: item['service'] != null
                ? ServiceModelss(
              srvId: item['service']['srvId'] ?? 0,
              srvName: item['service']['srvName'] ?? '',
              srvCode: item['service']['srvCode'] ?? '',
            )
                : ServiceModelss(srvId: 0, srvName: '', srvCode: ''),
            patientDiagnoses: (item['patientDiagnoses'] as List?)?.map((d) {
              return PatientDiagnosesModelss(
                rptDgnId: d['dgn_id'] ?? 0,
                dgnName: d['dgn_name'] ?? '',
                dgnCode: d['dgn_code'] ?? '',
                fkPtId: d['fk_pt_id'] ?? 0,
                fkDgnId: d['fk_dgn_id'] ?? 0,
                rptPdgm: d['rpt_pdgm'] ?? false,
                rptIsPrimary: d['rpt_isPrimary'] ?? false,
                color: d['color'] ?? 0,
              );
            }).toList() ??
                [],
            referralSource: item['referralSource'] != null
                ? ReferralSourceModelss(
              refSrcId: item['referralSource']['refSrcId'] ?? 0,
              refSrcName: item['referralSource']['refSrcName'] ?? '',
            )
                : ReferralSourceModelss(refSrcId: 0, refSrcName: ''),
            pcp: item['pcp'] != null
                ? PCPModelss(
              pcpId: item['pcp']['pcpId'] ?? 0,
              pcpName: item['pcp']['pcpName'] ?? '',
            )
                : PCPModelss(pcpId: 0, pcpName: ''),
            marketer: item['marketer'] != null
                ? MarketerModelss(
              marketerId: item['marketer']['marketerId'] ?? 0,
              marketerName: item['marketer']['marketerName'] ?? '',
            )
                : MarketerModelss(marketerId: 0, marketerName: ''),
            insurance: (item['patientInsurance'] as List?)?.map((i) {
              return InsuranceModelss(
                rptiId: i['rpti_id'],
                fkPtId: i['fk_pt_id'],
                policy: i['rpti_policy'],
                insuranceProvider: i['rpti_insurance_provider'],
                insurancePlan: i['rpti_insurance_plan'],
                eligibility: i['rpti_eligibility'],
                authorization: i['rpti_authorization'],
                time: i['rpti_last_checked_time'],
              );
            }).toList() ??
                [],
          ));
        }
        print("✔ Total records fetched from API: ${itemsData.length}");
      } else {
        print("❌ Error while fetching patient referrals data.");
      }

      return itemsData;
    } catch (e) {
      print("❌ Exception in getToBeSchedulerData: $e");
      return itemsData;
    }
  }
///
}






Future<PatientWithDisciplinesModel?> getPatientWithDisciplinesDataUsingId({
  required BuildContext context,
  required int patientId,
}) async {
  PatientWithDisciplinesModel? patientData;

  String convertIsoToDate(String isoDate) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(isoDate));
  }

  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getdisciplanebyid(pt_id: patientId), // Use correct repo path
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = response.data;

      final patientJson = item['pt_id'];
      final disciplinesJson = item['data'];

      patientData = PatientWithDisciplinesModel(
        patient: PatientModel(
          ptId: patientJson['pt_id'],
          ptFirstName: patientJson['pt_first_name'] ?? '',
          ptLastName: patientJson['pt_last_name'] ?? '',
          ptContactNo: patientJson['pt_contact_no'] ?? '',
          ptZipCode: patientJson['pt_zip_code'] ?? '',
          ptChartNo: patientJson['pt_chart_no'] ?? 0,
          ptSummary: patientJson['pt_summary'] ?? '',
          ptRefferalDate: convertIsoToDate(patientJson['pt_refferal_date']),
          fkSrvId: patientJson['fk_srv_id'] ?? 0,
          fkPtPrimaryDiagnosis: patientJson['fk_pt_primary_diagnosis'] ?? 0,
          fkPtSecondaryDiagnosis: List<int>.from(patientJson['fk_pt_secondary_diagnosis'] ?? []),
          fkPtRefferalSource: patientJson['fk_pt_refferal_source'] ?? 0,
          fkPtPcp: patientJson['fk_pt_pcp'] ?? 0,
          fkPtMarketer: patientJson['fk_pt_marketer'] ?? 0,
          fkPtDiscplines: List<int>.from(patientJson['fk_pt_discplines'] ?? []),
          ptCoverageArea: patientJson['pt_coverage_area'] ?? 0,
          isIntake: patientJson['is_intake'] ?? false,
          intakeTime: patientJson['intake_time'],
          isArchieved: patientJson['is_archieved'] ?? false,
          archievedTime: patientJson['archieved_time'] != null ? DateTime.tryParse(patientJson['archieved_time']) : null,
          createdAt: DateTime.parse(patientJson['created_at']),
          ptDateOfBirth: DateTime.parse(patientJson['pt_date_of_birth']),
          ptImgUrl: patientJson['pt_img_url'] ?? '',
          fk_rpti_id: patientJson['fk_rpti_id'],
          fkempIdArchieved: patientJson['fk_emp_id_archived'],
          is_selfPay: patientJson['is_selfPay'] ?? false,
          documentName: patientJson['document_name'],
          moveToScheduler: patientJson['moveToScheduler'] ?? false,
          moveToSchedulerDatetime: patientJson['moveToSchedulerDatetime'],
          isNonAdmit: patientJson['is_non_admit'] ?? false,
          admitDateTime: patientJson['admitDateTime'],
        ),
        disciplineAssignments: (disciplinesJson as List).map((d) {
          final empType = d['employeetypeId'];
          return DisciplineAssignmentModel(
            disciplineId: d['disciplineId'],
            employeedId: d['employeedId'],
            notesToClinician: d['notesToClinician'] ?? '',
            createdAt: DateTime.parse(d['createdAt']),
            updatedAt: DateTime.parse(d['updatedAt']),
            employeeType: EmployeeTypeModel(
              employeeTypeId: empType['employeeTypeId'],
              employeeType: empType['employeeType'],
              color: empType['color'],
              abbreviation: empType['abbreviation'],
              departmentId: empType['DepartmentId'],
            ),
          );
        }).toList(),
      );
    } else {
      print("Error: ${response.statusCode} fetching patient data.");
    }
  } catch (e) {
    print("Exception caught: $e");
  }

  return patientData;
}



Future<ApiData> patchDisciplineData({
  required BuildContext context,
  required int recordId,
  required String notesToClinician,
  required int fkEmployeeId,
}) async {
  try {
    var response = await Api(context).patch(
      path: PatientRefferalsRepo.patchDisciplineEndpoint(id: recordId),
      data: {
        "notesToClinician": notesToClinician,
        "fk_employeeId": fkEmployeeId,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Discipline Record Updated");
      return ApiData(
        statusCode: response.statusCode!,
        success: true,
        message: response.statusMessage ?? "Update successful",
      );
    } else {
      print("Error updating discipline");
      return ApiData(
        statusCode: response.statusCode!,
        success: false,
        message: response.data['message'] ?? "Unknown error",
      );
    }
  } catch (e) {
    print("Exception: $e");
    return ApiData(
      statusCode: 404,
      success: false,
      message: AppString.somethingWentWrong,
    );
  }
}
