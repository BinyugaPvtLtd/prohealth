import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalMoveToIntakeScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  final VoidCallback onMergeDuplicatePressed;
  const RefferalMoveToIntakeScreen({super.key, required this.onEyeButtonPressed, required this.onMergeDuplicatePressed});

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

  bool _MContainerVisible = false;
  bool _OContainerVisible = false;
  bool _RContainerVisible = false;
  bool _AContainerVisible = false;
  bool _IContainerVisible = false;
  bool _ICContainerVisible = false;
  bool _PContainerVisible = false;

  TextEditingController assigndatecontroller = TextEditingController();

  void toggleContainerM() {
    setState(() {
      _MContainerVisible = !_MContainerVisible;
    });
  }
  void toggleContainerO() {
    setState(() {
      _OContainerVisible = !_OContainerVisible;
    });
  }
  void toggleContainerR() {
    setState(() {
      _RContainerVisible = !_RContainerVisible;
    });
  }
  void toggleContainerA() {
    setState(() {
      _AContainerVisible = !_AContainerVisible;
    });
  }
  void toggleContainerI() {
    setState(() {
      _IContainerVisible = !_IContainerVisible;
    });
  }
  void toggleContainerIC() {
    setState(() {
      _ICContainerVisible = !_ICContainerVisible;
    });
  }
  void toggleContainerP() {
    setState(() {
      _PContainerVisible = !_PContainerVisible;
    });
  }
  bool _isChecked = false;
  List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60,right: 60, top: 10,bottom: 10),
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
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: 18,width: 16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              Row(
                children: [
                  Text("Received Date",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s50,),
                  Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s50,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
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
                        padding: const EdgeInsets.symmetric(vertical: 7,),
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
                                        width: AppSize.s105,
                                        height: AppSize.s16,
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
                                              width: AppSize.s47,
                                              height: AppSize.s47,
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
                                              SizedBox(height: AppSize.s5,),
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
                                            color: ColorManager.textBlack,),
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
                                            style: DocDefineTableData.customTextStyle(context),
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
                                              width: AppSize.s20,
                                              height: AppSize.s25,
                                              child: SvgPicture.asset(
                                                'images/sm/sm_refferal/eye.svg', // make sure your file is in assets and listed in pubspec.yaml
                                                height: AppSize.s15,
                                                width: AppSize.s22,
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
                                          SizedBox(width: AppSize.s2),
                                          PopupMenuButton<String>(
                                            tooltip: '',
                                            splashRadius: 0,
                                            onSelected: (value) {
                                              if (value == 'Merge Duplicate') {
                                                Future.microtask(() {
                                                  widget.onMergeDuplicatePressed();
                                                });
                                              } else if (value == 'Archived') {
                                                Future.microtask(() {
                                                  print('Option 2 Selected');
                                                });
                                              }
                                            },
                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: 'Merge Duplicate',
                                                child: Text('Merge Duplicate'),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Archived',
                                                child: Text('Archived'),
                                              ),
                                            ],
                                            child: Icon(Icons.more_vert,color: ColorManager.mediumgrey,),
                                          ),
                                          SizedBox(width: AppSize.s10),
                                        ],
                                      ))
                                ],
                              ),
                              Container(height: AppSize.s8,),
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
        if (_isFilterOpen)
          GestureDetector(
            onTap: _toggleFilter,
            behavior: HitTestBehavior.translucent,
            child: Container(
              color: Colors.black.withOpacity(0.0), // Invisible but catches taps
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        // Sliding Filter Panel
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          right: _isFilterOpen ? -0 : -320, // Slide in/out effect
          top: 0,
          bottom: 0,
          child: Container(
            width: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: SingleChildScrollView(// Wrap the Column inside SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: _toggleFilter,
                          child: Row(
                            children: [
                              Icon(Icons.menu_open),
                              SizedBox(width: AppSize.s10),
                              Text(
                                "Filters",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        // TextButton(onPressed: (){}, child: Text("CLEAR ALL"))
                      ],
                    ),
                  ),
                  Divider(),
                  // Example filter fields
                  InkWell(
                    onTap:  toggleContainerM,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Marketer",
                            style: AllHRTableData.customTextStyle(context),),
                          Icon(
                            _MContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _MContainerVisible ? 0 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _MContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerO,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Received Date",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _OContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _OContainerVisible ? 0 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _OContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerR,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Referral Source",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _RContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _RContainerVisible ? 300 : 0,
                    width: 300,
                    // color: Colors.grey,
                    // alignment: Alignment.center,
                    child: _RContainerVisible
                        ?Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                            ),
                            //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          ),
                          onChanged: (value) {
                            // Handle search logic here (e.g., filtering options)
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       _isChecked = !_isChecked;  // Toggle checkbox state
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //    //   shape: BoxShape.,
                        //       color:  Colors.transparent, // Checked or unchecked background color
                        //       border: Border.all(color: Colors.blue), // Border color of the circle
                        //     ),
                        //     padding: EdgeInsets.all(10),
                        //     child: _isChecked
                        //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                        //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                        //   ),
                        // ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),


                      ],
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerA,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Agency",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _AContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _AContainerVisible ? 0 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _AContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerI,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Insurance",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _IContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _IContainerVisible ? 0 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _IContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerIC,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Insurance Category",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _ICContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _ICContainerVisible ? 310 : 0,
                    width: 300,
                    // color: Colors.blue,
                    // alignment: Alignment.center,
                    child: _ICContainerVisible
                        ?Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                            ),
                            //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          ),
                          onChanged: (value) {
                            // Handle search logic here (e.g., filtering options)
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       _isChecked = !_isChecked;  // Toggle checkbox state
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //    //   shape: BoxShape.,
                        //       color:  Colors.transparent, // Checked or unchecked background color
                        //       border: Border.all(color: Colors.blue), // Border color of the circle
                        //     ),
                        //     padding: EdgeInsets.all(10),
                        //     child: _isChecked
                        //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                        //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                        //   ),
                        // ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Medicare',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Private Med Advantage',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Kaiser',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Medi-Cal',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Private Commercial',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'LOA',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'ProBono',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Other',
                              style: DocDefineTableDataID.customTextStyle(context),
                            ),
                          ],
                        ),


                      ],
                    )
                        : null,
                  ),

                  Divider(),
                  InkWell(
                    onTap:  toggleContainerP,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Potential Discharge Date",
                              style: AllHRTableData.customTextStyle(context)),

                          Icon(
                            _PContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _PContainerVisible ? 100 : 0,
                    width: 300,
                    // color: Colors.blue,
                    // alignment: Alignment.center,
                    child: _PContainerVisible
                        ? Column(
                        children: [
                          TextField(
                            controller: assigndatecontroller,style: TextStyle(
                              fontSize: 14
                          ),

                            decoration: InputDecoration(
                              hintText: 'Date Range',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.calendar_month_outlined,size: 18,color: Colors.grey,),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            ),
                            onChanged: (value) {
                              // Handle search logic here (e.g., filtering options)
                            },

                            onTap: ()async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1901),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                assigndatecontroller.text =
                                "${pickedDate.toLocal()}".split(' ')[0];

                              }
                            },
                          ),
                        ]
                    )
                        : null,
                  ),
                  Divider(),
                  // Example filter fields
                  InkWell(
                    onTap:  toggleContainerM,
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Physician",
                              style: AllHRTableData.customTextStyle(context)),
                          Icon(
                            _MContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: ColorManager.mediumgrey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
