import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../../../widgets/widgets/constant_textfield/const_textfield.dart';
import '../sm_scheduler_screen_const.dart';

class SocPageView extends StatefulWidget {
  const SocPageView({super.key});

  @override
  State<SocPageView> createState() => _SocPageViewState();
}

class _SocPageViewState extends State<SocPageView> {


  String _selectedValue = 'Sort';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 220,
                      height: 36,
                      child:TextField(
                        textCapitalization:
                        TextCapitalization.words,
                        style: DocumentTypeDataStyle.customTextStyle(context),
                        // onChanged: _search,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF8F8F8),
                            hintText: 'Search',
                            alignLabelWithHint: true,
                            hintStyle: DocumentTypeDataStyle.customTextStyle(context),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFFC9C9C9),width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:Colors.grey.shade200,width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              icon: Center(
                                child: Icon(
                                  Icons.search,
                                  size: IconSize.I18,
                                  color:  ColorManager.greylight,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                      ),

                    ),

                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CustomDropdownTextField(
                //       width: 150,
                //       isAstric:false,
                //       // Adjust headText based on depId
                //       initialValue: 'Employee Type',
                //       headText: "", // Default fallback if depId doesn't match any of the expected values
                //       items: ['Employee 1','Employee 2','Employee 3'],
                //       onChanged: (newValue) {
                //         // for (var a in snapshot.data!) {
                //         //   if (a.empType == newValue) {
                //         //     clinicialName = a.empType!;
                //         //     clinicalId = a.employeeTypesId!;
                //         //     print("Dept ID'''''' ${clinicalId}");
                //         //     print("';';';''''''''Dept ID ${clinicialName}");
                //         //     // Do something with docType
                //         //   }
                //         // }
                //       },
                //     ),
                //     CustomDropdownTextField(
                //       width:150,
                //       isAstric:false,
                //       // Adjust headText based on depId
                //       initialValue: 'Clinician Type',
                //       headText: "", // Default fallback if depId doesn't match any of the expected values
                //       items: ['Clinical 1','Clinical 2','Clinical 3'],
                //       onChanged: (newValue) {
                //         // for (var a in snapshot.data!) {
                //         //   if (a.empType == newValue) {
                //         //     clinicialName = a.empType!;
                //         //     clinicalId = a.employeeTypesId!;
                //         //     print("Dept ID'''''' ${clinicalId}");
                //         //     print("';';';''''''''Dept ID ${clinicialName}");
                //         //     // Do something with docType
                //         //   }
                //         // }
                //       },
                //     ),
                //     Container(
                //       decoration: BoxDecoration(
                //           border:  Border.all(color: Color(0xFFC9C9C9), width: 0.86),
                //           borderRadius: BorderRadius.all(
                //               Radius.circular(8))
                //       ),
                //       // child:buildDropdownButton(context),
                //       child: CustomDropdownTextField(
                //         width:100,
                //         height: 32,
                //         isAstric:false,
                //         // Adjust headText based on depId
                //         initialValue: 'Filter by',
                //         headText: "", // Default fallback if depId doesn't match any of the expected values
                //         items: ['Weekly','Monthly',],
                //         onChanged: (newValue) {
                //           // for (var a in snapshot.data!) {
                //           //   if (a.empType == newValue) {
                //           //     clinicialName = a.empType!;
                //           //     clinicalId = a.employeeTypesId!;
                //           //     print("Dept ID'''''' ${clinicalId}");
                //           //     print("';';';''''''''Dept ID ${clinicialName}");
                //           //     // Do something with docType
                //           //   }
                //           // }
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),

