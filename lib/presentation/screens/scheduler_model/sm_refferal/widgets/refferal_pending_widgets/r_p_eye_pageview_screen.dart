import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../em_module/company_identity/widgets/manage_history_version.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../hr_module/onboarding/download_doc_const.dart';

class ReferalPendingEyePageview extends StatefulWidget {
  final VoidCallback onGoBackPressed;
  const ReferalPendingEyePageview({super.key, required this.onGoBackPressed});

  @override
  State<ReferalPendingEyePageview> createState() => _ReferalPendingEyePageviewState();
}

class _ReferalPendingEyePageviewState extends State<ReferalPendingEyePageview> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController patientsController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController(text: "1");
  String selectedType = "Insurance";
  bool isChecked = false;
  List<bool> isCheckedList = List.generate(5, (index) => false); // Initialize list with false
  String? selectedFileName;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['svg', 'png', 'jpg', 'gif'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }
  // @override
  // Widget build(BuildContext context) {
  //   return  Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
  //     child:  ScrollConfiguration(
  //   behavior: ScrollBehavior().copyWith(scrollbars: false),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Container(
  //               height: 120,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.white,
  //                 borderRadius: BorderRadius.circular(8),
  //                 border: Border(
  //                   top: BorderSide(
  //                     color: ColorManager.bluebottom,
  //                     width: 3,
  //                   ),
  //                 ),
  //                 // boxShadow: [
  //                 //   BoxShadow(
  //                 //     color: ColorManager.black.withOpacity(0.5),
  //                 //     offset: Offset(0, 4),
  //                 //     blurRadius: 4,
  //                 //     spreadRadius: 0,
  //                 //   ),
  //                 // ],
  //               ),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     flex:1,
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.all(20.0),
  //                           child: InkWell(
  //                               onTap: widget.onGoBackPressed,
  //                               child: Icon(
  //                                 Icons.arrow_back,
  //                                 size: IconSize.I16,
  //                                 color: ColorManager.mediumgrey,
  //
  //                               )),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                       flex:3,
  //                       child: Container(
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           children: [
  //                             ClipRRect(
  //                               borderRadius: BorderRadius.circular(60),
  //                               child: SizedBox(
  //                                 width: AppSize.s53,
  //                                 height: AppSize.s50,
  //                                 child: Image.asset(
  //                                   'images/1.png', // Replace with your image path
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                               ),
  //                             ),
  //                             Text(
  //                               "John smith",
  //                               textAlign: TextAlign.center,
  //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
  //                                 fontWeight: FontWeight.w700,
  //                                 color: ColorManager.black,),
  //                             ),
  //                             Text(
  //                               "C #1",
  //                               textAlign: TextAlign.center,
  //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: ColorManager.mediumgrey,),
  //                             ),
  //                             Text(
  //                               "Sync 05/08/2024  | 6:35 PM",
  //                               textAlign: TextAlign.center,
  //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                 fontWeight: FontWeight.w400,
  //                                 color: ColorManager.mediumgrey,),
  //                             ),
  //                           ],
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex:4,
  //                       child: Container(
  //                         child:  Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Expanded(
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Refferal Date: ",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
  //                                         fontWeight: FontWeight.w400,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   flex: 2,
  //                                   child: Container(
  //                                     child: Text(
  //                                       "9/15/2025",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                         fontWeight: FontWeight.w700,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Expanded(
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Primary Diagnosis: ",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
  //                                         fontWeight: FontWeight.w400,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   flex: 2,
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Migrain",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                         fontWeight: FontWeight.w700,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex:4,
  //                       child: Container(
  //                         child:  Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Expanded(
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Refferal Source: ",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
  //                                         fontWeight: FontWeight.w400,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   flex: 2,
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Sunshine Hospital",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                         fontWeight: FontWeight.w700,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Expanded(
  //                                   child: Container(
  //                                     child: Text(
  //                                       "PCP:  ",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
  //                                         fontWeight: FontWeight.w400,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   flex: 2,
  //                                   child: Container(
  //                                     child: Text(
  //                                       "Sam Johnson",
  //                                       textAlign: TextAlign.start,
  //                                       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                                         fontWeight: FontWeight.w700,
  //                                         color: ColorManager.mediumgrey,),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       )),
  //                   Expanded(
  //                       flex:3,
  //                       child: Container(child: Row(
  //                         children: [
  //                           Text("Marketer: ",style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                             fontWeight: FontWeight.w400,
  //                             color: ColorManager.mediumgrey,),),
  //                           SizedBox(width: AppSize.s25),
  //                           ClipRRect(
  //                             borderRadius: BorderRadius.circular(60),
  //                             child: SizedBox(
  //                               width: AppSize.s45,
  //                               height: AppSize.s50,
  //                               child: Image.asset(
  //                                 'images/1.png', // Replace with your image path
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(width: AppSize.s15),
  //                           Text(
  //                             "Sophia Scott",
  //                             textAlign: TextAlign.center,
  //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
  //                               fontWeight: FontWeight.w700,
  //                               color: ColorManager.mediumgrey,),
  //                           ),
  //                           SizedBox(width: AppSize.s7),
  //                           ],
  //                       ),)),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: AppSize.s10,),
  //             ///patients info
  //             Container(
  //               height: 32,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.SMFBlue,
  //               ),
  //               padding: EdgeInsets.only(left: 25, right: 60),
  //              // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Patients Information',
  //                     style:TextStyle(
  //                       fontSize: FontSize.s16,
  //                       fontWeight: FontWeight.w700,
  //                       color: ColorManager.mediumgrey,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_up_outlined,
  //                     size: IconSize.I24,
  //                     color: ColorManager.mediumgrey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: AppSize.s10,),
  //             Row(
  //               children: [
  //                 SizedBox(width: AppSize.s25,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "First Name"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: lastNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Last Name"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: patientsController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Patient or Caregiver Phone Number"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: zipCodeController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Zip Code"),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: AppSize.s10,),
  //             Row(
  //               children: [
  //                 SizedBox(width: AppSize.s25,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Reffered for"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: AppSize.s30,),
  //             ///insurance
  //             Container(
  //               height: 32,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.SMFBlue,
  //               ),
  //               padding: EdgeInsets.only(left: 25, right: 60),
  //              // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Insurance',
  //                     style:TextStyle(
  //                       fontSize: FontSize.s16,
  //                       fontWeight: FontWeight.w700,
  //                       color: ColorManager.mediumgrey,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_up_outlined,
  //                     size: IconSize.I24,
  //                     color: ColorManager.mediumgrey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 SizedBox(width: 10),
  //                 CustomRadioListTile(
  //                   value: 'Insurance',
  //                   groupValue: selectedType,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       selectedType = value!;
  //                     });
  //                   },
  //                   title: 'Insurance',
  //                 ),
  //                 CustomRadioListTile(
  //                   value: 'Self Pay',
  //                   groupValue: selectedType,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       selectedType = value!;
  //                     });
  //                   },
  //                   title: 'Self Pay',
  //                 ),
  //               ],
  //             ),
  //             Text(
  //               'Mark as Primary',
  //               style: AllPopupHeadings.customTextStyle(context),
  //             ),
  //             SizedBox(height: 10),
  //             Container(
  //               height: 400,
  //               child:  ScrollConfiguration(
  //                 behavior: ScrollBehavior().copyWith(scrollbars: false),
  //                 child: ListView.builder(
  //                   itemCount: 5, // Adjust as needed
  //                   itemBuilder: (context, index) {
  //                     return Column(
  //                       children: [
  //                         Row(mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Expanded(
  //                               child:  Checkbox(
  //                                 splashRadius: 0,
  //                                 checkColor: ColorManager.white,
  //                                 activeColor: ColorManager.bluebottom,
  //                                 side: BorderSide(color: ColorManager.bluebottom, width: 2),
  //                                 value: isCheckedList[index],
  //                                 onChanged: (bool? value) {
  //                                   setState(() {
  //                                     isCheckedList[index] = value!;
  //                                   });
  //                                 },
  //                               ),
  //                             ),
  //                             Expanded(
  //                               flex: 2,
  //                               child: SMTextFConst(
  //                                 controller: firstNameController,
  //                                 isAsteric: false,
  //                                 keyboardType: TextInputType.text,
  //                                 text: "Insurance ${index + 1}",
  //                               ),
  //                             ),
  //                             SizedBox(width: 10,),
  //                             Expanded(
  //                               flex: 3,
  //                               child: Column(
  //                                 mainAxisAlignment: MainAxisAlignment.start,
  //                                 children: [
  //                                 Row(
  //                                   children: [
  //                                     Expanded(
  //                                       flex:2,
  //                                       child: Container(
  //                                         child: Text("Insurance Provider:",
  //                                         style: AllPopupHeadings.customTextStyle(context),),
  //                                       ),
  //                                     ),
  //                                     Expanded(
  //                                       flex:2,
  //                                       child: Container(
  //                                         child: Text("Insurance Plan:",
  //                                           style: AllPopupHeadings.customTextStyle(context),),
  //                                       ),
  //                                     ),
  //                                     Expanded(
  //                                       child: Container(
  //                                         child: Text("Eligibility:",
  //                                           style: AllPopupHeadings.customTextStyle(context),),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     Expanded(
  //                                       flex:2,
  //                                       child: Container(
  //                                         child: Text("  Max Health Insurance",
  //                                         style: TextStyle(
  //                                           fontSize: FontSize.s12,
  //                                           fontWeight: FontWeight.w700,
  //                                           color: ColorManager.blueprime,
  //                                         ),),
  //                                       ),
  //                                     ),
  //                                     Expanded(
  //                                       flex: 2,
  //                                       child: Container(
  //                                         child: Text("  1220 MAX HEALTH GOLD\n PLAN",
  //                                           style: TextStyle(
  //                                             fontSize: FontSize.s12,
  //                                             fontWeight: FontWeight.w700,
  //                                             color: ColorManager.blueprime,
  //                                           ),),
  //                                       ),
  //                                     ),
  //                                     Expanded(
  //                                       child: Container(
  //                                         child: Text("  Eligible",
  //                                           style: TextStyle(
  //                                             fontSize: FontSize.s12,
  //                                             fontWeight: FontWeight.w700,
  //                                             color: ColorManager.greenDark,
  //                                           ),),
  //                                       ),
  //                                     )
  //                                   ],
  //                                 )
  //                               ],),
  //                             ),
  //                             Container(
  //                               width: 30,
  //                               height: 30,
  //                               decoration: BoxDecoration(
  //                                 color: ColorManager.greenDark,
  //                                 borderRadius: BorderRadius.circular(3),
  //                               ),
  //                               child: Center(
  //                                 child: Text("A",
  //                                  style: TextStyle(
  //                                    fontSize: FontSize.s16,
  //                                    fontWeight: FontWeight.w700,
  //                                    color: ColorManager.white,
  //                                  ),),
  //                               ),
  //                             ),
  //                             SizedBox(width: 30,),
  //                             Expanded(
  //                               child: Column(
  //                                 children: [
  //                                   CustomElevatedButton(
  //                                     width: AppSize.s130,
  //                                     height: AppSize.s30,
  //                                     text: "Check Eligibility",
  //                                     color:  ColorManager.blueprime,
  //                                     onPressed: (){},
  //                                   ),
  //                                   SizedBox(height: 5,),
  //                                   Text("Last checked at 8:30 AM",
  //                                     style: TextStyle(
  //                                       fontSize: FontSize.s12,
  //                                       fontWeight: FontWeight.w400,
  //                                       color: ColorManager.mediumgrey,
  //                                     ),),
  //                                 ],
  //                               ),
  //                             )
  //
  //                           ],
  //                         ),
  //                         Divider(
  //                           color: ColorManager.containerBorderGrey,
  //                           thickness: 1,
  //                           height: 30,
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //
  //           ],
  //         ),
  //             SizedBox(height: AppSize.s10,),
  //             ///diagnosis
  //             Container(
  //               height: 32,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.SMFBlue,
  //               ),
  //               padding: EdgeInsets.only(left: 25, right: 60),
  //              // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'diagnosis',
  //                     style:TextStyle(
  //                       fontSize: FontSize.s16,
  //                       fontWeight: FontWeight.w700,
  //                       color: ColorManager.mediumgrey,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_up_outlined,
  //                     size: IconSize.I24,
  //                     color: ColorManager.mediumgrey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: AppSize.s10,),
  //             Row(
  //               children: [
  //                 SizedBox(width: AppSize.s25,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Primary Diagnosis"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Secondary Diagnosis"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: AppSize.s40,),
  //             ///Suggested Plan of Care
  //             Container(
  //               height: 32,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.SMFBlue,
  //               ),
  //               padding: EdgeInsets.only(left: 25, right: 60),
  //              // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Suggested Plan of Care',
  //                     style:TextStyle(
  //                       fontSize: FontSize.s16,
  //                       fontWeight: FontWeight.w700,
  //                       color: ColorManager.mediumgrey,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_up_outlined,
  //                     size: IconSize.I24,
  //                     color: ColorManager.mediumgrey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: AppSize.s10,),
  //             Row(
  //               children: [
  //                 SizedBox(width: AppSize.s25,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Select Clinician"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: SMTextFConst(controller: firstNameController,
  //                       isAsteric: false,
  //                       keyboardType: TextInputType.text, text: "Select Suggested Treatments"),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //                 SizedBox(width: AppSize.s30,),
  //                 Expanded(
  //                   child: Container(
  //                     height: 30,
  //                     width: AppSize.s354,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(height: AppSize.s30,),
  //             ///documents
  //             Container(
  //               height: 32,
  //               decoration: BoxDecoration(
  //                 color: ColorManager.SMFBlue,
  //               ),
  //               padding: EdgeInsets.only(left: 25, right: 60),
  //               // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Documents',
  //                     style:TextStyle(
  //                       fontSize: FontSize.s16,
  //                       fontWeight: FontWeight.w700,
  //                       color: ColorManager.mediumgrey,
  //                     ),
  //                   ),
  //                   Icon(
  //                     Icons.arrow_drop_up_outlined,
  //                     size: IconSize.I24,
  //                     color: ColorManager.mediumgrey,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: AppSize.s30,),
  //             Text(
  //               'Upload Bulk Document',
  //               style:TextStyle(
  //                 fontSize: FontSize.s16,
  //                 fontWeight: FontWeight.w700,
  //                 color: ColorManager.mediumgrey,
  //               ),
  //             ),
  //             SizedBox(height: 8),
  //             DottedBorder(
  //               color: Color(0xFFDBDBDB),
  //               strokeWidth: 1,
  //               dashPattern: [6, 3],
  //               borderType: BorderType.RRect,
  //               radius: Radius.circular(12),
  //               borderPadding: EdgeInsets.symmetric(horizontal: 10),
  //               child: Container(
  //                 width: double.infinity,
  //                 height: 80,
  //                 alignment: Alignment.center,
  //                 child: InkWell(
  //                   hoverColor: Colors.transparent,
  //                   splashColor: Colors.transparent,
  //                   highlightColor: Colors.transparent,
  //                   onTap: _pickFile,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         height: 50,
  //                           width: 50,
  //                           decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(30),
  //                             color: Color(0xFFE6F1FE)
  //                      ),
  //                       child: Center(child: SvgPicture.asset('images/doc_vector.svg',height: 30,width: 30,))),
  //                       SizedBox(width: 30),
  //                       Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           RichText(
  //                             text: TextSpan(
  //                               text: "Drop your files here or ",
  //                               style: TextStyle(color: Colors.black),
  //                               children: [
  //                                 TextSpan(
  //                                   text: "Click to upload",
  //                                   style: TextStyle(color: ColorManager.blueBorder, fontWeight: FontWeight.bold),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(height: 10),
  //                           Text("SVG, PNG, JPG or GIF (max. 800x400px)",
  //                               style: TextStyle(color: Colors.grey, fontSize: 12)),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             if (selectedFileName != null)
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 8.0),
  //                 child: Text("Selected file: $selectedFileName",
  //                     style: TextStyle(color: Colors.green)),
  //               ),
  //             Column(
  //               children: [
  //                 Container(
  //                   height: 450,
  //                   child: ScrollConfiguration(
  //                     behavior: ScrollBehavior().copyWith(scrollbars: false),
  //                     child: ListView.builder(
  //                         scrollDirection: Axis.vertical,
  //                         itemCount: 2,//paginatedData.length,
  //                         itemBuilder: (context, index) {
  //                         //  int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
  //                          // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
  //                           var fileUrl = "url";//policiesdata.docurl;
  //                           final fileExtension = fileUrl.split('/').last;
  //
  //                           Widget fileWidget;
  //                           if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
  //                             fileWidget = Image.network(
  //                               fileUrl,
  //                               fit: BoxFit.cover,
  //                               errorBuilder: (context, error, stackTrace) {
  //                                 return Icon(
  //                                   Icons.broken_image,
  //                                   size: IconSize.I45,
  //                                   color: ColorManager.faintGrey,
  //                                 );
  //                               },
  //                             );
  //                           }
  //                           else if (['pdf', 'doc', 'docx'].contains(fileExtension)) {
  //                             fileWidget = Icon(
  //                               Icons.description,
  //                               size: IconSize.I45,
  //                               color: ColorManager.faintGrey,
  //                             );
  //                           }
  //                           else {
  //                             fileWidget = Icon(
  //                               Icons.insert_drive_file,
  //                               size: IconSize.I45,
  //                               color: ColorManager.faintGrey,
  //                             );
  //                           }
  //                           return Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               //SizedBox(height: 5),
  //                               Padding(
  //                                 padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p10),
  //                                 child: Container(
  //                                     margin: EdgeInsets.symmetric(horizontal: AppSize.s5),
  //                                     decoration: BoxDecoration(
  //                                       color: Colors.white,
  //                                       borderRadius:
  //                                       BorderRadius.circular(4),
  //                                       boxShadow: [
  //                                         BoxShadow(
  //                                           color: const Color(0xff000000).withOpacity(0.25),
  //                                           spreadRadius: 0,
  //                                           blurRadius: 4,
  //                                           offset: const Offset(0, 2),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     height: AppSize.s65,
  //                                     child: Padding(
  //                                       padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
  //                                       child: Row(
  //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                         children: [
  //                                           Row(
  //                                             children: [
  //                                               GestureDetector(
  //                                                 onTap: (){
  //                                                   print("FileExtension:${fileExtension}");
  //                                                   downloadFile(fileUrl);
  //                                                   //DowloadFile();
  //                                                   //.downloadPdfFromBase64(fileExtension,"Acknowledgement");
  //                                                 },
  //                                                 child: Container(
  //                                                     width: AppSize.s62,
  //                                                     height: AppSize.s45,
  //                                                     padding: EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p8),
  //                                                     decoration: BoxDecoration(
  //                                                       borderRadius: BorderRadius.circular(4),
  //                                                       border: Border.all(width: 2, color: ColorManager.faintGrey),
  //                                                     ),
  //                                                     child: SvgPicture.asset('images/doc_vector.svg')),
  //                                               ),
  //                                               SizedBox(width: AppSize.s10,),
  //                                               Text(
  //                                                 "Document 1",
  //                                                 //policiesdata.fileName.toString(),
  //                                                 textAlign: TextAlign.center,
  //                                                 style:  DocDefineTableData.customTextStyle(context),
  //                                               ),
  //                                             ],
  //                                           ),
  //
  //                                           Row(
  //                                             mainAxisAlignment: MainAxisAlignment.center,
  //                                             children: [
  //                                               IconButton(
  //                                                 onPressed: () {},
  //                                                 // {
  //                                                 //   showDialog(
  //                                                 //     context: context,
  //                                                 //     builder: (context) =>
  //                                                 //         ManageHistoryPopup(
  //                                                 //           docHistory: 'new',//policiesdata.docHistory,
  //                                                 //         ),
  //                                                 //   );
  //                                                 // },
  //                                                 icon: Icon(
  //                                                   Icons.history,
  //                                                   size:IconSize.I22,color: IconColorManager.bluebottom,
  //                                                 ),
  //                                                 splashColor: Colors.transparent,
  //                                                 highlightColor: Colors.transparent,
  //                                                 hoverColor: Colors.transparent,
  //                                               ),
  //                                               SizedBox(width: AppSize.s10,),
  //                                               ///print
  //                                               IconButton(
  //                                                 onPressed: () {
  //                                                   print("FileExtension:${fileExtension}");
  //                                                   // DowloadFile()
  //                                                   //     .downloadPdfFromBase64(
  //                                                   //     fileExtension,
  //                                                   //     "DME.pdf");
  //                                                   downloadFile(fileUrl);
  //                                                 },
  //                                                 icon: Icon(
  //                                                   Icons
  //                                                       .print_outlined,
  //                                                   size:IconSize.I22,color: IconColorManager.bluebottom,
  //                                                 ),
  //                                                 splashColor:
  //                                                 Colors.transparent,
  //                                                 highlightColor:
  //                                                 Colors.transparent,
  //                                                 hoverColor:
  //                                                 Colors.transparent,
  //                                               ),
  //                                               SizedBox(width: AppSize.s10,),
  //                                               ///download saloni
  //                                               PdfDownloadButton(apiUrl: "",// policiesdata.docurl,
  //                                                   iconsize: IconSize.I22,
  //                                                   documentName: "",//policiesdata.docName!
  //                                               ),
  //                                               SizedBox(width: AppSize.s10,),
  //                                               ///edit
  //                                               IconButton(
  //                                                 onPressed: (){},
  //                                                 //     () {
  //                                                 //   showDialog(
  //                                                 //     context: context,
  //                                                 //     builder: (context) {
  //                                                 //       return FutureBuilder<
  //                                                 //           MCorporateCompliancePreFillModal>(
  //                                                 //         future: getPrefillNewOrgOfficeDocument(
  //                                                 //             context,
  //                                                 //             policiesdata
  //                                                 //                 .orgOfficeDocumentId),
  //                                                 //         builder: (context,
  //                                                 //             snapshotPrefill) {
  //                                                 //           if (snapshotPrefill
  //                                                 //               .connectionState ==
  //                                                 //               ConnectionState
  //                                                 //                   .waiting) {
  //                                                 //             return Center(
  //                                                 //               child:
  //                                                 //               CircularProgressIndicator(
  //                                                 //                 color: ColorManager
  //                                                 //                     .blueprime,
  //                                                 //               ),
  //                                                 //             );
  //                                                 //           }
  //                                                 //
  //                                                 //           var calender =
  //                                                 //               snapshotPrefill
  //                                                 //                   .data!
  //                                                 //                   .expiry_date;
  //                                                 //           calenderController =
  //                                                 //               TextEditingController(
  //                                                 //                 text: snapshotPrefill
  //                                                 //                     .data!
  //                                                 //                     .expiry_date,
  //                                                 //               );
  //                                                 //           return StatefulBuilder(
  //                                                 //             builder: (BuildContext
  //                                                 //             context,
  //                                                 //                 void Function(void Function())
  //                                                 //                 setState) {
  //                                                 //               return VCScreenPopupEditConst(
  //                                                 //                 fileName: snapshotPrefill
  //                                                 //                     .data!
  //                                                 //                     .fileName,
  //                                                 //                 url: snapshotPrefill.data!.url,
  //                                                 //                 expiryDate: snapshotPrefill.data!.expiry_date,
  //                                                 //                 title: EditPopupString.editPolicy,
  //                                                 //                 loadingDuration: _isLoading,
  //                                                 //                 officeId: widget.officeId,
  //                                                 //                 docTypeMetaIdCC: widget.docID,
  //                                                 //                 selectedSubDocId: widget.subDocID,
  //                                                 //                 //orgDocId: manageCCADR.orgOfficeDocumentId,
  //                                                 //                 orgDocId: snapshotPrefill.data!.orgOfficeDocumentId,
  //                                                 //                 orgDocumentSetupid: snapshotPrefill.data!.documentSetupId,
  //                                                 //                 docName: snapshotPrefill.data!.docName,
  //                                                 //                 selectedExpiryType: snapshotPrefill.data!.expType,
  //                                                 //                 documentType: AppStringEM.policiesAndProcedures,
  //                                                 //                 documentSubType: '',
  //                                                 //                 isOthersDocs: snapshotPrefill.data!.isOthersDocs,
  //                                                 //                 idOfDoc: snapshotPrefill.data!.idOfDocument,
  //                                                 //                 expiryType: snapshotPrefill.data!.expType,
  //                                                 //                 threshhold: snapshotPrefill.data!.threshould,
  //                                                 //               );
  //                                                 //             },
  //                                                 //           );
  //                                                 //         },
  //                                                 //       );
  //                                                 //     },
  //                                                 //   );
  //                                                 // },
  //                                                 icon: Icon(
  //                                                   Icons.edit_outlined,
  //                                                   size:IconSize.I22,color: IconColorManager.bluebottom,
  //                                                 ),
  //                                                 splashColor:
  //                                                 Colors.transparent,
  //                                                 highlightColor:
  //                                                 Colors.transparent,
  //                                                 hoverColor:
  //                                                 Colors.transparent,
  //                                               ),
  //                                               SizedBox(width: AppSize.s10,),
  //                                               ///delete
  //                                               IconButton(
  //                                                   splashColor: Colors.transparent,
  //                                                   highlightColor: Colors.transparent,
  //                                                   hoverColor: Colors.transparent,
  //                                                   onPressed: () {
  //                                                   },
  //                                                   icon: Icon(
  //                                                     Icons
  //                                                         .delete_outline,
  //                                                     size:IconSize.I24,color: IconColorManager.red,
  //                                                   )),
  //                                             ],
  //                                           )
  //                                         ],
  //                                       ),
  //                                     )),
  //                               ),
  //                             ],
  //                           );
  //                         }),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
@override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 50),
    child:  ScrollConfiguration(
    behavior: ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView()
  ),
    );
  }
}
