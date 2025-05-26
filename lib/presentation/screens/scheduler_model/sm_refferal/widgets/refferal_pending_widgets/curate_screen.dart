import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../em_module/widgets/text_form_field_const.dart';

class CurateScreen extends StatefulWidget {
  final VoidCallback onCurateBackPressed;
  //final VoidCallback onCurateScreenPressed;
  const CurateScreen({super.key, required this.onCurateBackPressed,
  //  required this.onCurateScreenPressed,
  });

  @override
  State<CurateScreen> createState() => _CurateScreenState();
}

class _CurateScreenState extends State<CurateScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController patientsController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController referred = TextEditingController();
  TextEditingController pcp = TextEditingController();
  TextEditingController referralSource = TextEditingController();
  TextEditingController marketer = TextEditingController();
  TextEditingController insurance = TextEditingController();
  TextEditingController secInsurance = TextEditingController();
  bool firstNameChecked = false;
  bool lastNameChecked = false;
  bool patientsChecked = false;
  bool zipCodeChecked = false;
  bool referredChecked = false;
  bool insuranceChecked = false;
  bool confirmInsChecked = false;
  bool secInsChecked = false;
  bool suggestClinicianChecked = false;
  bool suggestTreatmentChecked = false;
  bool primDiagnoChecked = false;
  bool secDiagnoChecked = false;
  bool docChecked = false;
  String selectedType = "Insurance";
  bool isChecked = false;
  List<String> desciplineModel = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 10),
      child:  ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: widget.onCurateBackPressed,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: IconSize.I16,
                        color: ColorManager.mediumgrey,
                      ),
                    ),
                    Text(
                      "Go back",
                      style: CustomTextStylesCommon.commonStyle(
                        color: ColorManager.mediumgrey,
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Curate E-Fax",
                    style: CustomTextStylesCommon.commonStyle(
                      color: ColorManager.bluebottom,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 14,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade300,
                                width: 3,
                              ),
                              left: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                // bottomLeft: Radius.circular(12),
                                //bottomRight: Radius.circular(12),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              border: const Border(
                                  top: BorderSide(color: Color(0xFF1696C8),width: 3)
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Container()),
                                /// Name & Sync
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "John S",
                                          textAlign: TextAlign.end,
                                          style: CustomTextStylesCommon.commonStyle(
                                            fontSize: FontSize.s14,
                                            fontWeight: FontWeight.w800,
                                            color: ColorManager.black,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          " Sync 05/08/2024  | 6:35 PM",
                                          style: DocDefineTableDataID.customTextStyle(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                /// Referral Date
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.end,
                                          "Referral Date: ",
                                          style: DocDefineTableDataID.customTextStyle(context),
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Expanded(
                                        child: Text(
                                          "4/30/2025",
                                          style: DocDefineTableData.customTextStyle(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// Contact Number
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Contact Number: ",
                                          textAlign: TextAlign.end,
                                          style: DocDefineTableDataID.customTextStyle(context),
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Expanded(
                                        child: Text(
                                          "+44 47962124531",
                                          style: DocDefineTableData.customTextStyle(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(child: Container()),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   height: 100,
                        //   decoration:BoxDecoration(
                        //     color: ColorManager.white,
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(8),
                        //       topRight: Radius.circular(8),
                        //       bottomRight: Radius.circular(8),
                        //       bottomLeft: Radius.circular(8),
                        //     ),
                        //     border: Border(
                        //       top: BorderSide(
                        //         color: ColorManager.bluebottom,
                        //         width: 3,
                        //       ),
                        //       left: BorderSide.none,
                        //     ),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(0.6),
                        //         spreadRadius: 1,
                        //         blurRadius: 4,
                        //         offset: const Offset(0, 2),
                        //       ),
                        //       // BoxShadow(
                        //       //   color: Colors.black.withOpacity(0.25), // Equivalent to #00000040
                        //       //   offset: Offset(0, 1.2), // X: 0px, Y: 1.2px
                        //       //   blurRadius: 4, // Blur radius: 4px
                        //       //   spreadRadius: 0, // Spread radius: 0px
                        //       // ),
                        //     ],
                        //   ),
                        //   child: Row(children: [
                        //     Expanded(
                        //         flex: 2,child: Container()),
                        //     Expanded(
                        //         flex: 10,
                        //         child: Container(//color: Colors.red,
                        //         child: Expanded(
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //             Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text(
                        //                       "John S",
                        //                       textAlign: TextAlign.center,
                        //                       style: CustomTextStylesCommon.commonStyle(
                        //                         fontSize: FontSize.s14,
                        //                         fontWeight: FontWeight.w800,
                        //                         color: ColorManager.black,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ),
                        //                 SizedBox(
                        //                   width: 30,
                        //                 ),
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text("Sync 05/08/2024  | 6:35 PM",
                        //                         textAlign: TextAlign.center,
                        //                         style: DocDefineTableDataID.customTextStyle(context)),
                        //                   ),
                        //                 ),
                        //
                        //               ],
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text("Referral Date: ",
                        //                         style: DocDefineTableDataID
                        //                             .customTextStyle(context)),
                        //                   ),
                        //                 ),
                        //                 SizedBox(
                        //                   width: 30,
                        //                 ),
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text(
                        //                       "09/15/2024",
                        //                       style: DocDefineTableData
                        //                           .customTextStyle(context),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Row(
                        //               children: [
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text("Contact Number: ",
                        //                         style: DocDefineTableDataID
                        //                             .customTextStyle(context)),
                        //                   ),
                        //                 ),
                        //                 SizedBox(
                        //                   width: 30,
                        //                 ),
                        //                 Expanded(
                        //                   child: Container(
                        //                     child: Text(
                        //                       "+44 47962124531",
                        //                       style: DocDefineTableData
                        //                           .customTextStyle(context),
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],),
                        //         ),)),
                        //     Expanded(flex: 2,child: Container()),
                        //   ],),
                        // ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Opacity(
                                  opacity: 0.6,
                                  child: IgnorePointer(
                                    child: Container(
                                      child: Column(children: [
                                        BlueBGHeadConst(HeadText: "Patient Information"),
                                        Container(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              SMTextFConst(
                                                controller: firstNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "First Name",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConst(
                                                controller: lastNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Last Name",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConstPhone(
                                                controller: patientsController,
                                                keyboardType: TextInputType.number,
                                                text:
                                                "Patient or Caregiver Phone Number",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConst(
                                                onlyAllowNumbers: true,
                                                isAsteric: false,
                                                controller: zipCodeController,
                                                keyboardType: TextInputType.text,
                                                text: "Zip Code",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConstPhone(
                                                controller: pcp,
                                                keyboardType: TextInputType.number,
                                                text:
                                                "PCP",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConst(
                                                controller: referred,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Referred for",
                                              ),
                                              SizedBox(height: 15),

                                              SMTextFConstPhone(
                                                controller: referralSource,
                                                keyboardType: TextInputType.number,
                                                text:
                                                "Referral Source",
                                              ),
                                              SizedBox(height: 15),
                                              SMTextFConstPhone(
                                                controller: marketer,
                                                keyboardType: TextInputType.number,
                                                text:
                                                "Marketer",
                                              ),
                                              Text(
                                                "Error",
                                                style: CustomTextStylesCommon.commonStyle(
                                                  fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.white,
                                                ),
                                              ),
                                              SizedBox(height: 25),
                                    
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        BlueBGHeadConst(HeadText: "Insurance"),
                                        Container(
                                          padding: EdgeInsets.only(left: 25, top: 15),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomRadioListTileSM(
                                                style: CustomTextStylesCommon.commonStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: FontSize.s13,
                                                  color: ColorManager.bluebottom,
                                                ),
                                                value: 'Insurance',
                                                groupValue: selectedType,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedType = value!;
                                                  });
                                                },
                                                title: 'Insurance',
                                              ),
                                              SMTextFConst(
                                                controller: insurance,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Insurance Number",
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SMCheckbox(
                                                    value: confirmInsChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        confirmInsChecked = value!;
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: AppSize.s5,
                                                  ),
                                                  Text(
                                                    "Do you have secondary Insurance ? ",
                                                    style: DocDefineTableDataID
                                                        .customTextStyle(context),
                                                  )
                                                ],
                                              ),
                                    
                                              SizedBox(
                                                height: 90,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        BlueBGHeadConst(HeadText: "Suggested Plan Of Care"),
                                        Container(
                                          padding: EdgeInsets.only(left: 25, top: 19,bottom: 30),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SMTextFConst(
                                                controller: firstNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Clinician",
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              SMTextFConst(
                                                controller: firstNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Clinician",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 28,
                                        ),
                                        BlueBGHeadConst(HeadText: "Diagnosis"),
                                        Container(
                                          padding: EdgeInsets.only(left: 25, top: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SMTextFConst(
                                                controller: firstNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Primary Diagnosis",
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              SMTextFConst(
                                                controller: firstNameController,
                                                isAsteric: false,
                                                keyboardType: TextInputType.text,
                                                text: "Secondary Diagnosis",
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ]),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: 50,
                            ),
                            ///column 2
                            Expanded(
                                child: Container(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    BlueBGHeadConst(HeadText: "Patient Information"),
                                    Container(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          SMTextFConst(
                                            controller: firstNameController,
                                            isAsteric: false,
                                            keyboardType: TextInputType.text,
                                            text: "First Name",
                                          ),
                                          SizedBox(height: 15),
                                          SMTextFConst(
                                            controller: lastNameController,
                                            isAsteric: false,
                                            keyboardType: TextInputType.text,
                                            text: "Last Name",
                                          ),
                                          SizedBox(height: 15),
                                          SMTextFConstPhone(
                                            controller: patientsController,
                                            keyboardType: TextInputType.number,
                                            text:
                                            "Patient or Caregiver Phone Number",
                                          ),
                                          SizedBox(height: 15),
                                          SMTextFConst(
                                            onlyAllowNumbers: true,
                                            isAsteric: false,
                                            controller: zipCodeController,
                                            keyboardType: TextInputType.text,
                                            text: "Zip Code",
                                          ),
                                          SizedBox(height: 15),
                                          SMTextFConstPhone(
                                            controller: pcp,
                                            keyboardType: TextInputType.number,
                                            text:
                                            "PCP",
                                          ),
                                          SizedBox(height: 15),
                                          SMTextFConst(
                                            controller: referred,
                                            isAsteric: false,
                                            keyboardType: TextInputType.text,
                                            text: "Referred for",
                                          ),
                                          SizedBox(height: 18),
                                          CustomDropdownTextFieldsm(
                                              width: AppSize.s354,
                                              isIconVisible: false,
                                              headText: "Referral Source"),
                                          SizedBox(height: 25),
                                          CustomDropdownTextFieldsm(
                                              width: AppSize.s354,
                                              isIconVisible: false,
                                              headText: "Marketer"),
                                          Text(
                                            "Error",
                                            style: CustomTextStylesCommon.commonStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.red,
                                            ),
                                          ),

                                          // SMTextFConstPhone(
                                          //   controller: marketer,
                                          //   keyboardType: TextInputType.number,
                                          //   text:
                                          //   "Marketer",
                                          // ),
                                          SizedBox(height: 30),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    BlueBGHeadConst(HeadText: "Insurance"),
                                    Container(
                                      padding: EdgeInsets.only(left: 25, top: 15),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomRadioListTileSM(
                                            style: CustomTextStylesCommon.commonStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: FontSize.s13,
                                              color: ColorManager.bluebottom,
                                            ),
                                            value: 'Insurance',
                                            groupValue: selectedType,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedType = value!;
                                              });
                                            },
                                            title: 'Insurance',
                                          ),
                                          SMTextFConst(
                                            controller: insurance,
                                            isAsteric: false,
                                            keyboardType: TextInputType.text,
                                            text: "Insurance Number",
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          StatefulBuilder(
                                            builder: (BuildContext context, void Function(void Function()) setState) {return  Row(
                                              children: [
                                                SMCheckbox(
                                                  value: confirmInsChecked,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      confirmInsChecked = value!;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: AppSize.s5,
                                                ),
                                                Text(
                                                  "Do you have secondary Insurance ? ",
                                                  style: DocDefineTableDataID
                                                      .customTextStyle(context),
                                                )
                                              ],
                                            );  },

                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Opacity(
                                            opacity: 0.6,
                                            child: SMTextFConst(
                                              controller: secInsurance,
                                              isAsteric: false,
                                              keyboardType: TextInputType.text,
                                              text: "Secondary Insurance Number",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    BlueBGHeadConst(HeadText: "Suggested Plan Of Care"),
                                    Container(
                                      padding: EdgeInsets.only(left: 25, top: 25,bottom: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 354,
                                           // height: 30,
                                            child: FutureBuilder<List<EmployeeClinicalData>>(
                                              future: getEmployeeClinicalInReffreals(context: context),
                                              builder: (context, snapshotEmp) {
                                                if (snapshotEmp.connectionState == ConnectionState.waiting) {
                                                  return Center(
                                                    child: CircularProgressIndicator(color: ColorManager.blueprime),
                                                  );
                                                }

                                                if (snapshotEmp.hasData) {
                                                  // Create the dropdown items list
                                                  List<DropdownMenuItem<String>> dropDownList = snapshotEmp.data!
                                                      .map((e) => DropdownMenuItem<String>(
                                                    child: Text(e.empType ?? ''),
                                                    value: e.empType,
                                                  ))
                                                      .toList();

                                                  return CustomDropdownTextFieldsm(
                                                    isIconVisible: false,
                                                    headText: 'Clinician',
                                                    initialValue: desciplineModel.isNotEmpty ? desciplineModel.last : null,
                                                    dropDownMenuList: dropDownList,
                                                    // onChanged: (newValue) {
                                                    //   final selected = snapshotEmp.data!.firstWhere((e) => e.empType == newValue);
                                                    //
                                                    //   // Clear previous selection if single-select dropdown
                                                    //   desciplineModel.clear();
                                                    //   desciplineintList.clear();
                                                    //
                                                    //   desciplineModel.add(selected.empType ?? '');
                                                    //   desciplineintList.add(selected.emptypeId ?? 0);
                                                    //
                                                    //   updateReferralPatient(
                                                    //     context: context,
                                                    //     patientId: providerAddState.patientId,
                                                    //     isUpdatePatiendData: true,
                                                    //     firstName: firstNameController.text,
                                                    //     lastName: lastNameController.text,
                                                    //     contactNo: patientsController.text,
                                                    //     summary: patientsSummary.text,
                                                    //     zipCode: zipCodeController.text,
                                                    //     serviceId: snapshot.data?.fkSrvId ?? 0,
                                                    //     disciplineIds: desciplineintList,
                                                    //     insuranceId: patientInsuranceId,
                                                    //   );
                                                    // },
                                                  );
                                                } else {
                                                  return const SizedBox();
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            width: 354,
                                            //height: 30,
                                            child: FutureBuilder<List<EmployeeClinicalData>>(
                                              future: getEmployeeClinicalInReffreals(context: context),
                                              builder: (context, snapshotEmp) {
                                                if (snapshotEmp.connectionState == ConnectionState.waiting) {
                                                  return Center(
                                                    child: CircularProgressIndicator(color: ColorManager.blueprime),
                                                  );
                                                }

                                                if (snapshotEmp.hasData) {
                                                  // Create the dropdown items list
                                                  List<DropdownMenuItem<String>> dropDownList = snapshotEmp.data!
                                                      .map((e) => DropdownMenuItem<String>(
                                                    child: Text(e.empType ?? ''),
                                                    value: e.empType,
                                                  ))
                                                      .toList();

                                                  return CustomDropdownTextFieldsm(
                                                    isIconVisible: false,
                                                    headText: 'Clinician',
                                                    initialValue: desciplineModel.isNotEmpty ? desciplineModel.last : null,
                                                    dropDownMenuList: dropDownList,
                                                    // onChanged: (newValue) {
                                                    //   final selected = snapshotEmp.data!.firstWhere((e) => e.empType == newValue);
                                                    //
                                                    //   // Clear previous selection if single-select dropdown
                                                    //   desciplineModel.clear();
                                                    //   desciplineintList.clear();
                                                    //
                                                    //   desciplineModel.add(selected.empType ?? '');
                                                    //   desciplineintList.add(selected.emptypeId ?? 0);
                                                    //
                                                    //   updateReferralPatient(
                                                    //     context: context,
                                                    //     patientId: providerAddState.patientId,
                                                    //     isUpdatePatiendData: true,
                                                    //     firstName: firstNameController.text,
                                                    //     lastName: lastNameController.text,
                                                    //     contactNo: patientsController.text,
                                                    //     summary: patientsSummary.text,
                                                    //     zipCode: zipCodeController.text,
                                                    //     serviceId: snapshot.data?.fkSrvId ?? 0,
                                                    //     disciplineIds: desciplineintList,
                                                    //     insuranceId: patientInsuranceId,
                                                    //   );
                                                    // },
                                                  );
                                                } else {
                                                  return const SizedBox();
                                                }
                                              },
                                            ),
                                          ),
                                          // CustomDropdownTextFieldsm(
                                          //     width: AppSize.s354,
                                          //     isIconVisible: false,
                                          //     headText: "Clinician"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    BlueBGHeadConst(HeadText: "Diagnosis"),
                                    Container(
                                      padding: EdgeInsets.only(left: 25, top: 25),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomDropdownTextFieldsm(
                                              width: AppSize.s354,
                                              isIconVisible: false,
                                              headText: "Primary Diagnosis"),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CustomDropdownTextFieldsm(
                                              width: AppSize.s354,
                                              isIconVisible: false,
                                              headText: "Secondary Diagnosis"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ]),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: ColorManager.bluebottom,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TransparentButtonTextConst.customTextStyle(
                            context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomElevatedButton(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    text: "Submit",
                    color: ColorManager.bluebottom,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
