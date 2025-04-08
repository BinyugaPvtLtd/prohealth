// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/sm_scheduler_screen_const.dart';
//
// import '../../../../../../../app/resources/color.dart';
// import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
// import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
// import '../../../../../../../app/resources/font_manager.dart';
// import '../../../../../../../app/resources/theme_manager.dart';
// import '../../../../../../../app/resources/value_manager.dart';
// import '../../../../../../widgets/widgets/constant_textfield/const_textfield.dart';
// import 'completed_popup.dart';
//
// class CompletedPageView extends StatefulWidget {
//   const CompletedPageView({super.key});
//
//   @override
//   State<CompletedPageView> createState() => _CompletedPageViewState();
// }
//
// class _CompletedPageViewState extends State<CompletedPageView> {
//
//   String _selectedValue = 'Sort';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 220,
//                   height: 36,
//                   child:TextField(
//                     textCapitalization:
//                     TextCapitalization.words,
//                     style: DocumentTypeDataStyle.customTextStyle(context),
//                     // onChanged: _search,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xFFF8F8F8),
//                         hintText: 'Search',
//                         alignLabelWithHint: true,
//                         hintStyle: DocumentTypeDataStyle.customTextStyle(context),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color:Color(0xFFC9C9C9),width: 1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color:Colors.grey.shade200,width: 1),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: IconButton(
//                           splashColor: Colors.transparent,
//                           highlightColor: Colors.transparent,
//                           hoverColor: Colors.transparent,
//                           icon: Center(
//                             child: Icon(
//                               Icons.search,
//                               size: IconSize.I18,
//                               color:  ColorManager.greylight,
//                             ),
//                           ),
//                           onPressed: () {},
//                         ),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
//                   ),
//
//                 ),
//                 Container(
//                  // height: 32,
//
//                   decoration: BoxDecoration(
//                       border:  Border.all(color: Color(0xFFC9C9C9), width: 0.86),
//                       borderRadius: BorderRadius.all(Radius.circular(8))
//                   ),
//                   // child:buildDropdownButton(context),
//                   child: CustomDropdownTextField(
//                     width:100,
//
//                     isAstric:false,
//                     // Adjust headText based on depId
//                     initialValue: 'Filter by',
//                     headText: "", // Default fallback if depId doesn't match any of the expected values
//                     items: ['Weekly','Monthly',],
//                     onChanged: (newValue) {
//                       // for (var a in snapshot.data!) {
//                       //   if (a.empType == newValue) {
//                       //     clinicialName = a.empType!;
//                       //     clinicalId = a.employeeTypesId!;
//                       //     print("Dept ID'''''' ${clinicalId}");
//                       //     print("';';';''''''''Dept ID ${clinicialName}");
//                       //     // Do something with docType
//                       //   }
//                       // }
//                     },
//                   ),
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
//                     child: InkWell(
//                       onTap: ()async{
//                     await showDialog(
//                     context: context,
//                     builder: (BuildContext context) { return Completed_popup();});
//                       },
//                       child: SchedularContainerConst(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                             flex: 2,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 25),
//                                 child: Row(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(vertical: 5),
//                                           child:  ClipRRect(
//                                             borderRadius: BorderRadius.circular(60),
//                                             child: SizedBox(
//                                               width: AppSize.s45,
//                                               height: AppSize.s50,
//                                               child: Image.asset(
//                                                 'images/hr_dashboard/man.png', // Replace with your image path
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(width: AppSize.s7),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 15),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Jeh Tiwari',
//                                         style: DocDefineTableData.customTextStyle(context),
//
//                                           ),
//                                           SizedBox(height: AppSize.s3),
//                                           Text(
//                                             'Anxiety',
//                                             style:DocDefineTableDataID.customTextStyle(context),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             Expanded(
//                               flex: 3,
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
//                                   SizedBox(width: AppSize.s15,),
//                                   Container(
//                                     child:Text("132 My Street,Kingston, New York 12401",
//                                       textAlign: TextAlign.start,
//                                       style: DocDefineTableDataID.customTextStyle(context),
//                                     ) ,
//                                   )
//                                 ],
//                               ),
//                             ),
//
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 children: [
//                                   // Text("POC :",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFF527FB9).withOpacity(0.5),
//                                       borderRadius: BorderRadius.circular(3), // Makes the borders curved with radius 5
//                                     ),
//                                     // color: Color(0xFF527FB9).withOpacity(0.5),
//                                     width: 22,
//                                     height: 20,
//                                     child: Center(
//                                       child: Text("ST",style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: FontSize.s12,
//                                         color: ColorManager.white,
//                                         decoration: TextDecoration.none,
//                                       ),),
//                                     ),
//                                   ),
//                                   SizedBox(width: 8,),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0xFFFEBD4D).withOpacity(0.5),
//                                       borderRadius: BorderRadius.circular(3), // Makes the borders curved with radius 5
//                                     ),
//                                     width: 22,
//                                     height: 20,
//                                     child: Center(
//                                       child: Text(
//                                         "OT",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: FontSize.s12,
//                                           color: ColorManager.white,
//                                           decoration: TextDecoration.none,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 25,
//                                     height: 15,
//                                     decoration: BoxDecoration(
//                                         color: Colors.yellow.shade200,
//                                         borderRadius: BorderRadius.circular(3)
//                                     ),
//                                     child: Center(
//                                       child: Text("PB",style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12,
//                                         color: ColorManager.greenDark,
//                                         decoration: TextDecoration.none,
//                                       ),),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 children: [
//                                   Text("Completed",style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: FontSize.s12,
//                                     color:  ColorManager.greenDark,
//                                     decoration: TextDecoration.none,
//                                   ),)
//                                 ],
//                               ),
//                             ),
//
//                             Expanded(
//                               flex: 1,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset("images/sm/contact_sv.svg",  height: 30,width: 20,),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 2,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 25.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
//                                    // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                     Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
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
