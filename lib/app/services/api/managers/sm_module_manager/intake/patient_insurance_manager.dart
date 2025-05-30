

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
            createdBy: item['insuranceCreatedBy']??0,
            updatedAt: item['insuranceUpdatedAt'] != null ? convertIsoToDayMonthYear(item['insuranceUpdatedAt']) :'0000-00-00T00:00:00.000Z',
            updatedBy: item['insuranceUpdatedBy']??0


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
