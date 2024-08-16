import 'package:flutter/material.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/establishment_data/ci_manage_button/manage_insurance_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/establishment_manager/establishment_repository.dart';

///Add vendors
Future<ApiData> addVendors(
  BuildContext context,
  String officeId,
  String name,
  String address,
  String city,
  String email,
  String phone,
  String workEmail,
  String workPhone,
  String zone,
) async {
  try {
    var response = await Api(context).post(
        path: EstablishmentManagerRepository.companyOfficeVendorPost(),
        data: {
          "officeId": officeId,
          "vendorName": name,
          "address": address,
          "city": city,
          "email": email,
          "phone": phone,
          "work_email": workEmail,
          "work_phone": workPhone,
          "zone": zone,
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Vendor Addded");
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

/// get vendor
Future<List<ManageVendorData>> companyVendorGet(BuildContext context) async {
  List<ManageVendorData> itemsList = [];
  try {
    final response = await Api(context)
        .get(path: EstablishmentManagerRepository.companyOfficeVendorGet());
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Companyy vendor get:::::${itemsList}");
      for (var item in response.data) {
        itemsList.add(
          ManageVendorData(
            sucess: true,
            message: response.statusMessage!,
            vendorId: item['vendorId'],
            officeId: item['officeId'],
            vendorName: item['vendorName'],
            address: item['address'],
            city: item['city'],
            email: item['email'],
            phone: item['phone'],
            workEmail: item['work_email'],
            workPhone: item['work_phone'],
            zone: item['zone'],
          ),
        );
      }
      print("Companyy vendor data:::::${itemsList}");
    } else {
      print('Api Error');
      //return itemsList;
    }
    return itemsList;
  } catch (e) {
    print("Error $e");
    return itemsList;
  }
}

/// patch vendor
Future<ApiData> patchCompanyVendor(
    BuildContext context,
    int vendorId,
    String officeId,
    String vendorName,
    String address,
    String city,
    String email,
    String phone,
    String workEmail,
    String workPhone,
    String zone) async {
  try {
    var response = await Api(context).patch(
        path: EstablishmentManagerRepository.companyOfficeVendorPatch(
            vendorId: vendorId),
        data: {
          "officeId": officeId,
          "vendorName": vendorName,
          "address": address,
          "city": city,
          "email": email,
          "phone": phone,
          "work_email": workEmail,
          "work_phone": workPhone,
          "zone": zone
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Vendor Updated");
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