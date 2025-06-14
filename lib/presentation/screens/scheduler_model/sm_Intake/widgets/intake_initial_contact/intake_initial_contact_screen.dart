import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_flow_contgainer_const.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/intake/inirial_contact_manager.dart';
import '../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../widgets/constant_widgets/dropdown_constant_sm.dart';

class SmIntakeInitialContactScreen extends StatelessWidget {
  final int patientId;
  final VoidCallback onOpenContact;
  SmIntakeInitialContactScreen(
      {super.key, required this.patientId, required this.onOpenContact});

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
    bool isDementia = false;
    bool isCatheterCare = false;
    bool isWoundCare = false;
    bool isZenMed = false;
    bool isOrthoPatient = false;
    bool isPtInr = false;
    TextEditingController receivedDateController = TextEditingController();
    TextEditingController caseManagerController = TextEditingController();
    TextEditingController patientDcDateController = TextEditingController();
    return Consumer<SmIntakeProviderManager>(
        builder: (context,providerState,child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppSize.s25, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Review and confirm the data pulled is correct',
                          style: SMItalicTextConst.customTextStyle(context))
                    ],
                  ),
                ),
                BlueBGHeadConst(HeadText: "Call Details"),
                FutureBuilder(
                  future: getInitialContactWithPtid(context: context, ptId: diagnosisProvider.patientId),
                  builder: (context,snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: Center(
                          child: CircularProgressIndicator(color: ColorManager.blueprime,),
                        ),
                      );
                    }
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.isEmpty ? 1 : snapshot.data!.length,
                        itemBuilder: (context,index) {
                           isDementia = snapshot.data!.isEmpty? false:snapshot.data![index].introCallComplete;
                           isCatheterCare = snapshot.data!.isEmpty? false:snapshot.data![index].demographicsConfirmed;
                           isWoundCare = snapshot.data!.isEmpty? false:snapshot.data![index].patientIsHome;
                           isZenMed = snapshot.data!.isEmpty? false:snapshot.data![index].consentsNeeded;
                           isOrthoPatient = snapshot.data!.isEmpty? false:snapshot.data![index].representativePresentSoc;
                           isPtInr = snapshot.data!.isEmpty? false:snapshot.data![index].sendConsentsForSign;
                           patientDcDateController = TextEditingController(text: snapshot.data!.isEmpty? '':snapshot.data![index].potentialDcDate);
                          return Container(
                              padding: EdgeInsets.only(top: 60),
                              height: 190,
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 30.0),
                                            child: FloatingActionButton(
                                              onPressed: onOpenContact,
                                              backgroundColor: ColorManager
                                                  .bluebottom, // Adjust color as needed
                                              shape: CircleBorder(),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.call,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 1.0),
                                                    child: Text(
                                                      "Contact",
                                                      style:
                                                          CustomTextStylesCommon.commonStyle(
                                                        fontSize: FontSize.s9,
                                                        fontWeight: FontWeight.w500,
                                                        color: ColorManager.white,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function())setState) {
                                   return Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CheckboxTile(
                                                  title:'Intro Call Complete',
                                                  initialValue: isDementia,
                                                  onChanged: (value) {
                                                    setState((){
                                                      isDementia = value;
                                                    });
                                                  },
                                                ),
                                                CheckboxTile(
                                                  title:providerState.isContactTrue?'Demographics\nConfirmed' :'Demographics Confirmed',
                                                  initialValue: isCatheterCare,
                                                  onChanged: (value) {
                                                    setState((){
                                                      isCatheterCare = value;
                                                    });
                                                  },
                                                )
                                              ]),
                                        ));}
                                  ),
                                  StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function())setState) {
                                    return Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CheckboxTile(
                                                title: 'Patient is home',
                                                initialValue: isWoundCare,
                                                onChanged: (value) {
                                                  setState((){
                                                    isWoundCare = value;
                                                  });
                                                },
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0, top: 5),
                                                child: SchedularTextField(
                                                  width: 215,
                                                  isIconVisible: true,
                                                  controller: patientDcDateController,
                                                  labelText: 'Potential DC Date',
                                                  showDatePicker: true,
                                                  enable: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                                }),
                                  StatefulBuilder(
                                      builder: (BuildContext context, void Function(void Function())setState) {
                                    return Expanded(
                                        flex: providerState.isContactTrue ? 3 : 2,
                                        child: Container(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CheckboxTile(
                                                title: 'Consents Needed',
                                                initialValue: isZenMed,
                                                onChanged: (value) {
                                                  setState((){
                                                    isZenMed = value;
                                                  });
                                                },
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40),
                                                child: ExpCheckboxTile(
                                                  title:
                                                  providerState.isContactTrue?'Patient representative will be\npresent at SOC':'Patient representative will be present at SOC',
                                                  initialValue: isOrthoPatient,
                                                  onChanged: (value) {
                                                    setState((){
                                                      isOrthoPatient = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 40),
                                                child: SizedBox(
                                                  width: 300,
                                                  child: ExpCheckboxTile(
                                                    icon: Image.asset(
                                                      "images/sm/sm_refferal/telegram.png",
                                                      height: 18,
                                                      width: 18,
                                                    ),
                                                    title: 'Send consents for signature',
                                                    initialValue: isPtInr,
                                                    isInfoIconVisible: true,
                                                    onChanged: (value) {
                                                      setState((){
                                                        isPtInr = value;
                                                      });
                                                      },
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ));}
                                  ),
                                ],
                              ));
                        }
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                // BlueBGHeadConst(HeadText: "Scheduling Requests"),
                // Container(
                //   height: 250,
                //   padding: EdgeInsets.only(top: 50, left: 28, bottom: 20),
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(top: 8.0),
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Flexible(
                //               child: CustomDropdownTextFieldsm(
                //                // width:  providerState.isContactTrue ? AppSize.s150 :AppSize.s210,
                //                 isIconVisible: false,
                //                 headText: 'User',
                //                 onChanged: (newValue) {},
                //               ),
                //             ),
                //             SizedBox(width: providerState.isContactTrue ? AppSize.s35 : AppSize.s70),
                //             Flexible(
                //               child: CustomDropdownTextFieldsm(
                //                // width: providerState.isContactTrue ? AppSize.s150 :AppSize.s210,
                //                 isIconVisible: false,
                //                 headText: 'Gender',
                //                 onChanged: (newValue) {},
                //               ),
                //             ),
                //             SizedBox(width: providerState.isContactTrue ? AppSize.s35 : AppSize.s70),
                //             Flexible(
                //               child: CustomDropdownTextFieldsm(
                //                 //width: providerState.isContactTrue ? AppSize.s150 :AppSize.s210,
                //                 isIconVisible: false,
                //                 headText: 'Language',
                //                 onChanged: (newValue) {},
                //               ),
                //             ),
                //             providerState.isContactTrue ?Offstage() : SizedBox(width: providerState.isContactTrue ? AppSize.s35 : AppSize.s70),
                //             providerState.isContactTrue ? Offstage() : Flexible(
                //               child: SchedularTextField(
                //               //  width: providerState.isContactTrue ? AppSize.s150 :AppSize.s210,
                //                 isIconVisible: true,
                //                 enable: false,
                //                 controller: receivedDateController,
                //                 labelText: 'Select Date',
                //                 showDatePicker: true,
                //               ),
                //             ),
                //             SizedBox(width: providerState.isContactTrue ? AppSize.s35 : AppSize.s70),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         height: 40,
                //       ),
                //       Row(
                //         children: [
                //           providerState.isContactTrue
                //               ? Flexible(
                //             child: SchedularTextField(
                //               width: AppSize.s240,
                //               isIconVisible: true,
                //               enable: false,
                //               controller: receivedDateController,
                //               labelText: 'Select Date',
                //               showDatePicker: true,
                //             ),
                //           )
                //               : Offstage(),
                //           providerState.isContactTrue
                //               ?  SizedBox(width: AppSize.s35,)   : Offstage(),
                //           Row(
                //             children: [
                //               Padding(
                //                   padding: EdgeInsets.only(top: 20, right: 20),
                //                   child: Text('Notes',
                //                       style:
                //                           SMTextfieldHeadings.customTextStyle(context)
                //                       //AllPopupHeadings.customTextStyle(context)
                //                       )),
                //               SchedularTextField(
                //                 isIconVisible: true,
                //                 width: 395,
                //                 enable: false,
                //                 controller: caseManagerController,
                //                 labelText: '',
                //               )
                //             ],
                //           ),
                //
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // Divider(),
                // SizedBox(height: AppSize.s100),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   spacing: 10,
                //   children: [
                //     CustomButtonTransparent(
                //       text: "Skip",
                //       onPressed: () {},
                //     ),
                //     CustomElevatedButton(
                //       width: AppSize.s100,
                //       text: AppString.save,
                //       onPressed: () {},
                //     ),
                //   ],
                // ),
                // SizedBox(height: AppSize.s30),
              ],
            ),
          ),
        );
      }
    );
  }
}
