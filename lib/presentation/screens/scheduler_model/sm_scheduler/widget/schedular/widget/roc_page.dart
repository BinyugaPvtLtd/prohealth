// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../../../../app/resources/color.dart';
// import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
// import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
// import '../../../../../../../app/resources/font_manager.dart';
// import '../../../../../../../app/resources/theme_manager.dart';
// import '../../../../../../../app/resources/value_manager.dart';
// import '../../../../../../widgets/widgets/constant_textfield/const_textfield.dart';
// import '../sm_scheduler_screen_const.dart';
//
// class RocPageView extends StatefulWidget {
//   const RocPageView({super.key});
//
//   @override
//   State<RocPageView> createState() => _RocPageViewState();
// }
//
// class _RocPageViewState extends State<RocPageView> {
//   String _selectedValue = 'Sort';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 220,
//                       height: 36,
//                       child:TextField(
//                         textCapitalization:
//                         TextCapitalization.words,
//                         style: DocumentTypeDataStyle.customTextStyle(context),
//                         // onChanged: _search,
//                         decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Color(0xFFF8F8F8),
//                             hintText: 'Search',
//                             alignLabelWithHint: true,
//                             hintStyle: DocumentTypeDataStyle.customTextStyle(context),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color:Color(0xFFC9C9C9),width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color:Colors.grey.shade200,width: 1),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             prefixIcon: IconButton(
//                               splashColor: Colors.transparent,
//                               highlightColor: Colors.transparent,
//                               hoverColor: Colors.transparent,
//                               icon: Center(
//                                 child: Icon(
//                                   Icons.search,
//                                   size: IconSize.I18,
//                                   color:  ColorManager.greylight,
//                                 ),
//                               ),
//                               onPressed: () {},
//                             ),
//                             contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
//                       ),
//
//                     ),
//
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomDropdownTextField(
//                       width: 150,
//                       isAstric:false,
//                       // Adjust headText based on depId
//                       initialValue: 'Employee Type',
//                       headText: "", // Default fallback if depId doesn't match any of the expected values
//                       items: ['Employee 1','Employee 2','Employee 3'],
//                       onChanged: (newValue) {
//                         // for (var a in snapshot.data!) {
//                         //   if (a.empType == newValue) {
//                         //     clinicialName = a.empType!;
//                         //     clinicalId = a.employeeTypesId!;
//                         //     print("Dept ID'''''' ${clinicalId}");
//                         //     print("';';';''''''''Dept ID ${clinicialName}");
//                         //     // Do something with docType
//                         //   }
//                         // }
//                       },
//                     ),
//                     CustomDropdownTextField(
//                       width:150,
//                       isAstric:false,
//                       // Adjust headText based on depId
//                       initialValue: 'Clinician Type',
//                       headText: "", // Default fallback if depId doesn't match any of the expected values
//                       items: ['Clinical 1','Clinical 2','Clinical 3'],
//                       onChanged: (newValue) {
//                         // for (var a in snapshot.data!) {
//                         //   if (a.empType == newValue) {
//                         //     clinicialName = a.empType!;
//                         //     clinicalId = a.employeeTypesId!;
//                         //     print("Dept ID'''''' ${clinicalId}");
//                         //     print("';';';''''''''Dept ID ${clinicialName}");
//                         //     // Do something with docType
//                         //   }
//                         // }
//                       },
//                     ),
//
//
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Container(
//
//                         decoration: BoxDecoration(
//                             border:  Border.all(color: Color(0xFFC9C9C9), width: 0.86),
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(8))
//                         ),
//                         // child:buildDropdownButton(context),
//                         child: CustomDropdownTextField(
//                           width:100,
//                           height: 32,
//                           isAstric:false,
//                           // Adjust headText based on depId
//                           initialValue: 'Filter by',
//                           headText: "", // Default fallback if depId doesn't match any of the expected values
//                           items: ['Weekly','Monthly',],
//                           onChanged: (newValue) {
//                             // for (var a in snapshot.data!) {
//                             //   if (a.empType == newValue) {
//                             //     clinicialName = a.empType!;
//                             //     clinicalId = a.employeeTypesId!;
//                             //     print("Dept ID'''''' ${clinicalId}");
//                             //     print("';';';''''''''Dept ID ${clinicialName}");
//                             //     // Do something with docType
//                             //   }
//                             // }
//                           },
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 30,),
//             Expanded(
//               child: ScrollConfiguration(
//                 behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//                 child: ListView.builder(
//                   itemCount: 5,
//                   itemBuilder: (BuildContext context, int index) { return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 1,
//                       vertical: 5,),
//                     child:  SchedularContainerConst(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 20),
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(vertical: 5),
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(60),
//                                           child: SizedBox(
//                                             width: AppSize.s45,
//                                             height: AppSize.s50,
//                                             child: Image.asset(
//                                               'images/hr_dashboard/man.png', // Replace with your image path
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(width: AppSize.s7),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 15),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'John Smith',
//                                           style: DocDefineTableData.customTextStyle(context),
//
//                                         ),
//                                         SizedBox(height: AppSize.s3),
//                                         Text(
//                                           'Anxiety',
//                                           style:DocDefineTableDataID.customTextStyle(context),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           Expanded(
//                             flex: 3,
//                             child: Row(
//                               children: [
//                                 Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
//                                 SizedBox(width: 15,),
//                                 Container(
//                                   child:Text("132 My Street,Kingston, New York 12401",
//                                     textAlign: TextAlign.start,
//                                     style: DocDefineTableDataID.customTextStyle(context),
//                                   ) ,
//                                 )
//                               ],
//                             ),
//                           ),
//
//                           Expanded(
//                             flex: 1,
//                             child: Row(
//                               children: [
//                                 // Text("POC :",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFF527FB9).withOpacity(0.5),
//                                     borderRadius: BorderRadius.circular(3), // Makes the borders curved with radius 5
//                                   ),
//                                   // color: Color(0xFF527FB9).withOpacity(0.5),
//                                   width: 22,
//                                   height: 20,
//                                   child: Center(
//                                     child: Text("ST",style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: FontSize.s12,
//                                       color: ColorManager.white,
//                                       decoration: TextDecoration.none,
//                                     ),),
//                                   ),
//                                 ),
//                                 SizedBox(width: 8,),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFFEBD4D).withOpacity(0.5),
//                                     borderRadius: BorderRadius.circular(3), // Makes the borders curved with radius 5
//                                   ),
//                                   width: 22,
//                                   height: 20,
//                                   child: Center(
//                                     child: Text(
//                                       "OT",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: FontSize.s12,
//                                         color: ColorManager.white,
//                                         decoration: TextDecoration.none,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 25,
//                                   height: 15,
//                                   decoration: BoxDecoration(
//                                       color: Colors.yellow.shade200,
//                                       borderRadius: BorderRadius.circular(3)
//                                   ),
//                                   child: Center(
//                                     child: Text("A+",style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 12,
//                                       color: ColorManager.greenDark,
//                                       decoration: TextDecoration.none,
//                                     ),),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Row(
//                               children: [
//                                 Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
//                                 // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                 Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Row(
//                               //mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset("images/sm/contact_sv.svg",  height: 28,width: 18,),
//                                 SizedBox(width: 15,),
//                                 // Container(
//                                 //   width: 120,
//                                 //  // height: 32,
//                                 //   child: ElevatedButton.icon(onPressed: (){}, label: Text("Manual", style: BlueButtonTextConst.customTextStyle(context),),
//                                 //    // icon: Icon( FontAwesomeIcons.userCheck,color:ColorManager.white ,size: 16,),
//                                 //     icon: Image.asset("images/sm/manual.png",height: 30,width: 18,),
//                                 //     style: ElevatedButton.styleFrom(backgroundColor:  ColorManager.bluebottom,
//                                 //       elevation: 5,
//                                 //       shape: RoundedRectangleBorder(
//                                 //         borderRadius: BorderRadius.circular(12),
//                                 //
//                                 //       ),),
//                                 //   ),
//                                 // ),
//                                 Icon(Icons.edit_outlined,color: ColorManager.bluebottom,),
//                                 SizedBox(width: 15,),
//                                 Container(
//                                   child: Row(
//                                     children: [
//                                       Stack(
//                                         children: [
//                                           ClipRRect(
//                                           borderRadius: BorderRadius.circular(60),
//                                           child: SizedBox(
//                                             width: AppSize.s45,
//                                             height: AppSize.s50,
//                                             child: Image.asset(
//                                               'images/1.png', // Replace with your image path
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                           Positioned(
//                                             left:22,
//                                             bottom :0,
//                                             child: Container(
//                                               color: Color(0xFF527FB9),
//                                               width: 19,
//                                               height: 15,
//                                               child: Center(
//                                                 child: Text("ST",style: TextStyle(
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 8,
//                                                   color: ColorManager.white,
//                                                   decoration: TextDecoration.none,
//                                                 ),),
//                                               ),
//                                             ),)
//                                         ],
//                                       ),
//                                       SizedBox(width: AppSize.s7),
//                                       Text(
//                                         'John Smith',
//                                         style:DocDefineTableData.customTextStyle(context),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ); },
//
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildDropdownButton(BuildContext context) {
//     final Map<String, String> displayTextMap = {
//       'Sort': 'Filter by',
//       'Opened': 'Opened',
//       'Notopen': 'Not Opened',
//       'Partial': 'Partial',
//       'Completed': 'Completed',
//     };
//
//     return Column(
//       children: [
//         DropdownButton2<String>(
//           value: _selectedValue,
//           onChanged: (String? newValue) {
//             setState(() {
//               _selectedValue = newValue!;
//               //filterData();
//             });
//           },
//           style: AllPopupHeadings.customTextStyle(context),
//           iconStyleData:  IconStyleData(
//             icon: Icon(
//               Icons.arrow_drop_down,
//               color: ColorManager.mediumgrey,
//             ),
//           ),
//           // iconSize: 20,
//           underline: const SizedBox(),
//           buttonStyleData: ButtonStyleData(
//             height: 32,
//             width: 130,
//             padding:
//             const EdgeInsets.symmetric(horizontal: 8), // Internal padding.
//             elevation: 2, // Shadow depth.
//             // decoration: BoxDecoration(
//             //   color: Colors.white,
//             //   border: Border.all(color: const Color(0xff50B5E5), width: 1.2),
//             //   borderRadius: BorderRadius.circular(12.0),
//             //   // boxShadow: [
//             //   //   BoxShadow(
//             //   //     color: const Color(0xff000000).withOpacity(0.25),
//             //   //     blurRadius: 2,
//             //   //     offset: const Offset(0, 2),
//             //   //   ),
//             //   // ],
//             // ),
//             overlayColor: WidgetStateProperty.all(
//                 Colors.grey.withOpacity(0.1)), // Background color when pressed.
//           ),
//
//           /// buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
//           // dropdownMaxHeight: 200,
//           // dropdownDecoration: BoxDecoration(
//           //   borderRadius: BorderRadius.circular(12),
//           //   color: Colors.white,
//           // ),
//           // itemPadding: const EdgeInsets.symmetric(horizontal: 8), // Updated padding
//           selectedItemBuilder: (context) =>
//               displayTextMap.keys.map((String value) {
//                 return Align(
//                   alignment: Alignment.center,
//                   child: Text(displayTextMap[value]!),
//                 );
//               }).toList(),
//           items: displayTextMap.keys.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(displayTextMap[value]!),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../../em_module/widgets/button_constant.dart';
import '../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RNSOCPageview extends StatefulWidget {
  const RNSOCPageview({super.key});

  @override
  State<RNSOCPageview> createState() => _RNSOCPageviewState();
}

class _RNSOCPageviewState extends State<RNSOCPageview> {
  TextEditingController firstNameController = TextEditingController();
  bool isAssigned = false;
  String selectedType = "Auto-assign";
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        isAssigned
            ? Container(
          height: 700,
          width: 200,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomRadioListTile(value: "Auto-assign",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Auto-assign"),
                  CustomRadioListTile(value: "Sent Request",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Sent Request"),
                  CustomRadioListTile(value: "Mark as Confirm",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Mark as Confirm"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 250,
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.bluebottom,width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "In Zone",
                                    style: CustomTextStylesCommon.commonStyle(color: ColorManager.greenDark,
                                        fontSize: FontSize.s12, fontWeight: FontWeight.w700),
                                  ),
                                ],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: SizedBox(
                                          width: AppSize.s45,
                                          height: AppSize.s50,
                                          child: Image.asset(
                                            'images/1.png', // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2,),
                                      Text('Salaried', style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                          fontSize: FontSize.s12, fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Adam Johnson",
                                        style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                            fontSize: FontSize.s12, fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("Available (22/25)",
                                        style: CustomTextStylesCommon.commonStyle(color: ColorManager.greenDark,
                                            fontSize: FontSize.s12, fontWeight: FontWeight.w600),),
                                      SizedBox(height: 10,),
                                      Text("Sacramento Z1 (2.4 Miles Away)",
                                        style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                            fontSize: FontSize.s12, fontWeight: FontWeight.w400),),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Image.asset("images/sm/contact_text.png",height: 35,)
                                ,onTap: (){},),
                              SizedBox(width: 50,),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorManager.bluebottom,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isAssigned = true;
                                    });
                                  },
                                  child: Text("Assign"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Week 1",
                              style: CustomTextStylesCommon.commonStyle(
                                  color: ColorManager.mediumgrey,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w700),),
                            SizedBox(height: 20,),
                            Text("2024-12-1  (Tuesday) , 01:00 PM",
                              style: CustomTextStylesCommon.commonStyle(
                                  color: ColorManager.mediumgrey,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w400),),
                            SizedBox(height: 15,),
                            Text("2024-12-2  (Wednesday) , 01:00 PM",
                              style: CustomTextStylesCommon.commonStyle(
                                  color: ColorManager.mediumgrey,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90, // Adjust height as needed
                    child: VerticalDivider(
                      color: ColorManager.mediumgrey, // Change color as needed
                      thickness: 2, // Adjust thickness as needed
                      width: 20, // Space between columns
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Week 1",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          Text("2024-12-1  (Tuesday) , 01:00 PM",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400),),
                          SizedBox(height: 15,),
                          Text("2024-12-2  (Wednesday) , 01:00 PM",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90, // Adjust height as needed
                    child: VerticalDivider(
                      color: ColorManager.mediumgrey, // Change color as needed
                      thickness: 2, // Adjust thickness as needed
                      width: 20, // Space between columns
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Week 1",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          Text("2024-12-1  (Tuesday) , 01:00 PM",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400),),
                          SizedBox(height: 15,),
                          Text("2024-12-2  (Wednesday) , 01:00 PM",
                            style: CustomTextStylesCommon.commonStyle(
                                color: ColorManager.mediumgrey,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: IconButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: (){
                            setState(() {
                              isAssigned = false;
                            });
                          }, icon: Icon(Icons.close,color: ColorManager.faintOrange,))
                  )
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Notes to Clinician",
                style: CustomTextStylesCommon.commonStyle(
                    color: ColorManager.mediumgrey,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                width:  AppSize.s400,
                height: AppSize.s45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB1B1B1), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  autofocus: true,
                  enabled: true ,
                  controller: firstNameController,
                  cursorColor: Colors.black,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Preferred Date: 2024/12/01 & Time: 12:00 pm",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p10,top: 10),
                  ),
                  style: TableSubHeading.customTextStyle(context),
                  //validator: widget.validator,
                  onTap: (){},
                  //validator: widget.validator,
                  // onTap: widget.onChange,
                ),
              ),
              SizedBox(height: 10),
              CustomeTransparentAddShift(
                  width: 130,
                  height: 30,
                  text: "Add Clinician", onPressed: (){}),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: ColorManager.bluebottom, // Adjust color as needed
                    shape: CircleBorder(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: Colors.white, size: IconSize.I20),
                        //SizedBox(height: 4),
                        Text(
                          'Contact',
                          style: CustomTextStylesCommon.commonStyle(fontSize: 10,color: ColorManager.white,fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(),
              Spacer(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      width: AppSize.s105,
                      height: AppSize.s30,
                      text: "Submit",
                      color: ColorManager.bluebottom,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        )
            : Expanded(
              child: Container(
                       // height: 500,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            "Clinician Preference",
                                            style: CustomTextStylesCommon.commonStyle(
                                                color: ColorManager.mediumgrey,
                                                fontSize: FontSize.s14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 40),
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomSearchFieldSM(
                                                onPressed: () {},
                                              ),
                                              SizedBox(width: 50,),
                                              SmDropdownConst(
                                                height: 36,
                                                width: 150,
                                                isAstric: false,
                                                initialValue: 'Filter by',
                                                headText: "",
                                                items: ['Filter by', 'Referral App', 'E-Fax', 'E-Referrals', 'Manual'],
                                                onChanged: (newValue) {},
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "Suggestions",
                                            style: CustomTextStylesCommon.commonStyle(
                                                color: ColorManager.mediumgrey,
                                                fontSize: FontSize.s14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 20),
                                          SizedBox(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 4,
                                              itemBuilder: (context, index) {
                                                return Container(
                          width: 250,
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.bluebottom,width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "In Zone",
                                        style: CustomTextStylesCommon.commonStyle(color: ColorManager.greenDark,
                                            fontSize: FontSize.s12, fontWeight: FontWeight.w700),
                                      ),
                                    ],),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(60),
                                            child: SizedBox(
                                              width: AppSize.s45,
                                              height: AppSize.s50,
                                              child: Image.asset(
                                                'images/1.png', // Replace with your image path
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2,),
                                          Text('Salaried', style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                              fontSize: FontSize.s12, fontWeight: FontWeight.w700),)
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Adam Johnson",
                                            style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                                fontSize: FontSize.s12, fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Available (22/25)",
                                            style: CustomTextStylesCommon.commonStyle(color: ColorManager.greenDark,
                                                fontSize: FontSize.s12, fontWeight: FontWeight.w600),),
                                          SizedBox(height: 10,),
                                          Text("Sacramento Z1 (2.4 Miles Away)",
                                            style: CustomTextStylesCommon.commonStyle(color: ColorManager.mediumgrey,
                                                fontSize: FontSize.s12, fontWeight: FontWeight.w400),),
                                        ],
                                      )
                                        
                                    ],
                                  ),
                                ],
                              ),
                                        
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: Image.asset("images/sm/contact_text.png",height: 35,)
                                      ,onTap: (){},),
                                    //SizedBox(width: 50,),
                                    Text(
                                      "Accepted",
                                      style: CustomTextStylesCommon.commonStyle(
                                          color: ColorManager.greenDark,
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isAssigned = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorManager.bluebottom,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // optional
                                      ),
                                      child: Text("Assign",  style: CustomTextStylesCommon.commonStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Notes to Clinician",
                                            style: CustomTextStylesCommon.commonStyle(
                                                color: ColorManager.mediumgrey,
                                                fontSize: FontSize.s14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width:  AppSize.s400,
                                            height: AppSize.s50,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Color(0xFFB1B1B1), width: 1),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: TextFormField(
                                              autofocus: true,
                                              enabled: true ,
                                              controller: firstNameController,
                                              cursorColor: Colors.black,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              decoration: InputDecoration(
                                                hintText: "Preferred Date: 2024/12/01 & Time: 12:00 pm",
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p10,top: 10),
                                              ),
                                              style: TableSubHeading.customTextStyle(context),
                                              //validator: widget.validator,
                                              onTap: (){},
                                              //validator: widget.validator,
                                              // onTap: widget.onChange,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          CustomeTransparentAddShift(
                                              width: 130,
                                              height: 30,
                                              text: "Add Clinician", onPressed: (){}),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              FloatingActionButton(
                                                onPressed: () {},
                                                backgroundColor: ColorManager.bluebottom, // Adjust color as needed
                                                shape: CircleBorder(),
                                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, color: Colors.white, size: IconSize.I20),
                            //SizedBox(height: 4),
                            Text(
                              'Contact',
                              style: CustomTextStylesCommon.commonStyle(fontSize: 10,color: ColorManager.white,fontWeight: FontWeight.w400),
                            ),
                          ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Divider(),
                                          // Spacer(),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CustomElevatedButton(
                                                width: AppSize.s105,
                                                height: AppSize.s30,
                                                text: "Submit",
                                                color: ColorManager.bluebottom,
                                                onPressed: () {},
                                              ),
                                            ],
                                          )
                                        ],
                          ),
                        ),
                      ),
            )
      ],
    );


  }
}

