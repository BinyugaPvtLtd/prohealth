
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
Future<List<DemographicPatientDataModel>> getDemographichPatientDetail({
  required BuildContext context,
  required int patientId
}) async {
  List<DemographicPatientDataModel> itemsData = [];
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
      for (var item in response.data) {
        itemsData.add(DemographicPatientDataModel(
            demoId: item['demo_Id']??0,
            fkPtId: item['fk_pt_id']??0,
            demoFirstName: item['demo_firstName']??'',
            demoMiddleInitial: item['demo_middleInitial']??'',
            demoLastName: item['demo_lastName']??'',
            demoSuffix: item['demo_suffix']??'',
            demoStreet: item['demo_street']??'',
            demoSuite: item['demo_suite']??'',
            demoCity: item['demo_city']??'',
            demoState: item['demo_state']??'',
            demoZipcode: item['demo_zipcode']??'',
            fkCountryId: item['fk_countryId']??0,
            fkResidenceTypeId: item['fk_residence_type_id']??0,
            demoFacilityName: item['demo_facitlityName']??'',
            fkZoneId: item['fk_zone_id']??0,
            demoLocationNotes: item['demo_locationNotes']??'',
            demoPrimaryContact: item['demo_primaryContact']??'',
            demoPrimaryContactName: item['demo_primaryContactName']??'',
            demoPrimaryPhone: item['demo_primaryPhone']??'',
            demoPrimaryEmail: item['demo_primaryEmail']??'',
            demoCahpsContact: item['demo_CAHPS_Contact']??'',
            demoSecondaryContact: item['demo_secondaryContact']??'',
            demoSecondaryContactName: item['demo_secondaryContactName']??'',
            demoSecondaryPhone: item['demo_secondaryPhone']??'',
            demoSecondaryEmail: item['demo_secondaryEmail']??'',
            demoDob: item['demo_dob'] != null ? convertIsoToDayMonthYear(item['demo_dob']) : '',
            fkGender: item['fk_gender']??0,
            fkSpokenLanguage: item['fk_spoken_language']??0,
            demoSocialSecurity: item['demo_socialSecurity']??'',
            fkRaceEthnicity: item['fk_raceEthnicity']??0,
            fkMaritalStatus: item['fk_maritalStatus']??0,
            demoCreatedAt: item['demo_created_at'] != null ? convertIsoToDayMonthYear(item['demo_created_at']) : '',
        ));
      }
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