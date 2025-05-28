import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../app/services/token/token_manager.dart';
import '../../../../../data/api_data/sm_data/sm_model_data/patient_insurances_data.dart';
import '../../../../widgets/error_popups/delete_success_popup.dart';
import '../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';
import '../widgets/intake_profile_bar.dart';
import 'add_popup_const.dart';

class DocumationScreenTab extends StatefulWidget {
  const DocumationScreenTab({super.key});

  @override
  State<DocumationScreenTab> createState() => _DocumationScreenTabState();
}

class _DocumationScreenTabState extends State<DocumationScreenTab> {

  TextEditingController ffdateController = TextEditingController();
  TextEditingController ffpostController = TextEditingController();
  TextEditingController ffappoController = TextEditingController();
  bool isLoading = false;
  final StreamController<List<PatientDocumentsData>> _streamController = StreamController<List<PatientDocumentsData>>.broadcast();
  final StreamController<List<PatientDocumentsBillingData>> _streamControllerBillingAttachment = StreamController<List<PatientDocumentsBillingData>>.broadcast();
  final StreamController<List<PatientDocumentsFtwoFData>> _streamControllerF2F = StreamController<List<PatientDocumentsFtwoFData>>.broadcast();
  final StreamController<List<PatientDocumentsConsentData>> _streamControllerConsent = StreamController<List<PatientDocumentsConsentData>>.broadcast();
  String? loginName = '';
  Future<String> user() async {
    loginName = await TokenManager.getUserName();
    //loginName = userName;
    print("UserName login ${loginName}");
    return loginName!;
  }
  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context,listen: false);
    final int patientId = diagnosisProvider.patientId;
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Review and confirm the data pulled is correct',
                              style: SMItalicTextConst.customTextStyle(context))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Missing Paperwork: Therapy Notes',
                          style: TextStyle(fontSize: FontSize.s12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFC30909)),)
                      ],),
                    SizedBox(height: AppSize.s10,),
                    BlueBGHeadConst(HeadText: "Clinical Attachments*"),
                    SizedBox(height: AppSize.s10,),
                    StreamBuilder<List<PatientDocumentsData>>(
                        stream: _streamController.stream,
                        builder: (context,snapshotDoc) {
                          getReffrealsPatientDocumentsByDocType(context: context, patientId: patientId,documentType: AppConfig.clinicianAttachment).then((data) {
                            _streamController.add(data);
                          }).catchError((error) {
                            // Handle error
                          });
                          if(snapshotDoc.connectionState == ConnectionState.waiting){
                            return Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                            );
                          }
                          if(snapshotDoc.data!.isEmpty){
                            return Center(
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(vertical: 76),
                                  child: Text(
                                    AppStringSMModule.patientDocNoData,
                                    style: AllNoDataAvailable.customTextStyle(context),
                                  ),
                                ));
                          }
                          if(snapshotDoc.hasData){
                   return Container(
                     child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: snapshotDoc.data!.length,
                         itemBuilder: (context,index){
                           return FileInfoCard(
                             content: snapshotDoc.data![index].rptd_content,
                             documentName: snapshotDoc.data![index].documentName,
                             fileUrl: snapshotDoc.data![index].rptd_url,
                             fileName: snapshotDoc.data![index].documentName,// "Erica Thompson REF.pdf",
                             uploadedInfo: providerState.isContactTrue
                                 ? "Uploaded ${snapshotDoc.data![index].rptd_created_at}\nAM PST by $loginName"
                                 : "Uploaded ${snapshotDoc.data![index].rptd_created_at}AM PST by $loginName",
                             isContact: providerState.isContactTrue,
                             // onHistoryTap: () {},
                             // onTelegramTap: () {},
                             onPrintTap: () {},
                             onDownloadTap: () {},
                             onDeleteTap: () async {
                               setState(() {
                                 isLoading = true;
                               });
                               try {
                                 var response =  await deletePatientDocument(context: context, docId: snapshotDoc.data![index].rptd_id, );
                                 if(response.statusCode == 200  || response.statusCode == 201) {
                                   // Navigator.pop(context);
                                   // Future.delayed(Duration(seconds: 1));
                                   showDialog(
                                     context: context,
                                     builder: (BuildContext context) => const DeleteSuccessPopup(),
                                   );
                                 }
                               } finally {
                                 setState(() {
                                   isLoading = false;
                                   //Navigator.pop(context);
                                 });
                               }
                             },
                           );
                         }),
                   );
                    }else{
                    return const SizedBox();
                    }

                  }
                  ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,
                          width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add  Clinical Attachment',docTypeId: AppConfig.clinicianAttachment);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),

                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Billing Attachments*"),
                    SizedBox(height: AppSize.s10,),
                    StreamBuilder<List<PatientDocumentsBillingData>>(
                        stream: _streamControllerBillingAttachment.stream,
                        builder: (context,snapshotDoc) {
                          getReffrealsPatientDocumentsBillingAttachment(context: context, patientId: patientId,).then((data) {
                            _streamControllerBillingAttachment.add(data);
                          }).catchError((error) {
                            // Handle error
                          });
                          if(snapshotDoc.connectionState == ConnectionState.waiting){
                            return Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                            );
                          }
                          if(snapshotDoc.data!.isEmpty){
                            return Center(
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(vertical: 76),
                                  child: Text(
                                    AppStringSMModule.patientDocNoData,
                                    style: AllNoDataAvailable.customTextStyle(context),
                                  ),
                                ));
                          }
                          if(snapshotDoc.hasData){
                            return Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshotDoc.data!.length,
                          itemBuilder: (context,index){
                            return FileInfoCard(
                              content: snapshotDoc.data![index].rptd_content,
                              documentName: snapshotDoc.data![index].documentName,
                              fileUrl: snapshotDoc.data![index].rptd_url,
                              fileName: snapshotDoc.data![index].documentName,
                              uploadedInfo: providerState.isContactTrue
                                  ? "Uploaded ${snapshotDoc.data![index].rptd_created_at}\nAM PST by $loginName"
                                  : "Uploaded ${snapshotDoc.data![index].rptd_created_at}AM PST by $loginName",
                              isContact: providerState.isContactTrue,
                              // onHistoryTap: () {},
                              // onTelegramTap: () {},
                              onPrintTap: () {},
                              onDownloadTap: () {},
                              onDeleteTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  var response =  await deletePatientDocument(context: context, docId: snapshotDoc.data![index].rptd_id, );
                                  if(response.statusCode == 200  || response.statusCode == 201) {
                                    // Navigator.pop(context);
                                    // Future.delayed(Duration(seconds: 1));
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => const DeleteSuccessPopup(),
                                    );
                                  }
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                    //Navigator.pop(context);
                                  });
                                }
                                // setState(() async{
                                //
                                //   Navigator.pop(context);
                                // });
                              },
                            );
                          }),
                    );
                    }else{
                    return const SizedBox();
                    }

                  }
                  ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                            onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Billing Attachment',docTypeId: AppConfig.billingAttachment);
                              },
                            );
                          },
                            text: "Add Attachment",
                        ),
                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Face to Face Encounter"),
                    SizedBox(height: AppSize.s10,),
                   //  StreamBuilder<List<PatientDocumentsFtwoFData>>(
                   //      stream: _streamControllerF2F.stream,
                   //      builder: (context,snapshotDoc) {
                   //        getReffrealsPatientDocumentsFaceTwoFace(context: context, patientId: patientId,).then((data) {
                   //          _streamControllerF2F.add(data);
                   //        }).catchError((error) {
                   //          // Handle error
                   //        });
                   //        if(snapshotDoc.connectionState == ConnectionState.waiting){
                   //          return Center(
                   //            child: SizedBox(
                   //                height: 30,
                   //                width: 30,
                   //                child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                   //          );
                   //        }
                   //        if(snapshotDoc.data!.isEmpty){
                   //          return Center(
                   //              child: Padding(
                   //                padding:const EdgeInsets.symmetric(vertical: 76),
                   //                child: Text(
                   //                  AppStringSMModule.patientDocNoData,
                   //                  style: AllNoDataAvailable.customTextStyle(context),
                   //                ),
                   //              ));
                   //        }
                   //        if(snapshotDoc.hasData){
                   //          return  Column(
                   //    children: [
                   //      Padding(
                   //        padding: EdgeInsets.only(left:providerState.isContactTrue ? 0 :  40),
                   //        child:
                   //        providerState.isContactTrue ? Container(
                   //          height: 150,
                   //          child: Column(
                   //            children: [
                   //              Padding(
                   //                padding: const EdgeInsets.only(left: 30.0),
                   //                child: Row(
                   //                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //                  // crossAxisAlignment: CrossAxisAlignment.center,
                   //                  children: [
                   //                    Flexible(
                   //                        child: SchedularTextField(
                   //                          width: 240,
                   //                            controller:ffdateController ,
                   //                            labelText: 'F2F Date:',
                   //                            enable: false,
                   //                            showDatePicker:true
                   //                        )),
                   //                    SizedBox(width: AppSize.s90),
                   //                    Flexible(
                   //                        child: Padding(
                   //                          padding: const EdgeInsets.only(top: 3),
                   //                          child: CustomDropdownTextFieldsm(
                   //                              width: 240,
                   //                              headText: 'Marketer',
                   //                              items: ['Spouse','Patient',],
                   //                              //dropDownMenuList: dropDownList,
                   //                              onChanged: (newValue) {
                   //
                   //                              }),
                   //                        )),
                   //                    Flexible(
                   //                        child: SizedBox(width:0)),
                   //                    // SizedBox(width: AppSize.s65),
                   //                  ],
                   //                ),
                   //              ),
                   //             SizedBox(height: 20,),
                   //             // Flexible(child: SizedBox(width:100)),
                   //              Row(
                   //                children: [
                   //                  Flexible(
                   //                      child: SchedularTextFieldcheckbox(
                   //                        enable: false,
                   //                        controller: ffpostController,
                   //                        labelText: 'Post-op Visit Note Needed',
                   //                        showDatePicker:true,
                   //                        initialCheckboxValue: true,
                   //                        onCheckboxChanged: (val) {
                   //                          print("Checkbox value: $val");
                   //                        },
                   //                      )),
                   //                  SizedBox(width: AppSize.s58),
                   //                  Flexible(
                   //                      child: SchedularTextFieldcheckbox(
                   //                        enable: false,
                   //                        controller: ffappoController,
                   //                        labelText: 'F2F Appointment Needed',
                   //                        showDatePicker:true,
                   //                        initialCheckboxValue: false,
                   //                        onCheckboxChanged: (val) {
                   //                          print("Checkbox value: $val");
                   //                        },
                   //                      )),
                   //                  Flexible(
                   //                      child: SizedBox(width:0)),
                   //                ],
                   //              )
                   //            ],
                   //          ),
                   //        ) :
                   //        Column(
                   //          children: [
                   //            Padding(
                   //              padding: const EdgeInsets.only(right: 100),
                   //              child: Row(
                   //                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //                // crossAxisAlignment: CrossAxisAlignment.center,
                   //                children: [
                   //                  Flexible(
                   //                      child: SchedularTextField(
                   //                          controller:ffdateController ,
                   //                          labelText: 'F2F Date:',
                   //                          enable: false,
                   //                          showDatePicker:true
                   //                      )),
                   //                 SizedBox(width: AppSize.s58),
                   //                  Flexible(
                   //                      child: Padding(
                   //                        padding: const EdgeInsets.only(top: 3),
                   //                        child: CustomDropdownTextFieldsm(
                   //                            headText: 'Marketer',
                   //                            items: ['Spouse','Patient',],
                   //                            //dropDownMenuList: dropDownList,
                   //                            onChanged: (newValue) {
                   //
                   //                            }),
                   //                      )),
                   //                  SizedBox(width: AppSize.s58),
                   //                  Flexible(
                   //                      child: SchedularTextFieldcheckbox(
                   //                        enable: false,
                   //                          controller: ffpostController,
                   //                          labelText: 'Post-op Visit Note Needed',
                   //                          showDatePicker:true,
                   //                        initialCheckboxValue: true,
                   //                        onCheckboxChanged: (val) {
                   //                          print("Checkbox value: $val");
                   //                        },
                   //                      )),
                   //                 SizedBox(width: AppSize.s58),
                   //                  Flexible(
                   //                      child: SchedularTextFieldcheckbox(
                   //                        enable: false,
                   //                          controller: ffappoController,
                   //                          labelText: 'F2F Appointment Needed',
                   //                          showDatePicker:true,
                   //                        initialCheckboxValue: false,
                   //                        onCheckboxChanged: (val) {
                   //                          print("Checkbox value: $val");
                   //                        },
                   //                      )),
                   //                  // Flexible(
                   //                  //     child: SizedBox(width:0)),
                   //               SizedBox(width: AppSize.s105),
                   //                ],
                   //              ),
                   //            ),
                   //          ],
                   //        ),
                   //      ),
                   //  SizedBox(height: AppSize.s10,),
                   // Container(
                   //    child: ListView.builder(
                   //        shrinkWrap: true,
                   //        itemCount: snapshotDoc.data!.length,
                   //        itemBuilder: (context,index){
                   //          return FileInfoCard(
                   //            documentName: snapshotDoc.data![index].documentName,
                   //            fileUrl: snapshotDoc.data![index].rptd_url,
                   //            fileName: snapshotDoc.data![index].documentName,
                   //           uploadedInfo: providerState.isContactTrue
                    //                 ? "Uploaded ${snapshotDoc.data![index].rptd_created_at}\nAM PST by $loginName"
                    //                 : "Uploaded ${snapshotDoc.data![index].rptd_created_at}AM PST by $loginName",
                    //                                  isContact: providerState.isContactTrue,
                   //            // onHistoryTap: () {},
                   //            // onTelegramTap: () {},
                   //            onPrintTap: () {},
                   //            onDownloadTap: () {},
                   //            onDeleteTap: () async {
                   //              setState(() {
                   //                isLoading = true;
                   //              });
                   //              try {
                   //                var response =  await deletePatientDocument(context: context, docId: snapshotDoc.data![index].rptd_id, );
                   //                if(response.statusCode == 200  || response.statusCode == 201) {
                   //                  // Navigator.pop(context);
                   //                  // Future.delayed(Duration(seconds: 1));
                   //                  showDialog(
                   //                    context: context,
                   //                    builder: (BuildContext context) => const DeleteSuccessPopup(),
                   //                  );
                   //                }
                   //              } finally {
                   //                setState(() {
                   //                  isLoading = false;
                   //                  //Navigator.pop(context);
                   //                });
                   //              }
                   //              // setState(() async{
                   //              //
                   //              //   Navigator.pop(context);
                   //              // });
                   //            },
                   //          );
                   //        }),
                   //  )  ],
                   //          );
                   //    }else{
                   //    return const SizedBox();
                   //    }
                   //
                   //  }
                   //  ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Face to Face Attachment',docTypeId: 0);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Consents"),
                    SizedBox(height: AppSize.s10,),
                    StreamBuilder<List<PatientDocumentsConsentData>>(
                        stream: _streamControllerConsent.stream,
                        builder: (context,snapshotDoc) {
                          getReffrealsPatientDocumentsConsent(context: context, patientId: patientId, doctypeId: AppConfig.consent,).then((data) {
                            _streamControllerConsent.add(data);
                          }).catchError((error) {
                            // Handle error
                          });
                          if(snapshotDoc.connectionState == ConnectionState.waiting){
                            return Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                            );
                          }
                          if(snapshotDoc.data!.isEmpty){
                            return Center(
                                child: Padding(
                                  padding:const EdgeInsets.symmetric(vertical: 76),
                                  child: Text(
                                    AppStringSMModule.patientDocNoData,
                                    style: AllNoDataAvailable.customTextStyle(context),
                                  ),
                                ));
                          }
                          if(snapshotDoc.hasData){
                            return Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshotDoc.data!.length,
                          itemBuilder: (context,index){
                            return FileInfoCard(
                              content: snapshotDoc.data![index].rptd_content,
                              documentName: snapshotDoc.data![index].documentName,
                              fileUrl: snapshotDoc.data![index].rptd_url,
                              fileName: snapshotDoc.data![index].documentName,
                              uploadedInfo: providerState.isContactTrue
                                  ? "Uploaded ${snapshotDoc.data![index].rptd_created_at}\nAM PST by $loginName"
                                  : "Uploaded ${snapshotDoc.data![index].rptd_created_at}AM PST by $loginName",
                              isContact: providerState.isContactTrue,
                              // onHistoryTap: () {},
                              // onTelegramTap: () {},
                              onPrintTap: () {},
                              onDownloadTap: () {},
                              onDeleteTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  var response =  await deletePatientDocument(context: context, docId: snapshotDoc.data![index].rptd_id, );
                                  if(response.statusCode == 200  || response.statusCode == 201) {
                                    // Navigator.pop(context);
                                    // Future.delayed(Duration(seconds: 1));
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => const DeleteSuccessPopup(),
                                    );
                                  }
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                    //Navigator.pop(context);
                                  });
                                }
                                // setState(() async{
                                //
                                //   Navigator.pop(context);
                                // });
                              },
                            );
                          }),
                    );
                      }else{
                      return const SizedBox();
                      }

                    }
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Consents Attachment',docTypeId: AppConfig.consent);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),
                    SizedBox(height: AppSize.s80),
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        CustomButtonTransparent(
                          text: "Cancel",
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
                  ],
                ),
              ),
            ),
        );
      }
    );

  }
}
