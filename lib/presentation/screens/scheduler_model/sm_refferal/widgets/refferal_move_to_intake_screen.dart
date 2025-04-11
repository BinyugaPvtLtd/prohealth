import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalMoveToIntakeScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  const RefferalMoveToIntakeScreen({super.key, required this.onEyeButtonPressed});

  @override
  State<RefferalMoveToIntakeScreen> createState() => _RefferalMoveToIntakeScreenState();
}

class _RefferalMoveToIntakeScreenState extends State<RefferalMoveToIntakeScreen> {
  bool _isFilterOpen = false; // Track filter panel state

  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen; // Toggle panel visibility
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: 15,)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              Row(
                children: [
                  Text("Received Date",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s45,),
                  Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s45,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s15,),
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
                        padding: const EdgeInsets.symmetric(vertical: 8,),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:[
                                    Container(
                                        width: AppSize.s99,
                                        height: AppSize.s15,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFFFE4E2),
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                              Radius.circular(12)),),
                                        child: Center(
                                          child: Text(
                                              'Potential Duplicate',
                                              textAlign: TextAlign.center,
                                              style: CustomTextStylesCommon.commonStyle(
                                                  color: ColorManager.mediumgrey,
                                                  fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400)),
                                        )),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
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
                                                "Referral Date : 09/15/2024",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: AppSize.s40),
                                          Text("Ch #1",style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.textBlack,)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 25,),
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
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [

                                        Image.asset('images/logo_login.png',width: 100,),
                                        // Text("Manual",style: DocDefineTableData.customTextStyle(context),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Row(
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
                                              width: AppSize.s40,
                                              height: AppSize.s45,
                                              child: Image.asset(
                                                'images/eye.png',
                                                height: AppSize.s15,
                                                width: AppSize.s22,
                                                color: ColorManager.bluebottom,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSize.s10),
                                          IconButton(
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onPressed: (){},
                                              icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                          SizedBox(width: AppSize.s10),
                                          PopupMenuButton<String>(
                                            splashRadius: 0,
                                            onSelected: (value) {
                                              if (value == 'Option 1') {
                                                widget.onEyeButtonPressed;
                                                print('Option 1 Selected');
                                              } else if (value == 'Option 2') {
                                                print('Option 2 Selected');
                                              }
                                            },
                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: 'Option 1',
                                                child: Text('Option 1'),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Option 2',
                                                child: Text('Option 2'),
                                              ),
                                            ],
                                            child: Icon(Icons.more_vert),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              Container(height: AppSize.s12,),
                            ],
                          ),
                        ),
                      ); },

                  ),
                ),
              ),
              // Expanded(
              //   child: ScrollConfiguration(
              //     behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              //     child: ListView.builder(
              //       itemCount: 5,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
              //           child: Container(
              //             height: 75,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(12),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.grey.withOpacity(0.6),
              //                   spreadRadius: 0,
              //                   blurRadius: 4,
              //                   offset: const Offset(0, 2),
              //                 ),
              //               ],
              //             ),
              //             child: Column(
              //               children: [
              //                 Row(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     crossAxisAlignment: CrossAxisAlignment.end,
              //                     children:[
              //                       Container(
              //                           width: AppSize.s99,
              //                           height: AppSize.s20,
              //                           decoration: BoxDecoration(
              //                             color:Color(0xFFFFE4E2),
              //                             borderRadius: BorderRadius.only(
              //                                 topRight:
              //                                 Radius.circular(12)),),
              //                           child: Center(
              //                             child: Text(
              //                                 'Potencial Duplicate',
              //                                 textAlign: TextAlign.center,
              //                                 style: CustomTextStylesCommon.commonStyle(
              //                                     color: ColorManager.mediumgrey,
              //                                     fontSize: FontSize.s11,
              //                                     fontWeight: FontWeight.w400)),
              //                           )),
              //                     ]
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Expanded(
              //                       flex: 2,
              //                       child: Padding(
              //                         padding: const EdgeInsets.only(left: 30.0),
              //                         child: Row(
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.circular(60),
              //                               child: SizedBox(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s50,
              //                                 child: Image.asset(
              //                                   'images/1.png', // Replace with your image path
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: AppSize.s12),
              //                             Column(
              //                               crossAxisAlignment: CrossAxisAlignment.start,
              //                               mainAxisAlignment: MainAxisAlignment.center,
              //                               children: [
              //                                 Text(
              //                                   "John smith",
              //                                   textAlign: TextAlign.center,
              //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                                     fontWeight: FontWeight.w700,
              //                                     color: ColorManager.mediumgrey,),
              //                                 ),
              //                                 SizedBox(height: AppSize.s4,),
              //                                 Text(
              //                                   "Refferal Date: 09/15/2024",
              //                                   textAlign: TextAlign.center,
              //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                                     fontWeight: FontWeight.w400,
              //                                     color: ColorManager.mediumgrey,),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
              //                     ),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "Refferal Source: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Sunshine Hospital",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(width: 15,),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "PCP: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Sam Johnson",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "Primary Diagnosis: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Migraine",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(width: 15,),
              //                     Expanded(
              //                       flex: 1,
              //                       child: Row(
              //                         children: [
              //                       Image.asset("images/logo.png",width: 100,),
              //                         ],
              //                       ),
              //                     ),
              //
              //                     Expanded(
              //                         flex: 3,
              //                         child: Row(
              //                           children: [
              //                             Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
              //                             SizedBox(width: AppSize.s15),
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.circular(60),
              //                               child: SizedBox(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s50,
              //                                 child: Image.asset(
              //                                   'images/1.png', // Replace with your image path
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: AppSize.s7),
              //                             Text(
              //                               "Sophia Scott",
              //                               textAlign: TextAlign.center,
              //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                                 fontWeight: FontWeight.w700,
              //                                 color: ColorManager.mediumgrey,),
              //                             ),
              //                             SizedBox(width: AppSize.s7),
              //                             InkWell(
              //                               onTap: () async {
              //                                 try {
              //                                   widget.onEyeButtonPressed();
              //                                 }
              //                                 catch (e){
              //                                   print("Error: $e");
              //                                 }
              //                               },
              //                               child: Container(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s45,
              //                                 child: Image.asset(
              //                                   'images/eye.png',
              //                                   height: AppSize.s15,
              //                                   width: AppSize.s22,
              //                                   color: ColorManager.bluebottom,
              //                                 ),
              //                               ),
              //                             ), SizedBox(width: AppSize.s7),
              //                             IconButton(
              //                                 hoverColor: Colors.transparent,
              //                                 splashColor: Colors.transparent,
              //                                 highlightColor: Colors.transparent,
              //                                 onPressed: (){},
              //                                 icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
              //                             SizedBox(width: AppSize.s7),
              //                             IconButton(
              //                                 hoverColor: Colors.transparent,
              //                                 splashColor: Colors.transparent,
              //                                 highlightColor: Colors.transparent,
              //                                 onPressed: (){}, icon: Icon(Icons.more_vert,color: ColorManager.mediumgrey,))
              //                           ],
              //                         ))
              //
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ); },
              //
              //     ),
              //   ),
              // ),
            ],
          ),
        ),

        // Sliding Filter Panel
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
