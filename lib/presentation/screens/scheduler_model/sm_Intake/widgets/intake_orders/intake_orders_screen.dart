import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_flow_contgainer_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/textfield_dropdown_constant/schedular_textfield_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/constants/app_config.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../widgets/constant_widgets/schedular_success_popup.dart';


import 'package:flutter/material.dart';

class PriDiagnosisProvider with ChangeNotifier {
  final List<GlobalKey<PriDiagonsisState>> _priDiagonsisKeys = [
    GlobalKey<PriDiagonsisState>() // 👈 One default diagnosis form
  ];
  bool _isVisible = false;

  List<GlobalKey<PriDiagonsisState>> get referenceFormKeys => _priDiagonsisKeys;
  bool get isVisible => _isVisible;

  void addReferenceForm() {
    _priDiagonsisKeys.add(GlobalKey<PriDiagonsisState>());
    notifyListeners();
  }

  void removeReferenceForm(GlobalKey<PriDiagonsisState> key) {
    _priDiagonsisKeys.remove(key);
    notifyListeners();
  }

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}






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

    String? selectedMarketer =" ";
    String? selectedSource =" ";
    TextEditingController residencyController = TextEditingController();


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
      Consumer<SmIntakeProviderManager>(
          builder: (context, providerState, child) {
            final priDiagnosisProvider = Provider.of<PriDiagnosisProvider>(context);
            return Padding(
             padding: const EdgeInsets.only(top: 5),
             child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10,right: 35,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Review and confirm the data pulled is correct',
                            style: SMItalicTextConst.customTextStyle(context))
                      ],
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Order Details"),
                  ),
                  IntakeFlowContainerConst(
                    height: AppSize.s370,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SchedularTextField(
                                    width:providerState.isContactTrue ? AppSize.s200 :AppSize.s300,
                                    controller: receivedDateController,
                                    labelText: 'Date Received',
                                    enable: false,
                                    showDatePicker:true,
                                  ),
                                  const SizedBox(height: AppSize.s14,),

                                     SchedularTextField(
                                      width:providerState.isContactTrue ? AppSize.s200 :AppSize.s300,
                                      controller: orderDateController,
                                      labelText: 'Order Date',
                                       enable: false,
                                      showDatePicker:true,
                                    ),

                                  const SizedBox(height: AppSize.s14,),
                                  SizedBox(
                                    width: 210,
                                    child: ExpCheckboxTile(
                                      title: 'Orders Signed and Date',
                                      initialValue: ordersSignAndDate,
                                      isInfoIconVisible: true,
                                      onChanged: (value) {

                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: providerState.isContactTrue ? 0 : 7),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Disciplines',
                                            style: AllPopupHeadings.customTextStyle(context),
                                          ),
                                          const SizedBox(width: 10),
                                          SvgPicture.asset(
                                            'images/sm/sm_refferal/i_circle.svg',
                                            height: 20,
                                            width: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: providerState.isContactTrue ? AppSize.s150 : AppSize.s200,
                                      width: providerState.isContactTrue ? AppSize.s350 : AppSize.s480,
                                      child: SingleChildScrollView(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            /// Column 1
                                            Expanded(
                                              flex: providerState.isContactTrue ? 4 : 3,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  ExpCheckboxTile(
                                                    title: 'Nursing',
                                                    initialValue: isNursing,
                                                    onChanged: (value) {},
                                                  ),
                                                  ExpCheckboxTile(
                                                    title: 'Physical Therapy',
                                                    initialValue: isPhysicalThe,
                                                    onChanged: (value) {},
                                                  ),
                                                  ExpCheckboxTile(
                                                    title: providerState.isContactTrue
                                                        ? 'Speech Therapy'
                                                        : 'Home Health Aide',
                                                    initialValue: providerState.isContactTrue
                                                        ? isOccupationalThe
                                                        : isSpeechThe,
                                                    onChanged: (value) {},
                                                  ),
                                                  if (providerState.isContactTrue)
                                                    CheckboxTile(
                                                      title: 'Dietician',
                                                      initialValue: isMedicalSocialThe,
                                                      onChanged: (value) {},
                                                    ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(width: providerState.isContactTrue ? 3 : 8),

                                            /// Column 2
                                            Expanded(
                                              flex: providerState.isContactTrue ? 5 : 4,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  ExpCheckboxTile(
                                                    title: providerState.isContactTrue
                                                        ? 'Home Health Aide'
                                                        : 'Speech Therapy',
                                                    initialValue: providerState.isContactTrue
                                                        ? isSpeechThe
                                                        : isOccupationalThe,
                                                    onChanged: (value) {},
                                                  ),
                                                  ExpCheckboxTile(
                                                    title: 'Medical Social Services',
                                                    initialValue: isSpeechThe,
                                                    onChanged: (value) {},
                                                  ),
                                                  ExpCheckboxTile(
                                                    title: 'Occupational Therapy',
                                                    initialValue: isPhysicalThe,
                                                    onChanged: (value) {},
                                                  ),
                                                  if (providerState.isContactTrue)
                                                    const SizedBox(height: 30),
                                                ],
                                              ),
                                            ),

                                            /// Column 3 (only when isContactTrue == false)
                                            if (!providerState.isContactTrue)
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    ExpCheckboxTile(
                                                      title: 'Dietician',
                                                      initialValue: isMedicalSocialThe,
                                                      onChanged: (value) {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

///
                            ///
                            // Expanded(
                            //   flex: 2,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(left: 100),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Padding(
                            //           padding: EdgeInsets.only(left: providerState.isContactTrue ? 0 :7),
                            //           child: Row(
                            //            // mainAxisAlignment: MainAxisAlignment.start,
                            //             spacing: 5,
                            //             children: [
                            //               Text('Disciplines',style:
                            //              // providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                            //               AllPopupHeadings.customTextStyle(context),),
                            //               const SizedBox(width: AppSize.s10,),
                            //               SvgPicture.asset(
                            //                 'images/sm/sm_refferal/i_circle.svg',
                            //                 height: IconSize.I20,
                            //                 width: IconSize.I20,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //         const SizedBox(height: 10),
                            //         Container(
                            //           height:providerState.isContactTrue ? AppSize.s150 :AppSize.s100,
                            //           width:providerState.isContactTrue ? AppSize.s350 :AppSize.s480,
                            //           child: Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: providerState.isContactTrue ? 4: 3,
                            //                 child: Container(
                            //                   child: Column(
                            //                     //alignment: WrapAlignment.start,
                            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                     // spacing: 10,
                            //                     // runSpacing: 5,
                            //                     children: [
                            //                       CheckboxTile(
                            //                         title: 'Nursing',
                            //                         initialValue: isNursing,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Physical\nTherapy' :
                            //                         'Physical Therapy',
                            //                         initialValue: isPhysicalThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ?
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Speech\nTherapy' :
                            //                         'Speech Therapy',
                            //                         initialValue: isOccupationalThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       )
                            //                       : CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Home Health\nAide' :
                            //                         'Home Health Aide',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ? CheckboxTile(
                            //                         title: 'Dietician',
                            //                         initialValue: isMedicalSocialThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ): const Offstage()
                            //
                            //
                            //
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //               SizedBox(width:providerState.isContactTrue ?  3 : 8 ,),
                            //               Expanded(
                            //                 flex: providerState.isContactTrue ? 5: 4,
                            //                 child: Container(
                            //                   child: Column(
                            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                     children: [
                            //                       providerState.isContactTrue ?
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Home Health\nAide' :
                            //                         'Home Health Aide',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ) : CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Speech\nTherapy' :
                            //                         'Speech Therapy',
                            //                         initialValue: isOccupationalThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: // providerState.isContactTrue ?'Medical Social\nServices' :
                            //                         'Medical Social Services',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: // providerState.isContactTrue ?'Occupational\nTherapy' :
                            //                         'Occupational Therapy',
                            //                         initialValue: isPhysicalThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ? Container(height: 30,): const Offstage()
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //               providerState.isContactTrue ? const Offstage() : Expanded(
                            //                 flex: 2,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.start,
                            //                   children: [
                            //                     CheckboxTile(
                            //                       title: 'Dietician',
                            //                       initialValue: isMedicalSocialThe,
                            //                       onChanged: (value) {
                            //                       },
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder<List<PatientMarketerData>>(
                                    future: getMarketerWithDeptId(context: context, deptId: AppConfig.salesId),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {

                                        // return  Container(
                                        //   width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                        //   padding: const EdgeInsets.only(bottom: 3, top: 4, left: AppPadding.p10,right: AppPadding.p7),
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(color: Colors.grey),
                                        //     borderRadius: BorderRadius.circular(8),
                                        //   ),
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text(
                                        //         "",
                                        //         style: DropdownItemStyle.customTextStyle(context),// TableSubHeading.customTextStyle(context),//DocumentTypeDataStyle.customTextStyle(context),
                                        //       ),
                                        //       Icon(Icons.arrow_drop_down_sharp, color: ColorManager.blueprime,),
                                        //     ],
                                        //   ),
                                        // );
                                        return SchedularTextField(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            controller:residencyController ,
                                            labelText: 'Marketer');
                                      }
                                      if (snapshot.hasData) {
                                        List<DropdownMenuItem<String>> dropDownList = [];
                                        for (var i in snapshot.data!) {
                                          dropDownList.add(DropdownMenuItem<String>(
                                            child: Text(i.firstName),
                                            value: i.firstName,
                                          ));
                                        }

                                        return CustomDropdownTextFieldsm(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            headText: 'Marketer',
                                            dropDownMenuList: dropDownList,
                                            onChanged: (newValue) {
                                              for (var a in snapshot.data!) {
                                                if (a.firstName == newValue) {
                                                  selectedMarketer = a.firstName;
                                                  // _checkFormValidity();
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
                                  // CustomDropdownTextFieldsm(
                                  //   width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                  //   isIconVisible: false,
                                  //   headText: 'Marketer',
                                  //   onChanged: (newValue) {
                                  //   },),
                                  const SizedBox(height: AppSize.s14,),
                                  FutureBuilder<List<ReferralSourcesData>>(
                                    future: getReferalSourceDD(context: context,),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {

                                        // return  Container(
                                        //   width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                        //   padding: const EdgeInsets.only(bottom: 3, top: 4, left: AppPadding.p10,right: AppPadding.p7),
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(color: Colors.grey),
                                        //     borderRadius: BorderRadius.circular(8),
                                        //   ),
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text(
                                        //         "",
                                        //         style: DropdownItemStyle.customTextStyle(context),// TableSubHeading.customTextStyle(context),//DocumentTypeDataStyle.customTextStyle(context),
                                        //       ),
                                        //       Icon(Icons.arrow_drop_down_sharp, color: ColorManager.blueprime,),
                                        //     ],
                                        //   ),
                                        // );
                                        return SchedularTextField(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            controller:residencyController ,
                                            labelText: 'Referral Source');
                                      }
                                      if (snapshot.hasData) {
                                        List<DropdownMenuItem<String>> dropDownList = [];
                                        for (var i in snapshot.data!) {
                                          dropDownList.add(DropdownMenuItem<String>(
                                            child: Text(i.sourcename),
                                            value: i.sourcename,
                                          ));
                                        }

                                        return CustomDropdownTextFieldsm(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            headText: 'Referral Source',
                                            dropDownMenuList: dropDownList,
                                            onChanged: (newValue) {
                                              for (var a in snapshot.data!) {
                                                if (a.sourcename == newValue) {
                                                  selectedSource = a.sourcename;
                                                  // _checkFormValidity();
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

                                  // CustomDropdownTextFieldsm(
                                  //   width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                  //   headText: 'Referral Source',
                                  //   onChanged: (newValue) {
                                  //
                                  //   },),
                                  const SizedBox(height: AppSize.s14,),
                                  SchedularTextField(
                                    width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                    controller: caseManagerController,
                                    labelText: 'Case Manager',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 15,
                          children: [
                            Padding(
                              padding:const EdgeInsets.symmetric(vertical: 13),
                                child: Text('Tracking Notes',style:
                                //providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                                SMTextfieldHeadings.customTextStyle(context)
                                  //AllPopupHeadings.customTextStyle(context)
                                )),
                            const SizedBox(width: AppSize.s10,),
                            SchedularTextField(
                              isIconVisible:true,

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
                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Primary Diagnosis"),
                  ),
                  Column(
                    children: [


                      Column(
                        children: priDiagnosisProvider.referenceFormKeys.asMap().entries.map((entry) {
                          int index = entry.key;
                          GlobalKey<PriDiagonsisState> key = entry.value;

                          return PriDiagonsis(
                            key: key,
                            index: index + 1,
                            onRemove: () => priDiagnosisProvider.removeReferenceForm(key),
                            isVisible: priDiagnosisProvider.isVisible,
                          );
                        }).toList(), // ✅ Convert to list, and no need for spread operator
                      ),

                      // Container(
                      //   child:  ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 4, // Adjust as needed
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding:  EdgeInsets.symmetric(horizontal: AppPadding.p35,vertical: 20),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Container(height: 90,width: 5,color: ColorManager.greenDark,),
                      //                 const SizedBox(width: AppSize.s30,),
                      //                 Expanded(
                      //                   child: SchedularTextField(
                      //                     controller: possibleDiagnosisController,
                      //                     labelText: 'Possible Diagnosis',
                      //                     enable: false,
                      //                   )
                      //                 ),
                      //                 const SizedBox(width: AppSize.s60,),
                      //                 Expanded(
                      //                   child: SchedularTextField(
                      //                     controller: icdCodeController,
                      //                     labelText: 'ICD Code',
                      //                     enable: false,
                      //
                      //                   )
                      //                 ),
                      //                 const SizedBox(width: AppSize.s60,),
                      //                 Expanded(
                      //                   child: SchedularTextField(
                      //                     isIconVisible: true,
                      //                     enable: false,
                      //                     controller: pDGMAcceptController,
                      //                     labelText: 'PDGM - Acceptable',
                      //                   ),
                      //                 ),
                      //                 const SizedBox(width: AppSize.s30,),
                      //              providerState.isContactTrue ? const Offstage() :  Expanded(
                      //                   child: Container(
                      //                     height: 30,
                      //                     width: AppSize.s354,
                      //                   ),
                      //                 ),
                      //                 providerState.isContactTrue ? const Offstage() :  const SizedBox(width: AppSize.s30,),
                      //                 providerState.isContactTrue?const SizedBox()  :Expanded(
                      //                   child: Container(
                      //                     height: 30,
                      //                     width: AppSize.s354,
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //             const Divider(),
                      //             // Divider(
                      //             //   color: ColorManager.containerBorderGrey,
                      //             //   thickness: 1,
                      //             //   height: 1,
                      //             // ),
                      //             const SizedBox(height: AppSize.s15,),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      const SizedBox(height: AppSize.s16),
                      CustomIconButtonConst(
                          width: 150,
                          text: 'Add Diagnosis',
                          icon: Icons.add,
                          onPressed: () {
                            priDiagnosisProvider.addReferenceForm();
                          }),
                      const SizedBox(height: AppSize.s16),
                      const Divider()
                    ],
                  ),
                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Special Orders"),
                  ),
                  IntakeFlowContainerConst(
                    height: AppSize.s200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                              padding:const EdgeInsets.only(top: 20,),
                              child: Text('Flags',style:
                              //providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                              SMTextfieldHeadings.customTextStyle(context)
                                //AllPopupHeadings.customTextStyle(context)
                              )),
                        ],),
                        const SizedBox(height: 10,),
                      providerState.isContactTrue?  Row(
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
                                ),
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
                                ),
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
                                ),
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
                          ),
                        ],
                      ):

                      Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        children: [
                          SizedBox(
                            width: 180, // Adjust width as needed
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'Dementia',
                                  initialValue: isDementia,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'Catheter Care',
                                  initialValue: isCatheterCare,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'Wound Care',
                                  initialValue: isWoundCare,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'Zen Med',
                                  initialValue: isZenMed,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'Ortho Patient',
                                  initialValue: isOrthoPatient,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'PT/INR',
                                  initialValue: isPtInr,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'Labs Ordered',
                                  initialValue: isLabsOrder,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'Infusion/IV',
                                  initialValue: isInfusionIv,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'Ostomy Care',
                                  initialValue: isOstomyCare,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'Rehospitalization Risk',
                                  initialValue: isRehospicRisk,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpCheckboxTile(
                                  title: 'ECH',
                                  initialValue: isEch,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                ),
                                ExpCheckboxTile(
                                  title: 'ECH SNF',
                                  initialValue: isEchSnf,
                                  isInfoIconVisible: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                        ////
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'Dementia',
                        //             initialValue: isDementia,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'Catheter Care',
                        //             initialValue: isCatheterCare,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     ),
                        //     Column(
                        //         crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'Wound Care',
                        //             initialValue: isWoundCare,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'Zen Med',
                        //             initialValue: isZenMed,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     ),
                        //
                        //     Column(
                        //         crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'Ortho Patient',
                        //             initialValue: isOrthoPatient,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'PT/INR',
                        //             initialValue: isPtInr,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     ),
                        //     Column(
                        //         crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'Labs Ordered',
                        //             initialValue: isLabsOrder,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'Infusion/IV',
                        //             initialValue: isInfusionIv,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     ),
                        //     Column(
                        //         crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'Ostomy Care',
                        //             initialValue: isOstomyCare,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'Rehospitalization Risk',
                        //             initialValue: isRehospicRisk,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     ),
                        //     Column(
                        //         crossAxisAlignment:CrossAxisAlignment.start,
                        //         children:[
                        //           CheckboxTile(
                        //             title: 'ECH',
                        //             initialValue: isEch,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           ),
                        //           CheckboxTile(
                        //             title: 'ECH SNF',
                        //             initialValue: isEchSnf,
                        //             isInfoIconVisible: true,
                        //             onChanged: (value) {
                        //
                        //             },
                        //           )
                        //
                        //         ]
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s40),
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
       );

  }
}







class PriDiagonsis extends StatefulWidget {
  // final int diagosisID;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  const PriDiagonsis({super.key, required this.onRemove, required this.index, required this.isVisible});

  @override
  PriDiagonsisState createState() => PriDiagonsisState();
}

class PriDiagonsisState extends State<PriDiagonsis> {


  TextEditingController possibleDiagnosisController = TextEditingController();
  TextEditingController icdCodeController = TextEditingController();
  TextEditingController pDGMAcceptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final primDiagonsisProvider = Provider.of<SmIntakeProviderManager>(context, listen: false);

    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.p35,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(height: 90,width: 5,color: ColorManager.greenDark,),
                  const SizedBox(width: AppSize.s30,),
                  Expanded(
                      child: SchedularTextField(
                        controller: possibleDiagnosisController,
                        labelText: 'Possible Diagnosis',
                     //   enable: true,
                      )
                  ),
                  const SizedBox(width: AppSize.s60,),
                  Expanded(
                      child: SchedularTextField(
                        controller: icdCodeController,
                        labelText: 'ICD Code',
                       // enable: true,

                      )
                  ),
                  const SizedBox(width: AppSize.s60,),
                  Expanded(
                    child: SchedularTextField(
                      isIconVisible: true,
                     // enable: true,
                      controller: pDGMAcceptController,
                      labelText: 'PDGM - Acceptable',
                    ),
                  ),
                  const SizedBox(width: AppSize.s30,),
                  primDiagonsisProvider.isContactTrue ? const Offstage() :  Expanded(
                    child: Container(
                      height: 30,
                      width: AppSize.s354,
                    ),
                  ),
                  primDiagonsisProvider.isContactTrue ? const Offstage() :  const SizedBox(width: AppSize.s30,),
                  primDiagonsisProvider.isContactTrue?const SizedBox()  :Expanded(
                    child: Container(
                      height: 30,
                      width: AppSize.s354,
                    ),
                  )
                ],
              ),
              const Divider(),
              // Divider(
              //   color: ColorManager.containerBorderGrey,
              //   thickness: 1,
              //   height: 1,
              // ),
              const SizedBox(height: AppSize.s15,),
            ],
          ),
        )
      ],
    );
  }
}
