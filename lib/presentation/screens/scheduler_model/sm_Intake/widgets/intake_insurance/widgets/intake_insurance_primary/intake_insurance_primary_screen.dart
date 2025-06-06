import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/constants/app_config.dart';
import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/font_manager.dart';
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
import '../../../../../textfield_dropdown_constant/schedular_dropdown_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../intake_flow_contgainer_const.dart';
import '../save_page/insurance_save_page.dart';

class IntakePrimaryScreen extends StatelessWidget {
  final int patientId;
  final VoidCallback onEditScreen;
   final VoidCallback onSave;
  IntakePrimaryScreen({super.key, required this.patientId,   required this.onSave, required this.onEditScreen,});


  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);

    TextEditingController pharmaSelectDB = TextEditingController();
    TextEditingController pharmaName = TextEditingController();
    TextEditingController pharmaphone = TextEditingController();
    TextEditingController pharmaType = TextEditingController();
    TextEditingController pharmaCategory = TextEditingController();
    TextEditingController pharmaSuitApt = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController pharmacyaddress = TextEditingController();
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
    String? statustype;
    String? dmeSupplies;
    String? pharmacydd;
    String? pharmacystate;
    String? pharmacycity;
    bool _isLoading = false;
    final StreamController<List<PatientInsuranceDocumentData>> _streamControllerDoc = StreamController<List<PatientInsuranceDocumentData>>.broadcast();
    return
      // backgroundColor: ColorManager.white,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(right: 90), // Shift left by 10
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       // Your onPressed action here
      //     },
      //     backgroundColor: ColorManager.bluebottom,
      //     child: Padding(
      //       padding: const EdgeInsets.all(5),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(Icons.call,size: 22,),
      //           SizedBox(height: 3,),
      //           Text(
      //             "Contact",
      //             style: CustomTextStylesCommon.commonStyle(
      //               fontSize: FontSize.s10,
      //               fontWeight: FontWeight.w500,
      //               color: ColorManager.white,
      //             ),
      //             textAlign: TextAlign.center,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      FutureBuilder<List<PatientInsuranceInfoData>>(
        future: getPatientInsuranceinfo(context: context,ptId:diagnosisProvider.patientId),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(color: ColorManager.blueprime,)
            );
          }
          return Consumer<SmIntakeProviderManager>(
            builder: (context,providerstate,child) {
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: BlueBGHeadConst(HeadText: "Policy Details"),
                      ),
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context,index) {
                            // print('rptiId ${snapshot.data![index].rptiId.toInt()}');
                            pharmaName = TextEditingController(text:snapshot.data!.isEmpty?'':snapshot.data![0].rptiName);
                            pharmaType = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiType);
                            pharmaCategory = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiCategory);
                            pharmacyaddress = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiStreet);
                            pharmaSuitApt = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiSuite);
                            city = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiCity);
                            state = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiState);
                            pharmacyzipcode = TextEditingController(text:snapshot.data!.isEmpty?'': snapshot.data![0].rptiZipcode);
                            pharmaphone =  TextEditingController(text:snapshot.data!.isEmpty?'': snapshot.data![0].rptiContact);
                            pharmaAuth = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiAuthorization ? 'NOT REQUIRED' : 'REQUIRED');
                            pharmaEftDateForm = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiEffectiveFrom);
                            pharmaEftDateFormTo = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiEffectiveTo);
                            pharmaPolicyHicNo = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiPolicy);
                            pharmaGrpNo = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiGroupNumber.toString());
                            pharmaGrpName = TextEditingController(text:snapshot.data!.isEmpty?'':  snapshot.data![0].rptiGroupName);
                            pharmaEmail = TextEditingController(text: snapshot.data!.isEmpty?'': snapshot.data![0].rptiEmail);
                            statustype = snapshot.data!.isEmpty?'': snapshot.data![0].rptiVerified ? 'Yes' : 'No';
                            return IntakeFlowContainerConst(
                              height: providerstate.isContactTrue ?AppSize.s550 :AppSize.s400,
                              containerPadding: providerstate.isContactTrue ? const EdgeInsets.only(left: AppPadding.p20, top: AppPadding.p30,bottom: AppPadding.p30) : null,
                              //child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    providerstate.isContactTrue ?
                                    Row(
                                      children: [
                                        Flexible(
                                            child: CustomDropdownTextFieldsm(headText: 'Select from Database',items: ["A",'B'],
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
                                    ):
                                    Row(
                                      children: [
                                        Flexible(
                                            child: CustomDropdownTextFieldsm(headText: providerstate.isContactTrue ? 'Select from\nDatabase' : 'Select from Database',items: ["A",'B'],
                                    onChanged: (newValue) {
                                    })),

                                            // SchedularTextField(
                                            //     controller: pharmaSelectDB,
                                            //     labelText: 'Select from Database')),
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
                                    providerstate.isContactTrue ? Row(
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
                                    providerstate.isContactTrue ?  Row(
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
                                          child: SchedularTextField(
                                            labelText: "State*",
                                            controller: state,
                                          ),
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
                                                labelText: 'Phone Number')),
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
                                    providerstate.isContactTrue ?  Row(
                                      children: [
                                        Flexible(
                                            child: SchedularTextField(
                                                controller: pharmaphone,
                                                phoneField:true,
                                                labelText: 'Phone Number')),
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
                                              controller: pharmaEmail, labelText: 'Primary Email',
                                              )),
                                        const SizedBox(width: AppSize.s35),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Insurance Verified',
                                                  style:providerstate.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                                  //AllPopupHeadings.customTextStyle(context)
                                                  ),
                                              const SizedBox(height: 10),
                                              StatefulBuilder(
                                                  builder: (BuildContext context, void Function(void Function())setState) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      child: CustomRadioListTileSMp(
                                                        title: 'Yes',
                                                        value: 'Yes',
                                                        groupValue: statustype,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            statustype = value;
                                                          });
                                                        },
                                                      ),
                                                    ),

                                                    Expanded(
                                                      child: CustomRadioListTileSMp(
                                                        title: 'No',
                                                        value: 'No',
                                                        groupValue: statustype,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            statustype = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );}
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    providerstate.isContactTrue ?  Row(
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
                                    providerstate.isContactTrue ? Row(
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
                                              controller: pharmaEmail, labelText: 'Primary Email',
                                            )),
                                      ],
                                    ) : const Offstage(),
                                    const SizedBox(height: AppSize.s16),
                                    providerstate.isContactTrue ?SizedBox(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Insurance Verified',
                                                    style:providerstate.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                                  //AllPopupHeadings.customTextStyle(context)
                                                ),
                                                const SizedBox(height: 10),
                                                StatefulBuilder(
                                                    builder: (BuildContext context, void Function(void Function())setState) {
                                                  return Row(
                                                    children: [
                                                      Expanded(
                                                        child: CustomRadioListTileSMp(
                                                          title: 'Yes',
                                                          value: 'Yes',
                                                          groupValue: statustype,
                                                          onChanged: (value) {
                                                            setState(() {
                                                            statustype = value;
                                                            });
                                                          },
                                                        ),
                                                      ),

                                                      Expanded(
                                                        child: CustomRadioListTileSMp(
                                                          title: 'No',
                                                          value: 'No',
                                                          groupValue: statustype,
                                                          onChanged: (value) {
                                                            setState(() {
                                                            statustype = value;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );}
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ):const Offstage(),
                                  ],
                                ),
                             // ),
                            );
                          }
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 35),
                      //   child: BlueBGHeadConst(HeadText: "Suggested Care & Diagnosis"),
                      // ),
                      const SizedBox(height: AppSize.s5),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
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
                                        return snapshotDoc.data![index].isPrimary != true? Offstage():Padding(
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
                                                    iconSize: providerstate.isContactTrue?IconSize.I20 :IconSize.I22,
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
                                                    iconSize:providerstate.isContactTrue?IconSize.I20 :IconSize.I22,
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
                                        isPrimary: true,
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
                      StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            SizedBox(
                              width:AppSize.s100,
                              height:AppSize.s35,
                              child: ElevatedButton(
                                onPressed: () async{

                                  // Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  backgroundColor: ColorManager.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular( 12),
                                    side: const BorderSide(color: Color(0xFF50B5E5)),
                                  ),
                                ),
                                child: Text(
                                    'Skip',
                                    style: TransparentButtonTextConst.customTextStyle(context)
                                ),
                              ),
                            ),
                          _isLoading? Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(color: ColorManager.blueprime,),
                            ),
                          ) :CustomElevatedButton(
                              width: AppSize.s100,
                              text: AppString.save,
                              onPressed: ()async{

                                setState((){
                                  _isLoading = true;
                                });
                                try{
                                  var responseUpdate = await updatePatientInsuranceInfo(
                                      context: context,
                                      id: snapshot.data![0].rptiId,
                                      rptiPolicy: pharmaPolicyHicNo.text,
                                      rptiInsuranceProvider: '',
                                      rptiType: pharmaType.text,
                                      rptiInsurancePlan:'' ,
                                      rptiEligibility: false,
                                      rptiAuthorization: false,
                                      rptiName: pharmaName.text,
                                      rptiCategory: pharmaCategory.text,
                                      rptiStreet: pharmacyaddress.text,
                                      rptiSuite: pharmaSuitApt.text,
                                      rptiCity: city.text,
                                      rptiState: state.text,
                                      rptiZipcode: pharmacyzipcode.text,
                                      rptiContact: pharmaphone.text,
                                      rptiEffectiveFrom: pharmaEftDateForm.text,
                                      rptiEffectiveTo: pharmaEftDateFormTo.text,
                                      rptiGroupNumber: int.parse(pharmaGrpNo.text),
                                      rptiGroupName: pharmaGrpName.text,
                                      rptiEmail: pharmaEmail.text,
                                      rptiVerified: statustype == 'Yes' ? true : false,
                                      rptiComments: snapshot.data![0].rptiComments);
                                  if(responseUpdate.statusCode == 200 || responseUpdate.statusCode == 201){
                                    //onMoveToIntake();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddSuccessPopup(
                                          message: 'Patient Insurance Updated Successfully',
                                        );
                                      },
                                    );
                                    onSave();
                                  }else{
                                    print('Api error');
                                  }
                                }finally{
                                  setState((){
                                    _isLoading = false;
                                  });
                                }

                              },
                            ),
                          ],
                        );
            }),
                      const SizedBox(height: AppSize.s30),
                          ],
                        )
                        ),
                        // ),
                      );
            }
          );
        }
      );


  }
}