// class RNSOCPageview extends StatelessWidget {
//   const RNSOCPageview({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       width: 200,
//      // color: Colors.red,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               CustomSearchFieldSM(
//                 onPressed: (){},
//               ),
//               SmDropdownConst(
//                 height: AppSize.s36,
//                 width:AppSize.s150,
//                 isAstric:false,
//                 // Adjust headText based on depId
//                 initialValue: 'Filter by',
//                 headText: "", // Default fallback if depId doesn't match any of the expected values
//                 items: ['Filter by','Referral App','E-Fax','E-Referrals','Manual',],
//                 onChanged: (newValue) {
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


///
class PTPageview extends StatefulWidget {
  const PTPageview({super.key});

  @override
  State<PTPageview> createState() => _PTPageviewState();
}

class _PTPageviewState extends State<PTPageview> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    bool isAssigned = false;
    String? selectedType = "Auto-assign";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s25,),
        Container(
          // width: 500,
          child:     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Assignment Type',
                      style: AllPopupHeadings.customTextStyle(context),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CustomRadioListTile(value: "Auto-assign",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Auto-assign"),
                  CustomRadioListTile(value: "Sent Request",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Sent Request"),
                  CustomRadioListTile(value: "Mark as Confirm",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Mark as Confirm"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSize.s25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,  // Background color (adjust as needed)
                border: Border.all(
                  color: ColorManager.bluebottom,  // Border color
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),  // Circular border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("In Zone", style:TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.greenDark,
                        ),),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Stack(

                                  children: [SizedBox(
                                    height: 60,  // Adjust height for circle size
                                    width: 60,
                                    child: CircleAvatar(
                                      child:
                                      Image.asset('images/1.png',fit: BoxFit.contain,),
                                    ),
                                  ),
                                    Positioned(
                                      right:0,
                                      bottom :0,
                                      child: Container(
                                        color: Color(0xFF527FB9),
                                        width: 19,
                                        height: 19,
                                        child: Center(
                                          child: Text("ST",style: TextStyle(
                                            // fontWeight: FontWeight.w600,
                                            // fontSize: FontSize.s13,
                                            color: ColorManager.white,
                                            decoration: TextDecoration.none,
                                          ),),
                                        ),
                                      ),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text("\$24", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.greenDark,
                            ),),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Adam Johnson", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,
                            ),),
                            SizedBox(height: 5),
                            Text("Available", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.greenDark,
                            ),),
                            SizedBox(height: 5),
                            Text("Sacramento Z1 (2.4 Miles Away)", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,
                            ),),
                            SizedBox(height: 5),
                            Text("Salaried", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,
                            ),),

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),

            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Week 1 ", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: AppSize.s25,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),


                ],
              ),
            ),

            SizedBox(
              height: 120, // Set this to match the height of your container
              child: VerticalDivider(
                width: 2,  // Divider width
                color: ColorManager.containerBorderGrey, // Divider color
                thickness: 2, // Thickness of the divider
              ),
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Week 2 ", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: AppSize.s25,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),


                ],
              ),
            ),
            SizedBox(
              height: 120, // Set this to match the height of your container
              child: VerticalDivider(
                width: 2,  // Divider width
                color: ColorManager.containerBorderGrey, // Divider color
                thickness: 2, // Thickness of the divider
              ),
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Week 3 ", style:TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.mediumgrey,
                      ),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.close,color: ColorManager.faintOrange,))
                    ],
                  ),
                  SizedBox(height: AppSize.s15,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),

                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(width: 10,),
          ],
        ),

        SizedBox(height: AppSize.s30,),
        Text(
          "Notes to Clinician",
          style: CustomTextStylesCommon.commonStyle(
              color: ColorManager.mediumgrey,
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          width:  AppSize.s400,
          height: AppSize.s45,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB1B1B1), width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            autofocus: true,
            enabled: true ,
            controller: firstNameController,
            cursorColor: Colors.black,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Preferred Date: 2024/12/01 & Time: 12:00 pm",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p10,top: 10),
            ),
            style: TableSubHeading.customTextStyle(context),
            //validator: widget.validator,
            onTap: (){},
            //validator: widget.validator,
            // onTap: widget.onChange,
          ),
        ),
        SizedBox(height: 10),
        CustomeTransparentAddShift(
            width: 130,
            height: 30,
            text: "Add Clinician", onPressed: (){}),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorManager.bluebottom, // Adjust color as needed
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.white, size: IconSize.I20),
                  //SizedBox(height: 4),
                  Text(
                    'Contact',
                    style: CustomTextStylesCommon.commonStyle(fontSize: 10,color: ColorManager.white,fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(),
        Spacer(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                width: AppSize.s105,
                height: AppSize.s30,
                text: "Submit",
                color: ColorManager.bluebottom,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OTPageview extends StatefulWidget {
  const OTPageview({super.key});

  @override
  State<OTPageview> createState() => _OTPageviewState();
}

class _OTPageviewState extends State<OTPageview> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    bool isAssigned = false;
    String? selectedType = "Auto-assign";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s25,),
        Container(
          // width: 500,
          child:     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Assignment Type',
                      style: AllPopupHeadings.customTextStyle(context),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CustomRadioListTile(value: "Auto-assign",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Auto-assign"),
                  CustomRadioListTile(value: "Sent Request",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Sent Request"),
                  CustomRadioListTile(value: "Mark as Confirm",
                      groupValue: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      }, title: "Mark as Confirm"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppSize.s25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,  // Background color (adjust as needed)
                border: Border.all(
                  color: ColorManager.bluebottom,  // Border color
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),  // Circular border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("In Zone", style:TextStyle(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.greenDark,
                        ),),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Stack(

                                  children: [SizedBox(
                                    height: 60,  // Adjust height for circle size
                                    width: 60,
                                    child: CircleAvatar(
                                      child:
                                      Image.asset('images/1.png',fit: BoxFit.contain,),
                                    ),
                                  ),
                                    Positioned(
                                      right:0,
                                      bottom :0,
                                      child: Container(
                                        color: Color(0xFF527FB9),
                                        width: 19,
                                        height: 19,
                                        child: Center(
                                          child: Text("ST",style: TextStyle(
                                            // fontWeight: FontWeight.w600,
                                            // fontSize: FontSize.s13,
                                            color: ColorManager.white,
                                            decoration: TextDecoration.none,
                                          ),),
                                        ),
                                      ),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text("\$24", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.greenDark,
                            ),),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Adam Johnson", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,
                            ),),
                            SizedBox(height: 5),
                            Text("Available", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.greenDark,
                            ),),
                            SizedBox(height: 5),
                            Text("Sacramento Z1 (2.4 Miles Away)", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,
                            ),),
                            SizedBox(height: 5),
                            Text("Salaried", style:TextStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,
                            ),),

                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),

            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Week 1 ", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: AppSize.s25,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),


                ],
              ),
            ),

            SizedBox(
              height: 120, // Set this to match the height of your container
              child: VerticalDivider(
                width: 2,  // Divider width
                color: ColorManager.containerBorderGrey, // Divider color
                thickness: 2, // Thickness of the divider
              ),
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Week 2 ", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: AppSize.s25,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),


                ],
              ),
            ),
            SizedBox(
              height: 120, // Set this to match the height of your container
              child: VerticalDivider(
                width: 2,  // Divider width
                color: ColorManager.containerBorderGrey, // Divider color
                thickness: 2, // Thickness of the divider
              ),
            ),
            Container(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Week 3 ", style:TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.mediumgrey,
                      ),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.close,color: ColorManager.faintOrange,))
                    ],
                  ),
                  SizedBox(height: AppSize.s15,),
                  Text("1.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),
                  SizedBox(height: 10),
                  Text("2.2024-12-1  (Tuesday) , 01:00 PM", style:TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.mediumgrey,
                  ),),

                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(width: 10,),


          ],
        ),

        SizedBox(height: AppSize.s30,),
        Text(
          "Notes to Clinician",
          style: CustomTextStylesCommon.commonStyle(
              color: ColorManager.mediumgrey,
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Container(
          width:  AppSize.s400,
          height: AppSize.s45,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB1B1B1), width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            autofocus: true,
            enabled: true ,
            controller: firstNameController,
            cursorColor: Colors.black,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: "Preferred Date: 2024/12/01 & Time: 12:00 pm",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p10,top: 10),
            ),
            style: TableSubHeading.customTextStyle(context),
            //validator: widget.validator,
            onTap: (){},
            //validator: widget.validator,
            // onTap: widget.onChange,
          ),
        ),
        SizedBox(height: 10),
        CustomeTransparentAddShift(
            width: 130,
            height: 30,
            text: "Add Clinician", onPressed: (){}),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorManager.bluebottom, // Adjust color as needed
              shape: CircleBorder(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.white, size: IconSize.I20),
                  //SizedBox(height: 4),
                  Text(
                    'Contact',
                    style: CustomTextStylesCommon.commonStyle(fontSize: 10,color: ColorManager.white,fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
        Divider(),
        Spacer(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                width: AppSize.s105,
                height: AppSize.s30,
                text: "Submit",
                color: ColorManager.bluebottom,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
