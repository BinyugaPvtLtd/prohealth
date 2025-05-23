import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/services/api/managers/hr_module_manager/add_employee/clinical_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/intake/all_intake_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/hr_module_data/add_employee/clinical.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographic_patient_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographics_dropdown_data.dart';
import '../../../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../../../textfield_dropdown_constant/schedular_dropdown_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_withbutton_const.dart';
import '../../../intake_flow_contgainer_const.dart';

class IntakePatientsDatatInfo extends StatelessWidget {
  final Widget childState;
 // final Widget childCity;
  final Widget childCountry;

  final Widget childStatus;
  final VoidCallback isIButtonPressed;

  IntakePatientsDatatInfo(
      {super.key,
      required this.childState,
     // required this.childCity,

      required this.childCountry, required this.childStatus, required this.isIButtonPressed});
  @override
  Widget build(BuildContext context) {
    String? status = '';

    String? statustype;
    String? selectedStatus;
    String? selectedCountry;
    String? selectedRace;
    String? selectedState;
    String? selectedcity;
    String? selectedLanguage;
    String? selectedReligion;
    String? selectedMaritalStatus;
    String? dateOfDeath;
    int primaryLanguageid = 0;
    int countyId = 0;
    int zoneId = 0;
    int residentialId = 0;
    int maritalStatusId = 0;


    TextEditingController ctlrMedicalRecord = TextEditingController();
    TextEditingController ctlrfirstName = TextEditingController();
    TextEditingController ctlrLastName = TextEditingController();
    TextEditingController ctlrSuffix = TextEditingController();
    TextEditingController ctlrDate = TextEditingController();
    TextEditingController ctlrStreet = TextEditingController();
    TextEditingController ctlrZipCode = TextEditingController();
    TextEditingController ctlrSuitApt = TextEditingController();
    TextEditingController ctlrCity = TextEditingController();
    TextEditingController ctlrState = TextEditingController();
    TextEditingController ctlrPrimaryContact = TextEditingController();
    TextEditingController ctlrSecondContact = TextEditingController();
    TextEditingController ctlrPrimeNo = TextEditingController();
    TextEditingController ctlrSecNo = TextEditingController();
    TextEditingController ctlrEmail = TextEditingController();
    TextEditingController ctlrSocialSec = TextEditingController();
    TextEditingController facilityNameController = TextEditingController();
    TextEditingController locationNotesController = TextEditingController();
    TextEditingController primaryContactNameController = TextEditingController();
    TextEditingController cahpsContactController = TextEditingController();
    TextEditingController secondaryPhoneController = TextEditingController();
    TextEditingController secEmailController = TextEditingController();
    TextEditingController primaryLanguageController = TextEditingController();
    TextEditingController residencyController = TextEditingController();
    TextEditingController maritalStatusController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController zoneController = TextEditingController();
    final providerPatientId = Provider.of<DiagnosisProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: FutureBuilder<DemographicPatientDataModel>(
        future: getDemographichPatientDetail(context: context, patientId: providerPatientId.patientId),
        builder: (context,snapshotPatient) {
          if(snapshotPatient.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: ColorManager.blueprime,),
            );
          }
          primaryLanguageid = snapshotPatient.data!.fkSpokenLanguage;
          countyId = snapshotPatient.data!.fkCountryId;
          zoneId = snapshotPatient.data!.fkZoneId;
          residentialId = snapshotPatient.data!.fkResidenceTypeId;
          maritalStatusId = snapshotPatient.data!.fkMaritalStatus;
           ctlrMedicalRecord = TextEditingController(text: snapshotPatient.data!.demoMiddleInitial);
           ctlrfirstName = TextEditingController(text: snapshotPatient.data!.demoFirstName);
           ctlrLastName = TextEditingController(text: snapshotPatient.data!.demoLastName);
           ctlrSuffix = TextEditingController(text: snapshotPatient.data!.demoSuffix);
           ctlrDate = TextEditingController(text: snapshotPatient.data!.demoDob);
           ctlrStreet = TextEditingController(text: snapshotPatient.data!.demoStreet);
           ctlrZipCode = TextEditingController(text: snapshotPatient.data!.demoZipcode);
           ctlrState = TextEditingController(text: snapshotPatient.data!.demoState);
            ctlrSuitApt = TextEditingController(text: snapshotPatient.data!.demoSuite);
           ctlrCity = TextEditingController(text: snapshotPatient.data!.demoCity);
           ctlrPrimaryContact = TextEditingController(text: snapshotPatient.data!.demoPrimaryContact);
           ctlrSecondContact = TextEditingController(text: snapshotPatient.data!.demoSecondaryContact);
           ctlrPrimeNo = TextEditingController(text: snapshotPatient.data!.demoPrimaryPhone);
           ctlrSecNo = TextEditingController(text: snapshotPatient.data!.demoSecondaryPhone);
           ctlrEmail = TextEditingController(text: snapshotPatient.data!.demoPrimaryEmail);
           ctlrSocialSec = TextEditingController(text: snapshotPatient.data!.demoSocialSecurity);
           facilityNameController = TextEditingController(text: snapshotPatient.data!.demoFacilityName);
           locationNotesController = TextEditingController(text: snapshotPatient.data!.demoLocationNotes);
           primaryContactNameController = TextEditingController(text: snapshotPatient.data!.demoPrimaryContactName);
           cahpsContactController = TextEditingController(text: snapshotPatient.data!.demoCahpsContact);
           secondaryPhoneController = TextEditingController(text:snapshotPatient.data!.demoSecondaryContactName );
           secEmailController = TextEditingController(text:snapshotPatient.data!.demoSecondaryEmail );
           // primaryLanguageController = TextEditingController(text:snapshotPatient.data.demoPr );
          return Consumer<SmIntakeProviderManager>(
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
                        //SizedBox(height: 10,),
                        providerState.isLeftSidebarOpen ? Container(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap:(){},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back,
                                      size: IconSize.I16,
                                      color: ColorManager.mediumgrey,

                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      'Go Back',
                                      style:TextStyle(
                                        // fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.mediumgrey,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ) : Offstage(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: BlueBGHeadConst(HeadText: "Contact Information"),
                        ),

                        IntakeFlowContainerConst(
                          height:providerState.isContactTrue ? AppSize.s640:AppSize.s500,
                          child: Column(
                            children: [
                            providerState.isContactTrue ?  Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        isIClicked: isIButtonPressed,
                                        controller: ctlrfirstName,
                                        labelText: 'First Name*',
                                        //showDatePicker:true
                                      )),
                                  SizedBox(width:  providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrMedicalRecord,
                                          labelText: 'Middle Initial',
                                          initialValue: 'A')),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrLastName,
                                          labelText: "Last Name*",
                                          initialValue: 'Erica')),
                                ],
                              ):
                              Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        isIClicked: isIButtonPressed,
                                    controller: ctlrfirstName,
                                    labelText: 'First Name*',
                                          //showDatePicker:true
                                  )),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrMedicalRecord,
                                          labelText: 'Middle Initial',
                                          initialValue: 'A')),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrLastName,
                                          labelText: "Last Name*",
                                          initialValue: 'Erica')),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller:ctlrSuffix,
                                          labelText: "Suffix",
                                          initialValue: 'Erica')),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SizedBox(width:0)),


                                  //SizedBox(width: AppSize.s35),

                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ?  Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                          controller:ctlrSuffix,
                                          labelText: "Suffix",
                                          initialValue: 'Erica')),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrStreet,
                                          icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                          labelText: 'Street*',
                                          initialValue: 'A')),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrSuitApt,
                                          labelText: "Suit/Apt#")),
                                ],
                              ):
                              Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrStreet,
                                          icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                          labelText: 'Street*',
                                          initialValue: 'A')),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrSuitApt,
                                          labelText: "Suit/Apt#")),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                    child:  SchedularTextField(
                                      controller: ctlrCity,
                                      labelText: 'City*',
                                    ),
                                     // child: childCity
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                    child: SchedularTextField(
                                      controller: ctlrState,
                                      labelText: 'State*',
                                    ),
                                  //    child: childState
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrZipCode,
                                          onlyAllowNumbers: true,
                                          labelText: AppString.zip_code)
                                      )
                                  // Flexible(
                                  //   child: Column(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text('Status',
                                  //           style: AllPopupHeadings.customTextStyle(context)),
                                  //       SizedBox(height: 1),
                                  //       Row(
                                  //         children: [
                                  //           CustomRadioListTile(
                                  //             title: 'Active',
                                  //             value: 'active',
                                  //             groupValue: statustype,
                                  //             onChanged: (value) {
                                  //               setState(() {
                                  //                 statustype = value;
                                  //               });
                                  //             },
                                  //           ),
                                  //           CustomRadioListTile(
                                  //             title: 'Trainee',
                                  //             value: 'trainee',
                                  //             groupValue: statustype,
                                  //             onChanged: (value) {
                                  //               setState(() {
                                  //                 statustype = value;
                                  //               });
                                  //             },
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ?  Row(
                                children: [
                                  Flexible(
                                    child: SchedularTextField(
                                        controller: ctlrCity,
                                        labelText: 'City*',
                                     ),
                                     // child: childCity
                                  ),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible( child:  SchedularTextField(
                                    controller: ctlrState,
                                    labelText: 'State*',
                                  ),
                                    //  child: childState
                                  ),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrZipCode,
                                          onlyAllowNumbers: true,
                                          labelText: AppString.zip_code)
                                  )
                                ],
                              ):
                              Row(
                                children: [
                                  Flexible(
                                      child: FutureBuilder<List<CountryData>>(
                                        future: getCountryDropDown(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return SchedularTextField(
                                                controller: countryController, labelText: 'Country*');
                                          }
                                          if (snapshot.hasData) {
                                            List<DropdownMenuItem<String>> dropDownList = [];
                                            for (var i in snapshot.data!) {
                                              dropDownList.add(DropdownMenuItem<String>(
                                                child: Text(i.name!),
                                                value: i.name,
                                              ));
                                            }

                                            return CustomDropdownTextFieldsm(
                                                headText: 'Country*',
                                                dropDownMenuList: dropDownList,
                                                onChanged: (newValue) {
                                                  for (var a in snapshot.data!) {
                                                    if (a.name == newValue) {
                                                      selectedCountry = a.name!;
                                                      //country = a
                                                      // int? docType = a.companyOfficeID;
                                                    }
                                                  }
                                                });
                                          } else {
                                            return const Offstage();
                                          }
                                        },
                                      ),
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                    child: FutureBuilder<List<ResidenceTypeData>>(
                                      future: getResidenceDropdown(context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return SchedularTextField(
                                              controller:residencyController , labelText: 'Residence Type');
                                        }
                                        if (snapshot.hasData) {
                                          List<DropdownMenuItem<String>> dropDownList = [];
                                          for (var i in snapshot.data!) {
                                            dropDownList.add(DropdownMenuItem<String>(
                                              child: Text(i.description),
                                              value: i.description,
                                            ));
                                          }

                                          return CustomDropdownTextFieldsm(
                                              headText: 'Residence Type',
                                              dropDownMenuList: dropDownList,
                                              onChanged: (newValue) {
                                                for (var a in snapshot.data!) {
                                                  if (a.description == newValue) {
                                                    selectedRace = a.description;
                                                    residentialId = a.id;
                                                    //country = a
                                                    // int? docType = a.companyOfficeID;
                                                  }
                                                }
                                              });
                                        } else {
                                          return const Offstage();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: facilityNameController,
                                        labelText: 'Facility Name',
                                      )),
                                  SizedBox(width: AppSize.s35),

                                  Flexible(
                                      child:  FutureBuilder<List<AEClinicalZone>>(
                                        future: HrAddEmplyClinicalZoneApi(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return SchedularTextField(
                                                controller: zoneController, labelText: 'Zone*');
                                          }
                                          if (snapshot.hasData) {
                                            List<DropdownMenuItem<String>> dropDownList = [];
                                            for (var i in snapshot.data!) {
                                              dropDownList.add(DropdownMenuItem<String>(
                                                child: Text(i.zoneName!),
                                                value: i.zoneName,
                                              ));

                                            }

                                            return CustomDropdownTextFieldsm(
                                                headText: 'Zone*',
                                                dropDownMenuList: dropDownList,
                                                onChanged: (newValue) {
                                                  for (var a in snapshot.data!) {
                                                    if (a.zoneName == newValue) {
                                                      // selectedCountry = a.zoneName!;
                                                      zoneId = a.zoneID!;
                                                      //country = a
                                                      // int? docType = a.companyOfficeID;
                                                    }
                                                  }
                                                });
                                          } else {
                                            return const Offstage();
                                          }
                                        },
                                      ),
                                      // SchedularTextField(
                                      //   controller: zoneController,
                                      //   labelText: 'Zone*',
                                      // )
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: locationNotesController,
                                        labelText: 'Location Notes',
                                      )),

                                  /// Remove code

                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ?  Row(
                                children: [
                                  Flexible(
                                      child: FutureBuilder<List<CountryData>>(
                                        future: getCountryDropDown(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return SchedularTextField(
                                                controller: countryController, labelText: 'Country*');
                                          }
                                          if (snapshot.hasData) {
                                            List<DropdownMenuItem<String>> dropDownList = [];
                                            for (var i in snapshot.data!) {
                                              dropDownList.add(DropdownMenuItem<String>(
                                                child: Text(i.name!),
                                                value: i.name,
                                              ));

                                            }

                                            return CustomDropdownTextFieldsm(
                                                headText: 'Country*',
                                                dropDownMenuList: dropDownList,
                                                onChanged: (newValue) {
                                                  for (var a in snapshot.data!) {
                                                    if (a.name == newValue) {
                                                      selectedCountry = a.name!;
                                                      //country = a
                                                      // int? docType = a.companyOfficeID;
                                                    }
                                                  }
                                                });
                                          } else {
                                            return const Offstage();
                                          }
                                        },
                                      ),
                                  ),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                    child: FutureBuilder<List<ResidenceTypeData>>(
                                      future: getResidenceDropdown(context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return SchedularTextField(
                                              controller:residencyController , labelText: 'Residence Type');
                                        }
                                        if (snapshot.hasData) {
                                          List<DropdownMenuItem<String>> dropDownList = [];
                                          for (var i in snapshot.data!) {
                                            dropDownList.add(DropdownMenuItem<String>(
                                              child: Text(i.description),
                                              value: i.description,
                                            ));
                                          }

                                          return CustomDropdownTextFieldsm(
                                              headText: 'Residence Type',
                                              dropDownMenuList: dropDownList,
                                              onChanged: (newValue) {
                                                for (var a in snapshot.data!) {
                                                  if (a.description == newValue) {
                                                    selectedRace = a.description;
                                                    //country = a
                                                    // int? docType = a.companyOfficeID;
                                                  }
                                                }
                                              });
                                        } else {
                                          return const Offstage();
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: facilityNameController,
                                        labelText: 'Facility Name',
                                      )),
                                ],
                              ):
                              Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: ctlrPrimaryContact,
                                        labelText: 'Primary Contact*',
                                      ),
                                      // CustomDropdownTextFieldsm(
                                      //     headText: 'Primary Contact*',
                                      //     items: ['Spouse','Patient',],
                                      //     //dropDownMenuList: dropDownList,
                                      //     onChanged: (newValue) {
                                      //
                                      //     })
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: primaryContactNameController,
                                          labelText: providerState.isContactTrue?'Primary Contact\nName*' :"Primary Contact Name*",
                                          )),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrPrimeNo,
                                          labelText: "Primary Phone #*",
                                          phoneField:true)),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrEmail,
                                          labelText: "Primary Email")),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: cahpsContactController,
                                          labelText: "CAHPS Contact")),


                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ?  Row(
                                children: [
                                  Flexible(
                                      child:  FutureBuilder<List<AEClinicalZone>>(
                                        future: HrAddEmplyClinicalZoneApi(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return SchedularTextField(
                                                controller: zoneController, labelText: 'Zone*');
                                          }
                                          if (snapshot.hasData) {
                                            List<DropdownMenuItem<String>> dropDownList = [];
                                            for (var i in snapshot.data!) {
                                              dropDownList.add(DropdownMenuItem<String>(
                                                child: Text(i.zoneName!),
                                                value: i.zoneName,
                                              ));

                                            }

                                            return CustomDropdownTextFieldsm(
                                                headText: 'Zone*',
                                                dropDownMenuList: dropDownList,
                                                onChanged: (newValue) {
                                                  for (var a in snapshot.data!) {
                                                    if (a.zoneName == newValue) {
                                                      // selectedCountry = a.zoneName!;
                                                      zoneId = a.zoneID!;
                                                      //country = a
                                                      // int? docType = a.companyOfficeID;
                                                    }
                                                  }
                                                });
                                          } else {
                                            return const Offstage();
                                          }
                                        },
                                      ),
                                      // SchedularTextField(
                                      //   controller: zoneController,
                                      //   labelText: 'Zone*',
                                      // )
              ),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: locationNotesController,
                                        labelText: 'Location Notes',
                                      )),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: ctlrPrimaryContact,
                                        labelText: 'Primary Contact*',
                                      ),
                                      // CustomDropdownTextFieldsm(
                                      //     headText: 'Primary Contact*',
                                      //     items: ['Spouse','Patient',],
                                      //     //dropDownMenuList: dropDownList,
                                      //     onChanged: (newValue) {
                                      //
                                      //     })
                                  ),
                                ],
                              ):
                              Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: ctlrSecondContact,
                                        labelText: 'Secondary Contact*',
                                      ),
                                      // CustomDropdownTextFieldsm(
                                      //     headText: 'Secondary Contact*',
                                      //     items: ['Spouse','Patient',],
                                      //     //dropDownMenuList: dropDownList,
                                      //     onChanged: (newValue) {
                                      //
                                      //     })
                                  ),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: secondaryPhoneController,
                                        labelText: "Secondary Contact Name",
                                      )),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: ctlrSecNo,
                                        phoneField: true,
                                        labelText: "Secondary Phone #*",
                                      )),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: secEmailController,
                                        labelText: "Secondary Email",
                                      )),
                                  SizedBox(width: AppSize.s35),
                                  Flexible(
                                      child: SizedBox(width:0)),

                                ],
                              ),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ? Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: primaryContactNameController,
                                        labelText: "Primary Contact Name*",
                                      )),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrPrimeNo,
                                          labelText: "Primary Phone #*",
                                          phoneField:true)),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: ctlrEmail,
                                          labelText: "Primary Email")),
                                ],
                              ):Offstage(),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ? Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                          controller: cahpsContactController,
                                          labelText: "CAHPS Contact")),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child:  SchedularTextField(
                                        controller: ctlrSecondContact,
                                        labelText: 'Secondary Contact*',
                                      ),
                                      // CustomDropdownTextFieldsm(
                                      //     headText: 'Secondary Contact*',
                                      //     items: ['Spouse','Patient',],
                                      //     //dropDownMenuList: dropDownList,
                                      //     onChanged: (newValue) {
                                      //
                                      //     })
                                  ),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: secondaryPhoneController,
                                        labelText: "Secondary Contact Name",
                                      )),
                                ],
                              ):Offstage(),
                              SizedBox(height: AppSize.s16),
                              providerState.isContactTrue ? Row(
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: ctlrSecNo,
                                        phoneField: true,
                                        labelText: "Secondary Phone #*",
                                      )),
                                  SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                  Flexible(
                                      child: SchedularTextField(
                                        controller: secEmailController,
                                        labelText: "Secondary Email",
                                      )),
                                  SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                  Flexible(
                                      child: SizedBox(width:0)),
                                ],
                              ):Offstage(),
                              // SizedBox(height: AppSize.s16),
                              // Row(
                              //   children: [
                              //     Flexible(child: widget.childLanguage),
                              //     SizedBox(width: AppSize.s35),
                              //     Flexible(
                              //         child: SchedularTextField(
                              //             controller: widget.ctlrDischargeResaon,
                              //             labelText: 'Discharge Reason')),
                              //     SizedBox(width: AppSize.s35),
                              //     Flexible(
                              //       child: widget.childRace ),
                              //     SizedBox(width: AppSize.s35),
                              //     Flexible(
                              //       child: widget.childReligion,),
                              //   ],
                              // ),
                              // SizedBox(height: AppSize.s16),
                              // Row(
                              //   children: [
                              //     Flexible(
                              //       child: widget.childMaritalStatus ),
                              //     SizedBox(width: AppSize.s35),
                              //
                              //     Flexible(
                              //       child: SchedularTextField(
                              //         controller: widget.ctlrDateOfDeath,
                              //         labelText: AppString.date_of_death,
                              //           showDatePicker:true,
                              //         onChanged: (value) {
                              //           /// If the TextField is empty, set dateOfDeath to null
                              //           dateOfDeath = value.isEmpty ? null : value;
                              //         },
                              //       ),
                              //     ),
                              //
                              //     // Flexible(
                              //     //   child: SchedularTextField(
                              //     //     controller: widget.ctlrDateOfDeath,
                              //     //     labelText: AppString.date_of_death,
                              //     //     suffixIcon: Icon(
                              //     //       Icons.calendar_month_outlined,
                              //     //       color: ColorManager.blueprime,
                              //     //     ),
                              //     //     onChanged: (value) {
                              //     //       /// If the TextField is empty, set dateOfDeath to null
                              //     //       if (value.isEmpty) {
                              //     //         dateOfDeath = null;
                              //     //       } else {
                              //     //         /// Otherwise, store the date value
                              //     //         dateOfDeath = value;
                              //     //       }
                              //     //     },
                              //     //   ),
                              //     // ),
                              //     // Flexible(
                              //     //     child: SchedularTextField(
                              //     //         controller: widget.ctlrDateOfDeath,
                              //     //         labelText: AppString.date_of_death,
                              //     //         suffixIcon:
                              //     //             Icon(Icons.calendar_month_outlined,
                              //     //               color: ColorManager.blueprime,))),
                              //     SizedBox(width: AppSize.s35),
                              //     Flexible(
                              //         child:
                              //             Container()), // Empty container for alignment
                              //     SizedBox(width: AppSize.s35),
                              //     Flexible(
                              //         child:
                              //             Container()), // Empty container for alignment
                              //   ],
                              // ),
                            ],
                          ),
                        ),

                        SizedBox(height: AppSize.s40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: BlueBGHeadConst(HeadText: "Additional Information"),
                        ),

                        IntakeFlowContainerConst(
                            height: AppSize.s180,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                          child: SchedularTextField(
                                            controller: ctlrDate,
                                            labelText: 'Date of Birth*',
                                            showDatePicker:true
                                          )),
                                      SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                      Flexible(
                                          child: CustomDropdownTextFieldsm(
                                              headText: 'Gender*',
                                              items: ['Male','Female','Other'],
                                              //dropDownMenuList: dropDownList,
                                              onChanged: (newValue) {

                                              })),
                                      SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                      Flexible(
                                          child: FutureBuilder<List<LanguageSpokenData>>(
                                            future: getlanguageSpokenDropDown(context),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return SchedularTextField(
                                                  controller: primaryLanguageController,
                                                  labelText: 'Language Spoken',
                                                );
                                              }
                                              if (snapshot.hasData) {
                                                List<DropdownMenuItem<String>> dropDownList = [];
                                                for (var i in snapshot.data!) {
                                                  dropDownList.add(DropdownMenuItem<String>(
                                                    child: Text(i.languageSpoken!),
                                                    value: i.languageSpoken,
                                                  ));
                                                }

                                                return CustomDropdownTextFieldsm(
                                                    headText: 'Language Spoken',
                                                    dropDownMenuList: dropDownList,
                                                    onChanged: (newValue) {
                                                      for (var a in snapshot.data!) {
                                                        if (a.languageSpoken == newValue) {
                                                          selectedLanguage = a.languageSpoken!;
                                                          primaryLanguageid = a.languageSpokenId;
                                                          //country = a
                                                          // int? docType = a.companyOfficeID;
                                                        }
                                                      }
                                                    });
                                              } else {
                                                return const Offstage();
                                              }
                                            },
                                          ),),
                                    providerState.isContactTrue ? Offstage():  SizedBox(width: AppSize.s35),
                                    providerState.isContactTrue ? Offstage() :Flexible(
                                          child: SizedBox(width:0)),
                                    providerState.isContactTrue ? Offstage() : SizedBox(width: AppSize.s35),
                                    providerState.isContactTrue ? Offstage() :Flexible(
                                     child: SizedBox(width:0)),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.s16),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: SchedularTextField(
                                            controller: ctlrSocialSec,
                                            labelText: 'Social Security',
                                            isPasswordField: true,
                                            //showDatePicker:true
                                          )),
                                      SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                                      Flexible(
                                          child: CustomDropdownTextFieldsm(
                                              headText: 'Race/Ethnicity',
                                              items: ['White','Blue',],
                                              //dropDownMenuList: dropDownList,
                                              onChanged: (newValue) {

                                              })),
                                      SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                                      Flexible(
                                          child: FutureBuilder<List<MetrialStatusData>>(
                                            future: getMaritalStatusDropDown(context),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return SchedularTextField(
                                                  controller: maritalStatusController,
                                                  labelText: 'Marital Status',
                                                );
                                              }
                                              if (snapshot.hasData) {
                                                List<DropdownMenuItem<String>> dropDownList = [];
                                                for (var i in snapshot.data!) {
                                                  dropDownList.add(DropdownMenuItem<String>(
                                                    child: Text(i.maritalStatus),
                                                    value: i.maritalStatus,
                                                  ));
                                                }

                                                return CustomDropdownTextFieldsm(
                                                    headText: 'Marital Status',
                                                    dropDownMenuList: dropDownList,
                                                    onChanged: (newValue) {
                                                      for (var a in snapshot.data!) {
                                                        if (a.maritalStatus == newValue) {
                                                          selectedMaritalStatus = a.maritalStatus!;
                                                          maritalStatusId = a.maritalStatusId;
                                                          //country = a
                                                          // int? docType = a.companyOfficeID;
                                                        }
                                                      }
                                                    });
                                              } else {
                                                return const Offstage();
                                              }
                                            },
                                          ),),
                                      providerState.isContactTrue ? Offstage():  SizedBox(width: AppSize.s35),
                                      providerState.isContactTrue ? Offstage() :Flexible(
                                          child: SizedBox(width:0)),
                                      providerState.isContactTrue ? Offstage() : SizedBox(width: AppSize.s35),
                                      providerState.isContactTrue ? Offstage() :Flexible(
                                          child: SizedBox(width:0)),


                                      //SizedBox(width: AppSize.s35),

                                    ],
                                  ),

                                ],
                              ),
                            ) ),
                        SizedBox(height: AppSize.s10),
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
                              onPressed: ()async{
                                print('Demo id ${snapshotPatient.data!.demoId}');
                                var responseUpdate = await patchPatientIntakeDemographich(
                                  context: context,
                                  demoId: snapshotPatient.data!.demoId,
                                  fk_pt_id: snapshotPatient.data!.fkPtId,
                                  demoFirstName: ctlrfirstName.text,
                                  demoMiddleInitial: ctlrMedicalRecord.text,
                                  demoLastName: ctlrLastName.text,
                                  demoSuffix: ctlrSuffix.text,
                                  demoStreet: ctlrStreet.text,
                                  demoSuite: ctlrSuitApt.text,
                                  demoCity: ctlrCity.text,
                                  demoState: ctlrState.text,
                                  demoZipcode: ctlrZipCode.text,
                                  fkCountryId: countyId,
                                  fkResidenceTypeId: residentialId,
                                  demoFacilityName: facilityNameController.text,
                                  fkZoneId: zoneId,
                                  demoLocationNotes: locationNotesController.text,
                                  demoPrimaryContact: ctlrPrimaryContact.text,
                                  demoPrimaryContactName: primaryContactNameController.text,
                                  demoPrimaryPhone: ctlrPrimeNo.text,
                                  demoPrimaryEmail: ctlrEmail.text,
                                  demoCahpsContact: cahpsContactController.text,
                                  demoSecondaryContact: ctlrSecondContact.text,
                                  demoSecondaryContactName: secondaryPhoneController.text,
                                  demoSecondaryPhone: ctlrSecNo.text,
                                  demoSecondaryEmail: secEmailController.text,
                                  demoDob: "${ctlrDate.text}T00:00:00.000Z",
                                  fkGender: snapshotPatient.data!.fkGender,// pass dynamic id
                                  fkSpokenLanguage: primaryLanguageid,
                                  demoSocialSecurity: ctlrSocialSec.text,
                                  fkRaceEthnicity: snapshotPatient.data!.fkRaceEthnicity, // pass dynamic id
                                  fkMaritalStatus: maritalStatusId,
                                );
                                if(responseUpdate.statusCode == 200 || responseUpdate.statusCode == 201){
                                  //onMoveToIntake();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddSuccessPopup(
                                        message: 'Patient Info Updated Successfully',
                                      );
                                    },
                                  );
                                }else{
                                  print('Api error');
                                }

                              },
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s30),
                      ],
                    ),
                  ),

              );
            }
          );
        }
      ),
    );
  }
}