            SizedBox(height: 30,),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) { return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
                    child: SchedularContainerConst(
                      height: 90,
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Container(
                                    width: AppSize.s88,
                                    height: AppSize.s20,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFE3F2F8),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),),
                                    child: Center(
                                      child: Text(
                                          'Wound',
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(
                                              color: Color(0xFFE1696C8),
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w600)),
                                    )),
                              ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(60),
                                              child: SizedBox(
                                                width: AppSize.s40,
                                                height: AppSize.s45,
                                                child: Image.asset(
                                                  'images/hr_dashboard/man.png', // Replace with your image path
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: AppSize.s7),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Jeh Tiwari',
                                            style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w700,
                                              color: ColorManager.mediumgrey,),
                                          ),
                                          SizedBox(height: AppSize.s5),
                                          Text(
                                            'Anxiety',
                                            style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.mediumgrey,),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 3,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButtonRow(
                                      onSaveClosePressed: () {
                                        // Action for Save and Close button
                                        print('Save and Close pressed');
                                      },
                                      onSubmitPressed: () {
                                        // Action for Submit button
                                        print('Submit pressed');
                                      },
                                      onNextPressed: () {
                                        // Action for Next button
                                        print('Next pressed');
                                      },
                                    )
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text("Kaiser Med Advantage ",
                                      style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.mediumgrey,),),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xFF527FB9).withOpacity(0.5),
                                    //     borderRadius: BorderRadius.circular(2), // Makes the borders curved with radius 5
                                    //   ),
                                    //   // color: Color(0xFF527FB9).withOpacity(0.5),
                                    //   width: 22,
                                    //   height: 20,
                                    //   child: Center(
                                    //     child: Text("ST",style: TextStyle(
                                    //       fontWeight: FontWeight.w700,
                                    //       fontSize: 12,
                                    //       color: ColorManager.white,
                                    //       decoration: TextDecoration.none,
                                    //     ),),
                                    //   ),
                                    // ),
                                    // SizedBox(width: 15,),
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xFFFEBD4D).withOpacity(0.5),
                                    //     borderRadius: BorderRadius.circular(2), // Makes the borders curved with radius 5
                                    //   ),
                                    //   width: 22,
                                    //   height: 20,
                                    //   child: Center(
                                    //     child: Text(
                                    //       "OT",
                                    //       style: TextStyle(
                                    //         fontWeight: FontWeight.w700,
                                    //         fontSize: 12,
                                    //         color: ColorManager.white,
                                    //         decoration: TextDecoration.none,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("San Josaquin z3",
                                      style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.mediumgrey,),),

                                    SizedBox(height: AppSize.s5),
                                    Text("58244",
                                      style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.mediumgrey,),),
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: Row(
                              //     children: [
                              //       Container(
                              //         width: 25,
                              //         height: 15,
                              //         decoration: BoxDecoration(
                              //             color: Color(0xFFE3F2F8),
                              //             borderRadius: BorderRadius.circular(3)
                              //         ),
                              //         child: Center(
                              //           child: Text("PB",style: TextStyle(
                              //             fontWeight: FontWeight.w700,
                              //             fontSize: 12,
                              //             color: ColorManager.bluebottom,
                              //             decoration: TextDecoration.none,
                              //           ),),
                              //         ),
                              //       )
                              //       // Image.asset("images/sm/pb.png", //width: 22,
                              //       //   height: 20,)
                              //     ],
                              //   ),
                              // ),


                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                            SizedBox(height: AppSize.s5),
                                            Text("SOC Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                          ],),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                            SizedBox(height: AppSize.s5),
                                            Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                          ],)
                                        // Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                        // // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
                                        // Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),

                                      ],
                                    ),

                                    // SizedBox(height: AppSize.s5),
                                    // Row(
                                    //   children: [
                                    //     Text("SOC Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                    //     // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
                                    //     Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                    //
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Image.asset("images/sm/contact_text.png",height: 60,)
                                      ,onTap:(){},),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Image.asset("images/sm/i_circle.png",height: 60,)
                                      ,onTap: (){},),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: SizedBox(
                                          width: AppSize.s40,
                                          height: AppSize.s45,
                                          child: Image.asset(
                                            'images/hr_dashboard/man.png', // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.s10,),
                                    Row(
                                      children: [
                                        Container(
                                          width: AppSize.s50,
                                          height: AppSize.s25,
                                          child: ElevatedButton(
                                            onPressed: (){},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:Color(0xffB4DB4C),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: Text(
                                              'RN',
                                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s10,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.white,),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.s5,),
                                        Text("Pending")
                                      ],

                                    ),
                                  ],
                                ),
                                // child: Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Column(
                                //       children: [
                                //         for (int i = 0; i < RandomImages.length; i++)
                                //           Align(
                                //             widthFactor: 0.5,
                                //             // parent circle avatar.
                                //             // We defined this for better UI
                                //             child: CircleAvatar(
                                //               radius: 20,
                                //               backgroundColor: Colors.white,
                                //               // Child circle avatar
                                //               child: CircleAvatar(
                                //                 radius: 20,
                                //                 backgroundImage: NetworkImage(RandomImages[i]),
                                //               ),
                                //             ),
                                //           ),
                                //       ],
                                //     ),
                                //     Row(
                                //       children: [
                                //         CustomButtonColumn(
                                //           onSaveClosePressed: () {
                                //             // Action for Save and Close button
                                //             print('Save and Close pressed');
                                //           },
                                //           onSubmitPressed: () {
                                //             // Action for Submit button
                                //             print('Submit pressed');
                                //           },
                                //           onNextPressed: () {
                                //             // Action for Next button
                                //             print('Next pressed');
                                //           },
                                //         )
                                //       ],
                                //     ),
                                //
                                //   ],
                                // ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ); },

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownButton(BuildContext context) {
    final Map<String, String> displayTextMap = {
      'Sort': 'Filter by',
      'Opened': 'Opened',
      'Notopen': 'Not Opened',
      'Partial': 'Partial',
      'Completed': 'Completed',
    };

    return Column(
      children: [
        DropdownButton2<String>(
          value: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
              //filterData();
            });
          },
          style: AllPopupHeadings.customTextStyle(context),
          iconStyleData:  IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorManager.mediumgrey,
            ),
          ),
          // iconSize: 20,
          underline: const SizedBox(),
          buttonStyleData: ButtonStyleData(
            height: 32,
            width: 130,
            padding:
            const EdgeInsets.symmetric(horizontal: 8), // Internal padding.
            elevation: 2, // Shadow depth.
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border.all(color: const Color(0xff50B5E5), width: 1.2),
            //   borderRadius: BorderRadius.circular(12.0),
            //   // boxShadow: [
            //   //   BoxShadow(
            //   //     color: const Color(0xff000000).withOpacity(0.25),
            //   //     blurRadius: 2,
            //   //     offset: const Offset(0, 2),
            //   //   ),
            //   // ],
            // ),
            overlayColor: WidgetStateProperty.all(
                Colors.grey.withOpacity(0.1)), // Background color when pressed.
          ),

          /// buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
          // dropdownMaxHeight: 200,
          // dropdownDecoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(12),
          //   color: Colors.white,
          // ),
          // itemPadding: const EdgeInsets.symmetric(horizontal: 8), // Updated padding
          selectedItemBuilder: (context) =>
              displayTextMap.keys.map((String value) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(displayTextMap[value]!),
                );
              }).toList(),
          items: displayTextMap.keys.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(displayTextMap[value]!),
            );
          }).toList(),
        ),
      ],
    );
  }
}


