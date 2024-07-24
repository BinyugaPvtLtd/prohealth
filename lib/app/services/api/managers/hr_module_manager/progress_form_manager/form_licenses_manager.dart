import 'package:flutter/material.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/hr_module_repository/form_repository/form_general_repo.dart';

Future<ApiData> postlicensesscreen(
    BuildContext context,
    String country,
    int employeeId,
    String licenseUrl,
    String licensure,
    String licenseNumber,
    String org,
    String documentType


    ) async {
  try {
    var response = await Api(context).post(
      path: ProgressBarRepository.postlicensesscreen(),
      data: {
        "country": country,
        "employeeId": employeeId,
        "expDate": "2024-07-19T05:59:02.929Z",
        "issueDate": "2024-07-19T05:59:02.929Z",
        "licenseUrl": licenseUrl,
        "licensure": licensure,
        "licenseNumber": licenseNumber,
        "org": org,
        "documentType":documentType

      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("licenses Added");
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