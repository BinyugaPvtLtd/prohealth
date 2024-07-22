import 'package:flutter/material.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/hr_module_repository/form_repository/form_general.dart';

Future<ApiData> addEmployeeEducation(BuildContext context,
    String code,
    int userID,
    String firstName,
    String lastName,
    int departmentId,
    int employeeTypeId,
    String expertise,
    int cityId,
    int countryId,
    int zoneId,
    String SSNNbr,
    String primaryPhoneNbr,
String secondryPhoneNbr,
    String workPhoneNbr,
    String regOfficId,
    String personalEmail,
    String workEmail,
    String address,

    String emergencyContact,
    String covreage,
    String employment,
    String gender,
    String status,
    String service,
    String imgurl,
    String resumeurl,
int companyId,
    String onboardingStatus,
    String driverLicenceNbr,


    String rehirable,
    String position,
    String finalAddress,
    String type,
    String reason,
    int finalPayCheck,

    int grossPay,
    int netPay,
    String methods,
    String materials,
    String race,




    String state




    ) async {
  try {
    var response = await Api(context).post(
      path: ProgressBarPageone.postgeneralscreen(),
      data: {
        "code": code,
        "userId": userID,
        "firstName": firstName,
        "lastName": lastName,
        "departmentId": departmentId,
        "employeeTypeId": employeeTypeId,
        "expertise": expertise,
        "cityId": cityId,
        "countryId": countryId,
        "zoneId": zoneId,
        "SSNNbr": SSNNbr,
        "primaryPhoneNbr": primaryPhoneNbr,
        "secondryPhoneNbr":secondryPhoneNbr,
        "workPhoneNbr": workPhoneNbr,
        "regOfficId": regOfficId,
        "personalEmail": personalEmail,
        "workEmail": workEmail,
        "address": address,
        "dateOfBirth": "2024-07-18T13:38:10.490Z",
        "emergencyContact": emergencyContact,
        "covreage": covreage,
        "employment": employment,
        "gender": gender,
        "status": status,
        "service":service,
        "imgurl": imgurl,
        "resumeurl": resumeurl,
        "companyId":companyId,
        "onboardingStatus": onboardingStatus,
        "driverLicenceNbr": driverLicenceNbr,
        "dateofTermination": "2024-07-18T13:38:10.490Z",
        "dateofResignation": "2024-07-18T13:38:10.490Z",
        "dateofHire": "2024-07-18T13:38:10.490Z",
        "rehirable": rehirable,
        "position": position,
        "finalAddress": finalAddress,
        "type": type,
        "reason": reason,
        "finalPayCheck":finalPayCheck,
        "checkDate": "2024-07-18T13:38:10.490Z",
        "grossPay":grossPay,
        "netPay":netPay,
        "methods": methods,
        "materials": materials,
        "race": race
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("General Added");
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