import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../textfield_dropdown_constant/schedular_dropdown_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_withbutton_const.dart';
import '../../../intake_flow_contgainer_const.dart';

class IntakePatientsDatatInfo extends StatelessWidget {
  final TextEditingController ctlrSos;
  final TextEditingController ctlrMedicalRecord;
  final TextEditingController ctlrfirstName;
  final TextEditingController ctlrMI;
  final TextEditingController ctlrLastName;
  final TextEditingController ctlrSuffix;
  final TextEditingController ctlrDate;
  final TextEditingController ctlrStreet;
  final TextEditingController ctlrZipCode;
  final TextEditingController ctlrApartment;
 // final TextEditingController ctlrCity;
  final TextEditingController ctlrMajorStreet;
  final TextEditingController ctlrPrimeNo;
  final TextEditingController ctlrSecNo;
  final TextEditingController ctlrEmail;
  final TextEditingController ctlrSocialSec;
  final TextEditingController ctlrDischargeResaon;
  final TextEditingController ctlrDateOfDeath;
  final Widget childState;
  final Widget childCity;
  final Widget childReligion;
  final Widget childRace;
  final Widget childLanguage;
  final Widget childCountry;
  final Widget childMaritalStatus;
  final Widget childStatus;
  final VoidCallback isIButtonPressed;

