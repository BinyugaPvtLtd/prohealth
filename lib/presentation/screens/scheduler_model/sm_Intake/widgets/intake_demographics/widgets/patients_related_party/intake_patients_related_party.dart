import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_withbutton_const.dart';
import '../../../../../widgets/constant_widgets/button_constant.dart';
import '../../../intake_flow_contgainer_const.dart';
import 'add_button_screen.dart';

class IntakeRelatedPartiesScreen extends StatelessWidget {
  final int patientId;

   IntakeRelatedPartiesScreen({
    super.key,
    required this.patientId,
  });



  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController firstNamePCController = TextEditingController();
    TextEditingController firstNamePRController = TextEditingController();

    TextEditingController lastNameController = TextEditingController();
    TextEditingController lastNamePCController = TextEditingController();
    TextEditingController lastNamePRController = TextEditingController();

    TextEditingController streetController = TextEditingController();
    TextEditingController streetPCController = TextEditingController();
    TextEditingController streetPRController = TextEditingController();

    TextEditingController ctlrCity = TextEditingController();
    TextEditingController ctlrCityy = TextEditingController();

    TextEditingController suitAptController = TextEditingController();
    TextEditingController suitAptPCController = TextEditingController();
    TextEditingController suitAptPRController = TextEditingController();

    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController phoneNumberPCController = TextEditingController();
    TextEditingController phoneNumberPRController = TextEditingController();

    TextEditingController zipCodeController = TextEditingController();
    TextEditingController zipCodePCController = TextEditingController();
    TextEditingController zipCodePRController = TextEditingController();

    TextEditingController emailController = TextEditingController();
    TextEditingController emailPCController = TextEditingController();
    TextEditingController emailPRController = TextEditingController();

    TextEditingController ctlrState = TextEditingController();
   // TextEditingController emailPRController = TextEditingController();

    TextEditingController optforChaps = TextEditingController();
    TextEditingController dummyCtrl = TextEditingController();
    bool isOptForCAHPSSurvey = false;
    bool copyEmergencyContactPR = false;
    bool copyPrimaryCaregiverPR = false;
    bool copyEmergencyContactPC = false;
    bool copyPatientPC = false;

    bool noPCData = false;
    bool noPRData = false;
    bool noEmergencyData = false;

    String? status = 'Active';
    String? selectedStateEC;
    String? selectedCityEC;
    String? selectedStatePC;
    String? selectedCityPC;
    String? selectedCity;
    String? selectedCountry;
    String? selectedRelationshipEC;
    String? selectedRelationshipPC;
    String? selectedPriority;
    return ChangeNotifierProvider(
        create: (_) => EmergencyContactProvider(),
    child:Scaffold(
      backgroundColor: ColorManager.white,
      body: Consumer<SmIntakeProviderManager>(
          builder: (context,providerState,child) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Review and confirm the data pulled is correct',
                            style: SMItalicTextConst.customTextStyle(context))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // InkWell(
                  //     splashColor: Colors.transparent,
                  //     highlightColor: Colors.transparent,
                  //     hoverColor: Colors.transparent,
                  //     onTap:(){},
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                  //       child: Row(
                  //         children: [
                  //           Icon(
                  //             Icons.arrow_back,
                  //             size: IconSize.I16,
                  //             color: ColorManager.mediumgrey,
                  //
                  //           ),
                  //           SizedBox(width: 5,),
                  //           Text(
                  //             'Go Back',
                  //            style:TextStyle(
                  //              fontSize: FontSize.s14,
                  //              fontWeight: FontWeight.w700,
                  //              color: ColorManager.mediumgrey,
                  //            ),
                  //           ),
                  //         ],
                  //       ),
                  //     )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Emergency Contact*"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p50,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: AppSize.s16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CheckboxTile(
                              title: 'No Emergency Contact',
                              initialValue: noEmergencyData,
                              onChanged: (value) {

                              },
                            )
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),


