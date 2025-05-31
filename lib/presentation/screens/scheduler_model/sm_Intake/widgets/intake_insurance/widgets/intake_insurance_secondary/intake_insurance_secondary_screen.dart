import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/intake/patient_insurance_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/api_data.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/patient_insurance_data.dart';
import '../../../../../../../widgets/error_popups/delete_success_popup.dart';
import '../../../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../../../em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../../hr_module/onboarding/download_doc_const.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../widgets/constant_widgets/dropdown_constant_sm.dart';
import '../../../intake_flow_contgainer_const.dart';

class IntakeSecondaryScreen extends StatelessWidget {
  final int patientId;
  const IntakeSecondaryScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
    TextEditingController pharmaSelectDB = TextEditingController();
    TextEditingController pharmaName = TextEditingController();
    TextEditingController pharmaphone = TextEditingController();
    TextEditingController pharmaType = TextEditingController();
    TextEditingController pharmaCategory = TextEditingController();
    TextEditingController pharmaSuitApt = TextEditingController();
    TextEditingController pharmacyaddress = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController pharmacyzipcode = TextEditingController();
    TextEditingController pharmaPolicyHicNo = TextEditingController();
    TextEditingController pharmaGrpName = TextEditingController();
    TextEditingController pharmaGrpNo = TextEditingController();
    TextEditingController pharmaEmail = TextEditingController();
    TextEditingController pharmaAuth = TextEditingController();
    TextEditingController pharmaEftDateForm = TextEditingController();
    TextEditingController pharmaEftDateFormTo = TextEditingController();
    TextEditingController pharmacycontactsecond = TextEditingController();
    TextEditingController dummyCtrl = TextEditingController();
    TextEditingController effectivefromController = TextEditingController();
    TextEditingController effectivetoController = TextEditingController();
    TextEditingController authorizze1 = TextEditingController();
    TextEditingController authorize2 = TextEditingController();
    final StreamController<List<PatientInsuranceDocumentData>> _streamControllerDoc = StreamController<List<PatientInsuranceDocumentData>>.broadcast();
    bool _isLoading = false;
    String? statustype;
    String? dmeSupplies;
    String? pharmacydd;
    String? pharmacystate;
    String? pharmacycity;
    return Consumer<SmIntakeProviderManager>(
        builder: (context,providerState,child) {
          return Center(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomIconButtonConst(
                              width: AppSize.s190,
                              text: 'Add Tertiary Insurance',
                              icon: Icons.add,
                              onPressed: () {

                              }),
                        ],
                      ),
                    ),
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: BlueBGHeadConst(HeadText: "Policy Details"),
                    ),
                    Container(
                      //height: providerState.isContactTrue ? AppSize.s540  :null,
                      padding: providerState.isContactTrue ? const EdgeInsets.only(left: AppPadding.p20, top: AppPadding.p30,bottom: AppPadding.p30) :  const EdgeInsets.symmetric(horizontal: 50,vertical: 25),
                      //child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        providerState.isContactTrue ?   Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Select from Database',
                                      items: ['B','A'],
                                      onChanged: (newValue) {
                                      })),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaName, labelText: 'Name*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaType,
                                    labelText: 'Type*',
                                  )),
                            ],
                          ) :
                          Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Select from Database',
                          items: ['B','A'],
                          onChanged: (newValue) {
                          })),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaName, labelText: 'Name*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaType,
                                    labelText: 'Type*',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      isIconVisible: true,
                                      controller: pharmaCategory, labelText: 'Category')),
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
                                      isIconVisible: true,
                                      controller: pharmaCategory, labelText: 'Category')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyaddress,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                      labelText: 'Street*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaSuitApt,
                                      labelText: 'Suite/Apt#')),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyaddress,
                                      icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                                      labelText: 'Street*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaSuitApt,
                                      labelText: 'Suite/Apt#')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return SchedularTextField(
                                //         controller: dummyCtrl,
                                //         labelText: 'City',);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //           onChanged: (newValue) {
                                //             for (var a in snapshot.data!) {
                                //               if (a.cityName == newValue) {
                                //                 pharmacycity = a.cityName!;
                                //                 //country = a
                                //                 // int? docType = a.companyOfficeID;
                                //               }
                                //             }
                                //           });
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                child: SchedularTextField(
                                    controller: city, labelText: 'City*'),
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(

                                // child:FutureBuilder<List<StateData>>(
                                //   future: getStateDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return SchedularTextField(
                                //           controller: dummyCtrl,
                                //           labelText: 'State');
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.name),
                                //           value: i.name,
                                //         ));
                                //       }
                                //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                //           onChanged: (newValue) {
                                //             for (var a in snapshot.data!) {
                                //               if (a.name == newValue) {
                                //                 pharmacystate = a.name;
                                //                 //country = a
                                //                 // int? docType = a.companyOfficeID;
                                //               }
                                //             }
                                //           });
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                  child:  SchedularTextField(
                                    labelText: "State*",
                                    controller: state,
                                  )
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyzipcode,
                                      onlyAllowNumbers: true,
                                      labelText: 'Zip Code*')),


                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?    Row(
                            children: [
                              Flexible(
                                // child: FutureBuilder<List<CityData>>(
                                //   future: getCityDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return SchedularTextField(
                                //         controller: dummyCtrl,
                                //         labelText: 'City',);
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.cityName!),
                                //           value: i.cityName,
                                //         ));
                                //       }
                                //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                //           onChanged: (newValue) {
                                //             for (var a in snapshot.data!) {
                                //               if (a.cityName == newValue) {
                                //                 pharmacycity = a.cityName!;
                                //                 //country = a
                                //                 // int? docType = a.companyOfficeID;
                                //               }
                                //             }
                                //           });
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                child: SchedularTextField(
                                    controller: city, labelText: 'City*'),
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(

                                // child:FutureBuilder<List<StateData>>(
                                //   future: getStateDropDown(context),
                                //   builder: (context, snapshot) {
                                //     if (snapshot.connectionState ==
                                //         ConnectionState.waiting) {
                                //       return SchedularTextField(
                                //           controller: dummyCtrl,
                                //           labelText: 'State');
                                //     }
                                //     if (snapshot.hasData) {
                                //       List<DropdownMenuItem<String>> dropDownList = [];
                                //       for (var i in snapshot.data!) {
                                //         dropDownList.add(DropdownMenuItem<String>(
                                //           child: Text(i.name),
                                //           value: i.name,
                                //         ));
                                //       }
                                //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                //           onChanged: (newValue) {
                                //             for (var a in snapshot.data!) {
                                //               if (a.name == newValue) {
                                //                 pharmacystate = a.name;
                                //                 //country = a
                                //                 // int? docType = a.companyOfficeID;
                                //               }
                                //             }
                                //           });
                                //     } else {
                                //       return const Offstage();
                                //     }
                                //   },
                                // ),
                                  child:  SchedularTextField(
                                    labelText: "State*",
                                    controller: state,
                                  )
                              ),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyzipcode,
                                      onlyAllowNumbers: true,
                                      labelText: 'Zip Code*')),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaphone,
                                      phoneField:true,
                                      labelText: 'Phone Number*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaAuth,
                                    labelText: 'Auth Status',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateForm, labelText: 'Effective From',
                                    showDatePicker: true,)),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateFormTo, labelText: 'Effective to',
                                    showDatePicker: true,)),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Eligibility Status',items: ['Santa Clara','A'],
                                      onChanged: (newValue) {
                                      })),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?   Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaphone,
                                      phoneField:true,
                                      labelText: 'Phone Number*')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaAuth,
                                    labelText: 'Auth Status',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateForm, labelText: 'Effective From',
                                    showDatePicker: true,)),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaPolicyHicNo,
                                      labelText: 'Policy/HIC Number')),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpNo,
                                    labelText: 'Group Number',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpName, labelText: 'Group Name',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEmail, labelText: 'Comments',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Insurance Verified',
                                        style:providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                      //AllPopupHeadings.customTextStyle(context)
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomRadioListTileSMp(
                                            title: 'Yes',
                                            value: 'Yes',
                                            groupValue: statustype,
                                            onChanged: (value) {
                                              // setState(() {
                                              statustype = value;
                                              // });
                                            },
                                          ),
                                        ),

                                        Expanded(
                                          child: CustomRadioListTileSMp(
                                            title: 'No',
                                            value: 'No',
                                            groupValue: statustype,
                                            onChanged: (value) {
                                              // setState(() {
                                              statustype = value;
                                              // });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateFormTo, labelText: 'Effective to',
                                    showDatePicker: true,)),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Eligibility Status',items: ['Santa Clara','A'],
                                      onChanged: (newValue) {
                                      })),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaPolicyHicNo,
                                      labelText: 'Policy/HIC Number')),
                            ],
                          ) : const Offstage(),
                          const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ? Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpNo,
                                    labelText: 'Group Number',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpName, labelText: 'Group Name',
                                  )),
                              const SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEmail, labelText: 'Comments',
                                  )),
                            ],
                          ) : const Offstage(),
                         // const SizedBox(height: AppSize.s16),
                          providerState.isContactTrue ?Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                Flexible(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text('Insurance Verified',
                                        style:providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                        //AllPopupHeadings.customTextStyle(context)
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                        children: [
                                        Expanded(
                                        child: CustomRadioListTileSMp(
                                        title: 'Yes',
                                        value: 'Yes',
                                        groupValue: statustype,
                                        onChanged: (value) {
                                        // setState(() {
                                        statustype = value;
                                        // });
                                        },
                                        ),
                                        ),

                                        Expanded(
                                        child: CustomRadioListTileSMp(
                                        title: 'No',
                                        value: 'No',
                                        groupValue: statustype,
                                        onChanged: (value) {
                                        // setState(() {
                                        statustype = value;
                                        // });
                                        },
                                        ),
                                        ),
                                        ],
                                        ),
                                        ],
                                        ),
                                        ),
                                ],
                              ),
                            ),
                          ):const Offstage(),
                          const Divider()
                        ],
                      ),
                      // ),
                    ),
                    ///dont delete temp commented
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 35),
                    //   child: BlueBGHeadConst(HeadText: "Suggested Care & Diagnosis"),
                    // ),
                    // Container(
                    //     height: AppSize.s430,
                    //     padding: providerState.isContactTrue ? const EdgeInsets.symmetric(horizontal: AppPadding.p0,vertical: AppPadding.p15 ) :const EdgeInsets.symmetric(horizontal: AppPadding.p30,vertical: AppPadding.p15 ),
                    //     //child: SingleChildScrollView(
                    //     child: Column(
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 55.0),
                    //             child: Container(
                    //              height: AppSize.s95,
                    //               padding: const EdgeInsets.only(right: AppPadding.p30, ),
                    //               decoration: BoxDecoration(
                    //                 color: ColorManager.white,
                    //                 border: Border(
                    //                   bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                    //                 ),
                    //               ),
                    //               child:Row(
                    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   Expanded(
                    //                     flex: 3,
                    //                     child: Row(
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         VerticalDivider(
                    //                           color: ColorManager.greenDark,
                    //                           thickness: 4.5,
                    //                         ),
                    //                         const SizedBox(width: AppSize.s20,),
                    //                         Expanded(
                    //                           child: Column(
                    //                             mainAxisAlignment: MainAxisAlignment.center,
                    //                             crossAxisAlignment: CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text('Authorization #1',
                    //                                   style: DocDefineTableData.customTextStyle(context)),
                    //                               const SizedBox(height: AppSize.s5,),
                    //                               providerState.isContactTrue?Text("Added 1/26/2025, 8:17:00 AM PST by\nHenry, Rebecca",
                    //                                   style: FaintTextColor.customTextStyle(context)
                    //                               )
                    //                                   :Flexible(
                    //                                     child: Text("Added 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                    //                                     style:  FaintTextColor.customTextStyle(context)),
                    //                                   ),
                    //
                    //                               const SizedBox(height: AppSize.s16,),
                    //                               Text("Effective: 1/5/2025 - 7/5/2025",
                    //                                   style:  DocDefineTableDataID.customTextStyle(context)),
                    //                             ],
                    //                           ),
                    //                         )
                    //                       ],
                    //                     ),
                    //                   ),
                    //
                    //                   Expanded(
                    //                     flex: 3,
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.only(right: 120),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         children: [
                    //                         Expanded(
                    //                           child: Column(
                    //                             mainAxisAlignment: MainAxisAlignment.center,
                    //                            // crossAxisAlignment: CrossAxisAlignment.center,
                    //                           spacing:2,
                    //                             children: [
                    //                             Text('Disciplines',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                             const SizedBox(height: AppSize.s10,),
                    //                             Text('RN',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                            // const SizedBox(height: AppSize.s5,),
                    //                             Text('PT',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                            //  const SizedBox(height: AppSize.s5,),
                    //                             Text('OT',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                           ],),
                    //                         ),
                    //                         const SizedBox(width: AppSize.s30,),
                    //                         Expanded(
                    //                           child: Column(
                    //                             mainAxisAlignment: MainAxisAlignment.center,
                    //                            // crossAxisAlignment: CrossAxisAlignment.center,
                    //                             spacing:2,
                    //                             children: [
                    //                             Text('Authorized',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                             const SizedBox(height: AppSize.s10,),
                    //                             Text('5',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                            // const SizedBox(height: AppSize.s5,),
                    //                             Text('5',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                            // const SizedBox(height: AppSize.s5,),
                    //                             Text('5',
                    //                                 style: FaintTextColor.customTextStyle(context)),
                    //                           ],),
                    //                         ),
                    //                       ],),
                    //                     ),
                    //                   ),
                    //                   //SizedBox(width: AppSize.s70,),
                    //                   Expanded(
                    //                     flex: 2,
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.only(left: 105),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         children: [
                    //                           Flexible(
                    //                             child: IconButton(
                    //                               splashColor: Colors.transparent,
                    //                               highlightColor: Colors.transparent,
                    //                               hoverColor: Colors.transparent,
                    //                               onPressed: () {
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.edit_outlined,
                    //                                 color: ColorManager.mediumgrey,
                    //                               ),
                    //                               iconSize: providerState.isContactTrue?IconSize.I16 :IconSize.I22,
                    //                             ),
                    //                           ),
                    //                           const SizedBox(width: AppSize.s10,),
                    //                           Flexible(
                    //                             child: IconButton(
                    //                               onPressed: () {
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.delete_outline,
                    //                                 color: ColorManager.mediumgrey,
                    //                               ),
                    //                               splashColor: Colors.transparent,
                    //                               highlightColor: Colors.transparent,
                    //                               hoverColor: Colors.transparent,
                    //                               iconSize:providerState.isContactTrue?IconSize.I16 :IconSize.I22,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(height: AppSize.s25),
                    //           Padding(padding:  const EdgeInsets.symmetric(horizontal: 59.0),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Expanded(
                    //                 flex:2,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(children: [
                    //                       Flexible(
                    //                         child: Padding(
                    //                             padding:const EdgeInsets.only(top: 20,right: 20),
                    //                             child: Text('Authorization #2',style:providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context) :SMTextfieldHeadings.customTextStyle(context)
                    //                               //AllPopupHeadings.customTextStyle(context)
                    //                             )),
                    //                       ),
                    //                       Flexible(
                    //                         child: CustomDropdownTextFieldsm(
                    //                           width: providerState.isContactTrue? 150 : 205,
                    //                           isIconVisible: false,
                    //                           headText: '',
                    //                           onChanged: (newValue) {},),
                    //                       ),
                    //                     ],),
                    //                     const SizedBox(height: AppSize.s15),
                    //                     SchedularTextField(
                    //                       isIconVisible:true,
                    //                       width: providerState.isContactTrue? 150 :205,
                    //                       controller: effectivefromController,
                    //                       labelText: 'Effective From',
                    //                       showDatePicker: true,
                    //                     ),
                    //                     const SizedBox(height: AppSize.s10),
                    //                     SchedularTextField(
                    //                       isIconVisible:true,
                    //                       width: providerState.isContactTrue? 150 :205,
                    //                       controller: effectivetoController,
                    //                       labelText: 'Effective To',
                    //                       showDatePicker: true,
                    //                     )
                    //                   ],),
                    //               ),
                    //               Expanded(
                    //                flex: 2,
                    //                 child: Row(
                    //                   children: [
                    //                     Flexible(
                    //                       child: Column(children: [
                    //                         const SizedBox(height: 20,),
                    //                         Center(
                    //                           child: Text('Disciplice',
                    //                               style: FaintTextColor.customTextStyle(context)),
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.symmetric(vertical: 4),
                    //                           child: CustomDropdownTextFieldsm(
                    //                             width:providerState.isContactTrue? 150 :205,
                    //                             borderRadius: 0,
                    //                             isIconVisible: false,
                    //                             headText: '',
                    //                             onChanged: (newValue) {},),
                    //                         ),
                    //                        // SizedBox(height: AppSize.s5),
                    //                         Padding(
                    //                           padding:const EdgeInsets.symmetric(vertical: 4),
                    //                           child: CustomDropdownTextFieldsm(
                    //                             width:providerState.isContactTrue? 150 :205,
                    //                             borderRadius: 0,
                    //                             isIconVisible: false,
                    //                             headText: '',
                    //                             onChanged: (newValue) {},),
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.symmetric(vertical: 4),
                    //                           child: Text('Add Discipline',
                    //                               style: TextStyle(
                    //                                 fontWeight: FontWeight.w600,
                    //                                 fontSize: FontSize.s12,
                    //                                 color: ColorManager.blueprime,
                    //                                 decoration: TextDecoration.underline,
                    //                               )),
                    //                         )
                    //                       ],),
                    //                     ),
                    //                     const SizedBox(width: AppSize.s50),
                    //                     Flexible(
                    //                       child: Column(children: [
                    //                         const SizedBox(height: 18,),
                    //                         Center(
                    //                           child: Text('Authorized',
                    //                               style: FaintTextColor.customTextStyle(context)),
                    //                         ),
                    //                         SchedularTextField(
                    //                           isIconVisible:true,
                    //                           width:providerState.isContactTrue? 60 : 105,
                    //                           controller: authorizze1,
                    //                           labelText: '',
                    //                           borderRadius: 0,
                    //                         ),
                    //                         SchedularTextField(
                    //                           isIconVisible:true,
                    //                           width: providerState.isContactTrue? 60 : 105,
                    //                           controller: authorize2,
                    //                           labelText: '',
                    //                           borderRadius: 0,
                    //                         ),
                    //                         Padding(
                    //                           padding: const EdgeInsets.symmetric(vertical: 4),
                    //                           child: Text('Add Discipline',
                    //                               style: TextStyle(
                    //                                 fontWeight: FontWeight.w600,
                    //                                 fontSize: FontSize.s12,
                    //                                 color: ColorManager.white,
                    //                                 decoration: TextDecoration.underline,
                    //                               )),
                    //                         )
                    //                       ],),
                    //                     ),
                    //                    // SizedBox(width: AppSize.s100),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Expanded(
                    //                 flex: 1,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     //SizedBox(height: 20,),
                    //                     Padding(
                    //                       padding: EdgeInsets.only(bottom: 90.0,right: providerState.isContactTrue? 30 :60),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.end,
                    //                         crossAxisAlignment: CrossAxisAlignment.end,
                    //                         children: [
                    //                           Flexible(
                    //                             child: IconButton(
                    //                               splashColor: Colors.transparent,
                    //                               highlightColor: Colors.transparent,
                    //                               hoverColor: Colors.transparent,
                    //                               onPressed: () {
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.save_outlined,
                    //                                 color: ColorManager.mediumgrey,
                    //                               ),
                    //                               iconSize: providerState.isContactTrue?IconSize.I18 :IconSize.I24,
                    //                             ),
                    //                           ),
                    //                           const SizedBox(width: AppSize.s10,),
                    //                           Flexible(
                    //                             child: IconButton(
                    //                               onPressed: () {
                    //                               },
                    //                               icon: Icon(
                    //                                 Icons.delete_outline,
                    //                                 color: ColorManager.mediumgrey,
                    //                               ),
                    //                               splashColor: Colors.transparent,
                    //                               highlightColor: Colors.transparent,
                    //                               hoverColor: Colors.transparent,
                    //                               iconSize: providerState.isContactTrue?IconSize.I18 :IconSize.I24,
                    //                             ),
                    //                           ),
                    //                           SizedBox(width: providerState.isContactTrue? 0 : AppSize.s30,),
                    //                         ],
                    //                       ),
                    //                     )
                    //                   ],),
                    //               )
                    //             ],
                    //           ),),
                    //           // Padding(
                    //           //   padding: const EdgeInsets.symmetric(horizontal: 59.0),
                    //           //   child: Row(children: [
                    //           //     Expanded(
                    //           //         flex: 2,
                    //           //         child: Container(
                    //           //             child: Column(
                    //           //               mainAxisAlignment: MainAxisAlignment.start,
                    //           //               crossAxisAlignment: CrossAxisAlignment.start,
                    //           //               children: [
                    //           //               Row(children: [
                    //           //                 Padding(
                    //           //                     padding:EdgeInsets.only(top: 20,right: 20),
                    //           //                     child: Text('Authorization #2',style:providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context) :SMTextfieldHeadings.customTextStyle(context)
                    //           //                       //AllPopupHeadings.customTextStyle(context)
                    //           //                     )),
                    //           //                 CustomDropdownTextFieldsm(
                    //           //                   width:205,
                    //           //                   isIconVisible: false,
                    //           //                   headText: '',
                    //           //                   onChanged: (newValue) {},),
                    //           //               ],),
                    //           //               SizedBox(height: AppSize.s15),
                    //           //               SchedularTextField(
                    //           //                 isIconVisible:true,
                    //           //                 width: 205,
                    //           //                 controller: effectivefromController,
                    //           //                 labelText: 'Effective From',
                    //           //                 showDatePicker: true,
                    //           //               ),
                    //           //               SizedBox(height: AppSize.s10),
                    //           //               SchedularTextField(
                    //           //             isIconVisible:true,
                    //           //             width: 205,
                    //           //             controller: effectivetoController,
                    //           //             labelText: 'Effective To',
                    //           //             showDatePicker: true,
                    //           //           )
                    //           //         ],))),
                    //           //     Expanded(
                    //           //         flex: 3,
                    //           //         child: Container(child: Column(children: [
                    //           //           Row(children: [
                    //           //             Expanded(
                    //           //               child: Center(
                    //           //                 child: Padding(
                    //           //                   padding: const EdgeInsets.only(right: 5.0),
                    //           //                   child: Text('Disciplice',
                    //           //                       style: DocDefineTableDataID.customTextStyle(context)),
                    //           //                 ),
                    //           //               ),
                    //           //             ),
                    //           //             Expanded(
                    //           //               child: Center(
                    //           //                 child: Padding(
                    //           //                   padding: const EdgeInsets.only(right: 50.0),
                    //           //                   child: Text('Authorized',
                    //           //                       style: DocDefineTableDataID.customTextStyle(context)),
                    //           //                 ),
                    //           //               ),
                    //           //             ),
                    //           //           ],),
                    //           //           Padding(
                    //           //             padding: const EdgeInsets.only(left: 40.0),
                    //           //             child: Row(
                    //           //               mainAxisAlignment: MainAxisAlignment.start,
                    //           //               children: [
                    //           //               CustomDropdownTextFieldsm(
                    //           //                 width:205,
                    //           //                 borderRadius: 0,
                    //           //                 isIconVisible: false,
                    //           //                 headText: '',
                    //           //                 onChanged: (newValue) {},),
                    //           //               SizedBox(
                    //           //                 width: 120,
                    //           //               ),
                    //           //               SchedularTextField(
                    //           //                 isIconVisible:true,
                    //           //                 width: 105,
                    //           //                 controller: authorizze1,
                    //           //                 labelText: '',
                    //           //                 borderRadius: 0,
                    //           //               ),
                    //           //             ],),
                    //           //           ),
                    //           //           Padding(
                    //           //             padding: const EdgeInsets.only(left: 40.0,bottom: 20),
                    //           //             child: Row(
                    //           //               mainAxisAlignment: MainAxisAlignment.start,
                    //           //               children: [
                    //           //               CustomDropdownTextFieldsm(
                    //           //                 width:205,
                    //           //                 borderRadius: 0,
                    //           //                 isIconVisible: false,
                    //           //                 headText: '',
                    //           //                 onChanged: (newValue) {},),
                    //           //               SizedBox(
                    //           //                 width: 120,
                    //           //               ),
                    //           //               SchedularTextField(
                    //           //                 isIconVisible:true,
                    //           //                 width: 105,
                    //           //                 controller: authorize2,
                    //           //                 labelText: '',
                    //           //                 borderRadius: 0,
                    //           //               ),
                    //           //             ],),
                    //           //           ),
                    //           //         ],))),
                    //           //     Expanded(child: Container()),
                    //           //     Expanded(
                    //           //         flex: 1,
                    //           //         child: Container(child: Column(
                    //           //           mainAxisAlignment: MainAxisAlignment.start,
                    //           //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           //           children: [
                    //           //           Padding(
                    //           //             padding: const EdgeInsets.only(bottom: 90.0,right: 60),
                    //           //             child: Row(
                    //           //               mainAxisAlignment: MainAxisAlignment.end,
                    //           //               crossAxisAlignment: CrossAxisAlignment.end,
                    //           //               children: [
                    //           //                 IconButton(
                    //           //                   splashColor: Colors.transparent,
                    //           //                   highlightColor: Colors.transparent,
                    //           //                   hoverColor: Colors.transparent,
                    //           //                   onPressed: () {
                    //           //                   },
                    //           //                   icon: Icon(
                    //           //                     Icons.save,
                    //           //                     color: ColorManager.mediumgrey,
                    //           //                   ),
                    //           //                   iconSize: IconSize.I22,
                    //           //                 ),
                    //           //                 SizedBox(width: AppSize.s10,),
                    //           //                 IconButton(
                    //           //                   onPressed: () {
                    //           //                   },
                    //           //                   icon: Icon(
                    //           //                     Icons.delete_outline,
                    //           //                     color: ColorManager.mediumgrey,
                    //           //                   ),
                    //           //                   splashColor: Colors.transparent,
                    //           //                   highlightColor: Colors.transparent,
                    //           //                   hoverColor: Colors.transparent,
                    //           //                   iconSize:IconSize.I22,
                    //           //                 ),
                    //           //                 SizedBox(width: AppSize.s30,),
                    //           //               ],
                    //           //             ),
                    //           //           )
                    //           //         ],))),
                    //           //   ],),
                    //           // ),
                    //           const SizedBox(height: AppSize.s40),
                    //           CustomIconButtonConst(
                    //               width: 170,
                    //               text: 'Add Authorization',
                    //               icon: Icons.add,
                    //               onPressed: () {
                    //
                    //               }),])),
                    const SizedBox(height: AppSize.s5),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 35),
                      child: BlueBGHeadConst(HeadText: "Attachments"),
                    ),
                    Container(

                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p40,vertical: AppPadding.p15 ),
                        //child: SingleChildScrollView(
                        child: Column(
                            children: [
                              StreamBuilder<List<PatientInsuranceDocumentData>>(
                                  stream: _streamControllerDoc.stream,
                                  builder: (context, snapshotDoc){
                                    getPatientEmergencyContact(context: context, ptId: diagnosisProvider.patientId,).then((data) {
                                      _streamControllerDoc.add(data);
                                    }).catchError((error) {
                                      // Handle error
                                    });
                                    if(snapshotDoc.connectionState == ConnectionState.waiting){
                                      return Center(
                                        child: CircularProgressIndicator(color: ColorManager.blueprime,),
                                      );
                                    }
                                    if(snapshotDoc.data!.isEmpty){
                                      return Center(
                                          child: Padding(
                                            padding:const EdgeInsets.symmetric(vertical: 76),
                                            child: Text(
                                              AppStringSMModule.patientInsuranceDocNoData,
                                              style: AllNoDataAvailable.customTextStyle(context),
                                            ),
                                          ));
                                    }
                                    if(snapshotDoc.hasData){
                                      return  Container(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshotDoc.data!.length,
                                            itemBuilder: (context,index) {
                                              var fileUrl = snapshotDoc.data![index].docUrl;
                                              var formatedData = DateFormat('yyyy/MM/dd').format(snapshotDoc.data![index].createdAt);
                                              return snapshotDoc.data![index].isPrimary == true? Offstage():Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
                                                child: Container(
                                                  height: AppSize.s65,
                                                  // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30, vertical: AppPadding.p15),
                                                  decoration: BoxDecoration(
                                                    color: ColorManager.white,
                                                    // borderRadius: BorderRadius.circular(5),
                                                    // border: Border.symmetric(vertical: BorderSide(width: 0.2,color: ColorManager.grey),horizontal: BorderSide(width: 0.2,color: ColorManager.grey),),//all(width: 1, color: Color(0xFFBCBCBC)),
                                                    border: Border(
                                                      bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                                                    ),//all(width: 1, color: Color(0xFFBCBCBC)),
                                                  ),child:Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const VerticalDivider(
                                                          color: Color(0xFF50B5E5),
                                                          thickness: 4.5,
                                                        ),
                                                        const SizedBox(width: AppSize.s20,),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: [
                                                            Text('${snapshotDoc.data![index].docName}',
                                                                style: DocDefineTableData.customTextStyle(context)),
                                                            const SizedBox(height: AppSize.s8,),
                                                            Text("Uploaded $formatedData, ${DateFormat.jm().format(snapshotDoc.data![index].createdAt)} PST by Henry, Rebecca",
                                                                style:  DocDefineTableDataID.customTextStyle(context)),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        // InkWell(
                                                        //   splashColor: Colors.transparent,
                                                        //   highlightColor: Colors.transparent,
                                                        //   hoverColor: Colors.transparent,
                                                        //   child: Image.asset("images/sm/telegram.png", height:  providerstate.isContactTrue?IconSize.I20 :IconSize.I22,),
                                                        //   onTap: () {
                                                        //   },
                                                        // ),
                                                        // const SizedBox(width: AppSize.s10,),
                                                        IconButton(
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          onPressed: () {
                                                            downloadFile(fileUrl);
                                                          },
                                                          icon: const Icon(
                                                            Icons.print_outlined,
                                                            color: Color(0xFF686464),
                                                          ),
                                                          iconSize: providerState.isContactTrue?IconSize.I20 :IconSize.I22,
                                                        ),
                                                        const SizedBox(width: AppSize.s10,),
                                                        ///download
                                                        PdfDownloadButton(apiUrl: snapshotDoc.data![index].docUrl,// policiesdata.docurl,
                                                          iconsize: IconSize.I22,
                                                          documentName: snapshotDoc.data![index].docName,
                                                          iconColor: Color(0xFF686464),//policiesdata.docName!
                                                        ),
                                                        const SizedBox(width: AppSize.s10,),
                                                        ///delete
                                                        IconButton(
                                                          onPressed: () async{
                                                            showDialog(
                                                                context: context,
                                                                builder: (context) =>
                                                                    StatefulBuilder(
                                                                      builder: (BuildContext context, void Function(void Function())setState) {
                                                                        return DeletePopup(
                                                                          loadingDuration: _isLoading,
                                                                          title: 'Delete Document',
                                                                          onCancel: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          onDelete: () async {
                                                                            setState(() {
                                                                              _isLoading = true;
                                                                            });
                                                                            try {
                                                                              var response =  await deletePatientInsuranceDocument(context: context, documentId: snapshotDoc.data![index].insuranceDocumentId, );
                                                                              if(response.statusCode == 200  || response.statusCode == 201) {
                                                                                Navigator.pop(context);
                                                                                // Future.delayed(Duration(seconds: 1));
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) => const DeleteSuccessPopup(),
                                                                                );
                                                                              }
                                                                            } finally {
                                                                              setState(() {
                                                                                _isLoading = false;
                                                                                //Navigator.pop(context);
                                                                              });
                                                                            }
                                                                            // setState(() async{
                                                                            //
                                                                            //   Navigator.pop(context);
                                                                            // });
                                                                          },
                                                                        );
                                                                      },
                                                                    ));
                                                          },
                                                          icon: const Icon(
                                                            Icons.delete_outline,
                                                            color: Color(0xFF686464),
                                                          ),
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          iconSize:providerState.isContactTrue?IconSize.I20 :IconSize.I22,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                ),
                                              );
                                            }
                                        ),
                                      );
                                    }
                                    else{
                                      return SizedBox();
                                    }
                                  }
                              ),
                              const SizedBox(height: AppSize.s25),
                        StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState){
                              return CustomIconButtonConst(
                                  width: 150,
                                  text: 'Add Attachment',
                                  icon: Icons.add,
                                  color: ColorManager.bluebottom,
                                  onPressed: () async{
                                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['svg', 'png', 'jpg', 'gif','pdf'],
                                    );
                                    if (result != null) {
                                      print('file name ${result.files.first.name}');
                                      ApiData apiData =  await addPatientInsuranceDocuments(
                                        context: context,
                                        ptId: diagnosisProvider.patientId,
                                        documentUrl: '--',
                                        documentName: result.files.first.name,
                                        isPrimary: false,
                                      );
                                      if(apiData.statusCode == 200 || apiData.statusCode == 201){
                                        var uploadPatientDoc = await uploadPatientInsuranceDocuments(
                                          context: context,
                                          documentId: apiData.patientInsuranceDocId!,
                                          documentFile: result.files.first.bytes,
                                          documentName: result.files.first.name,
                                        );
                                        if(uploadPatientDoc.success == true){
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const AddSuccessPopup(
                                                message: 'Document Uploaded Successfully',
                                              );
                                            },
                                          );
                                        }
                                      }

                                    }
                                  });}
                        ),])),
                    const SizedBox(height: AppSize.s60),
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
                )
            ),
            // ),
          );
        }
      );
  }
}

