import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_flow_contgainer_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/textfield_dropdown_constant/schedular_textfield_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../widgets/constant_widgets/schedular_success_popup.dart';

class SMIntakeOrdersScreen extends StatelessWidget {
  final int patientId;
  const SMIntakeOrdersScreen({super.key, required this.patientId});


  // int selectedIndex = 0;
  // final PageController smIntakePageController = PageController();
  //
  // void selectButton(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  //
  //   smIntakePageController.animateToPage(
  //     index,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.ease,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    TextEditingController receivedDateController = TextEditingController();
    TextEditingController orderDateController = TextEditingController();
    TextEditingController caseManagerController = TextEditingController();
    TextEditingController trackingNotesController = TextEditingController();
    TextEditingController possibleDiagnosisController = TextEditingController();
    TextEditingController icdCodeController = TextEditingController();
    TextEditingController pDGMAcceptController = TextEditingController();
    bool ordersSignAndDate = false;
    bool isNursing = false;
    bool isPhysicalThe = false;
    bool isOccupationalThe = false;
    bool isSpeechThe = false;
    bool isMedicalSocialThe = false;
    //
    bool isDementia = false;
    bool isCatheterCare = false;
    bool isWoundCare = false;
    bool isZenMed = false;
    bool isOrthoPatient = false;
    bool isPtInr = false;
    bool isLabsOrder = false;
    bool isInfusionIv = false;
    bool isOstomyCare = false;
    bool isRehospicRisk = false;
    bool isEch = false;
    bool isEchSnf = false;
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
       SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
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
              BlueBGHeadConst(HeadText: "Order Details"),
              IntakeFlowContainerConst(
                height: AppSize.s370,
                child: SingleChildScrollView(
                  child: Column(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SchedularTextField(
                                width:300,
                                controller: receivedDateController,
                                labelText: 'Date Received',
                                enable: false,
                                showDatePicker:true,
                              ),
                              SizedBox(height: AppSize.s14,),

                                 SchedularTextField(
                                  width:300,
                                  controller: orderDateController,
                                  labelText: 'Order Date',
                                   enable: false,
                                  showDatePicker:true,
                                ),

                              SizedBox(height: AppSize.s14,),
                              CheckboxTile(

                                title: 'Orders Signed and Date',
                                initialValue: ordersSignAndDate,
                                isInfoIconVisible: true,
                                onChanged: (value) {

                                },
                              )

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  spacing: 5,
                                  children: [
                                    Text('Disciplines',style: AllPopupHeadings.customTextStyle(context),),
                                    SizedBox(width: AppSize.s10,),
                                    SvgPicture.asset(
                                      'images/sm/sm_refferal/i_circle.svg',
                                      height: IconSize.I20,
                                      width: IconSize.I20,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:200,
                                width:400,
                                child: Column(
                                  children: [
                                    Row(
                                      //alignment: WrapAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // spacing: 10,
                                      // runSpacing: 5,
                                      children: [
                                        CheckboxTile(
                                          title: 'Nursing',
                                          initialValue: isNursing,
                                          onChanged: (value) {

                                          },
                                        ),
                                        CheckboxTile(
                                          title: 'Physical Therapy',
                                          initialValue: isPhysicalThe,
                                          onChanged: (value) {

                                          },
                                        ),


                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CheckboxTile(
                                          title: 'Occupational Therapy',
                                          initialValue: isOccupationalThe,
                                          onChanged: (value) {

                                          },
                                        ),
                                        CheckboxTile(
                                          title: 'Speech Therapy',
                                          initialValue: isSpeechThe,
                                          onChanged: (value) {

                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CheckboxTile(
                                          title: 'Medical Social Services',
                                          initialValue: isMedicalSocialThe,
                                          onChanged: (value) {
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropdownTextFieldsm(
                                width:300,
                                isIconVisible: false,
                                headText: 'Marketer',
                                onChanged: (newValue) {
                                },),
                              SizedBox(height: AppSize.s14,),
                              CustomDropdownTextFieldsm(
                                width:300,
                                headText: 'Referral Source',
                                onChanged: (newValue) {

                                },),
                              SizedBox(height: AppSize.s14,),
                              SchedularTextField(
                                width:300,
                                controller: caseManagerController,
                                labelText: 'Case Manager',
                              )
                            ],
                          )
                          // CheckboxTile(
                          //   title: 'No Emergency Contact',
                          //   initialValue: noEmergencyData,
                          //   onChanged: (value) {
                          //
                          //   },
                          // )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 15,
                        children: [
                          Padding(
                            padding:EdgeInsets.symmetric(vertical: 13),
                              child: Text('Tracking Notes',style:AllPopupHeadings.customTextStyle(context))),
                          SchedularTextField(
                            isIconVisible:true,
                            enable: false,
                            width: 350,
                            controller: trackingNotesController,
                            labelText: '',
                            hintText: 'Enter Text',
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSize.s40),
              BlueBGHeadConst(HeadText: "Primary Diagnosis"),
              IntakeFlowContainerConst(
                height: AppSize.s400,
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                    height: AppSize.s100,
                   // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30, vertical: AppPadding.p15),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      // borderRadius: BorderRadius.circular(5),
                      // border: Border.symmetric(vertical: BorderSide(width: 0.2,color: ColorManager.grey),horizontal: BorderSide(width: 0.2,color: ColorManager.grey),),//all(width: 1, color: Color(0xFFBCBCBC)),
                      border: Border(
                        bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                      ),//all(width: 1, color: Color(0xFFBCBCBC)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: ColorManager.black.withOpacity(0.2),
                      //     spreadRadius: 0,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 4),
                      //   ),
                      // ],
                    ),child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VerticalDivider(
                            color: Colors.red,
                            thickness: 4.5,
                          ),
                          SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: possibleDiagnosisController,
                                    labelText: 'Possible Diagnosis',
                                    enable: false,
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: icdCodeController,
                                    labelText: 'ICD Code',
                                    enable: false,

                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:9),
                                    child: SchedularTextField(
                                      isIconVisible: true,
                                      enable: false,
                                      controller: pDGMAcceptController,
                                      labelText: 'PDGM - Acceptable',

                                    ),
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(child: SizedBox()),



                          // CheckboxTile(
                          //   title: 'No Emergency Contact',
                          //   initialValue: noEmergencyData,
                          //   onChanged: (value) {
                          //
                          //   },
                          // )
                        ],
                      ),),
                    Container(
                      height: AppSize.s100,
                      // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30, vertical: AppPadding.p15),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        // borderRadius: BorderRadius.circular(5),
                        // border: Border.symmetric(vertical: BorderSide(width: 0.2,color: ColorManager.grey),horizontal: BorderSide(width: 0.2,color: ColorManager.grey),),//all(width: 1, color: Color(0xFFBCBCBC)),
                        border: Border(
                          bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                        ),//all(width: 1, color: Color(0xFFBCBCBC)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: ColorManager.black.withOpacity(0.2),
                        //     spreadRadius: 0,
                        //     blurRadius: 4,
                        //     offset: Offset(0, 4),
                        //   ),
                        // ],
                      ),child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalDivider(
                          color: Colors.green,
                          thickness: 4.5,
                        ),
                        SizedBox(width: AppSize.s35),
                        Flexible(
                            child: SchedularTextField(
                              controller: possibleDiagnosisController,
                              labelText: 'Possible Diagnosis',
                              enable: false,

                            )),
                        SizedBox(width: AppSize.s35),
                        Flexible(
                            child: SchedularTextField(
                              controller: icdCodeController,
                              labelText: 'ICD Code',
                              enable: false,

                            )),
                        SizedBox(width: AppSize.s35),
                        Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top:9),
                              child: SchedularTextField(
                                isIconVisible: true,
                                enable: false,
                                controller: pDGMAcceptController,
                                labelText: 'PDGM - Acceptable',

                              ),
                            )),
                        SizedBox(width: AppSize.s35),
                        Flexible(child: SizedBox()),



                        // CheckboxTile(
                        //   title: 'No Emergency Contact',
                        //   initialValue: noEmergencyData,
                        //   onChanged: (value) {
                        //
                        //   },
                        // )
                      ],
                    ),),

                    // Container(
                    //   height:AppSize.s500,
                    //   child: ListView.builder(
                    //     itemCount: 4,
                    //     itemBuilder: (context,index) {
                    //       return IntakeFlowContainerConst(
                    //         isColorVisible: true,
                    //         dividerColor: Colors.red,
                    //         height: AppSize.s250,
                    //         child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.end,
                    //                 children: [
                    //                   Column(
                    //                     children: [
                    //                       Flexible(
                    //                           child: SchedularTextField(
                    //                             controller: possibleDiagnosisController,
                    //                             labelText: 'Possible Diagnosis',
                    //
                    //                           )),
                    //                       SizedBox(height: AppSize.s14,),
                    //                       Flexible(
                    //                           child: SchedularTextField(
                    //                             controller: icdCodeController,
                    //                             labelText: 'ICD Code',
                    //
                    //                           )),
                    //                       SizedBox(height: AppSize.s14,),
                    //                       Flexible(
                    //                           child: SchedularTextField(
                    //                             controller: pDGMAcceptController,
                    //                             labelText: 'PDGM - Acceptable',
                    //
                    //                           )),
                    //                       SizedBox(height: AppSize.s14,),
                    //                       Flexible(
                    //                           child: SizedBox()),
                    //
                    //                     ],
                    //                   ),
                    //
                    //                   // CheckboxTile(
                    //                   //   title: 'No Emergency Contact',
                    //                   //   initialValue: noEmergencyData,
                    //                   //   onChanged: (value) {
                    //                   //
                    //                   //   },
                    //                   // )
                    //                 ],
                    //               ),
                    //       );
                    //     }
                    //   ),
                    // ),
                    SizedBox(height: AppSize.s16),
                    CustomIconButtonConst(
                        width: 150,
                        text: 'Add Diagnosis',
                        icon: Icons.add,
                        onPressed: () {

                        }),
                  ],
                ),
              ),
              SizedBox(height: AppSize.s40),
              BlueBGHeadConst(HeadText: "Special Orders"),
              IntakeFlowContainerConst(
                height: AppSize.s200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'Dementia',
                            initialValue: isDementia,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'Catheter Care',
                            initialValue: isCatheterCare,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          )

                        ]
                    ),
                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'Wound Care',
                            initialValue: isWoundCare,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'Zen Med',
                            initialValue: isZenMed,
                            onChanged: (value) {

                            },
                          )

                        ]
                    ),

                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'Ortho Patient',
                            initialValue: isOrthoPatient,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'PT/INR',
                            initialValue: isPtInr,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          )

                        ]
                    ),
                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'Labs Ordered',
                            initialValue: isLabsOrder,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'Infusion/IV',
                            initialValue: isInfusionIv,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          )

                        ]
                    ),
                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'Ostomy Care',
                            initialValue: isOstomyCare,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'Rehospitalization Risk',
                            initialValue: isRehospicRisk,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          )

                        ]
                    ),
                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
                          CheckboxTile(
                            title: 'ECH',
                            initialValue: isEch,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          ),
                          CheckboxTile(
                            title: 'ECH SNF',
                            initialValue: isEchSnf,
                            isInfoIconVisible: true,
                            onChanged: (value) {

                            },
                          )

                        ]
                    )
                  ],
                ),
              ),
              SizedBox(height: AppSize.s40),
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
      );

  }
}