                        Consumer<EmergencyContactProvider>(
                          builder: (context, provider, _) {
                            return Column(
                              children: provider.addEmergencyContactKeys.asMap().entries.map((entry) {
                                int index = entry.key;
                                GlobalKey<AddEemergencyContactState> key = entry.value;
                                return AddEemergencyContact(
                                  key: key,
                                  index: index + 1,
                                  onRemove: () => provider.removeEmergency(key),
                                  patientId: patientId,
                                  isVisible: provider.isVisible,
                                );
                              }).toList(),
                            );
                          },
                        ),

                      //   providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNameController,
                      //             labelText: 'First Name*',
                      //           )),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: lastNameController,
                      //             labelText: 'Last Name*',
                      //           )),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.relationship == newValue) {
                      //                       selectedRelationshipEC = a.relationship!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNameController,
                      //             labelText: 'First Name*',
                      //           )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: lastNameController,
                      //               labelText: 'Last Name*',
                      //               )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.relationship == newValue) {
                      //                       selectedRelationshipEC = a.relationship!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       const Flexible(
                      //           child: SizedBox()),
                      //       const SizedBox(width: AppSize.s35),
                      //       const Flexible(
                      //           child: SizedBox()),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetController,
                      //               labelText: "Street*")),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptController,
                      //               labelText: "Suite/Apt#")),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         child: FutureBuilder<List<CityData>>(
                      //           future: getCityDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'City*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.cityName!),
                      //                   value: i.cityName,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.cityName == newValue) {
                      //                       selectedCityEC = a.cityName!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //               //   SizedBox(
                      //               //   height: 27,
                      //               //   child: DropdownButtonFormField<String>(
                      //               //     decoration: InputDecoration(
                      //               //       labelText: 'City',
                      //               //       labelStyle: GoogleFonts.firaSans(
                      //               //         fontSize: 10.0,
                      //               //         fontWeight: FontWeight.w400,
                      //               //         color: ColorManager.greylight,
                      //               //       ),
                      //               //       focusedBorder: OutlineInputBorder(
                      //               //         borderSide: BorderSide(
                      //               //             color: ColorManager
                      //               //                 .containerBorderGrey),
                      //               //       ),
                      //               //       border: OutlineInputBorder(
                      //               //         borderRadius:
                      //               //         BorderRadius.circular(4.0),
                      //               //         borderSide: const BorderSide(
                      //               //             color: Colors.grey),
                      //               //       ),
                      //               //       contentPadding:
                      //               //       const EdgeInsets.symmetric(
                      //               //         //   //  vertical: 5,
                      //               //           horizontal: 12),
                      //               //     ),
                      //               //     // value: selectedCountry,
                      //               //     icon: Icon(
                      //               //       Icons.arrow_drop_down,
                      //               //       color: ColorManager.blueprime,
                      //               //     ),
                      //               //     iconSize: 24,
                      //               //     elevation: 16,
                      //               //     style: GoogleFonts.firaSans(
                      //               //       fontSize: 10.0,
                      //               //       fontWeight: FontWeight.w400,
                      //               //       color: const Color(0xff686464),
                      //               //     ),
                      //               //
                      //               //     onChanged: (newValue) {
                      //               //       for (var a in snapshot.data!) {
                      //               //         if (a.cityName == newValue) {
                      //               //          selectedCityEC = a.cityName!;
                      //               //           //country = a
                      //               //           // int? docType = a.companyOfficeID;
                      //               //         }
                      //               //       }
                      //               //     },
                      //               //     items: dropDownList.map((String value) {
                      //               //       return DropdownMenuItem<String>(
                      //               //         value: value,
                      //               //         child: Text(
                      //               //           value,
                      //               //           style: GoogleFonts.firaSans(
                      //               //             fontSize: 12,
                      //               //             color: Color(0xff575757),
                      //               //             fontWeight: FontWeight.w400,
                      //               //           ),
                      //               //         ),
                      //               //       );
                      //               //     }).toList(),
                      //               //   ),
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //
                      //         // child: SchedularTextField(
                      //         //     controller: ctlrCity,
                      //         //     labelText: AppString.city),
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetController,
                      //               labelText: "Street*")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptController,
                      //               labelText: "Suite/Apt#")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child: FutureBuilder<List<CityData>>(
                      //           future: getCityDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'City*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.cityName!),
                      //                   value: i.cityName,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.cityName == newValue) {
                      //                       selectedCityEC = a.cityName!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //               //   SizedBox(
                      //               //   height: 27,
                      //               //   child: DropdownButtonFormField<String>(
                      //               //     decoration: InputDecoration(
                      //               //       labelText: 'City',
                      //               //       labelStyle: GoogleFonts.firaSans(
                      //               //         fontSize: 10.0,
                      //               //         fontWeight: FontWeight.w400,
                      //               //         color: ColorManager.greylight,
                      //               //       ),
                      //               //       focusedBorder: OutlineInputBorder(
                      //               //         borderSide: BorderSide(
                      //               //             color: ColorManager
                      //               //                 .containerBorderGrey),
                      //               //       ),
                      //               //       border: OutlineInputBorder(
                      //               //         borderRadius:
                      //               //         BorderRadius.circular(4.0),
                      //               //         borderSide: const BorderSide(
                      //               //             color: Colors.grey),
                      //               //       ),
                      //               //       contentPadding:
                      //               //       const EdgeInsets.symmetric(
                      //               //         //   //  vertical: 5,
                      //               //           horizontal: 12),
                      //               //     ),
                      //               //     // value: selectedCountry,
                      //               //     icon: Icon(
                      //               //       Icons.arrow_drop_down,
                      //               //       color: ColorManager.blueprime,
                      //               //     ),
                      //               //     iconSize: 24,
                      //               //     elevation: 16,
                      //               //     style: GoogleFonts.firaSans(
                      //               //       fontSize: 10.0,
                      //               //       fontWeight: FontWeight.w400,
                      //               //       color: const Color(0xff686464),
                      //               //     ),
                      //               //
                      //               //     onChanged: (newValue) {
                      //               //       for (var a in snapshot.data!) {
                      //               //         if (a.cityName == newValue) {
                      //               //          selectedCityEC = a.cityName!;
                      //               //           //country = a
                      //               //           // int? docType = a.companyOfficeID;
                      //               //         }
                      //               //       }
                      //               //     },
                      //               //     items: dropDownList.map((String value) {
                      //               //       return DropdownMenuItem<String>(
                      //               //         value: value,
                      //               //         child: Text(
                      //               //           value,
                      //               //           style: GoogleFonts.firaSans(
                      //               //             fontSize: 12,
                      //               //             color: Color(0xff575757),
                      //               //             fontWeight: FontWeight.w400,
                      //               //           ),
                      //               //         ),
                      //               //       );
                      //               //     }).toList(),
                      //               //   ),
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //
                      //         // child: SchedularTextField(
                      //         //     controller: ctlrCity,
                      //         //     labelText: AppString.city),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<StateData>>(
                      //           future: getStateDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'State*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.name),
                      //                   value: i.name,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.name == newValue) {
                      //                       selectedStateEC = a.name!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //               // return SchedularDropdown(
                      //               //   labelText: 'State',
                      //               //   // labelStyle: GoogleFonts.firaSans(
                      //               //   //   fontSize: 12,
                      //               //   //   color: Color(0xff575757),
                      //               //   //   fontWeight: FontWeight.w400,
                      //               //   // ),
                      //               //   // labelFontSize: 12,
                      //               //   items: dropDownList,
                      //               //   onChanged: (newValue) {
                      //               //     for (var a in snapshot.data!) {
                      //               //       if (a.name == newValue) {
                      //               //         selectedStatepr = a.name!;
                      //               //         // stateId = a.stateId!;
                      //               //         //  print("Dept ID ${stateId}");
                      //               //         // int docType = a.employeeTypesId;
                      //               //         // Do something with docType
                      //               //       }
                      //               //     }
                      //               //   },
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodeController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //         child:FutureBuilder<List<StateData>>(
                      //           future: getStateDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'State*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.name),
                      //                   value: i.name,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.name == newValue) {
                      //                       selectedStateEC = a.name!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //               // return SchedularDropdown(
                      //               //   labelText: 'State',
                      //               //   // labelStyle: GoogleFonts.firaSans(
                      //               //   //   fontSize: 12,
                      //               //   //   color: Color(0xff575757),
                      //               //   //   fontWeight: FontWeight.w400,
                      //               //   // ),
                      //               //   // labelFontSize: 12,
                      //               //   items: dropDownList,
                      //               //   onChanged: (newValue) {
                      //               //     for (var a in snapshot.data!) {
                      //               //       if (a.name == newValue) {
                      //               //         selectedStatepr = a.name!;
                      //               //         // stateId = a.stateId!;
                      //               //         //  print("Dept ID ${stateId}");
                      //               //         // int docType = a.employeeTypesId;
                      //               //         // Do something with docType
                      //               //       }
                      //               //     }
                      //               //   },
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodeController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberController,
                      //               phoneField: true,
                      //               labelText: "Phone Number*")),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberController,
                      //               phoneField: true,
                      //               labelText: "Phone Number*")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailController,
                      //               labelText: "Email")),
                      //        // Empty container for alignment
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailController,
                      //               labelText: "Email")),
                      //       // Empty container for alignment
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(child: Container()),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(child: Container()),
                      //     ],
                      //   )
                      //     : const Offstage(),


