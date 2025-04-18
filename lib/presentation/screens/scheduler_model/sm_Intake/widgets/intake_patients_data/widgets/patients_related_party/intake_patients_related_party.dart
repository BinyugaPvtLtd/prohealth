import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/sm_module_manager/patient_data/patient_data_related_party_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/physician_info/physician_info_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_withbutton_const.dart';
import '../../../../../widgets/constant_widgets/button_constant.dart';
import '../../../intake_flow_contgainer_const.dart';

class IntakeRelatedPartiesScreen extends StatelessWidget {
  final int patientId;

  const IntakeRelatedPartiesScreen({
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
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Review and confirm the data pulled is correct',style: CustomTextStylesCommon.commonStyle(
                        color:Color(0xFF575757),
                        fontWeight: FontWeight.w300,fontSize: 12))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: BlueBGHeadConst(HeadText: "Emergency Contact*"),
              ),
              IntakeFlowContainerConst(
                height: AppSize.s370,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                controller: firstNameController,
                                labelText: 'First Name*',
                              )),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: lastNameController,
                                  labelText: 'Last Name*',
                                  )),
                          SizedBox(width: AppSize.s35),
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SizedBox()),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SizedBox()),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: streetController,
                                  labelText: "Street*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: suitAptController,
                                  labelText: "Suite/Apt#")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child: FutureBuilder<List<CityData>>(
                              future: getCityDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'City',items: [],
                                    onChanged: (newValue) {
                              
                                    },);
                                }
                                if (snapshot.hasData) {
                                  List<DropdownMenuItem<String>> dropDownList = [];
                                  for (var i in snapshot.data!) {
                                    dropDownList.add(DropdownMenuItem<String>(
                                      child: Text(i.cityName!),
                                      value: i.cityName,
                                    ));
                                  }
                              
                                  return CustomDropdownTextFieldsm(headText: 'City',dropDownMenuList: dropDownList,
                                    onChanged: (newValue) {
                                      for (var a in snapshot.data!) {
                                        if (a.cityName == newValue) {
                                          selectedCityEC = a.cityName!;
                                          //country = a
                                          // int? docType = a.companyOfficeID;
                                        }
                                      }
                                    },);
                                  //   SizedBox(
                                  //   height: 27,
                                  //   child: DropdownButtonFormField<String>(
                                  //     decoration: InputDecoration(
                                  //       labelText: 'City',
                                  //       labelStyle: GoogleFonts.firaSans(
                                  //         fontSize: 10.0,
                                  //         fontWeight: FontWeight.w400,
                                  //         color: ColorManager.greylight,
                                  //       ),
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: ColorManager
                                  //                 .containerBorderGrey),
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius:
                                  //         BorderRadius.circular(4.0),
                                  //         borderSide: const BorderSide(
                                  //             color: Colors.grey),
                                  //       ),
                                  //       contentPadding:
                                  //       const EdgeInsets.symmetric(
                                  //         //   //  vertical: 5,
                                  //           horizontal: 12),
                                  //     ),
                                  //     // value: selectedCountry,
                                  //     icon: Icon(
                                  //       Icons.arrow_drop_down,
                                  //       color: ColorManager.blueprime,
                                  //     ),
                                  //     iconSize: 24,
                                  //     elevation: 16,
                                  //     style: GoogleFonts.firaSans(
                                  //       fontSize: 10.0,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: const Color(0xff686464),
                                  //     ),
                                  //
                                  //     onChanged: (newValue) {
                                  //       for (var a in snapshot.data!) {
                                  //         if (a.cityName == newValue) {
                                  //          selectedCityEC = a.cityName!;
                                  //           //country = a
                                  //           // int? docType = a.companyOfficeID;
                                  //         }
                                  //       }
                                  //     },
                                  //     items: dropDownList.map((String value) {
                                  //       return DropdownMenuItem<String>(
                                  //         value: value,
                                  //         child: Text(
                                  //           value,
                                  //           style: GoogleFonts.firaSans(
                                  //             fontSize: 12,
                                  //             color: Color(0xff575757),
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }).toList(),
                                  //   ),
                                  // );
                                } else {
                                  return const Offstage();
                                }
                              },
                            ),
                              
                            // child: SchedularTextField(
                            //     controller: ctlrCity,
                            //     labelText: AppString.city),
                          ),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child:FutureBuilder<List<StateData>>(
                              future: getStateDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'State',items: [],
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
                              
                                  return CustomDropdownTextFieldsm(headText: 'State',dropDownMenuList: dropDownList,
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: zipCodeController,
                                  labelText: "Zip Code*")),
                              
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: phoneNumberController,
                                  phoneField: true,
                                  labelText: "Phone Number*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: emailController,
                                  labelText: "Email*")),
                           // Empty container for alignment
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      CustomIconButtonConst(
                          width: 200,
                          text: 'Add Emergency Contact',
                          icon: Icons.add,
                          onPressed: () {

                          }),

                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.s40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                child: BlueBGHeadConst(HeadText: "Primary Caregiver*"),
              ),
              IntakeFlowContainerConst(
                height: AppSize.s370,
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
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                controller: firstNamePCController,
                                labelText: 'First Name*',

                              )),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: lastNamePCController,
                                  labelText: 'Last Name*',
                                  )),
                          SizedBox(width: AppSize.s35),
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SizedBox()),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SizedBox()),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: streetPCController,
                                  labelText: "Street*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: suitAptPCController,
                                  labelText: "Suite/Apt#")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child: FutureBuilder<List<CityData>>(
                              future: getCityDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'City',items: [],
                                    onChanged: (newValue) {
                  
                                    },);
                                }
                                if (snapshot.hasData) {
                                  List<DropdownMenuItem<String>> dropDownList = [];
                                  for (var i in snapshot.data!) {
                                    dropDownList.add(DropdownMenuItem<String>(
                                      child: Text(i.cityName!),
                                      value: i.cityName,
                                    ));
                                  }
                  
                                  return CustomDropdownTextFieldsm(headText: 'City',dropDownMenuList: dropDownList,
                                    onChanged: (newValue) {
                                      for (var a in snapshot.data!) {
                                        if (a.cityName == newValue) {
                                          selectedCityEC = a.cityName!;
                                          //country = a
                                          // int? docType = a.companyOfficeID;
                                        }
                                      }
                                    },);
                                  //   SizedBox(
                                  //   height: 27,
                                  //   child: DropdownButtonFormField<String>(
                                  //     decoration: InputDecoration(
                                  //       labelText: 'City',
                                  //       labelStyle: GoogleFonts.firaSans(
                                  //         fontSize: 10.0,
                                  //         fontWeight: FontWeight.w400,
                                  //         color: ColorManager.greylight,
                                  //       ),
                                  //       focusedBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: ColorManager
                                  //                 .containerBorderGrey),
                                  //       ),
                                  //       border: OutlineInputBorder(
                                  //         borderRadius:
                                  //         BorderRadius.circular(4.0),
                                  //         borderSide: const BorderSide(
                                  //             color: Colors.grey),
                                  //       ),
                                  //       contentPadding:
                                  //       const EdgeInsets.symmetric(
                                  //         //   //  vertical: 5,
                                  //           horizontal: 12),
                                  //     ),
                                  //     // value: selectedCountry,
                                  //     icon: Icon(
                                  //       Icons.arrow_drop_down,
                                  //       color: ColorManager.blueprime,
                                  //     ),
                                  //     iconSize: 24,
                                  //     elevation: 16,
                                  //     style: GoogleFonts.firaSans(
                                  //       fontSize: 10.0,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: const Color(0xff686464),
                                  //     ),
                                  //
                                  //     onChanged: (newValue) {
                                  //       for (var a in snapshot.data!) {
                                  //         if (a.cityName == newValue) {
                                  //          selectedCityEC = a.cityName!;
                                  //           //country = a
                                  //           // int? docType = a.companyOfficeID;
                                  //         }
                                  //       }
                                  //     },
                                  //     items: dropDownList.map((String value) {
                                  //       return DropdownMenuItem<String>(
                                  //         value: value,
                                  //         child: Text(
                                  //           value,
                                  //           style: GoogleFonts.firaSans(
                                  //             fontSize: 12,
                                  //             color: Color(0xff575757),
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     }).toList(),
                                  //   ),
                                  // );
                                } else {
                                  return const Offstage();
                                }
                              },
                            ),
                  
                            // child: SchedularTextField(
                            //     controller: ctlrCity,
                            //     labelText: AppString.city),
                          ),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child:FutureBuilder<List<StateData>>(
                              future: getStateDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'State',items: [],
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
                  
                                  return CustomDropdownTextFieldsm(headText: 'State',dropDownMenuList: dropDownList,
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: zipCodePCController,
                                  labelText: "Zip Code*")),
                  
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: phoneNumberPCController,
                                  phoneField:true,
                                  labelText: "Phone Number*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: emailPCController,
                                  labelText: "Email*")),
                          // Empty container for alignment
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      CustomIconButtonConst(
                          width: 160,
                          text: 'Add Caregiver',
                          icon: Icons.add,
                          onPressed: () {

                          }),

                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.s40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: BlueBGHeadConst(HeadText: "Patient Representative*"),
              ),
              IntakeFlowContainerConst(
                height: AppSize.s370,
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
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                controller: firstNamePRController,
                                labelText: 'First Name*',

                              )),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: lastNamePRController,
                                  labelText: 'Last Name*',
                                 )),
                          SizedBox(width: AppSize.s35),
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                                onChanged: (newValue) {
                  
                                },)),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                                onChanged: (newValue) {
                  
                                },)),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: streetPRController,
                                  labelText: "Street*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: suitAptPRController,
                                  labelText: "Suite/Apt#")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child: FutureBuilder<List<CityData>>(
                              future: getCityDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'City',items: [],
                                    onChanged: (newValue) {
                  
                                    },);
                                }
                                if (snapshot.hasData) {
                                  List<DropdownMenuItem<String>> dropDownList = [];
                                  for (var i in snapshot.data!) {
                                    dropDownList.add(DropdownMenuItem<String>(
                                      child: Text(i.cityName!),
                                      value: i.cityName,
                                    ));
                                  }
                  
                                  return CustomDropdownTextFieldsm(headText: 'City',dropDownMenuList: dropDownList,
                                    onChanged: (newValue) {
                                      for (var a in snapshot.data!) {
                                        if (a.cityName == newValue) {
                                          selectedCityEC = a.cityName!;
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
                  
                            // child: SchedularTextField(
                            //     controller: ctlrCity,
                            //     labelText: AppString.city),
                          ),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                            child:FutureBuilder<List<StateData>>(
                              future: getStateDropDown(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CustomDropdownTextFieldsm(
                                    initialValue: 'Select',
                                    headText: 'State',items: [],
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
                  
                                  return CustomDropdownTextFieldsm(headText: 'State',dropDownMenuList: dropDownList,
                                    onChanged: (newValue) {
                                      for (var a in snapshot.data!) {
                                        if (a.name == newValue) {
                                          selectedStateEC = a.name!;
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
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: zipCodePRController,
                                  labelText: "Zip Code*")),
                  
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Flexible(
                              child: SchedularTextField(
                                  controller: phoneNumberPRController,
                                  phoneField:true,
                                  labelText: "Phone Number*")),
                          SizedBox(width: AppSize.s35),
                          Flexible(
                              child: SchedularTextField(
                                  controller: emailPRController,
                                  labelText: "Email*")),
                          // Empty container for alignment
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                          SizedBox(width: AppSize.s35),
                          Flexible(child: Container()),
                        ],
                      ),
                      SizedBox(height: AppSize.s16),
                      CustomIconButtonConst(
                          width: 200,
                          text: 'Add Representative',
                          icon: Icons.add,
                          onPressed: () {

                          }),

                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSize.s80),
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

            ],
          ),
        ),
      ),
    );
  }
}
