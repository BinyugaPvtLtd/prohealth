
import 'package:flutter/material.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/intake/patient_intake_repo.dart';

/// Add Demographich
Future<ApiData> addPatientIntakeDemographich(
    {
      required BuildContext context,
      required int ptId,
    }) async {
  try {
    var response = await Api(context).post(
      path: PatientIntakeRepo.addPatientDemographich(),
      data: {
        'fk_pt_id':ptId
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Intake demograpich created ");
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