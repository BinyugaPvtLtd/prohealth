import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/services/api/api.dart';
import 'package:prohealth/app/services/api/repository/hr_module_repository/onboarding/clinical_licenses_repo.dart';
import 'package:prohealth/app/services/token/token_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/hr_module_data/onboarding_data/clinical_license_data.dart';

/// Get driving license
Future<List<ClinicalLicenseDataModel>> getDrivingLicenseRecord(BuildContext context,
   int employeeId, String approveOnly) async {
  List<ClinicalLicenseDataModel> itemsList = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
        path: ClinicalLicensesRepo.getDrivingLicenseByEmpId(employeeId: employeeId, approve: approveOnly));
    if (response.statusCode == 200 || response.statusCode == 201) {
       print("Clinical Document driving license fetched");
      for (var item in response.data) {
        itemsList.add(ClinicalLicenseDataModel(
            drivingLicenseId: item['drivingLicenceId']??0,
            idOFDocument: item['idOfDocument']??"--",
            createdAt: item['doc_created_at'],
            expDate: item['expiry_date'] == null ? item['expiry_date']:convertIsoToDayMonthYear(item['expiry_date']),
            url: item['url']??"--",
            companyId: item['company_id'],
            officeId: item['office_id']??"--",
            fileName: item['file_name']??"--",
            employeeId: item['employee_id']??0,
            approve: item['approved']??false));
      }
    } else {
      print('onboarding Clinical Document');
      return itemsList;
    }
    // print("Org response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