                      ///
                        const SizedBox(height: AppSize.s16),
                        CustomIconButtonConst(
                            width:  AppSize.s200,
                            text: 'Add Emergency Contact',
                            icon: Icons.add,
                            onPressed: () {
                              context.read<EmergencyContactProvider>().addEmergency();
                            }),
                        const SizedBox(height: AppSize.s16),
                        Divider(),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                    child: BlueBGHeadConst(HeadText: "Primary Caregiver*"),
                  ),
                  IntakeFlowContainerConst(
                    height: providerState.isContactTrue ?AppSize.s430 :AppSize.s370,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  CheckboxTile(
                                    title: 'Copy Emergency Contact',
                                    initialValue: copyEmergencyContactPC,
                                    onChanged: (value) {
                                      // setState(() {
                                      //
                                      // });
                                    },
                                  ),
                                  CheckboxTile(
                                    title: 'Copy Patient Representative',
                                    initialValue: copyPatientPC,
                                    onChanged: (value) {

                                    },
                                  )
                                ],
                              ),
                              CheckboxTile(
                                title: 'No Caregiver Available',
                                initialValue: noPCData,
                                onChanged: (value) {

                                },
                              )

                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: firstNamePCController,
                                    labelText: 'First Name*',

                                  )),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: lastNamePCController,
                                    labelText: 'Last Name*',
                                  )),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<RelationshipData>>(
                                  future: getRelationshipDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CustomDropdownTextFieldsm(
                                        initialValue: 'Select',
                                        headText: 'Relationship',items: [],
                                        onChanged: (newValue) {

                                        },);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.relationship!),
                                          value: i.relationship,
                                        ));
                                      }

                                      return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                                        onChanged: (newValue) {
                                          for (var a in snapshot.data!) {
                                            if (a.relationship == newValue) {
                                              selectedRelationshipEC = a.relationship!;
                                              //country = a
                                              // int? docType = a.companyOfficeID;
                                            }
                                          }
                                        },);


                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: firstNamePCController,
                                    labelText: 'First Name*',

                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: lastNamePCController,
                                      labelText: 'Last Name*',
                                      )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<RelationshipData>>(
                                  future: getRelationshipDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CustomDropdownTextFieldsm(
                                        initialValue: 'Select',
                                        headText: 'Relationship',items: [],
                                        onChanged: (newValue) {

                                        },);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.relationship!),
                                          value: i.relationship,
                                        ));
                                      }

                                      return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                                        onChanged: (newValue) {
                                          for (var a in snapshot.data!) {
                                            if (a.relationship == newValue) {
                                              selectedRelationshipEC = a.relationship!;
                                              //country = a
                                              // int? docType = a.companyOfficeID;
                                            }
                                          }
                                        },);


                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: AppSize.s35),
                              const Flexible(
                                  child: SizedBox()),
                              const SizedBox(width: AppSize.s35),
                              const Flexible(
                                  child: SizedBox()),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: streetPCController,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                      labelText: "Street*")),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: suitAptPCController,
                                      labelText: "Suite/Apt#")),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'City*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.cityName == newValue) {
                                //               selectedCityEC = a.cityName!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //       //   SizedBox(
                                //       //   height: 27,
                                //       //   child: DropdownButtonFormField<String>(
                                //       //     decoration: InputDecoration(
                                //       //       labelText: 'City',
                                //       //       labelStyle: GoogleFonts.firaSans(
                                //       //         fontSize: 10.0,
                                //       //         fontWeight: FontWeight.w400,
                                //       //         color: ColorManager.greylight,
                                //       //       ),
                                //       //       focusedBorder: OutlineInputBorder(
                                //       //         borderSide: BorderSide(
                                //       //             color: ColorManager
                                //       //                 .containerBorderGrey),
                                //       //       ),
                                //       //       border: OutlineInputBorder(
                                //       //         borderRadius:
                                //       //         BorderRadius.circular(4.0),
                                //       //         borderSide: const BorderSide(
                                //       //             color: Colors.grey),
                                //       //       ),
                                //       //       contentPadding:
                                //       //       const EdgeInsets.symmetric(
                                //       //         //   //  vertical: 5,
                                //       //           horizontal: 12),
                                //       //     ),
                                //       //     // value: selectedCountry,
                                //       //     icon: Icon(
                                //       //       Icons.arrow_drop_down,
                                //       //       color: ColorManager.blueprime,
                                //       //     ),
                                //       //     iconSize: 24,
                                //       //     elevation: 16,
                                //       //     style: GoogleFonts.firaSans(
                                //       //       fontSize: 10.0,
                                //       //       fontWeight: FontWeight.w400,
                                //       //       color: const Color(0xff686464),
                                //       //     ),
                                //       //
                                //       //     onChanged: (newValue) {
                                //       //       for (var a in snapshot.data!) {
                                //       //         if (a.cityName == newValue) {
                                //       //          selectedCityEC = a.cityName!;
                                //       //           //country = a
                                //       //           // int? docType = a.companyOfficeID;
                                //       //         }
                                //       //       }
                                //       //     },
                                //       //     items: dropDownList.map((String value) {
                                //       //       return DropdownMenuItem<String>(
                                //       //         value: value,
                                //       //         child: Text(
                                //       //           value,
                                //       //           style: GoogleFonts.firaSans(
                                //       //             fontSize: 12,
                                //       //             color: Color(0xff575757),
                                //       //             fontWeight: FontWeight.w400,
                                //       //           ),
                                //       //         ),
                                //       //       );
                                //       //     }).toList(),
                                //       //   ),
                                //       // );
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),

                                child: SchedularTextField(
                                    controller: ctlrCity,
                                    labelText: AppString.city),
                              ),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: streetPCController,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),

                                      labelText: "Street*")),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: suitAptPCController,
                                      labelText: "Suite/Apt#")),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'City*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.cityName == newValue) {
                                //               selectedCityEC = a.cityName!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //       //   SizedBox(
                                //       //   height: 27,
                                //       //   child: DropdownButtonFormField<String>(
                                //       //     decoration: InputDecoration(
                                //       //       labelText: 'City',
                                //       //       labelStyle: GoogleFonts.firaSans(
                                //       //         fontSize: 10.0,
                                //       //         fontWeight: FontWeight.w400,
                                //       //         color: ColorManager.greylight,
                                //       //       ),
                                //       //       focusedBorder: OutlineInputBorder(
                                //       //         borderSide: BorderSide(
                                //       //             color: ColorManager
                                //       //                 .containerBorderGrey),
                                //       //       ),
                                //       //       border: OutlineInputBorder(
                                //       //         borderRadius:
                                //       //         BorderRadius.circular(4.0),
                                //       //         borderSide: const BorderSide(
                                //       //             color: Colors.grey),
                                //       //       ),
                                //       //       contentPadding:
                                //       //       const EdgeInsets.symmetric(
                                //       //         //   //  vertical: 5,
                                //       //           horizontal: 12),
                                //       //     ),
                                //       //     // value: selectedCountry,
                                //       //     icon: Icon(
                                //       //       Icons.arrow_drop_down,
                                //       //       color: ColorManager.blueprime,
                                //       //     ),
                                //       //     iconSize: 24,
                                //       //     elevation: 16,
                                //       //     style: GoogleFonts.firaSans(
                                //       //       fontSize: 10.0,
                                //       //       fontWeight: FontWeight.w400,
                                //       //       color: const Color(0xff686464),
                                //       //     ),
                                //       //
                                //       //     onChanged: (newValue) {
                                //       //       for (var a in snapshot.data!) {
                                //       //         if (a.cityName == newValue) {
                                //       //          selectedCityEC = a.cityName!;
                                //       //           //country = a
                                //       //           // int? docType = a.companyOfficeID;
                                //       //         }
                                //       //       }
                                //       //     },
                                //       //     items: dropDownList.map((String value) {
                                //       //       return DropdownMenuItem<String>(
                                //       //         value: value,
                                //       //         child: Text(
                                //       //           value,
                                //       //           style: GoogleFonts.firaSans(
                                //       //             fontSize: 12,
                                //       //             color: Color(0xff575757),
                                //       //             fontWeight: FontWeight.w400,
                                //       //           ),
                                //       //         ),
                                //       //       );
                                //       //     }).toList(),
                                //       //   ),
                                //       // );
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),

                                child: SchedularTextField(
                                    controller: ctlrCity,
                                    labelText: AppString.city),
                              ),
                              const SizedBox(width: AppSize.s35),
                              ///state
                              Flexible(
                                // child:FutureBuilder<List<StateData>>(
                                //   future: getStateDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'State*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.name),
                                //           value: i.name,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.name == newValue) {
                                //               selectedStateEC = a.name!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //
                                //       // return SchedularDropdown(
                                //       //   labelText: 'State',
                                //       //   // labelStyle: GoogleFonts.firaSans(
                                //       //   //   fontSize: 12,
                                //       //   //   color: Color(0xff575757),
                                //       //   //   fontWeight: FontWeight.w400,
                                //       //   // ),
                                //       //   // labelFontSize: 12,
                                //       //   items: dropDownList,
                                //       //   onChanged: (newValue) {
                                //       //     for (var a in snapshot.data!) {
                                //       //       if (a.name == newValue) {
                                //       //         selectedStatepr = a.name!;
                                //       //         // stateId = a.stateId!;
                                //       //         //  print("Dept ID ${stateId}");
                                //       //         // int docType = a.employeeTypesId;
                                //       //         // Do something with docType
                                //       //       }
                                //       //     }
                                //       //   },
                                //       // );
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                child: SchedularTextField(
                                    controller: ctlrCity,
                                    labelText: AppString.city),
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: zipCodePCController,
                                      onlyAllowNumbers: true,
                                      labelText: "Zip Code*")),

                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?  Row(
                            children: [
                              ///state
                              Flexible(
                                child:FutureBuilder<List<StateData>>(
                                  future: getStateDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CustomDropdownTextFieldsm(
                                        initialValue: 'Select',
                                        headText: 'State*',items: [],
                                        onChanged: (newValue) {

                                        },);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.name),
                                          value: i.name,
                                        ));
                                      }

                                      return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                        onChanged: (newValue) {
                                          for (var a in snapshot.data!) {
                                            if (a.name == newValue) {
                                              selectedStateEC = a.name!;
                                              //country = a
                                              // int? docType = a.companyOfficeID;
                                            }
                                          }
                                        },);

                                      // return SchedularDropdown(
                                      //   labelText: 'State',
                                      //   // labelStyle: GoogleFonts.firaSans(
                                      //   //   fontSize: 12,
                                      //   //   color: Color(0xff575757),
                                      //   //   fontWeight: FontWeight.w400,
                                      //   // ),
                                      //   // labelFontSize: 12,
                                      //   items: dropDownList,
                                      //   onChanged: (newValue) {
                                      //     for (var a in snapshot.data!) {
                                      //       if (a.name == newValue) {
                                      //         selectedStatepr = a.name!;
                                      //         // stateId = a.stateId!;
                                      //         //  print("Dept ID ${stateId}");
                                      //         // int docType = a.employeeTypesId;
                                      //         // Do something with docType
                                      //       }
                                      //     }
                                      //   },
                                      // );
                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: zipCodePCController,
                                      onlyAllowNumbers: true,
                                      labelText: "Zip Code*")),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: phoneNumberPCController,
                                      phoneField:true,
                                      labelText: "Phone Number*")),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: phoneNumberPCController,
                                      phoneField:true,
                                      labelText: "Phone Number*")),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: emailPCController,
                                      labelText: "Email")),
                              // Empty container for alignment
                              const SizedBox(width: AppSize.s35),
                              Flexible(child: Container()),
                              const SizedBox(width: AppSize.s35),
                              Flexible(child: Container()),
                              const SizedBox(width: AppSize.s35),
                              Flexible(child: Container()),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: emailPCController,
                                      labelText: "Email")),
                              // Empty container for alignment
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(child: Container()),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(child: Container()),
                            ],
                          ) : const Offstage(),
                          const SizedBox(height: AppSize.s16),
                          CustomIconButtonConst(
                              width: AppSize.s140,
                              text: 'Add Caregiver',
                              icon: Icons.add,
                              onPressed: () {

                              }),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Patient Representative*"),
                  ),
                  IntakeFlowContainerConst(
                    height: providerState.isContactTrue ?AppSize.s430 :AppSize.s370,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  CheckboxTile(
                                    title: 'Copy Emergency Contact',
                                    initialValue: copyEmergencyContactPR,
                                    onChanged: (value) {
                                      // setState(() {
                                      //
                                      // });
                                    },
                                  ),
                                  CheckboxTile(
                                    title: 'Copy Primary Caregiver',
                                    initialValue: copyPrimaryCaregiverPR,
                                    onChanged: (value) {

                                    },
                                  )
                                ],
                              ),
                              CheckboxTile(
                                title: 'No Selected Representative',
                                initialValue: noPRData,
                                onChanged: (value) {

                                },
                              )

                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: firstNamePRController,
                                    labelText: 'First Name*',

                                  )),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: lastNamePRController,
                                    labelText: 'Last Name*',
                                  )),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<RelationshipData>>(
                                  future: getRelationshipDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CustomDropdownTextFieldsm(
                                        initialValue: 'Select',
                                        headText: 'Relationship',items: [],
                                        onChanged: (newValue) {

                                        },);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.relationship!),
                                          value: i.relationship,
                                        ));
                                      }

                                      return
                                        CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.relationship == newValue) {
                                                selectedRelationshipEC = a.relationship!;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          },);


                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: firstNamePRController,
                                    labelText: 'First Name*',

                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: lastNamePRController,
                                      labelText: 'Last Name*',
                                     )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<RelationshipData>>(
                                  future: getRelationshipDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CustomDropdownTextFieldsm(
                                        initialValue: 'Select',
                                        headText: 'Relationship',items: [],
                                        onChanged: (newValue) {

                                        },);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.relationship!),
                                          value: i.relationship,
                                        ));
                                      }

                                      return
                                        CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.relationship == newValue) {
                                                selectedRelationshipEC = a.relationship!;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          },);


                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                                    onChanged: (newValue) {

                                    },)),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                                    onChanged: (newValue) {

                                    },)),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                                    onChanged: (newValue) {

                                    },)),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                                    onChanged: (newValue) {

                                    },)),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: streetPRController,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                      labelText: "Street*")),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: streetPRController,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                      labelText: "Street*")),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: suitAptPRController,
                                      labelText: "Suite/Apt#")),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'City*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.cityName == newValue) {
                                //               selectedCityEC = a.cityName!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),

                                child: SchedularTextField(
                                    controller: ctlrCity,
                                    labelText: AppString.city),
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                // child:FutureBuilder<List<StateData>>(
                                //   future: getStateDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'State*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.name),
                                //           value: i.name,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.name == newValue) {
                                //               selectedStateEC = a.name!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //
                                //
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                //
                                child: SchedularTextField(
                                  labelText: "State*",
                                  controller: ctlrState,
                                )
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: zipCodePRController,
                                      onlyAllowNumbers: true,
                                      labelText: "Zip Code*")),

                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: suitAptPRController,
                                      labelText: "Suite/Apt#")),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'City*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.cityName == newValue) {
                                //               selectedCityEC = a.cityName!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),

                                child: SchedularTextField(
                                    controller: ctlrCity,
                                    labelText: AppString.city),
                              ),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                // child:FutureBuilder<List<StateData>>(
                                //   future: getStateDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return CustomDropdownTextFieldsm(
                                //         initialValue: 'Select',
                                //         headText: 'State*',items: [],
                                //         onChanged: (newValue) {
                                //
                                //         },);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.name),
                                //           value: i.name,
                                //         ));
                                //       }
                                //
                                //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                //         onChanged: (newValue) {
                                //           for (var a in snapshot.data!) {
                                //             if (a.name == newValue) {
                                //               selectedStateEC = a.name!;
                                //               //country = a
                                //               // int? docType = a.companyOfficeID;
                                //             }
                                //           }
                                //         },);
                                //
                                //
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),

                                child: SchedularTextField(
                                  labelText: "State*",
                                  controller: ctlrState,
                                )
                              ),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: phoneNumberPRController,
                                      phoneField:true,
                                      labelText: "Phone Number*")),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: emailPRController,
                                      labelText: "Email")),
                              // Empty container for alignment
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(child: Container()),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(child: Container()),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(child: Container()),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                        providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: zipCodePRController,
                                      onlyAllowNumbers: true,
                                      labelText: "Zip Code*")),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: phoneNumberPRController,
                                      phoneField:true,
                                      labelText: "Phone Number*")),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: emailPRController,
                                      labelText: "Email")),
                            ],
                          ): const Offstage(),
                          const SizedBox(height: AppSize.s16),
                          CustomIconButtonConst(
                              width:  AppSize.s170,
                              text: 'Add Representative',
                              icon: Icons.add,
                              onPressed: () {

                              }),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CustomButtonTransparent(
                        text: "Skip",
                        onPressed: () {

                        },
                      ),
                      CustomElevatedButton(
                        width: AppSize.s100,
                        text: AppString.save,
                        onPressed: (){},
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s30),

                ],
              ),
            ),
          );
        }
      ),
    )
    );
  }
}






// class AddEemergencyContact extends StatefulWidget {
//   const AddEemergencyContact({super.key});
//
//   @override
//   _AddEemergencyContactState createState() => _AddEemergencyContactState();
// }
//
// class _AddEemergencyContactState extends State<AddEemergencyContact> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
