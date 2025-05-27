import 'package:flutter/cupertino.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographics_dropdown_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/related_parties_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/intake/relatedParties_repo.dart';

Future<List<EmergencyContactData>> getPatientEmergencyContact({
  required BuildContext context,
  required int ptId
}) async {
  List<EmergencyContactData> itemsList = [];
  try {
    final response = await Api(context).get(path: RelatedPartiesRepo.getEmergencyContact(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(EmergencyContactData(
            contactId: item['contactId']??0,
            fk_pt_id: item['fk_pt_id']??0,
            firstName: item['firstName']??'',
            lastName: item['lastName']??'',
            fk_Relationship: item['fk_Relationship']??1,
            street: item['street']??'',
            suite: item['suite']??'',
            city: item['city']??'',
            state: item['state']??'',
            zipCode: item['zipCode']??'',
            phoneNumber: item['phoneNumber']??'',
            email: item['email']??''
        ));
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

Future<ApiData> addPatientEmergencyContact(
    {
      required BuildContext context,
      required int fk_pt_id,
      required String firstName,
      required String lastname,
      required int relationshipId,
      required String street,
      required String suite,
      required String city,
      required String state,
      required String zipCode,
      required String phoneNumber,
      required String email,
    }) async {
  try {
    var response = await Api(context).post(
        path: RelatedPartiesRepo.addEmergencyContact(),
        data: {
          "fk_pt_id": fk_pt_id,
          "firstName": firstName,
          "lastName": lastname,
          "fk_Relationship": relationshipId,
          "street": street,
          "suite": suite,
          "city": city,
          "state": state,
          "zipCode": zipCode,
          "phoneNumber": phoneNumber,
          "email": email
        }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient emergency conatact  added ");
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!,
      );
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

/// Role dropdown
Future<List<RelatedPartiesRoleData>> getRelataedRoleDropDown({
  required BuildContext context,
}) async {
  List<RelatedPartiesRoleData> itemsList = [];
  try {
    final response = await Api(context).get(path: RelatedPartiesRepo.getRelatedPartiesRole());
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(RelatedPartiesRoleData(
            roleId: item['roleId']??0,
            roleName: item['roleName']??'',
            roleDiscription: item['roleDescription']??''
        ));
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

/// Type dropdown
Future<List<RelatedPatiesTypeData>> getRelataedTypeDropDown({
  required BuildContext context,
}) async {
  List<RelatedPatiesTypeData> itemsList = [];
  try {
    final response = await Api(context).get(path: RelatedPartiesRepo.getRelatedPartiesType());
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(RelatedPatiesTypeData(
            typeId: item['typeId']??0,
            typeName: item['typeName']??'',
            typeDiscription: item['typeDescription']??''
        ));
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

Future<List<PatientRepresentativeData>> getPatientRepresentative({
  required BuildContext context,
  required int ptId
}) async {
  List<PatientRepresentativeData> itemsList = [];
  try {
    final response = await Api(context).get(path: RelatedPartiesRepo.getRelatedRepresentive(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var item in response.data) {
        itemsList.add(
            PatientRepresentativeData(
            representiveId: item['representiveId']??0,
            fk_pt_id: item['fk_pt_id']??0,
            firstName: item['firstName']??'',
            lastName: item['lastName']??'',
            fk_Relationship: item['fk_Relationship']??1,
            street: item['street']??'',
            suite: item['suite']??'',
            city: item['city']??'',
            state: item['state']??'',
            zipCode: item['zipCode']??'',
            phoneNumber: item['phoneNumber']??'',
            email: item['email']??'',
            RoleId: item['fk_role']??0,
            typeId: item['fk_type']??0
        ));
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


Future<ApiData> addPatientRepresentative(
    {
      required BuildContext context,
      required int fk_pt_id,
      required String firstName,
      required String lastname,
      required int relationshipId,
      required String street,
      required String suite,
      required String city,
      required String state,
      required String zipCode,
      required String phoneNumber,
      required String email,
      required int fk_role,
      required int fk_type
    }) async {
  try {
    var response = await Api(context).post(
        path: RelatedPartiesRepo.addRelatedRepresentive(),
        data: {
          "fk_pt_id": fk_pt_id,
          "firstName": firstName,
          "lastName": lastname,
          "fk_Relationship": relationshipId,
          "street": street,
          "suite": suite,
          "city": city,
          "state": state,
          "zipCode": zipCode,
          "phoneNumber": phoneNumber,
          "email": email,
          "fk_role": fk_role,
          "fk_type": fk_type
        }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Representative  added ");
      return ApiData(
        statusCode: response.statusCode!,
        success: true,
        message: response.statusMessage!,
      );
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