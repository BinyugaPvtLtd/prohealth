import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/roc_page.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../widgets/app_clickable_widget.dart';
import '../../../../../../em_module/company_identity/widgets/ci_tab_widget/widget/upper_menu_buttons.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../sm_Intake/intake_main_screen.dart';
import '../../sm_scheduler_screen_const.dart';

class SchedularPendingPatientDetails extends StatefulWidget {
  final VoidCallback onMergeBackPressed;
   SchedularPendingPatientDetails({super.key, required this.onMergeBackPressed});

  @override
  State<SchedularPendingPatientDetails> createState() => _SchedularPendingPatientDetailsState();
}

class _SchedularPendingPatientDetailsState extends State<SchedularPendingPatientDetails> {
  final PageController _tabPageController = PageController();

  int _selectedIndex = 0;

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabPageController.jumpToPage(
      index,
      // duration: Duration(milliseconds: 500),
      // curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 70, top: 20),
      child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: widget.onMergeBackPressed,
                            child: Icon(
                              Icons.arrow_back,
                              size: IconSize.I16,
                              color: ColorManager.mediumgrey,
                            )),
                        SizedBox(width: 20,),
                        Text("Patients Details",
                          style: TextStyle(
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.mediumgrey,
                        ),)
                      ],
                    ),
                    CustomElevatedButton(
                      width: AppSize.s105,
                      height: AppSize.s30,
                      text: "Submit",
                      color: ColorManager.bluebottom,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(width: AppSize.s12),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Jeh Tiwari',
                            style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),
                          ),
                          SizedBox(height: AppSize.s5),
                          Text(
                            'MRN #584234',
                            style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                              fontWeight: FontWeight.w400,
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
                    ),
                    Expanded(
                      flex: 3,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonRow(
                            onSaveClosePressed: (){},
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
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Icon(Icons.location_on_outlined,size: IconSize.I18,color: ColorManager.bluebottom,),
                          SizedBox(width: 15,),
                          Flexible(
                            child: Text(
                              "132 My Street,Lane no 123,  Sacramento 12401",
                              textAlign: TextAlign.start,
                              style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.textBlack,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(height: 2,),
                SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Preferred Date: 2024/12/01 & Time: 12:00 pm",
                //     style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                //       fontWeight: FontWeight.w400,
                //       color: ColorManager.textBlack,),),
                //   ],
                // ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 250,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SMTabbarscheduler(onTap: (int index){
                              _selectButton(0);
                            }, index: 0, grpIndex: _selectedIndex, heading: "RN SOC", ),
                          ),
                          Expanded(
                            child: SMTabbarscheduler(onTap: (int index){
                              _selectButton(1);
                            }, index: 1, grpIndex: _selectedIndex, heading: "PT"),
                          ),
                          Expanded(
                            child: SMTabbarscheduler(onTap: (int index){
                              _selectButton(2);
                            }, index: 2, grpIndex: _selectedIndex, heading: "OT"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                      child: NonScrollablePageView(
                        controller: _tabPageController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        children: [
                          RNSOCPageview(),
                                PTPageview(),
                              OTPageview(),
                        ],
                      ),
                    ),

                    // Expanded(
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 70),
                    //     child: NonScrollablePageView(
                    //       controller: _tabPageController,
                    //       onPageChanged: (index) {
                    //         setState(() {
                    //           _selectedIndex = index;
                    //         });
                    //       },
                    //       children: [
                    //         PendingPageView(onAutoTap: (){})
                    //        // RNSOCPageview(),
                    //         // PTPageview(),
                    //         // OTPageview(),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}















///scheduler
class SMTabbarscheduler extends StatelessWidget {
  const SMTabbarscheduler({
    super.key,
    required this.onTap,
    required this.index,
    required this.grpIndex,
    required this.heading,
    this.badgeNumber,
    this.width,
  });

  final OnManuButtonTapCallBack onTap;
  final int index;
  final int grpIndex;
  final String heading;
  final int? badgeNumber;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppClickableWidget(
      onTap: () {
        onTap(index);
      },
      onHover: (bool val) {},
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                //color: Colors.red,
                width: width ?? 170,
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    heading,
                    style: schedulerBgTabbar.customTextStyle(grpIndex, index),
                  ),
                ),
              ),
              if (badgeNumber != null) // Only show badge if badgeNumber is not null
                Positioned(
                  right: -5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                    decoration: BoxDecoration(
                      color: ColorManager.blueprime, // Badge color
                      borderRadius: BorderRadius.circular(12), // Rounded badge
                    ),
                    child: Text(
                      badgeNumber!.toString(),
                      style: TextStyle(
                        fontSize: FontSize.s10, // Adjust font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Badge text color
                      ),
                    ),
                  ),
                ),
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(
                  text: heading,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();

              final textWidth = textPainter.size.width;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                height: 2,
                width: textWidth + 80, // Adjust padding around text
                color: grpIndex == index
                    ? ColorManager.blueprime
                    : Colors.transparent,
              );
            },
          ),
        ],
      ),
    );
  }
}

///Tabbar with transparent BG
class schedulerBgTabbar {
  static TextStyle customTextStyle(int selectedIndex, int currentIndex) {
    return TextStyle(
      fontSize: FontSize.s14,
      fontWeight: selectedIndex == currentIndex
          ? FontWeight.w700
          : FontWeight.w700,
      color: selectedIndex == currentIndex
          ? ColorManager.blueprime
          : ColorManager.blueprime,
      decoration: TextDecoration.none,
    );
  }
}