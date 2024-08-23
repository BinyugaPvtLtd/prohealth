// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_compliance/intake_patients_compliance.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_info/intake_patients_info.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_plan_care/intake_patients_plan_care.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_related_party/intake_patients_related_party.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_stay_info/intake_patients_stay_info.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/schedular_success_popup.dart';
//
// import '../../../../../../app/resources/color.dart';
// import '../../../../../../app/resources/font_manager.dart';
//
// class SmIntakePatientsScreen extends StatefulWidget {
//   SmIntakePatientsScreen({super.key});
//
//   @override
//   State<SmIntakePatientsScreen> createState() => _SmIntakePatientsScreenState();
// }
//
// class _SmIntakePatientsScreenState extends State<SmIntakePatientsScreen> {
//   int selectedIndex = 0;
//   final PageController smIntakePageController = PageController();
//
//   void selectButton(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//
//     smIntakePageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.ease,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(14),
//       child: Column(
//         children: [
//           SizedBox(height: 15,),
//           Container(
//             width: MediaQuery.of(context).size.width/1.97,  //1.97
//             height: 30,
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     offset: Offset(0, 4),
//                     blurRadius: 4,
//                     spreadRadius: 0,
//                   ),
//                 ],
//                 color: ColorManager.blueprime,
//                 borderRadius: BorderRadius.circular(20)
//             ),
//             child: Row(
//               children: [
//                 InkWell(
//                   child: Container(
//                     height: 30,
//                     width: MediaQuery.of(context).size.width / 10,
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     decoration: BoxDecoration(
//
//                       borderRadius: BorderRadius.circular(20),
//                       color: selectedIndex == 0
//                           ? Colors.white
//                           : null,
//                     ),
//                     child: Text(
//                       'Info',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.firaSans(
//                         fontSize: 12,
//                         fontWeight: FontWeightManager.semiBold,
//                         color: selectedIndex == 0
//                             ? ColorManager.mediumgrey
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                   onTap: () => selectButton(0),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 30,
//                     width: MediaQuery.of(context).size.width / 10,
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: selectedIndex == 1
//                           ? Colors.white
//                           : null,
//                     ),
//                     child: Text(
//                       'Compliance',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.firaSans(
//                         fontSize: 12,
//                         fontWeight: FontWeightManager.semiBold,
//                         color: selectedIndex == 1
//                             ? ColorManager.mediumgrey
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                   onTap: () => selectButton(1),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 30,
//                     width: MediaQuery.of(context).size.width / 10,
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: selectedIndex == 2
//                           ? Colors.white
//                           : null,
//                     ),
//                     child: Text(
//                       'Plan of Care',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.firaSans(
//                         fontSize: 12,
//                         fontWeight: FontWeightManager.semiBold,
//                         color: selectedIndex == 2
//                             ? ColorManager.mediumgrey
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                   onTap: () => selectButton(2),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 30,
//                     width: MediaQuery.of(context).size.width / 9.5,
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: selectedIndex == 3
//                           ? Colors.white
//                           : null,
//                     ),
//                     child: Text(
//                       'Related Parties',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.firaSans(
//                         fontSize: 12,
//                         fontWeight: FontWeightManager.semiBold,
//                         color: selectedIndex == 3
//                             ? ColorManager.mediumgrey
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                   onTap: () => selectButton(3),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 30,
//                     width: MediaQuery.of(context).size.width / 9.8,
//                     padding: EdgeInsets.symmetric(vertical: 6),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: selectedIndex == 4
//                           ? Colors.white
//                           : null,
//                     ),
//                     child: Text(
//                       'Stay Info',
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.firaSans(
//                         fontSize: 12,
//                         fontWeight: FontWeightManager.semiBold,
//                         color: selectedIndex == 4
//                             ? ColorManager.mediumgrey
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                   onTap: () => selectButton(4),
//                 ),
//
//               ],
//             ),
//           ),
//
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             flex: 10,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 //horizontal: MediaQuery.of(context).size.width / 45,
//                   vertical: 5),
//               child: PageView(
//                   controller: smIntakePageController,
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     IntakePatientsDatatInfo(),
//                     IntakePComplianceScreen(),
//                     IntakePlanCareScreen(),
//                     IntakeRelatedPartiesScreen(),
//                     IntakePatientsStayInfoScreen(),
//                   ]),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_compliance/intake_patients_compliance.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_info/intake_patients_info.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_plan_care/intake_patients_plan_care.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_related_party/intake_patients_related_party.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_stay_info/intake_patients_stay_info.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/schedular_success_popup.dart';
//
// import '../../../../../../app/resources/color.dart';
// import '../../../../../../app/resources/font_manager.dart';
//
// class SmIntakePatientsScreen extends StatefulWidget {
//   SmIntakePatientsScreen({super.key});
//
//   @override
//   State<SmIntakePatientsScreen> createState() => _SmIntakePatientsScreenState();
// }
//
// class _SmIntakePatientsScreenState extends State<SmIntakePatientsScreen> {
//   int selectedIndex = 0;
//   final PageController smIntakePageController = PageController();
//
//   void selectButton(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//
//     smIntakePageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.ease,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(14),
//       child: Column(
//         children: [
//           SizedBox(height: 15,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.97,  //1.97
//                 height: 30,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5),
//                       offset: Offset(0, 4),
//                       blurRadius: 4,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                   color: ColorManager.blueprime,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 0 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Info',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 0
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(0),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 1 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Compliance',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 1
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(1),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 2 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Plan of Care',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 2
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(2),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width / 9.5,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 3 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Related Parties',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 3
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(3),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: 30,
//                         width: MediaQuery.of(context).size.width / 9.8,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 4 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Stay Info',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: 12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 4
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(4),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: MediaQuery.of(context).size.width/6),
//               Padding(
//                 padding: const EdgeInsets.only(right: 40.0),
//                 child: Container(
//                   height: 26,
//                   width: 102,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return SchedularSuccessPopup(title: 'Success',);
//                         },
//                       );
//                     },
//                     child: Text(
//                       'Save',
//                       style: GoogleFonts.firaSans(
//                         fontSize: FontSize.s12,
//                         fontWeight: FontWeightManager.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 25,
//                         vertical: 10,
//                       ),
//                       backgroundColor: ColorManager.blueprime,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10,),
//           Expanded(
//             flex: 10,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: PageView(
//                 controller: smIntakePageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   IntakePatientsDatatInfo(),
//                   IntakePComplianceScreen(),
//                   IntakePlanCareScreen(),
//                   IntakeRelatedPartiesScreen(),
//                   IntakePatientsStayInfoScreen(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/sm_module_manager/patient_data/patient_data_info_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_compliance/intake_patients_compliance.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_info/intake_patients_info.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_plan_care/intake_patients_plan_care.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_related_party/intake_patients_related_party.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_stay_info/intake_patients_stay_info.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_profile_bar.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/info_success_popup.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/schedular_success_popup.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/physician_info/physician_info_manager.dart';
import '../../../../../../app/services/token/token_manager.dart';
import '../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';

class SmIntakePatientsScreen extends StatefulWidget {
  SmIntakePatientsScreen({super.key});

  @override
  State<SmIntakePatientsScreen> createState() => _SmIntakePatientsScreenState();
}

class _SmIntakePatientsScreenState extends State<SmIntakePatientsScreen> {
  int selectedIndex = 0;
  bool showProfileBar = false;
  final PageController smIntakePageController = PageController();
  TextEditingController ctlrSos = TextEditingController();
  TextEditingController ctlrMedicalRecord = TextEditingController();
  TextEditingController ctlrfirstName = TextEditingController();
  TextEditingController ctlrMI = TextEditingController();
  TextEditingController ctlrLastName = TextEditingController();
  TextEditingController ctlrSuffix = TextEditingController();
  TextEditingController ctlrDate = TextEditingController();
  TextEditingController ctlrStreet = TextEditingController();
  TextEditingController ctlrZipCode = TextEditingController();
  TextEditingController ctlrApartment = TextEditingController();
  TextEditingController ctlrCity = TextEditingController();

  TextEditingController ctlrMajorStreet = TextEditingController();
  TextEditingController ctlrPrimeNo = TextEditingController();
  TextEditingController ctlrSecNo = TextEditingController();
  TextEditingController ctlrEmail = TextEditingController();
  TextEditingController ctlrSocialSec = TextEditingController();

  TextEditingController ctlrDischargeResaon = TextEditingController();

  TextEditingController ctlrDateOfDeath = TextEditingController();
  String? statusType;
  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });

    smIntakePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void toggleProfileBar() {
    setState(() {
      showProfileBar = true;
    });
  }

  // Function to validate text fields
  bool _validateInputs() {
    return ctlrMedicalRecord.text.isNotEmpty &&
        ctlrfirstName.text.isNotEmpty &&
        ctlrLastName.text.isNotEmpty &&
        ctlrMI.text.isNotEmpty &&
        ctlrSuffix.text.isNotEmpty &&
        ctlrStreet.text.isNotEmpty &&
        ctlrZipCode.text.isNotEmpty &&
        ctlrCity.text.isNotEmpty &&
        ctlrEmail.text.isNotEmpty &&
        ctlrSocialSec.text.isNotEmpty &&
        ctlrDischargeResaon.text.isNotEmpty;
  }

