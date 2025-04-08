import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/pending_page.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/roc_page.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/onboarding/download_doc_const.dart';
import '../../../../../sm_Intake/intake_main_screen.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
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
    _tabPageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 70),
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
                    Expanded(
                      flex: 3,
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
                          SizedBox(width: 25,),
                          Text(
                            "132 My Street, Lane no 123,  Sacramento 12401",
                            textAlign: TextAlign.start,
                            style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.textBlack,),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Preferred Date: 2024/12/01 & Time: 12:00 pm",
                    style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.textBlack,),),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 300,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SMTabbar(onTap: (int index){
                            _selectButton(0);
                          }, index: 0, grpIndex: _selectedIndex, heading: "RN SOC", ),
                          SMTabbar(onTap: (int index){
                            _selectButton(1);
                          }, index: 1, grpIndex: _selectedIndex, heading: "PT"),
                          SMTabbar(onTap: (int index){
                            _selectButton(2);
                          }, index: 2, grpIndex: _selectedIndex, heading: "OT"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 70),
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
