import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/services/api/api.dart';
import 'package:prohealth/app/services/api/repository/hr_module_repository/manage_emp/manage_emp_repo.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/hr_module_data/manage/qualification_licenses.dart';

Future<List<QulificationLicensesData>> getEmployeeLicenses(
    BuildContext context, int employeeId) async {
  String convertIsoToDayMonthYear(String isoDate) {
    // Parse ISO date string to DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Create a DateFormat object to format the date
    DateFormat dateFormat = DateFormat('dd MMM yyyy');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  }

  List<QulificationLicensesData> itemsData = [];
  try {
    final response = await Api(context).get(
        path: ManageReposotory.getEmployeeLicenses(employeeid: employeeId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        String expFormattedDate = convertIsoToDayMonthYear(item['expDate']);
        String issueFormattedDate = convertIsoToDayMonthYear(item['issueDate']);
        itemsData.add(QulificationLicensesData(
          licenseId: item['licenseId'],
          country: item['country'],
          employeeId: item['employeeId'],
          expData: expFormattedDate,
          issueDate: issueFormattedDate,
          licenseUrl: item['licenseUrl'],
          licenure: item['licensure'],
          licenseNumber: item['licenseNumber'],
          org: item['org'],
          documentType: item['documentType'],
          approved: item['approved'] ?? false,
          sucess: true,
          message: response.statusMessage!,
        ));
      }
    } else {
      print("Employee Licenses");
    }
    return itemsData;
  } catch (e) {
    print("error${e}");
    return itemsData;
  }
}

/// Add License

Future<ApiData> addLicensePost(
    BuildContext context,
    int licenseId,
    String country,
    int employeeId,
    String expDate,
    String issueDate,
    String licenseUrl,
    String licensure,
    String licenseNumber,
    String org,
    String documentType) async {
  try {
    var response = await Api(context).post(
      path: ManageReposotory.addEmployeeLicenses(),
      data: {
        "country": country,
        "employeeId": employeeId,
        "expDate": expDate,
        "issueDate": issueDate,
        "licenseUrl": licenseUrl,
        "licensure": licensure,
        "licenseNumber": licenseNumber,
        "org": org,
        "documentType": documentType
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("License Added");
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

/// Update license
Future<ApiData> updateLicensePatch(
    BuildContext context,
    int licenseId,
    String country,
    int employeeId,
    String expDate,
    String issueDate,
    String licenseUrl,
    String licensure,
    String licenseNumber,
    String org,
    String documentType) async {
  try {
    var response = await Api(context).patch(
      path: ManageReposotory.updateEmployeeLicenses(licensedId: licenseId),
      data: {
        "country": country,
        "employeeId": employeeId,
        "expDate": expDate,
        "issueDate": issueDate,
        "licenseUrl": licenseUrl,
        "licensure": licensure,
        "licenseNumber": licenseNumber,
        "org": org,
        "documentType": documentType
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("License Updated");
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

/// Reject license
Future<ApiData> rejectLicensePatch(BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
      path: ManageReposotory.rejectEmployeeLicenses(licensedId: licenseId),
      data: {},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("License rejected");
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

/// Approve license
Future<ApiData> approveLicensePatch(BuildContext context, int licenseId) async {
  try {
    var response = await Api(context).patch(
      path: ManageReposotory.approveEmployeeLicenses(licensedId: licenseId),
      data: {},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("License Approved");
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