import 'package:flutter/material.dart';
import 'package:prohealth/app/services/api/api.dart';
import 'package:prohealth/app/services/api/repository/hr_module_repository/onboarding/onboarding_qualification.dart';
import 'package:prohealth/data/api_data/hr_module_data/onboarding_data/form_status_data.dart';

Future<FormModel?> getAckHealthRecord({
  required BuildContext context,
  required int employeeId,
}) async {
  List<SignedForm> signedForms = [];
  List<UnsignedForm> unsignedForms = [];
  var listData =[];
  try {
    final response = await Api(context).get(
      path: OnboardingQualificationRepo.employeeFormStatusGet(employeeId: employeeId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("API Response received");

      // Mapping the signed forms
      if (response.data['signedForms'] != null) {
        for (var signedForm in response.data['signedForms']) {
          signedForms.add(SignedForm(
            formHtmlTemplatesId: signedForm['formHtmlTemplatesId'] ?? 0,
            htmlname: signedForm['htmlname'] ?? '--',
            companyId: signedForm['company_Id'] ?? 0,
            signed: signedForm['signed'] ?? false,
          ));
        }
      }

      // Mapping the unsigned forms
      if (response.data['unsignedForms'] != null) {
        for (var unsignedForm in response.data['unsignedForms']) {
          unsignedForms.add(UnsignedForm(
            formHtmlTemplatesId: unsignedForm['formHtmlTemplatesId'] ?? 0,
            htmlname: unsignedForm['htmlname'] ?? '--',
            companyId: unsignedForm['company_Id'] ?? 0,
            signed: unsignedForm['signed'] ?? false,
          ));
        }
      }

      // Creating the FormsData object with the populated lists
      FormModel formModel = FormModel(
        signedForms: signedForms,
        unsignedForms: unsignedForms,
      );

      print("Signed Forms: $signedForms, Unsigned Forms: $unsignedForms");
      return formModel;
    } else {
      print("Error: Failed to fetch data");
      return null;
    }
  } catch (e) {
    print("Error occurred: $e");
    return null;
  }
}