/// Get driving license prefill
Future<ClinicalLicensePrefillDataModel> getDrivingLicenseRecordPreFill({required BuildContext context,
  required String docId,}) async {
  var itemsList;
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
        path: ClinicalLicensesRepo.DrivingLicensePrefillAndPatch(docId: docId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Clinical Document driving license fetched");
        itemsList = ClinicalLicensePrefillDataModel(
            drivingLicenseId: response.data['drivingLicenceId']??0,
            idOFDocument: response.data['idOfDocument']??"--",
            createdAt: response.data['doc_created_at'],
            expDate: response.data['expiry_date'] == null ? response.data['expiry_date']:convertIsoToDayMonthYear(response.data['expiry_date']),
            url: response.data['url']??"--",
            companyId: response.data['company_id'],
            officeId: response.data['office_id']??"--",
            fileName: response.data['file_name']??"--",
            employeeId: response.data['employee_id']??0,
            approve: response.data['approved']??false);

    } else {
      print('Prefill driving license error');
      return itemsList;
    }
    // print("Org response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

/// Patch driving license
Future<ApiData> patchDrivingLicense(
    {required BuildContext context, required String docId, required int employeeId, required String idOfDocument, required String expiryDate,
      required String createdAt,required String url, required String officeId, required String fileName, required bool approved}) async {
  try {
    final companyId = await TokenManager.getCompanyId();
    var response = await Api(context).patch(
      path: ClinicalLicensesRepo.DrivingLicensePrefillAndPatch(docId: docId),
      data: {
        "employee_id":employeeId,
        "ifOfDocument":idOfDocument,
        "expiry_date":"${expiryDate}T00:00:00Z",
        "doc_created_at":createdAt,
        "company_id":companyId,
        "url":url,
        "office_id":officeId,
        "file_name":fileName,
        "doc_modified_at":DateTime.now().toIso8601String() + "Z",
        //"approved":approved
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Driving license updated");
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

/// Approve driving license
Future<ApiData> singleDrivingLicenseApprovePatch(
    BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
        path: ClinicalLicensesRepo.patchDrivingLicenseApprove(licenseId: licenseId),
        data: {}
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Driving license Approved");
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

/// Reject driving license
Future<ApiData> singleDrivingLicenseRejectPatch(
    BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
        path: ClinicalLicensesRepo.patchDrivingLicenseReject(licenseId: licenseId),
        data: {}
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Driving license Rejected");
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

/// Delete Driving license
Future<ApiData> deleteDrivingLicense(
    BuildContext context, String docId) async {
  try {
    var response = await Api(context).delete(
      path: ClinicalLicensesRepo.deleteDrivingLicense(docId: docId),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Driving license deleted");
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


/// Get PractitionerLicense
Future<List<PractitionerLicenseDataModel>> getPractitionerLicenseRecord(BuildContext context,
   int employeeId, String approveOnly) async {
  List<PractitionerLicenseDataModel> itemsList = [];
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
        path: ClinicalLicensesRepo.getPractitionerLicenseByEmpId(employeeId: employeeId, approve: approveOnly));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Clinical PractitionerLicense fetched");
      for (var item in response.data) {
        itemsList.add(PractitionerLicenseDataModel(
            practitionerLicenceId: item['practitionerLicenceId']??0,
            idOFDocument: item['idOfDocument']??"--",
            createdAt: item['doc_created_at'],
            expDate: item['expiry_date'] == null ? item['expiry_date']:convertIsoToDayMonthYear(item['expiry_date']),
            url: item['url']??"--",
            companyId: item['company_id'],
            officeId: item['office_id']??"--",
            fileName: item['file_name']??"--",
            employeeId: item['employee_id']??0,
            approve: item['approved']??false));
      }
    } else {
      print('onboarding Clinical Document PractitionerLicense');
      return itemsList;
    }
    // print("Org response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

/// Approve PractitionerLicense
Future<ApiData> singlePractitionerLicenseApprovePatch(
    BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
        path: ClinicalLicensesRepo.patchPractitionerLicenseApprove(licenseId: licenseId),
        data: {}
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Practitioner License Approved");
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

/// Reject PractitionerLicense
Future<ApiData> singlePractitionerLicenseRejectPatch(
    BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
        path: ClinicalLicensesRepo.patchPractitionerLicenseReject(licenseId: licenseId),
        data: {}
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Practitioner License Rejected");
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

/// Delete Practioner license
Future<ApiData> deletePractitionerLicense(
    BuildContext context, String docId) async {
  try {
    var response = await Api(context).delete(
        path: ClinicalLicensesRepo.deletePractitionerLicense(docId: docId),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Practitioner License deleted");
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

/// Patch Practioner license
Future<ApiData> patchPractitionerLicense(
{required BuildContext context, required String docId, required int employeeId, required String idOfDocument, required String expiryDate,
  required String createdAt,required String url, required String officeId, required String fileName, required bool approved}) async {
  try {
    final companyId = await TokenManager.getCompanyId();
    var response = await Api(context).patch(
      path: ClinicalLicensesRepo.deletePractitionerLicense(docId: docId),
      data: {
        "employee_id":employeeId,
        "ifOfDocument":idOfDocument,
        "expiry_date":"${expiryDate}T00:00:00Z",
        "doc_created_at":createdAt,
        "company_id":companyId,
        "url":url,
        "office_id":officeId,
        "file_name":fileName,
        "doc_modified_at":DateTime.now().toIso8601String() + "Z",
        "approved":approved
    },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Practitioner License updated");
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

/// Prefill
Future<PractitionerLicensePreFillDataModel> getPractitionerLicenseRecordPreFill({required BuildContext context,
    required String docId,}) async {
  var itemsList;
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }
  try {
    final response = await Api(context).get(
        path: ClinicalLicensesRepo.practitionerLicensePrefillAndPatch(docId: docId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Clinical PractitionerLicense prefill fetched");

        itemsList = PractitionerLicensePreFillDataModel(
            practitionerLicenceId: response.data['practitionerLicenceId']??0,
            idOFDocument: response.data['idOfDocument']??"--",
            createdAt: response.data['doc_created_at'],
            expDate: response.data['expiry_date'] == null ? response.data['expiry_date']:convertIsoToDayMonthYear(response.data['expiry_date']),
            url: response.data['url']??"--",
            companyId: response.data['company_id'],
            officeId: response.data['office_id']??"--",
            fileName: response.data['file_name']??"--",
            employeeId: response.data['employee_id']??0,
            approve: response.data['approved']??false);

    } else {
      print('onboarding Clinical Document PractitionerLicense');
      return itemsList;
    }
    // print("Org response:::::${response}");
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}