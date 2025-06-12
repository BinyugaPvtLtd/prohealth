
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographic_patient_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographich_ai_data.dart';
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
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Format the date into "dd mm yy" format
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }
  try {
    final response = await Api(context).get(
      path: PatientIntakeRepo.getPatientDemographichWithPtId(ptId: patientId),
    );


    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('county data ${response.data['country']['name']??'null'}');
      // print('residence_type data ${response.data['residence_type']['detail']??'null'}');
      // print('zone data ${response.data['zone']['zoneName']??'null'}');
      // print('maritalStatus data ${response.data['maritalStatus']['maritalStatus']??'null'}');

      print('All Response ${response.data}');
        itemsData = DemographicPatientDataModel(
          countyName: response.data['country'] != null ? response.data['country']['name']??'Select' :'Select' ,
          fkResidenceTypeName: response.data['residence_type'] != null ?response.data['residence_type']['detail']??'Select':'Select',
          zoneName: response.data['zone'] != null ? response.data['zone']['zoneName']??'Select':'Select',
          genderName: response.data['gender'] != null ?response.data['gender']['gender']??"Select":'Select',
          spokenLanguageName: response.data['spoken_language'] != null ?response.data['spoken_language']['languageSpoken']??"Select":'Select',
          RaceEthniname: response.data['race'] != null ? response.data['race']['race']??"Select":'Select',
          maritalStatusName: response.data['maritalStatus'] != null ? response.data['maritalStatus']['maritalStatus']??'Select':'Select',
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
          // countryObject:response.data['country'] != null ? CountryObject(
          //     countryId: response.data['country']['countryId']??0,
          //     name: response.data['country']['name']??'',
          //     short: response.data['country']['short']??''):CountryObject(
          //     countryId: 0,
          //     name: '',
          //     short: ''),
          // residencyTypeObject: response.data['residence_type'] != null ? ResidencyTypeObject(
          //     id: response.data['residence_type']['id']??0,
          //     detail: response.data['residence_type']['detail']??'',
          //     description: response.data['residence_type']['description']??'') : ResidencyTypeObject(
          //     id: 0,
          //     detail: '',
          //     description: ''),
          // zoneObject: response.data['zone'] != null ? ZoneObject(
          //     zoneId: response.data['zone']['zone_id']??0,
          //     zoneName: response.data['zone']['zoneName']??'',
          //     companyId: response.data['zone']['companyId']??0,
          //     officeId: response.data['zone']['officeId']??'',
          //     countyId: response.data['zone']['county_id']??0) : ZoneObject(
          //     zoneId: 0,
          //     zoneName: '',
          //     companyId: 0,
          //     officeId: '',
          //     countyId: 0),
          // genderObject: response.data['gender'] != null ? GenderObject(
          //     genderId: response.data['gender']['genderId']??0,
          //     genderName: response.data['gender']['gender']??'') :GenderObject(
          //     genderId: 0,
          //     genderName: ''),
          // spokenLanguage: response.data['spoken_language'] != null ? SpokenLanguage(
          //     languageId: response.data['spoken_language']['languageSpokenId']??0,
          //     languagename: response.data['spoken_language']['languageSpoken']??'') :SpokenLanguage(
          //     languageId: 0,
          //     languagename: ''),
          // raceObject: response.data['race'] != null ? RaceObject(
          //     raceId: response.data['race']['raceId']??0,
          //     raceName: response.data['race']['race']??'') : RaceObject(
          //     raceId: 0,
          //     raceName: ''),
          // maritalStatusObject: response.data['maritalStatus'] != null ? MaritalStatusObject(
          //     statusId: response.data['maritalStatus']['maritalStatusId']??0,
          //     status: response.data['maritalStatus']['maritalStatus']??''):MaritalStatusObject(
          //     statusId: 0,
          //     status: '')

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


Future<AIDemographichModelData> getAIDemographichData({
  required BuildContext context,
  required int ptId
}) async {
  var itemsList;
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
    final response = await Api(context).get(path: PatientIntakeRepo.getAIDemographich(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var item = response.data;
       print('All Data ${response.data}');
        itemsList = AIDemographichModelData(
          demoIdI: item['demo_id_I']??0,
          fkPtId: item['fk_pt_id']??0,
          demoFirstNameI: item['demo_firstName_I']??'',
          demoMiddleInitialI: item['demo_middleInitial_I']??'',
          demoLastNameI: item['demo_lastName_I']??'',
          demoSuffixI: item['demo_suffix_I']??'',
          demoStreetI: item['demo_street_I']??'',
          demoSuiteI: item['demo_suite_I']??'',
          demoCityI: item['demo_city_I']??'',
          demoStateI: item['demo_state_I']??'',
          demoZipcodeI: item['demo_zipcode_I']??'',
          demoFacitlityNameI: item['demo_facitlityName_I']??'',
          demoLocationNotesI: item['demo_locationNotes_I']??'',
          demoPrimaryContactI: item['demo_primaryContact_I']??"",
          demoPrimaryContactNameI: item['demo_primaryContactName_I']??'',
          demoPrimaryPhoneI: item['demo_primaryPhone_I']??'',
          demoPrimaryEmailI: item['demo_primaryEmail_I']??'',
          demoCahpsContactI: item['demo_CAHPS_Contact_I']??'',
          demoSecondaryContactI: item['demo_secondaryContact_I']??'',
          demoSecondaryContactNameI: item['demo_secondaryContactName_I']??'',
          demoSecondaryPhoneI: item['demo_secondaryPhone_I']??'',
          demoSecondaryEmailI: item['demo_secondaryEmail_I']??'',
          demoSocialSecurityI: item['demo_socialSecurity_I']??'',
          demoCreatedAtI: convertIsoToDayMonthYear(item['demo_created_at_I']),
        );

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





/// Add Demographich
Future<ApiData> postDiscipline(
    {
      required BuildContext context,
      required int ptId,
    }) async {
  try {
    var response = await Api(context).post(
      path: PatientIntakeRepo.addDiscipline(),
      data: {
        'fk_pt_id':ptId
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient from Intake  to  scheduler  ");
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

Future<AiEmergencyContactData> getAIEmergencyContact({
  required BuildContext context,
  required int ptId
}) async {
  var itemsList;
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
    final response = await Api(context).get(path: PatientIntakeRepo.getAIEmergencyContact(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var item = response.data;
      print('All Data ${response.data}');
      itemsList = AiEmergencyContactData(
          contactId_I: item['contactId_I']??0,
          fk_pt_id: item['fk_pt_id']??0,
          firstName_I: item['firstName_I']??" ",
          lastName_I: item['lastName_I']??" ",
          street_I: item['street_I']??" ",
          suite_I: item['suite_I']??" ",
          city_I: item['city_I']??" ",
          state_I: item['state_I']??" ",
          zipCode_I: item['zipCode_I']??" ",
          phoneNumber_I: item['phoneNumber_I']??" ",
          email_I: item['email_I']??" "
      );
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


Future<AiRepresentativeData> getAIRepresentative({
  required BuildContext context,
  required int ptId
}) async {
  var itemsList;
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
    final response = await Api(context).get(path: PatientIntakeRepo.getAIPatientRepresentative(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      var item = response.data;
      print('All Data ${response.data}');
      itemsList = AiRepresentativeData(
          representiveId_I: item['contactId_I']??0,
          fk_pt_id: item['fk_pt_id']??0,
          firstName_I: item['firstName_I']??" ",
          lastName_I: item['lastName_I']??" ",
          street_I: item['street_I']??" ",
          suite_I: item['suite_I']??" ",
          city_I: item['city_I']??" ",
          state_I: item['state_I']??" ",
          zipCode_I: item['zipCode_I']??" ",
          phoneNumber_I: item['phoneNumber_I']??" ",
          email_I: item['email_I']??" "
      );
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