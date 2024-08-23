import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/data/api_data/api_data.dart';

import 'package:prohealth/data/api_data/api_data.dart';

import '../../../../../../presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../resources/const_string.dart';
import '../../../api.dart';
import '../../../repository/sm_repository/patient_data/patient_data_info_repo.dart';




Future<ApiData> InfoStayPatientData(
    BuildContext context,
    int patientId,
    String lisi_Facility,
    String lisi_MedicalRecord,
    String lisi_Status,
    String lisi_Hospital,
    String lisi_Phone,
    String lisi_Address,
    String lisi_City,
    String lisi_State,
    String lisi_Zipcode,
    String lisi_AdmitDate,
    String lisi_DischargeDate,
    String lisi_RecentSurgery_Procedure,
    String lisi_DateOfSurgery_Procedure,
    String lisi_Comments,
    String loc_StartDate,
    String loc_EndDate,
    String loc_Street,
    String loc_SuiteApt,
    String loc_City,
    String loc_State,
    String loc_Zipcode,
    String loc_PhoneNbr,
    String loc_Fax,
    ) async {
  try {
    var response = await Api(context).post(
      path: PatientDataInfoRepo.stayInfoAdd(),
      data: {
        "patientId": patientId,
        "lisi_Facility": lisi_Facility,
        "lisi_MedicalRecord": lisi_MedicalRecord,
        "lisi_Status": lisi_Status,
        "lisi_Hospital": lisi_Hospital,
        "lisi_Phone": lisi_Phone,
        "lisi_Address": lisi_Address,
        "lisi_City": lisi_City,
        "lisi_State": lisi_State,
        "lisi_Zipcode": lisi_Zipcode,
        "lisi_AdmitDate":  "${lisi_AdmitDate}T00:00:00Z",           //"2024-08-17T10:39:29.404Z",
        "lisi_DischargeDate": lisi_DischargeDate,
        "lisi_RecentSurgery_Procedure": lisi_RecentSurgery_Procedure,
        "lisi_DateOfSurgery_Procedure": "${lisi_DateOfSurgery_Procedure}T00:00:00Z",          //"2024-08-17T10:39:29.404Z",
        "lisi_Comments": lisi_Comments,
        "LOC_StartDate": "${loc_StartDate}T00:00:00Z",                   //"2024-08-17T10:39:29.404Z",
        "LOC_EndDate":  "${loc_EndDate}T00:00:00Z",                   //"2024-08-17T10:39:29.404Z",
        "LOC_Street": loc_Street,
        "LOC_SuiteApt": loc_SuiteApt,
        "LOC_City": loc_City,
        "LOC_State": loc_State,
        "LOC_Zipcode": loc_Zipcode,
        "LOC_PhoneNbr": loc_PhoneNbr,
        "LOC_Fax": loc_Fax

      },
    );
    print(response);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Info Stay Added");
      var patientIdresponse = response.data;
      int idPatient = patientIdresponse["patientId"];

      // orgDocumentGet(context);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
            ),
            child: Container(
              height: 270,
              width: 300,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                color: Colors.white, // Background color
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF50B5E5),
                    size: 80.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Successfully Add !",
                    style: GoogleFonts.firaSans(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomButton(
                          height: 30,
                          width: 130,
                          text: 'Continue',
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
      return ApiData(
          statusCode: response.statusCode!,
          success: true,
          message: response.statusMessage!,
          patientId: idPatient);
    } else {
      print("Error 1");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
            ),
            child: Container(
              height: 270,
              width: 300,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
                color: Colors.white, // Background color
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                    size: 80.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Failed, Please Try Again !",
                    style: GoogleFonts.firaSans(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomButton(
                          height: 30,
                          width: 130,
                          text: 'Back',
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
      return ApiData(
          statusCode: response.statusCode!,
          success: false,
          message: response.data['message']);
    }
  } catch (e) {
    print("Error $e");
    // Show error dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          child: Container(
            height: 270,
            width: 300,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), // Rounded corners
              color: Colors.white, // Background color
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 80.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Please Try Again !",
                  style: GoogleFonts.firaSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(
                        height: 30,
                        width: 130,
                        text: 'Back',
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return ApiData(
        statusCode: 404, success: false, message: AppString.somethingWentWrong);
  }
}