//SchedularContainerConst(
//                       height: 80,
//
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                             children:[
//                               Container(
//                                   width: AppSize.s88,
//                                   height: AppSize.s20,
//                                   decoration: BoxDecoration(
//                                     color:Color(0xFFE3F2F8),
//                                     borderRadius: BorderRadius.only(
//                                         topRight:
//                                         Radius.circular(12)),),
//                                   child: Center(
//                                     child: Text(
//                                          'Chart #1',
//                                         textAlign: TextAlign.center,
//                                         style: CustomTextStylesCommon.commonStyle(
//                                             color: Color(0xFFE1696C8),
//                                             fontSize: FontSize.s12,
//                                             fontWeight: FontWeight.w600)),
//                                   )),
//                             ]
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5),
//                                             child: ClipRRect(
//                                               borderRadius: BorderRadius.circular(60),
//                                               child: SizedBox(
//                                                 width: AppSize.s45,
//                                                 height: AppSize.s50,
//                                                 child: Image.asset(
//                                                   'images/hr_dashboard/man.png', // Replace with your image path
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(width: AppSize.s7),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Jeh Tiwari',
//                                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                               fontWeight: FontWeight.w700,
//                                               color: ColorManager.mediumgrey,),
//                                           ),
//                                           SizedBox(height: AppSize.s5),
//                                           Text(
//                                             'Anxiety',
//                                             style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorManager.mediumgrey,),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               Expanded(
//                                 flex: 3,
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
//                                     SizedBox(width: 15,),
//                                     Container(
//                                       width: 230,
//                                       child:Text("Tufts International Center, 20 Sawyer Ave, Medford MA 02155",
//                                         textAlign: TextAlign.start,
//                                         style:DocDefineTableDataID.customTextStyle(context),
//                                       ) ,
//                                     )
//                                   ],
//                                 ),
//                               ),
//
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF692A8),
//                                           borderRadius: BorderRadius.circular(5), // Makes the borders curved with radius 5
//                                         ),
//                                         width: 22,
//                                         height: 20,
//                                         child: Center(
//                                           child: Text(
//                                             "PT",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 12,
//                                               color: ColorManager.white,
//                                               decoration: TextDecoration.none,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF8E3F8).withOpacity(0.5),
//                                           borderRadius: BorderRadius.circular(5), // Makes the borders curved with radius 5
//                                         ),
//                                         width: 22,
//                                         height: 20,
//                                         child: Center(
//                                           child: Text(
//                                             "A+",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 12,
//                                               color:  Color(0xFFC416C8),
//                                               decoration: TextDecoration.none,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
//                                     // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                     Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
//                                   ],
//                                 ),
//                               ),
//
//
//                               // Row(
//                               //   children: [
//                               //     Padding(
//                               //         padding: const EdgeInsets.only(right: 0),
//                               //         child: Image.asset("images/sm/contact.png",height: 50,width: 60,)
//                               //     ),
//                               //     Padding(
//                               //       padding: const EdgeInsets.all(8.0),
//                               //       child: Container(
//                               //           decoration: BoxDecoration(
//                               //             borderRadius:
//                               //             BorderRadius.circular(8),
//                               //             color:Color(0xFFDCEFF7) ,
//                               //           ),
//                               //           height:40,
//                               //           width: 40,
//                               //
//                               //           child: Icon(Icons.edit,color: ColorManager.bluebottom,)),
//                               //     ),
//                               //   ],
//                               // ),
//
//                               Expanded(
//                                 flex: 3,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//
//                                     SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
//                                     SizedBox(width: 15,),
//                                     Icon(Icons.edit_outlined,color: ColorManager.bluebottom,),
//                                     // Container(
//                                     //     width: 200,
//                                     //     height: 55,
//                                     //     child:Row(
//                                     //       children: [
//                                     //         Container(
//                                     //           width: 100,
//                                     //           child:  ElevatedButton.icon(onPressed: ()async{
//                                     //             await  showDialog(
//                                     //               context: context,
//                                     //               builder: (BuildContext context) {
//                                     //                 return VendorSelectNoti(
//                                     //                   message: 'Please Select A File',
//                                     //                 );
//                                     //               },
//                                     //             );
//                                     //           },label: Text("Auto", style: TextStyle(
//                                     //             fontSize: FontSize.s13,
//                                     //             fontWeight: FontWeight.w600,
//                                     //             color: ColorManager.white,
//                                     //             decoration: TextDecoration.none,
//                                     //           )),
//                                     //             //icon: Icon(Icons.flash_auto,color:ColorManager.white ,size: 16,),
//                                     //           icon: Image.asset("images/sm/auto.png",height: 30,width: 18,),
//                                     //             style: ElevatedButton.styleFrom(
//                                     //               backgroundColor:  ColorManager.bluebottom,
//                                     //               shape: RoundedRectangleBorder(
//                                     //                 borderRadius: BorderRadius.only(
//                                     //                   topLeft: Radius.circular(12), // Round only the top-left corner
//                                     //                   bottomLeft: Radius.circular(12), // Round only the bottom-left corner
//                                     //                 ),
//                                     //                 side: BorderSide(
//                                     //                   color: Color(0xFF0A74DA), // Border color
//                                     //                   width: 1,
//                                     //                 ),
//                                     //               ),
//                                     //             ),
//                                     //           ),
//                                     //         ),
//                                     //         Container(
//                                     //           width: 100,
//                                     //           child:  ElevatedButton.icon(onPressed: (){
//                                     //             showDialog(
//                                     //               context: context,
//                                     //               builder: (BuildContext context) {
//                                     //                 return AddErrorPopup(
//                                     //                   message: 'File is too large!',
//                                     //                 );
//                                     //               },
//                                     //             );
//                                     //           },label: Text("Manual", style: TextStyle(
//                                     //             fontSize: FontSize.s13,
//                                     //             fontWeight: FontWeight.w600,
//                                     //             color: ColorManager.bluebottom,
//                                     //             decoration: TextDecoration.none,
//                                     //           )),
//                                     //             //icon: Icon(Icons.swipe_rounded,color:ColorManager.bluebottom ,size: 16,),
//                                     //              icon: Image.asset("images/sm/manual.png",height: 30,width: 18,),
//                                     //             style: ElevatedButton.styleFrom(
//                                     //               backgroundColor: Colors.white,
//                                     //               shape: RoundedRectangleBorder(
//                                     //                 borderRadius: BorderRadius.only(
//                                     //                   topRight: Radius.circular(12), // Round only the top-left corner
//                                     //                   bottomRight: Radius.circular(12), // Round only the bottom-left corner
//                                     //                 ),
//                                     //                 side: BorderSide(
//                                     //                   color: Color(0xFF0A74DA), // Border color
//                                     //                   width: 1,
//                                     //                 ),
//                                     //               ),
//                                     //             ),
//                                     //           ),
//                                     //         ),
//                                     //
//                                     //
//                                     //       ],
//                                     //     )
//                                     // )
//                                     SizedBox(width: 15,),
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 0),
//                                         child: Row(
//                                           children: [
//                                             Stack(
//
//                                               children: [ClipRRect(
//                                                 borderRadius: BorderRadius.circular(60),
//                                                 child: SizedBox(
//                                                   width: AppSize.s45,
//                                                   height: AppSize.s50,
//                                                   child: Image.asset(
//                                                     'images/1.png', // Replace with your image path
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                                 Positioned(
//                                                   left:22,
//                                                   bottom :0,
//                                                   child: Container(
//                                                     color: Color(0xFF527FB9),
//                                                     width: 19,
//                                                     height: 19,
//                                                     child: Center(
//                                                       child: Text("ST",style: TextStyle(
//                                                         // fontWeight: FontWeight.w600,
//                                                         // fontSize: FontSize.s13,
//                                                         color: ColorManager.white,
//                                                         decoration: TextDecoration.none,
//                                                       ),),
//                                                     ),
//                                                   ),)
//                                               ],
//                                             ),
//                                             SizedBox(width: AppSize.s7),
//                                             Text(
//                                               'John Smith',
//                                               style:DocumentTypeDataStyle.customTextStyle(context),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