// Function to show an error message
  void _showErrorMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Please fill out all required fields.'),
      backgroundColor: ColorManager.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

 int patientId = 0;

  String? statustype;
  String? selectedStatus;
  String? selectedCountry;
  String? selectedRace;
  String? selectedState;
  String? selectedcity;
  String? selectedLanguage;
  String? selectedReligion;
  String? selectedMaritalStatus;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(14),
      child: Column(
        children: [
          if (showProfileBar) IntakeProfileBar(),
          SizedBox(height: AppSize.s15),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.97,
              height: AppSize.s30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                color: ColorManager.blueprime,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  InkWell(
                    child: Container(
                      height: AppSize.s30,
                      width: MediaQuery.of(context).size.width / 10,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == 0 ? Colors.white : null,
                      ),
                      child: Text(
                        'Info',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: selectedIndex == 0
                              ? ColorManager.mediumgrey
                              : Colors.white,
                        ),
                      ),
                    ),
                    onTap: () => selectButton(0),
                  ),
                  InkWell(
                    child: Container(
                      height: AppSize.s30,
                      width: MediaQuery.of(context).size.width / 10,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == 1 ? ColorManager.white : null,
                      ),
                      child: Text(
                        'Compliance',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: selectedIndex == 1
                              ? ColorManager.mediumgrey
                              : ColorManager.white,
                        ),
                      ),
                    ),
                    onTap: () => selectButton(1),
                  ),
                  InkWell(
                    child: Container(
                      height: AppSize.s30,
                      width: MediaQuery.of(context).size.width / 10,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == 2 ? ColorManager.white : null,
                      ),
                      child: Text(
                        'Plan of Care',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: selectedIndex == 2
                              ? ColorManager.mediumgrey
                              : Colors.white,
                        ),
                      ),
                    ),
                    onTap: () => selectButton(2),
                  ),
                  InkWell(
                    child: Container(
                      height: AppSize.s30,
                      width: MediaQuery.of(context).size.width / 9.5,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == 3 ? ColorManager.white : null,
                      ),
                      child: Text(
                        'Related Parties',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: selectedIndex == 3
                              ? ColorManager.mediumgrey
                              : ColorManager.white,
                        ),
                      ),
                    ),
                    onTap: () => selectButton(3),
                  ),
                  InkWell(
                    child: Container(
                      height: AppSize.s30,
                      width: MediaQuery.of(context).size.width / 9.8,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == 4 ? ColorManager.white : null,
                      ),
                      child: Text(
                        'Stay Info',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.semiBold,
                          color: selectedIndex == 4
                              ? ColorManager.mediumgrey
                              : Colors.white,
                        ),
                      ),
                    ),
                    onTap: () => selectButton(4),
                  ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 6),
            if (selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Container(
                  height: AppSize.s26,
                  width: AppSize.s102,
                  child:
                  ElevatedButton(
                    onPressed: () async {
                      final companyId = await TokenManager.getCompanyId();
                      ApiData result = await IntakeInfoSave(
                        context,
                        "14/12/2024",
                        ctlrMedicalRecord.text,
                        'Pending',
                        ctlrfirstName.text,
                        ctlrLastName.text,
                        ctlrMI.text,
                        ctlrSuffix.text,
                        statusType ?? '',
                        "14/12/2024",
                        ctlrStreet.text,
                        selectedState!.toString(),
                        ctlrZipCode.text,
                        ctlrApartment.text,
                        selectedcity!.toString(),
                        selectedCountry ?? '',
                        ctlrMajorStreet.text,
                        ctlrPrimeNo.text,
                        ctlrSecNo.text,
                        ctlrEmail.text,
                        ctlrSocialSec.text,
                        selectedLanguage.toString() ?? '',
                        ctlrDischargeResaon.text,
                        selectedRace.toString() ?? '',
                        selectedReligion.toString() ?? '',
                        selectedMaritalStatus.toString() ?? '',
                        "14/08/2024",
                        1,
                        'At Land OSC',
                        'case',
                        'Type',
                        companyId,
                      );

                      if (result.success) {

                        patientId = result.patientId!;
                        ctlrMedicalRecord.clear();
                        ctlrfirstName.clear();
                        ctlrLastName.clear();
                        ctlrMI.clear();
                        ctlrSuffix.clear();
                        ctlrStreet.clear();
                        ctlrZipCode.clear();
                        ctlrApartment.clear();
                        ctlrCity.clear();
                        ctlrMajorStreet.clear();
                        ctlrPrimeNo.clear();
                        ctlrSecNo.clear();
                        ctlrEmail.clear();
                        ctlrSocialSec.clear();
                        ctlrDischargeResaon.clear();
                      } else {

                      }
                    },
                    child: Text(
                      AppString.save,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      backgroundColor: ColorManager.blueprime,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: SizedBox(width: AppSize.s80),
              ),
          ]),
          const SizedBox(height: AppSize.s10),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: PageView(
                controller: smIntakePageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  IntakePatientsDatatInfo(
                    ctlrSos: ctlrSos,
                    ctlrMedicalRecord: ctlrMedicalRecord,
                    ctlrfirstName: ctlrfirstName,
                    ctlrMI: ctlrMI,
                    ctlrLastName: ctlrLastName,
                    ctlrSuffix: ctlrSuffix,
                    ctlrDate: ctlrDate,
                    ctlrStreet: ctlrStreet,
                    ctlrZipCode: ctlrZipCode,
                    ctlrApartment: ctlrApartment,
                  // ctlrCity: ctlrCity,
                    ctlrMajorStreet: ctlrMajorStreet,
                    ctlrPrimeNo: ctlrPrimeNo,
                    ctlrSecNo: ctlrSecNo,
                    ctlrEmail: ctlrEmail,
                    ctlrSocialSec: ctlrSocialSec,
                    ctlrDischargeResaon: ctlrDischargeResaon,
                    ctlrDateOfDeath: ctlrDateOfDeath,
                    childReligion:FutureBuilder<List<religiondata>>(
                      future: getReligionDropDown(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7),
                            child: Container(
                                width: AppSize.s250,
                                height: AppSize.s40,
                                decoration: BoxDecoration(
                                    color: ColorManager.white),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Loading...',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: ColorManager.mediumgrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                          );
                        }
                        if (snapshot.hasData) {
                          List<String> dropDownList = [];
                          for (var i in snapshot.data!) {
                            dropDownList.add(i.religion!);
                          }

                          return SizedBox(
                            height: 27,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Religion',
                                labelStyle: GoogleFonts.firaSans(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.greylight,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorManager
                                          .containerBorderGrey),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                ),
                                contentPadding:
                                const EdgeInsets.symmetric(
                                  //   //  vertical: 5,
                                    horizontal: 12),
                              ),
                              // value: selectedCountry,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: ColorManager.blueprime,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff686464),
                              ),

                              onChanged: (newValue) {
                                for (var a in snapshot.data!) {
                                  if (a.religion == newValue) {
                                    selectedReligion = a.religion!;
                                    //country = a
                                    // int? docType = a.companyOfficeID;
                                  }
                                }
                              },
                              items: dropDownList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: Color(0xff575757),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        } else {
                          return const Offstage();
                        }
                      },
                    ),

                    childState: FutureBuilder<List<statedata>>(
                      future: getStateDropDown(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7),
                            child: Container(
                                width: AppSize.s250,
                                height: AppSize.s40,
                                decoration: BoxDecoration(
                                    color: ColorManager.white),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Loading...',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: ColorManager.mediumgrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                          );
                        }
                        if (snapshot.hasData) {
                          List<String> dropDownList = [];
                          for (var i in snapshot.data!) {
                            dropDownList.add(i.name!);
                          }

                          return SizedBox(
                            height: 27,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'State',
                                labelStyle: GoogleFonts.firaSans(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.greylight,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorManager
                                          .containerBorderGrey),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                ),
                                contentPadding:
                                const EdgeInsets.symmetric(
                                  //   //  vertical: 5,
                                    horizontal: 12),
                              ),
                              // value: selectedCountry,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: ColorManager.blueprime,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff686464),
                              ),

                              onChanged: (newValue) {
                                for (var a in snapshot.data!) {
                                  if (a.name == newValue) {
                                    selectedState = a.name!;
                                    //country = a
                                    // int? docType = a.companyOfficeID;
                                  }
                                }
                              },
                              items: dropDownList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: Color(0xff575757),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        } else {
                          return const Offstage();
                        }
                      },
                    ),
                    childCity:  FutureBuilder<List<citydata>>(
                      future: getCityDropDown(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7),
                            child: Container(
                                width: AppSize.s250,
                                height: AppSize.s40,
                                decoration: BoxDecoration(
                                    color: ColorManager.white),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Loading...',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: ColorManager.mediumgrey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )),
                          );
                        }
                        if (snapshot.hasData) {
                          List<String> dropDownList = [];
                          for (var i in snapshot.data!) {
                            dropDownList.add(i.cityName!);
                          }

                          return SizedBox(
                            height: 27,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'City',
                                labelStyle: GoogleFonts.firaSans(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.greylight,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorManager
                                          .containerBorderGrey),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(4.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey),
                                ),
                                contentPadding:
                                const EdgeInsets.symmetric(
                                  //   //  vertical: 5,
                                    horizontal: 12),
                              ),
                              // value: selectedCountry,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: ColorManager.blueprime,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff686464),
                              ),

                              onChanged: (newValue) {
                                for (var a in snapshot.data!) {
                                  if (a.cityName == newValue) {
                                    selectedcity = a.cityName!;
                                    //country = a
                                    // int? docType = a.companyOfficeID;
                                  }
                                }
                              },
                              items: dropDownList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 12,
                                      color: Color(0xff575757),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        } else {
                          return const Offstage();
                        }
                      },
                    ),
                    childRace:FutureBuilder<List<racedata>>(
                    future: getRaceDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7),
                          child: Container(
                              width: AppSize.s250,
                              height: AppSize.s40,
                              decoration: BoxDecoration(
                                  color: ColorManager.white),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Loading...',
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: ColorManager.mediumgrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        );
                      }
                      if (snapshot.hasData) {
                        List<String> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(i.race!);
                        }

                        return SizedBox(
                          height: 27,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Race  / Ethnicity',
                              labelStyle: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.greylight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager
                                        .containerBorderGrey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey),
                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(
                                //   //  vertical: 5,
                                  horizontal: 12),
                            ),
                            // value: selectedCountry,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff686464),
                            ),

                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.race == newValue) {
                                  selectedRace = a.race!;
                                  //country = a
                                  // int? docType = a.companyOfficeID;
                                }
                              }
                            },
                            items: dropDownList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: Color(0xff575757),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return const Offstage();
                      }
                    },
                  ),

                    childLanguage:  FutureBuilder<List<languageSpokendata>>(
                    future: getlanguageSpokenDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7),
                          child: Container(
                              width: AppSize.s250,
                              height: AppSize.s40,
                              decoration: BoxDecoration(
                                  color: ColorManager.white),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Loading...',
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: ColorManager.mediumgrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        );
                      }
                      if (snapshot.hasData) {
                        List<String> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(i.languageSpoken!);
                        }

                        return SizedBox(
                          height: 27,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Language Spoken',
                              labelStyle: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.greylight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager
                                        .containerBorderGrey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey),
                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(
                                //   //  vertical: 5,
                                  horizontal: 12),
                            ),
                            // value: selectedCountry,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff686464),
                            ),

                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.languageSpoken == newValue) {
                                  selectedLanguage = a.languageSpoken!;
                                  //country = a
                                  // int? docType = a.companyOfficeID;
                                }
                              }
                            },
                            items: dropDownList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: Color(0xff575757),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return const Offstage();
                      }
                    },
                  ),


                    childMaritalStatus: FutureBuilder<List<metrialStatusdata>>(
                    future: getMaritalStatusDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7),
                          child: Container(
                              width: AppSize.s250,
                              height: AppSize.s40,
                              decoration: BoxDecoration(
                                  color: ColorManager.white),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Loading...',
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: ColorManager.mediumgrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )),
                        );
                      }
                      if (snapshot.hasData) {
                        List<String> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(i.maritalStatus!);
                        }

                        return SizedBox(
                          height: 27,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Marital Status',
                              labelStyle: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.greylight,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorManager
                                        .containerBorderGrey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(4.0),
                                borderSide: const BorderSide(
                                    color: Colors.grey),
                              ),
                              contentPadding:
                              const EdgeInsets.symmetric(
                                //   //  vertical: 5,
                                  horizontal: 12),
                            ),
                            // value: selectedCountry,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff686464),
                            ),

                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.maritalStatus == newValue) {
                                  selectedMaritalStatus =
                                  a.maritalStatus!;
                                  //country = a
                                  // int? docType = a.companyOfficeID;
                                }
                              }
                            },
                            items: dropDownList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.firaSans(
                                    fontSize: 12,
                                    color: Color(0xff575757),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return const Offstage();
                      }
                    },
                  ),


                  ),
                  IntakePComplianceScreen(patientId: patientId),
                  IntakePlanCareScreen(),
                  IntakeRelatedPartiesScreen(patientId: patientId,),
                  IntakePatientsStayInfoScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ///old
