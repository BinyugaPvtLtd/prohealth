import 'package:flutter/material.dart';
import 'package:prohealth/data/api_data/hr_module_data/onboarding_data/onboarding_ack_health_data.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/hr_module_repository/onboarding/onboarding_qualification.dart';

///get ack health
Future<List<OnboardingAckHealthData>> getAckHealthRecord(BuildContext context,
    int EmpDocTypeMetaDataId,int EmpDocTypeSetupId ,int employeeId
    ) async {
  List<OnboardingAckHealthData> itemsList = [];
  try {
    final response = await Api(context)
        .get(path: OnboardingQualificationRepo.getAckHealthRecord(
        EmpDocTypeMetaDataId: EmpDocTypeMetaDataId,
        EmpDocTypeSetupId: EmpDocTypeSetupId,
        employeeId: employeeId

    ));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print("Org Document response:::::${itemsList}");
      print("1212");
      for(var item in response.data){
        itemsList.add(
          OnboardingAckHealthData(
            DocumentName: item['DocumentName'] ?? 'Document Name',
              employeeDocumentId: item['employeeDocumentId'] ?? 1,
              EmployeeDocumentTypeMetaDataId: item['EmployeeDocumentTypeMetaDataId'] ?? 10,
              EmployeeDocumentTypeSetupId: item['EmployeeDocumentTypeSetupId'] ?? 2,
              employeeId: item['employeeId'] ?? 1,
              DocumentUrl: item['DocumentUrl'] ?? 'null',
              ReminderThreshold: item['ReminderThreshold'] ?? '--',
              approved: item['approved'] ?? false)
          // EmployeeDocTabModal(
          //   employeeDocType: item['EmployeeDocumentType']== null ?"null" :item['EmployeeDocumentType'],
          //   employeeDocMetaDataId: item['EmployeeDocumentTypeMetaDataId']== null ? 0 :item['EmployeeDocumentTypeMetaDataId'],
          //   success: true,
          //   message: response.statusMessage!,
          // ),
        );
        print(".....Get ack Health......$response");
      }
      print("onboarding Document Response:::::${itemsList}");
    } else {
      print('onboarding Document');
      return itemsList;
    }
    // print("Org response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

///reject ack health
Future<ApiData> rejectOnboardAckHealthPatch(BuildContext context, int employeeDocumentId) async {
  try {
    var response = await Api(context).patch(
      path: OnboardingQualificationRepo.rejectAckHealthRecord(employeeDocumentId: employeeDocumentId),
      data: {},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Ack Health rejected$employeeDocumentId");
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

///approve ack health
Future<ApiData> approveOnboardAckHealthPatch(BuildContext context, int employeeDocumentId) async {
  try {
    var response = await Api(context).patch(
      path: OnboardingQualificationRepo.approveAckHealthRecord(employeeDocumentId: employeeDocumentId),
      data: {},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Ack Health Approved$employeeDocumentId");
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