  IntakePatientsDatatInfo(
      {super.key,
      required this.ctlrSos,
      required this.ctlrMedicalRecord,
      required this.ctlrfirstName,
      required this.ctlrMI,
      required this.ctlrLastName,
      required this.ctlrSuffix,
      required this.ctlrDate,
      required this.ctlrStreet,
      required this.ctlrZipCode,
      required this.ctlrApartment,
     // required this.ctlrCity,
      required this.ctlrMajorStreet,
      required this.ctlrPrimeNo,
      required this.ctlrSecNo,
      required this.ctlrEmail,
      required this.ctlrSocialSec,
      required this.ctlrDischargeResaon,
      required this.ctlrDateOfDeath,
      required this.childState,
      required this.childCity,
      required this.childReligion,
      required this.childRace,
      required this.childLanguage,

      required this.childMaritalStatus, required this.childCountry, required this.childStatus, required this.isIButtonPressed});
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
    TextEditingController facilityNameController = TextEditingController();
    TextEditingController zoneController = TextEditingController();
    TextEditingController locationNotesController = TextEditingController();
    TextEditingController primaryContactNameController = TextEditingController();
    TextEditingController cahpsContactController = TextEditingController();
    TextEditingController primaryPhoneController = TextEditingController();
    TextEditingController secondaryPhoneController = TextEditingController();
    TextEditingController secEmailController = TextEditingController();
    TextEditingController primaryLanguageController = TextEditingController();
    return Scaffold(
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
                    SizedBox(height: 20,),
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
                                      labelText: 'Street*',
                                      initialValue: 'A')),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: ctlrApartment,
                                      labelText: "Suit/Apt#")),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: ctlrStreet,
                                      labelText: 'Street*',
                                      initialValue: 'A')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: ctlrApartment,
                                      labelText: "Suit/Apt#")),
                              SizedBox(width: AppSize.s35),
                              Flexible(child: childCity),
                              SizedBox(width: AppSize.s35),
                              Flexible(child: childState),
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
                              Flexible(child: childCity),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(child: childState),
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
                                  child: childCountry
                              ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: childRace ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: facilityNameController,
                                    labelText: 'Facility Name',
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: zoneController,
                                    labelText: 'Zone*',
                                  )),
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
                                  child: childCountry
                              ),
                              SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                              Flexible(
                                  child: childRace ),
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
                                  child: CustomDropdownTextFieldsm(
                                      headText: 'Primary Contact*',
                                      items: ['Spouse','Patient',],
                                      //dropDownMenuList: dropDownList,
                                      onChanged: (newValue) {

                                      })),
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
                                  child: SchedularTextField(
                                    controller: zoneController,
                                    labelText: 'Zone*',
                                  )),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: locationNotesController,
                                    labelText: 'Location Notes',
                                  )),
                              SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(
                                      headText: 'Primary Contact*',
                                      items: ['Spouse','Patient',],
                                      //dropDownMenuList: dropDownList,
                                      onChanged: (newValue) {

                                      })),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(
                                      headText: 'Secondary Contact*',
                                      items: ['Spouse','Patient',],
                                      //dropDownMenuList: dropDownList,
                                      onChanged: (newValue) {

                                      })),
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
                                  child: CustomDropdownTextFieldsm(
                                      headText: 'Secondary Contact*',
                                      items: ['Spouse','Patient',],
                                      //dropDownMenuList: dropDownList,
                                      onChanged: (newValue) {

                                      })),
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
                                      child: SchedularTextField(
                                          controller: primaryLanguageController,
                                          labelText: "Primary Language",
                                          initialValue: 'English')),
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
                                      child: CustomDropdownTextFieldsm(
                                          headText: 'Marital Status',
                                          items: ['Married','Unmarried',],
                                          //dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {

                                          })),
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
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s30),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 40.0),
                    //   child: Container(
                    //     height: AppSize.s26,
                    //     width: AppSize.s102,
                    //     child:
                    //     ElevatedButton(
                    //       onPressed: () async {
                    //         final companyId = await TokenManager.getCompanyId();
                    //         // String? dateOfDeath = ctlrDateOfDeath.text.isEmpty ? null : ctlrDateOfDeath.text;
                    //         ApiData result = await IntakeInfoSave(
                    //           context,
                    //           widget.ctlrSos.text,
                    //           //"2024-08-12",
                    //           widget.ctlrMedicalRecord.text,
                    //           selectedStatus!.toString() ?? '',
                    //           // 'Pending',
                    //           widget.ctlrfirstName.text,
                    //           widget.ctlrLastName.text,
                    //           widget.ctlrMI.text,
                    //           widget.ctlrSuffix.text,
                    //           widget.statusType ?? '',
                    //           //"2024-08-12",
                    //           widget.ctlrDate.text,
                    //           widget.ctlrStreet.text,
                    //           selectedState!.toString(),
                    //           // "291000",//
                    //           widget.ctlrZipCode.text,
                    //           widget.ctlrApartment.text,
                    //           selectedcity!.toString(),
                    //           selectedCountry.toString() ?? '',
                    //           widget.ctlrMajorStreet.text,
                    //           widget.ctlrPrimeNo.text,
                    //           widget.ctlrSecNo.text,
                    //           widget.ctlrEmail.text,
                    //           widget.ctlrSocialSec.text,
                    //           selectedLanguage.toString() ?? '',
                    //           widget.ctlrDischargeResaon.text,
                    //           selectedRace.toString() ?? '',
                    //           selectedReligion.toString() ?? '',
                    //           selectedMaritalStatus.toString() ?? '',
                    //           //"2024-08-12",
                    //           // ctlrDateOfDeath.text,    //  :"2024-08-14T00:00:00Z",
                    //           widget.ctlrDateOfDeath.text.isEmpty ? null : widget.ctlrDateOfDeath.text,
                    //
                    //           1,
                    //           'At Land OSC',
                    //           'case',
                    //           'Type',
                    //           companyId,
                    //         );
                    //
                    //         if (result.success) {
                    //           patientId = result.patientId!;
                    //           widget.onPatientIdGenerated(patientId);
                    //           widget.ctlrMedicalRecord.clear();
                    //           widget.ctlrfirstName.clear();
                    //           widget.ctlrLastName.clear();
                    //           widget.ctlrMI.clear();
                    //           widget.ctlrSuffix.clear();
                    //           widget.ctlrStreet.clear();
                    //           widget.ctlrZipCode.clear();
                    //           widget.ctlrApartment.clear();
                    //           widget.ctlrCity.clear();
                    //           widget.ctlrMajorStreet.clear();
                    //           widget.ctlrPrimeNo.clear();
                    //           widget.ctlrSecNo.clear();
                    //           widget.ctlrEmail.clear();
                    //           widget.ctlrSocialSec.clear();
                    //           widget.ctlrDischargeResaon.clear();
                    //         } else {
                    //
                    //         }
                    //       },
                    //       child: Text(
                    //         AppString.save,
                    //         style: GoogleFonts.firaSans(
                    //           fontSize: FontSize.s14,
                    //           fontWeight: FontWeightManager.bold,
                    //           color: ColorManager.white,
                    //         ),
                    //       ),
                    //       style: ElevatedButton.styleFrom(
                    //         padding: const EdgeInsets.symmetric(
                    //           horizontal: 25,
                    //           vertical: 10,
                    //         ),
                    //         backgroundColor: ColorManager.blueprime,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(12),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),

          );
        }
      ),
    );
  }
}
