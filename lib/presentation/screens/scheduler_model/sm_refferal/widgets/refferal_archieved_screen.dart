import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalArchievedScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  const RefferalArchievedScreen({super.key, required this.onEyeButtonPressed});

  @override
  State<RefferalArchievedScreen> createState() => _RefferalArchievedScreenState();
}

class _RefferalArchievedScreenState extends State<RefferalArchievedScreen> {
  bool _isFilterOpen = false; // Track filter panel state

  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen;
    });
  }
  List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60,right: 45, top: 5,bottom: 10),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
                  Row(
                    children: [
                      CustomSearchFieldSM(
                        width: 440,
                        onPressed: (){},
                      ),
                      SizedBox(width: AppSize.s20,),
                      IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _toggleFilter,
                        icon: Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       height: AppSize.s30,
                  //       child: CustomIconButton(
                  //         color: ColorManager.bluebottom,
                  //         icon: Icons.add,
                  //         textWeight: FontWeight.w600,
                  //         textSize: FontSize.s11,
                  //         text: "Add Refferal",
                  //         onPressed: ()async{},
                  //       ),
                  //     ),
                  //     SizedBox(width: AppSize.s10,),
                  //     SmDropdownConst(
                  //       height: AppSize.s30,
                  //       width:AppSize.s150,
                  //       isAstric:false,
                  //       // Adjust headText based on depId
                  //       initialValue: 'Office',
                  //       headText: "", // Default fallback if depId doesn't match any of the expected values
                  //       items: ['Office 1','Office 2','Office 3'],
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
                  //     SizedBox(width: AppSize.s10,),
                  //     SmDropdownConst(
                  //       height: AppSize.s30,
                  //       width:AppSize.s150,
                  //       isAstric:false,
                  //       // Adjust headText based on depId
                  //       initialValue: 'All',
                  //       headText: "", // Default fallback if depId doesn't match any of the expected values
                  //       items: ['All','Referral App','E-Fax','E-Referrals','Manual',],
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
                  //
                  //   ],
                  // ),
              //   ],
              // ),
              SizedBox(height: AppSize.s20,),
              Row(
                children: [
                  Text("Received Date", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s15,),
                   Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s15,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8,),
                        child: Container(
                          height: 75,
                          // decoration:  BoxDecoration(
                          //   color: ColorManager.white,
                          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                          //   border: Border(
                          //     bottom: BorderSide(
                          //       color: Colors.grey.shade200,
                          //       width: 3,
                          //     ),
                          //     left: BorderSide(
                          //       color: Colors.grey.shade200,
                          //       width: 3,
                          //     ),
                          //     right: BorderSide(
                          //       color: Colors.grey.shade200,
                          //       width: 3,
                          //     ),
                          //   ),
                          // ),
                         decoration:  BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),topLeft: Radius.circular(12),topRight: Radius.circular(12)),
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
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ///condition wise
                              // Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     crossAxisAlignment: CrossAxisAlignment.end,
                              //     children:[
                              //       Container(
                              //           width: AppSize.s99,
                              //           height: AppSize.s15,
                              //           decoration: BoxDecoration(
                              //             color:Color(0xFFFFE4E2),
                              //             borderRadius: BorderRadius.only(
                              //                 topRight:
                              //                 Radius.circular(12)),),
                              //           child: Center(
                              //             child: Text(
                              //                 'Potencial Duplicate',
                              //                 textAlign: TextAlign.center,
                              //                 style: CustomTextStylesCommon.commonStyle(
                              //                     color: ColorManager.mediumgrey,
                              //                     fontSize: FontSize.s11,
                              //                     fontWeight: FontWeight.w400)),
                              //           )),
                              //     ]
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(60),
                                            child: SizedBox(
                                              width: AppSize.s45,
                                              height: AppSize.s45,
                                              child: Image.asset(
                                                'images/1.png', // Replace with your image path
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSize.s12),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "John smith",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                              SizedBox(height: AppSize.s4,),
                                              Text(
                                                "Referral Date: 09/15/2024",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                              SizedBox(height: AppSize.s2,),
                                              Text(
                                                "08/05/24  |  04:20 PM",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: AppSize.s35),
                                          Row(
                                            children: [
                                              Text("By Ross Geller",style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.mediumgrey,),),
                                              SizedBox(width: AppSize.s35),
                                              Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 50,),

                                  // Expanded(
                                  //   flex: 2,
                                  //   child: Row(
                                  //     children: [
                                  //       Text("By Ross Geller",style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  //         fontWeight: FontWeight.w600,
                                  //         color: ColorManager.mediumgrey,),),
                                  //       Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
                                  //     ],
                                  //   ),
                                  // ),

                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Referral Source: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Sunshine Hospital",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "PCP: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Sam Johnson",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s15),
                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Primary Diagnosis: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Migraine",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s15),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Image.asset("images/logo.png",width: 105,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
                                          SizedBox(width: AppSize.s30),
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(60),
                                            child: SizedBox(
                                              width: AppSize.s45,
                                              height: AppSize.s45,
                                              child: Image.asset(
                                                'images/1.png', // Replace with your image path
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSize.s15),
                                          Text(
                                            "Sophia Scott",
                                            textAlign: TextAlign.center,
                                            style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w700,
                                              color: ColorManager.mediumgrey,),
                                          ),
                                          SizedBox(width: AppSize.s15),
                                          InkWell(
                                            onTap: () async {
                                              try {
                                                widget.onEyeButtonPressed();
                                              }
                                              catch (e){
                                                print("Error: $e");
                                              }
                                            },
                                            child: Container(
                                              width: AppSize.s45,
                                              height: AppSize.s40,
                                              child: Image.asset(
                                                'images/eye.png',
                                                height: AppSize.s15,
                                                width: AppSize.s22,
                                                color: ColorManager.bluebottom,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSize.s15),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                  hoverColor: Colors.transparent,
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: (){},
                                                  child : Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                              SizedBox(height: 8,),
                                              Text("Call",
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s10,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.bluebottom,),)
                                            ],
                                          ),
                                          SizedBox(width: AppSize.s20),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("images/sm/sm_refferal/Restore.png",height: 16,width: 18,color: ColorManager.bluebottom,),
                                               SizedBox(height: 6,),
                                              Text("Restore",
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s10,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.bluebottom,),)
                                            ],
                                          ),
                                          SizedBox(width: AppSize.s20),
                                        ],
                                      ))

                                  // Expanded(
                                  //   flex: 3,
                                  //   child: Row(
                                  //     children: [
                                  //       Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
                                  //       SizedBox(width: AppSize.s15,),
                                  //       Container(
                                  //         child:Text("132 My Street,Kingston, New York 12401",
                                  //           textAlign: TextAlign.start,
                                  //           style:DocDefineTableDataID.customTextStyle(context),
                                  //         ) ,
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  //
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
                                  //           child: Text("ST",style: TextStyle(
                                  //             fontWeight: FontWeight.w700,
                                  //             fontSize: 12,
                                  //             color: ColorManager.bluebottom,
                                  //             decoration: TextDecoration.none,
                                  //           ),),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   flex: 2,
                                  //   child: Row(
                                  //     children: [
                                  //       Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                  //       // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
                                  //       Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
                                  //     ],
                                  //   ),
                                  // ),

                                  ///dont delete
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Row(
                                  //     children: [
                                  //       GestureDetector(
                                  //         onTap: () => _makeCall(phoneNumber),
                                  //         child: SvgPicture.asset(
                                  //           "images/sm/contact_s.svg",
                                  //           height: 30,
                                  //           width: 20,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  //
                                  // Expanded(
                                  //   flex: 2,
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Row(
                                  //         // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                  //         // crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text("Auto assigned on 2024/12/08 |",style: DocDefineTableData.customTextStyle(context),),
                                  //           // Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),
                                  //         ],
                                  //       ),
                                  //       Row(
                                  //         // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                  //         // crossAxisAlignment: CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text("10:00 AM ",style: DocDefineTableData.customTextStyle(context),),
                                  //
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              //Container(height: AppSize.s15,),
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
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          right: _isFilterOpen ? 0 : -220, // Slide in/out effect
          top: 0,
          bottom: 10,
          child: Container(
            width: 200,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Filter Options", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Divider(),
                // Example filter fields
                Text("Status"),
                DropdownButton<String>(
                  items: ["All", "Pending", "Approved"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {},
                ),
                SizedBox(height: 10),
                Text("Date Range"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Select Date"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