// class SmIntakePatientsScreen extends StatefulWidget {
//   SmIntakePatientsScreen({super.key, });
//
//   @override
//   State<SmIntakePatientsScreen> createState() => _SmIntakePatientsScreenState();
// }
//
// class _SmIntakePatientsScreenState extends State<SmIntakePatientsScreen> {
//   int selectedIndex = 0;
//   bool showProfileBar = false;
//   final PageController smIntakePageController = PageController();
//
//   void selectButton(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//
//     smIntakePageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.ease,
//     );
//   }
//
//   void toggleProfileBar() {
//     setState(() {
//       showProfileBar = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: ColorManager.white,
//       elevation: 4,
//       borderRadius: BorderRadius.circular(14),
//       child: Column(
//         children: [
//           if (showProfileBar) ...[
//
//             IntakeProfileBar()
//           ],
//           SizedBox(height: AppSize.s15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.97,  //1.97
//                 height: 30,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5),
//                       offset: Offset(0, 4),
//                       blurRadius: 4,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                   color: ColorManager.blueprime,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       child: Container(
//                         height: AppSize.s30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 0 ? Colors.white : null,
//                         ),
//                         child: Text(
//                           'Info',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 0
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(0),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: AppSize.s30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 1 ? ColorManager.white : null,
//                         ),
//                         child: Text(
//                           'Compliance',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 1
//                                 ? ColorManager.mediumgrey
//                                 : ColorManager.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(1),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: AppSize.s30,
//                         width: MediaQuery.of(context).size.width / 10,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 2 ? ColorManager.white : null,
//                         ),
//                         child: Text(
//                           'Plan of Care',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 2
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(2),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: AppSize.s30,
//                         width: MediaQuery.of(context).size.width / 9.5,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 3 ? ColorManager.white : null,
//                         ),
//                         child: Text(
//                           'Related Parties',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 3
//                                 ? ColorManager.mediumgrey
//                                 : ColorManager.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(3),
//                     ),
//                     InkWell(
//                       child: Container(
//                         height: AppSize.s30,
//                         width: MediaQuery.of(context).size.width / 9.8,
//                         padding: EdgeInsets.symmetric(vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: selectedIndex == 4 ? ColorManager.white : null,
//                         ),
//                         child: Text(
//                           'Stay Info',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s12,
//                             fontWeight: FontWeightManager.semiBold,
//                             color: selectedIndex == 4
//                                 ? ColorManager.mediumgrey
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                       onTap: () => selectButton(4),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(width: MediaQuery.of(context).size.width / 6),
//               Padding(
//                 padding: const EdgeInsets.only(right: 40.0),
//                 child: Container(
//                   height: AppSize.s26,
//                   width: AppSize.s102,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       toggleProfileBar();
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           // return SchedularSuccessPopup(title: 'Success');
//                           return SchedularInfoSuccessPopup();
//                         },
//                       );
//                     },
//                     child: Text(
//                       AppString.save,
//                       style: GoogleFonts.firaSans(
//                         fontSize: FontSize.s12,
//                         fontWeight: FontWeightManager.bold,
//                         color: ColorManager.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 25,
//                         vertical: 10,
//                       ),
//                       backgroundColor: ColorManager.blueprime,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: AppSize.s10),
//           Expanded(
//             flex: 10,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: PageView(
//                 controller: smIntakePageController,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   IntakePatientsDatatInfo(),
//                   IntakePComplianceScreen(),
//                   IntakePlanCareScreen(),
//                   IntakeRelatedPartiesScreen(),
//                   IntakePatientsStayInfoScreen(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (_validateInputs()) {
//                         // All fields are filled, proceed with saving
//                         final companyId = await TokenManager.getCompanyId();
//                         await IntakeInfoSave(
//                           context,
//                           "14/12/2024", // Example date, replace with actual value
//                           ctlrMedicalRecord.text,
//                           'Pending',
//                           ctlrfirstName.text,
//                           ctlrLastName.text,
//                           ctlrMI.text,
//                           ctlrSuffix.text,
//                           statusType.toString(),
//                           "14/12/2024", // Example date, replace with actual value
//                           ctlrStreet.text,
//                           'California',
//                           ctlrZipCode.text,
//                           ctlrApartment.text,
//                           ctlrCity.text,
//                           'county',
//                           ctlrMajorStreet.text,
//                           ctlrPrimeNo.text,
//                           ctlrSecNo.text,
//                           ctlrEmail.text,
//                           ctlrSocialSec.text,
//                           'English',
//                           ctlrDischargeResaon.text,
//                           'Race',
//                           'Christian',
//                           'Single',
//                           "14/08/2024", // Example date, replace with actual value
//                           1,
//                           'At Land OSC',
//                           'case',
//                           'Type',
//                           companyId,
//                         );
//                       } else {
//                         // Show error message
//                         _showErrorMessage(context);
//                       }
//                     },
//                     child: Text(
//                       AppString.save,
//                       style: GoogleFonts.firaSans(
//                         fontSize: FontSize.s12,
//                         fontWeight: FontWeightManager.bold,
//                         color: ColorManager.white,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 25,
//                         vertical: 10,
//                       ),
//                       backgroundColor: ColorManager.blueprime,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   )