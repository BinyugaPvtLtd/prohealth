
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographic_patient_data.dart';
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

/// Demographic patient data
Future<DemographicPatientDataModel> getDemographichPatientDetail({
  required BuildContext context,
  required int patientId
}) async {
  var itemsData;
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
    final response = await Api(context).get(
      path: PatientIntakeRepo.getPatientDemographichWithPtId(ptId: patientId),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
        itemsData = DemographicPatientDataModel(
            demoId: response.data['demo_id']??0,
            fkPtId: response.data['fk_pt_id']??0,
            demoFirstName: response.data['demo_firstName']??'',
            demoMiddleInitial: response.data['demo_middleInitial']??'',
            demoLastName: response.data['demo_lastName']??'',
            demoSuffix: response.data['demo_suffix']??'',
            demoStreet: response.data['demo_street']??'',
            demoSuite: response.data['demo_suite']??'',
            demoCity: response.data['demo_city']??'',
            demoState: response.data['demo_state']??'',
            demoZipcode: response.data['demo_zipcode']??'',
            fkCountryId: response.data['fk_countryId']??0,
            fkResidenceTypeId: response.data['fk_residence_type_id']??0,
            demoFacilityName: response.data['demo_facitlityName']??'',
            fkZoneId: response.data['fk_zone_id']??0,
            demoLocationNotes: response.data['demo_locationNotes']??'',
            demoPrimaryContact: response.data['demo_primaryContact']??'',
            demoPrimaryContactName: response.data['demo_primaryContactName']??'',
            demoPrimaryPhone: response.data['demo_primaryPhone']??'',
            demoPrimaryEmail: response.data['demo_primaryEmail']??'',
            demoCahpsContact: response.data['demo_CAHPS_Contact']??'',
            demoSecondaryContact: response.data['demo_secondaryContact']??'',
            demoSecondaryContactName: response.data['demo_secondaryContactName']??'',
            demoSecondaryPhone: response.data['demo_secondaryPhone']??'',
            demoSecondaryEmail: response.data['demo_secondaryEmail']??'',
            demoDob: response.data['demo_dob'] != null ? convertIsoToDayMonthYear(response.data['demo_dob']) : '',
            fkGender: response.data['fk_gender']??0,
            fkSpokenLanguage: response.data['fk_spoken_language']??0,
            demoSocialSecurity: response.data['demo_socialSecurity']??'',
            fkRaceEthnicity: response.data['fk_raceEthnicity']??0,
            fkMaritalStatus: response.data['fk_maritalStatus']??0,
            demoCreatedAt: response.data['demo_created_at'] != null ? convertIsoToDayMonthYear(response.data['demo_created_at']) : '',
        );

    }
    else {
      print("patient demographic error");
    }

    return itemsData;
  } catch (e) {
    print("error: $e");
    return itemsData;
  }
}

/// Patch Demographich
Future<ApiData> patchPatientIntakeDemographich(
    {
      required BuildContext context,
      required int demoId,
      required int fk_pt_id,
      required String demoFirstName,
      required String demoMiddleInitial,
      required String demoLastName,
      required String demoSuffix,
      required String demoStreet,
      required String demoSuite,
      required String demoCity,
      required String demoState,
      required String demoZipcode,
      required int fkCountryId,
      required int fkResidenceTypeId,
      required String demoFacilityName,
      required int fkZoneId,
      required String demoLocationNotes,
      required String demoPrimaryContact,
      required String demoPrimaryContactName,
      required String demoPrimaryPhone,
      required String demoPrimaryEmail,
      required String demoCahpsContact,
      required String demoSecondaryContact,
      required String demoSecondaryContactName,
      required String demoSecondaryPhone,
      required String demoSecondaryEmail,
      required String demoDob, // Format: yyyy-MM-ddTHH:mm:ss.sssZ
      required int fkGender,
      required int fkSpokenLanguage,
      required String demoSocialSecurity,
      required int fkRaceEthnicity,
      required int fkMaritalStatus,
    }) async {
  try {
    var response = await Api(context).patch(
      path: PatientIntakeRepo.updatePatientDemographich(id: demoId),
      data: {
        "fk_pt_id": fk_pt_id,
        "demo_firstName": demoFirstName,
        "demo_middleInitial": demoMiddleInitial,
        "demo_lastName": demoLastName,
        "demo_suffix": demoSuffix,
        "demo_street": demoStreet,
        "demo_suite": demoSuite,
        "demo_city": demoCity,
        "demo_state": demoState,
        "demo_zipcode": demoZipcode,
        "fk_countryId": fkCountryId,
        "fk_residence_type_id": fkResidenceTypeId,
        "demo_facitlityName": demoFacilityName,
        "fk_zone_id": fkZoneId,
        "demo_locationNotes": demoLocationNotes,
        "demo_primaryContact": demoPrimaryContact,
        "demo_primaryContactName": demoPrimaryContactName,
        "demo_primaryPhone": demoPrimaryPhone,
        "demo_primaryEmail": demoPrimaryEmail,
        "demo_CAHPS_Contact": demoCahpsContact,
        "demo_secondaryContact": demoSecondaryContact,
        "demo_secondaryContactName": demoSecondaryContactName,
        "demo_secondaryPhone": demoSecondaryPhone,
        "demo_secondaryEmail": demoSecondaryEmail,
        "demo_dob": demoDob,
        "fk_gender": fkGender,
        "fk_spoken_language": fkSpokenLanguage,
        "demo_socialSecurity": demoSocialSecurity,
        "fk_raceEthnicity": fkRaceEthnicity,
        "fk_maritalStatus": fkMaritalStatus,
      }
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient Intake demograpich updated ");
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