///dont delete ui created by saloni
// Widget build(BuildContext context) {
//   return SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               ///add button
//               Container(
//                 height: AppSize.s32,
//                 width: AppSize.s105,
//                 child: SchedularIconButtonConst(
//                   text: AppString.add_new,
//                   icon: Icons.add,
//                   onPressed: () async {
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20,),
//           Column(
//             children: [
//               Container(
//                 height: 500,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Expanded(
//                   // child: StreamBuilder<List<IntakeNotesMiscData>>(
//                   //   stream: noteMiscController.stream,
//                   //   builder: (context, snapshot) {
//                   //     getIntakeNoteMiscByPatientsID(context,
//                   //         patientId: widget.patientId)
//                   //         .then((data) {
//                   //       noteMiscController.add(data);
//                   //     }).catchError((error) {
//                   //       // Handle error
//                   //     });
//                   //     if (snapshot.connectionState ==
//                   //         ConnectionState.waiting) {
//                   //       return Center(
//                   //           child: CircularProgressIndicator(
//                   //             color: ColorManager.blueprime,
//                   //           ));
//                   //     }
//                   //     if (snapshot.data!.isEmpty) {
//                   //       return Center(
//                   //         child: Text(
//                   //           AppString.dataNotFound,
//                   //           style: AllNoDataAvailable.customTextStyle(context),
//                   //         ),
//                   //       );
//                   //     }
//                   //     if (snapshot.hasData) {
//                   //  return
//                   child:   ListView.builder(
//                     itemCount: 10,//snapshot.data!.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       // final note = snapshot.data![index];
//                       // // var note = snapshot.data![index];
//                       // var fileUrl = note.docUrl;
//                       // final fileExtension = fileUrl.split('/').last;
//                       //
//                       // Widget fileWidget;
//                       //
//                       // if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
//                       //   fileWidget = Image.network(
//                       //     fileUrl,
//                       //     fit: BoxFit.cover,
//                       //     errorBuilder: (context, error, stackTrace) {
//                       //       return Icon(
//                       //         Icons.broken_image,
//                       //         size: 45,
//                       //         color: ColorManager.faintGrey,
//                       //       );
//                       //     },
//                       //   );
//                       // }
//                       // else if (['pdf', 'doc', 'docx'].contains(fileExtension)) {
//                       //   fileWidget = Icon(
//                       //     Icons.description,
//                       //     size: 45,
//                       //     color: ColorManager.faintGrey,
//                       //   );
//                       // }
//                       // else {
//                       //   fileWidget = Icon(
//                       //     Icons.insert_drive_file,
//                       //     size: 45,
//                       //     color: ColorManager.faintGrey,
//                       //   );
//                       // }
//                       return Column(
//                         children: [
//                           Container(
//                             height: AppSize.s65,
//                             decoration: BoxDecoration(
//                               color: ColorManager.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: ColorManager.black.withOpacity(0.2),
//                                   spreadRadius: 1,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 10.0),
//                                         child: Container(
//                                             color: ColorManager.blueprime,
//                                             height: AppSize.s45,
//                                             width: AppSize.s65,
//                                             child: Image.asset("images/sm/eye_outline.png")
//                                           // Icon(
//                                           //   Icons.remove_red_eye_outlined,
//                                           //   color: ColorManager.white,
//                                           //   size: AppSize.s24,
//                                           // ),
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                       Padding(
//                                         padding: const EdgeInsets.only(bottom: 4,top: 2),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                           children: [
//                                             Text(
//                                               "NanDoc",
//                                               //'ID: ${snapshot.data![index].miscNoteId}',
//                                               style:TableSubHeading.customTextStyle(context),
//                                             ),
//                                             //SizedBox(height:AppSize.s2 ),
//                                             Text(
//                                                 "Pdf name",
//                                                 //snapshot.data![index].docType,
//                                                 style:AllPopupHeadings.customTextStyle(context)
//                                             ),
//
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Expanded(flex: 2,
//                                     child: Container(
//                                       child:  Row(
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                               "Expires on",
//                                               //snapshot.data![index].docType,
//                                               style:AllPopupHeadings.customTextStyle(context)
//                                           ),
//                                           Text(
//                                               "14/12/00",
//                                               //snapshot.data![index].docType,
//                                               style:AllPopupHeadings.customTextStyle(context)
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                                 Expanded(
//                                   //flex: 2,
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       IconButton(
//                                         icon: Icon(
//                                             size: 20,
//                                             Icons.history,
//                                             color: ColorManager.blueprime
//                                         ),
//                                         onPressed: () {},
//                                       ),
//                                       IconButton(
//                                           icon: Icon(
//                                               size: 20,
//                                               Icons.print_outlined,
//                                               color:  ColorManager.blueprime
//                                           ),
//                                           onPressed: () async {}
//                                         // {
//                                         //   final pdf = pw.Document();
//                                         //
//                                         //   final miscNotes = snapshot.data!;
//                                         //
//                                         //   miscNotes.forEach((note) {
//                                         //     pdf.addPage(
//                                         //       pw.Page(
//                                         //         build: (pw.Context context) => pw.Column(
//                                         //           mainAxisAlignment: pw.MainAxisAlignment.start,
//                                         //           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                         //           children: [
//                                         //             pw.Text(
//                                         //               'Miscellaneous Note',
//                                         //               style: pw.TextStyle(
//                                         //                 fontSize: FontSize.s18,
//                                         //                 fontWeight: pw.FontWeight.bold,
//                                         //               ),
//                                         //             ),
//                                         //             pw.Divider(),
//                                         //             pw.SizedBox(height: AppSize.s20),
//                                         //             pw.Table(
//                                         //               border: pw.TableBorder.all(),
//                                         //               children: [
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Misc ID',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text('${note.miscNoteId}'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Patient ID',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text('${note.patientId}'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Doc Type ID',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text('${note.docTypeId}'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Doc Type',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(note.docType.isNotEmpty ? note.docType : 'N/A'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Doc URL',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(note.docUrl.isNotEmpty ? note.docUrl : 'N/A'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Name',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(note.name.isNotEmpty ? note.name : 'N/A'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Created At',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(note.createdAt.isNotEmpty ? note.createdAt : 'N/A'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //                 pw.TableRow(
//                                         //                   children: [
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(
//                                         //                         'Expiry Date',
//                                         //                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                                         //                       ),
//                                         //                     ),
//                                         //                     pw.Padding(
//                                         //                       padding: pw.EdgeInsets.all(8.0),
//                                         //                       child: pw.Text(note.expDate.isNotEmpty ? note.expDate : 'N/A'),
//                                         //                     ),
//                                         //                   ],
//                                         //                 ),
//                                         //               ],
//                                         //             ),
//                                         //           ],
//                                         //         ),
//                                         //       ),
//                                         //     );
//                                         //   });
//                                         //
//                                         //   await Printing.layoutPdf(
//                                         //     onLayout: (PdfPageFormat format) async => pdf.save(),
//                                         //   );
//                                         // },
//                                       ),
//                                       ///download button
//                                       IconButton(
//                                         icon: Icon(
//                                           size: 20,
//                                           Icons
//                                               .file_download_outlined,
//                                           color: ColorManager.blueprime,
//                                         ),
//                                         onPressed: () {
//                                           // print("FileExtension:${fileExtension}");
//                                           // DowloadFile().downloadPdfFromBase64(fileExtension,"MicNotes.pdf");
//                                           // downloadFile(fileUrl);
//                                           // // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
//
//
//                                         },
//                                       ),
//
//                                       IconButton(
//                                         onPressed: () {
//                                           // showDialog(
//                                           //   context: context,
//                                           //   builder: (context) =>
//                                           //       StatefulBuilder(
//                                           //         builder: (BuildContext
//                                           //         context, void Function(
//                                           //                 void
//                                           //                 Function())
//                                           //             setState) {
//                                           //           return DeletePopup(
//                                           //             title:
//                                           //             'Delete Miscellaneous Note',
//                                           //             loadingDuration:
//                                           //             _isLoading,
//                                           //             onCancel: () {
//                                           //               Navigator.pop(
//                                           //                   context);
//                                           //             },
//                                           //             onDelete:
//                                           //                 () async {
//                                           //               setState(() {
//                                           //                 _isLoading =
//                                           //                 true;
//                                           //               });
//                                           //               try {
//                                           //                 await deleteMiscNoteAPI(
//                                           //                     context,
//                                           //                     snapshot
//                                           //                         .data![
//                                           //                     index]
//                                           //                         .miscNoteId!);
//                                           //                 setState(
//                                           //                         () async {
//                                           //                       getIntakeNoteMiscByPatientsID(
//                                           //                           context,
//                                           //                           patientId: widget
//                                           //                               .patientId)
//                                           //                           .then(
//                                           //                               (data) {
//                                           //                             noteMiscController
//                                           //                                 .add(
//                                           //                                 data);
//                                           //                           }).catchError(
//                                           //                               (error) {
//                                           //                             // Handle error
//                                           //                           });
//                                           //                       Navigator.pop(
//                                           //                           context);
//                                           //                     });
//                                           //               } finally {
//                                           //                 setState(() {
//                                           //                   _isLoading =
//                                           //                   false;
//                                           //                 });
//                                           //               }
//                                           //             },
//                                           //           );
//                                           //         },
//                                           //       ),
//                                           // );
//                                         },
//                                         icon: Icon(
//                                           Icons.delete_outline,
//                                           size: 20,
//                                           color: ColorManager.rednew,
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                         ],
//                       );
//                     },
//                   ),
//                   //     }
//                   //     return Offstage();
//                   //   },
//                   // ),
//                 ),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     ),
//   );
// }