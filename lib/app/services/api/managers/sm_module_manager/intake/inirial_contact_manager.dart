import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/services/api/repository/sm_repository/intake/initial_contact_repo.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_initial_contact_data/initial_contact_data.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';

Future<List<PatientInitialContactData>> getInitialContactWithPtid({
  required BuildContext context,
  required int ptId
}) async {
  List<PatientInitialContactData> itemsList = [];
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
    final response = await Api(context).get(path: InitialContactRepo.getInitialContact(ptId: ptId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      for(var item in response.data){
        print('rpti id type ${item['rpti_id'].runtimeType}');
        print('rpti id type ${item['rpti_id']}');
        itemsList.add(PatientInitialContactData(
            initialContactId: item['initialContactId']??0,
            patientId: item['pt_id']??0,
            introCallComplete: item['introCallComplete']??false,
            patientIsHome: item['patientIsHome']??false,
            consentsNeeded: item['consentsNeeded']??false,
            demographicsConfirmed: item['demographicsConfirmed']??false,
            potentialDcDate: item['potentialDcDate'] == null? "":convertIsoToDayMonthYear(item['potentialDcDate']),
            sendConsentsForSign: item['sendConsentsForSign']??false,
            representativePresentSoc: item['representativePresentSoc']??false,
            createdAt: item['createdAt'] == null ? "" :convertIsoToDayMonthYear(item['createdAt']),
            updatedAt: item['updatedAt'] == null ? "" :convertIsoToDayMonthYear(item['updatedAt'])
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


Future<ApiData> updatePatientinitialContact(
    {
      required BuildContext context,
      required int id,
      required int ptId,
      required bool introCallComplete,
      required bool patientIsHome,
      required bool consentsNeeded,
      required bool demographicsConfirmed,
      required String potentialDcDate,
      required bool sendConsentsForSign,
      required bool representativePresentSoc

    }) async {
  try {
    var response = await Api(context).patch(
      path: InitialContactRepo.patchInitialContactWithId(Id: id),
      data: {
        "pt_id": ptId,
        "introCallComplete": introCallComplete,
        "patientIsHome": patientIsHome,
        "consentsNeeded": consentsNeeded,
        "demographicsConfirmed": demographicsConfirmed,
        "potentialDcDate": potentialDcDate,
        "sendConsentsForSign": sendConsentsForSign,
        "representativePresentSoc": representativePresentSoc
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Patient initial contact updated");
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