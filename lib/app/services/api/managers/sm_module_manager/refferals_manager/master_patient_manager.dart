import 'package:flutter/material.dart';

import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/refferals/patient_refferal_repo.dart';

///  patient physician master
Future<List<PatientPhysicianMasterData>> getPatientPhysicianMaster({
  required BuildContext context,
}) async {
  List<PatientPhysicianMasterData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.patientPhysicianmaster(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientPhysicianMasterData(
            phy_id: item['phy_id']??0,
            phy_first_name: item['phy_first_name']??'--',
            phy_last_name: item['phy_last_name']??'--',
            phy_pico_no: item['phy_pico_no']??'',
            phy_pico_status: item['phy_pico_status']??false,
            phy_email: item['phy_email']??'--',
            phy_contact: item['phy_contact']??''
        ));
      }
    }
    else {
      print("patient physician master");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}


///  patient referral master
Future<List<PatientRefferalSourcesData>> getPatientreferralsMaster({
  required BuildContext context,
}) async {
  List<PatientRefferalSourcesData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.patientReffrealsSources(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientRefferalSourcesData(
            ref_source_id: item['ref_source_id']??0,
            source_name: item['source_name']??'',
            description: item['description']??'',
            referral_source_img_url: item['referral_source_img_url']??'',
            documentName:item['documentName']??''
        ));
      }
    }
    else {
      print("patient referrals master");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

///  patient Diagnosis master
Future<List<PatientDiagnosisMasterData>> getPatientDiagnosisMaster({
  required BuildContext context,
}) async {
  List<PatientDiagnosisMasterData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.getDiagnosisMaster(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientDiagnosisMasterData(
            dgnId: item['dgn_id']??0,
            dgnName: item['dgn_name']??'',
            dgnCode: item['dgn_code']??''

        ));
      }
    }
    else {
      print("patient Diagnosis master");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

///  patient referral master
Future<List<PatientRefferalSourcesData>> getPatientreferralsSearchMaster({
  required BuildContext context,
  required String nameSearch
}) async {
  List<PatientRefferalSourcesData> itemsData = [];
  try {
    final response = await Api(context).get(
      path: PatientRefferalsRepo.patientReffrealsSearchSources(searchPatient: nameSearch),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsData.add(PatientRefferalSourcesData(
            ref_source_id: item['ref_source_id']??0,
            source_name: item['source_name']??'',
            description: item['description']??'',
            referral_source_img_url: item['referral_source_img_url']??'',
            documentName:item['documentName']??''
        ));
      }
    }
    else {
      print("patient referrals master");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}