import 'package:flutter/material.dart';
import 'package:prohealth/data/api_data/api_data.dart';

import '../../../../../../data/api_data/sm_data/sm_intake_data/sm_physician_info/physician_info.dart';
import '../../../../../resources/const_string.dart';
import '../../../../token/token_manager.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/intake/intake_physician_info.dart';

Future<ApiData> addPhysicianInfo({
  required BuildContext context,
  required String phyFirstName,
  required String phyLastName,
  required String phyPicoNo,
  required bool phyPicoStatus,
  required String phyEmail,
  required String phyContact,
  required String phySuffix,
  required String phyStreet,
  required String phySuite,
  required String phyCity,
  required String phyState,
  required String phyZipCode,
  required String phyFax,
  required int phyNPI,
  required String phyUPI,
  required String phyProtocols,
  required String phyNotes,
  required bool phyVerified,
  required String phyVerificationDetails,
  required String phyTrackingNotes,
}) async {
  try{
    final companyId = await TokenManager.getCompanyId();
    var data = {
      "phy_first_name": phyFirstName,
      "phy_last_name": phyLastName,
      "phy_pico_no": phyPicoNo,
      "phy_pico_status": phyPicoStatus,
      "phy_email": phyEmail,
      "phy_contact": phyContact,
      "phy_suffix": phySuffix,
      "phy_street": phyStreet,
      "phy_suite": phySuite,
      "phy_city": phyCity,
      "phy_state": phyState,
      "phy_zipCode": phyZipCode,
      "phy_fax": phyFax,
      "phy_NPI": phyNPI,
      "phy_UPI": phyUPI,
      "phy_protocols": phyProtocols,
      "phy_notes": phyNotes,
      "phy_verified": phyVerified,
      "phy_verificationDetails": phyVerificationDetails,
      "phy_trackingNotes": phyTrackingNotes,
    };

    print('New Org Corporate Doc $data');
    var response = await Api(context).post(
        path: IntakePhysicianInfo.addPhysicianMaster(),
        data: data);

    print('New ORG Doc Post::::$response ');

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("New Org Corporate Doc added ");
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!);
    }
    else {
      print("Error 1");
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message'][0]);
    }
  }
      catch(e){
        print("Error $e");
        print("Error 2");
        return ApiData(
            statusCode: 404, success: false, message: AppString.somethingWentWrong);
      }
}

///physician-master/patient/{patientId}
Future<List<PhysicianInfoPrefillData>> getPhysicianInfoById({
  required BuildContext context,
  required int patientId,
}) async {
  List<PhysicianInfoPrefillData> itemsList = [];
  try {
    final response = await Api(context).get(path: IntakePhysicianInfo.getByIdPhysicianMaster(patientId: patientId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(
          PhysicianInfoPrefillData(
            phyId: item['phy_id'] ?? 0,
            phyFirstName: item['phy_first_name'] ?? '',
            phyLastName: item['phy_last_name'] ?? '',
            phyPicoNo: item['phy_pico_no'] ?? '',
            phyPicoStatus: item['phy_pico_status'] ?? false,
            phyEmail: item['phy_email'] ?? '',
            phyContact: item['phy_contact'] ?? '',
            phySuffix: item['phy_suffix'] ?? '',
            phyStreet: item['phy_street']?? '',
            phySuite: item['phy_suite']?? '',
            phyCity: item['phy_city']?? '',
            phyState: item['phy_state']?? '',
            phyZipCode: item['phy_zipCode']?? '',
            phyFax: item['phy_fax']?? '',
            phyNPI: item['phy_NPI'] ?? 0,
            phyUPI: item['phy_UPI']?? '',
            phyProtocols: item['phy_protocols']?? '',
            phyNotes: item['phy_notes']?? '',
            phyVerified: item['phy_verified'] ?? false,
            phyVerificationDetails: item['phy_verificationDetails']?? '',
            phyTrackingNotes: item['phy_trackingNotes']?? '',
          ),
        );
      }
    } else {
      print('Api Error');
    }
    print("Response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

///patch
Future<ApiData> updatePhysicianMasterPatch({
  required BuildContext context,
  required int phyId,
  required String phyFirstName,
  required String phyLastName,
  required String? phySuffix,
  required String phyPicoNo,
  required bool phyPicoStatus,
  required String phyEmail,
  required String phyContact,
  required String? phyStreet,
  required String? phySuite,
  required String? phyCity,
  required String? phyState,
  required String? phyZipCode,
  required String? phyFax,
  required int? phyNPI,
  required String? phyUPI,
  required String? phyProtocols,
  required String? phyNotes,
  required bool? phyVerified,
  required String? phyVerificationDetails,
  required String? phyTrackingNotes,
}) async {
  try {
    final companyId = await TokenManager.getCompanyId();

    var response = await Api(context).patch(
      path: IntakePhysicianInfo.patchPhysicianMaster(id: phyId),
      data: {
        "phy_id": phyId,
        "phy_first_name": phyFirstName,
        "phy_last_name": phyLastName,
        "phy_suffix": phySuffix,
        "phy_pico_no": phyPicoNo,
        "phy_pico_status": phyPicoStatus,
        "phy_email": phyEmail,
        "phy_contact": phyContact,
        "phy_street": phyStreet,
        "phy_suite": phySuite,
        "phy_city": phyCity,
        "phy_state": phyState,
        "phy_zipCode": phyZipCode,
        "phy_fax": phyFax,
        "phy_NPI": phyNPI,
        "phy_UPI": phyUPI,
        "phy_protocols": phyProtocols,
        "phy_notes": phyNotes,
        "phy_verified": phyVerified,
        "phy_verificationDetails": phyVerificationDetails,
        "phy_trackingNotes": phyTrackingNotes,
      },
    );

    print('Physician Patch Response: $response');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiData(
        statusCode: response.statusCode!,
        success: true,
        message: response.statusMessage!,
      );
    } else {
      return ApiData(
        statusCode: response.statusCode!,
        success: false,
        message: response.data['message'][0],
      );
    }
  } catch (e) {
    print("Error $e");
    return ApiData(
      statusCode: 404,
      success: false,
      message: AppString.somethingWentWrong,
    );
  }
}
