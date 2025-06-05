

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/patient_insurance_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../../base64/encode_decode_base64.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/intake/patient_insurance_repo.dart';

Future<List<PatientInsuranceDocumentData>> getPatientEmergencyContact({
  required BuildContext context,
  required int ptId
}) async {
  List<PatientInsuranceDocumentData> itemsList = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('MM/dd/yyyy');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(path: PatientInsuranceRepo.getPatientInsuranceDocumentsWithPtId(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(PatientInsuranceDocumentData(
            insuranceDocumentId: item['insuranceDocumentId']??0,
            ptId: item['fk_pt_id']??0,
            docUrl: item['insuranceUrl']??'',
            isPrimary: item['is_primary']??false,
            docName: item['document_name']??'',
            createdAt: DateTime.parse(item['insuranceCreatedAt']),
            createdBy: item['insuranceCreatedBy']??'--',
            updatedAt: item['insuranceUpdatedAt'] != null ? convertIsoToDayMonthYear(item['insuranceUpdatedAt']) :'0000-00-00T00:00:00.000Z',
            updatedBy: item['insuranceUpdatedBy']??'--',

        ));
      }
    } else {
      print('Api Error');
    }
   // print("Response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}


Future<ApiData> addPatientInsuranceDocuments(
    {
      required BuildContext context,
      required int ptId,
      required String documentUrl,
      required String documentName,
      required bool isPrimary,
    }) async {
  try {
    var response = await Api(context).post(
      path: PatientInsuranceRepo.addPatientInsuranceDocuments(),
      data: {
        "fk_pt_id": ptId,
        "insuranceUrl": documentUrl,
        "document_name": documentName,
        "is_primary": isPrimary
      },
    );
    print('Response add::::${response}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient insurance document created ");
      // orgDocumentGet(context);
      var doumentId = response.data;
      int insuranceDocumentId = doumentId['insuranceDocumentId'];
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!,
          patientInsuranceDocId:insuranceDocumentId);
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

Future<ApiData> uploadPatientInsuranceDocuments({
  required BuildContext context,
  required int documentId,
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
      path: PatientInsuranceRepo.attachPatientInsuranceDocuments(documentid: documentId),
      data: {
        'base64':documents,
        "documentName":documentName
      },
    );
    print("Response ${response.toString()}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient insurance document uploaded");
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


Future<ApiData> deletePatientInsuranceDocument(
    {
      required BuildContext context,
      required int documentId,
    }) async {
  try {
    var response = await Api(context).delete(
      path: PatientInsuranceRepo.deletePatientInsuranceDocuments(documentid: documentId),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient insurance document deleted");
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

/// insurance info
Future<List<PatientInsuranceInfoData>> getPatientInsuranceinfo({
  required BuildContext context,
  required int ptId
}) async {
  List<PatientInsuranceInfoData> itemsList = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('MM/dd/yyyy');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(path: PatientInsuranceRepo.getPatientInsuranceInfo(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for(var item in response.data){
        print('rpti id type ${item['rpti_id'].runtimeType}');
        print('rpti id type ${item['rpti_id']}');
        itemsList.add(PatientInsuranceInfoData(
            rptiId: item['rpti_id']??0,
            fkPtId: item['fk_pt_id']??0,
            rptiPolicy: item['rpti_policy']??"",
            rptiInsuranceProvider:item['rpti_insurance_provider']??'',
            rptiInsurancePlan: item['rpti_insurance_plan']??'',
            rptiEligibility: item['rpti_eligibility']??false,
            rptiAuthorization: item['rpti_authorization']??false,
            rptiLastCheckedTime: item['rpti_last_checked_time'] == null ? '' : convertIsoToDayMonthYear(item['rpti_last_checked_time']),
            rptiName: item['rpti_name']??'',
            rptiType: item['rpti_type']??'',
            rptiCategory: item['rpti_category']??'',
            rptiStreet: item['rpti_street']??'',
            rptiSuite: item['rpti_suite']??'',
            rptiCity: item['rpti_city']??'',
            rptiState: item['rpti_state']??'',
            rptiZipcode: item['rpti_zipcode']??'',
            rptiContact: item['rpti_contact']??'',
            rptiEffectiveFrom: item['rpti_effectiveFrom'] == null ? '' : convertIsoToDayMonthYear(item['rpti_effectiveFrom']),
            rptiEffectiveTo: item['rpti_effectiveTo'] == null ? '' : convertIsoToDayMonthYear(item['rpti_effectiveTo']),
            rptiGroupNumber: item['rpti_groupNumber']??0,
            rptiGroupName: item['rpti_groupName']??'',
            rptiEmail: item['rpti_email']??'',
            rptiVerified: item['rpti_verified']??'',
            rptiComments: item['rpti_comments']??''

        ));
      }


    } else {
      print('Api Error');
    }
    // print("Response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

Future<ApiData> updatePatientInsuranceInfo(
    {
      required BuildContext context,
      required int id,
      required String rptiPolicy,
      required String rptiInsuranceProvider,
      required String rptiInsurancePlan,
      required bool rptiEligibility,
      required bool rptiAuthorization,
      required String rptiName,
      required String rptiType,
      required String rptiCategory,
      required String rptiStreet,
      required String rptiSuite,
      required String rptiCity,
      required String rptiState,
      required String rptiZipcode,
      required String rptiContact,
      required String rptiEffectiveFrom,
      required String rptiEffectiveTo,
      required int rptiGroupNumber,
      required String rptiGroupName,
      required String rptiEmail,
      required bool rptiVerified,
      required String rptiComments,
    }) async {
  try {
    var response = await Api(context).patch(
      path: PatientInsuranceRepo.updatePatientInsurance(id: id),
      data: {
        "rpti_policy": rptiPolicy,
        "rpti_insurance_provider": rptiInsuranceProvider,
        "rpti_insurance_plan": rptiInsurancePlan,
        "rpti_eligibility": rptiEligibility,
        "rpti_authorization": rptiAuthorization,
        "rpti_name": rptiName,
        "rpti_type": rptiType,
        "rpti_category": rptiCategory,
        "rpti_street": rptiStreet,
        "rpti_suite": rptiSuite,
        "rpti_city": rptiCity,
        "rpti_state": rptiState,
        "rpti_zipcode": rptiZipcode,
        "rpti_contact": rptiContact,
        "rpti_effectiveFrom": rptiEffectiveFrom,
        "rpti_effectiveTo": rptiEffectiveTo,
        "rpti_groupNumber": rptiGroupNumber,
        "rpti_groupName": rptiGroupName,
        "rpti_email": rptiEmail,
        "rpti_verified": rptiVerified,
        "rpti_comments": rptiComments,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient insurance info updated");
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
