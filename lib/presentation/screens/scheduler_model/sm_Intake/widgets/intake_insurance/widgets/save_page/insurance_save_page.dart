import 'package:flutter/material.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../intake_flow_contgainer_const.dart';

class InsuranceSavePage extends StatelessWidget {
  final VoidCallback onBack;
  final int patientId;

  const InsuranceSavePage(
      {super.key, required this.onBack, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Review and confirm the data pulled is correct',
                    style: SMItalicTextConst.customTextStyle(context))
              ],
            ),
            //SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Insurance I',
                    style: CustomTextStylesCommon.commonStyle(
                      //  color:Color(0xFF575757),
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.mediumgrey,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            BlueBGHeadConst(HeadText: "Policy Details"),
            Container(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF008000),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Verified",
                                  style: CustomTextStylesCommon.commonStyle(
                                    //  color:Color(0xFF575757),
                                    fontSize: FontSize.s12,
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.white,
                                  )),
                              Image.asset(
                                "images/sm/white_tik.png",
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Code:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Street:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Street:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Suite/Apt#:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('City:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('State:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Zip Code:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Phone Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Medicare Home Health',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('60001',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('P.O. Box 7149',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Indianapolis',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('IN',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('46207',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Category:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Type:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Policy/HIC Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Group Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Group Name:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Effective From:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Effective To:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDark.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Medicare - Episodic',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Not Applicable',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('1234567890',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('01/01/2025',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('12/31/2025',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Auth Status:',
                                    style: DocDefineTableData.customTextStyle(
                                        context)),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                Text('Eligibility Status:',
                                    style: DocDefineTableData.customTextStyle(
                                        context)),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('NOT REQUIRED',
                                    style: CustomTextStylesCommon.commonStyle(
                                      //  color:Color(0xFF575757),
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff04BF00),
                                    )),
                                SizedBox(
                                  height: AppSize.s10,
                                ),
                                Text('Active Coverage',
                                    style: ThemeManagerDarkFont.customTextStyle(context)),
                              ],
                            )
                          ],
                        ),
                      ),

                      ///
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 200),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_outlined,
                                color: ColorManager.bluebottom,
                                size: IconSize.I22,
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),

            SizedBox(
              height: 20,
            ),
            BlueBGHeadConst(HeadText: "Suggested Care & Diagnosis"),
            SizedBox(
              height: 30,
            ),
            BlueBGHeadConst(HeadText: "Attachments"),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Insurance II',
                    style: CustomTextStylesCommon.commonStyle(
                      //  color:Color(0xFF575757),
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.mediumgrey,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            BlueBGHeadConst(HeadText: "Policy Details"),
            Container(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xFF008000),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Verified",
                                  style: CustomTextStylesCommon.commonStyle(
                                    //  color:Color(0xFF575757),
                                    fontSize: FontSize.s12,
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.white,
                                  )),
                              Image.asset(
                                "images/sm/white_tik.png",
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Name:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Code:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Street:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Street:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Suite/Apt#:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('City:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('State:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Zip Code:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Phone Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Medicare Home Health',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('60001',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('P.O. Box 7149',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Indianapolis',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('IN',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('46207',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Category:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Type:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Policy/HIC Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Group Number:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Group Name:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Effective From:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('Effective To:',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDark.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Medicare - Episodic',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('Not Applicable',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('1234567890',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              SizedBox(
                                height: AppSize.s10,
                              ),
                              Text('01/01/2025',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('12/31/2025',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: ThemeManagerDarkFont.customTextStyle(
                                      context)),
                              const SizedBox(height: AppSize.s10),
                              Text('',
                                  style: DocDefineTableData.customTextStyle(
                                      context)),
                            ],
                          )
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Auth Status:',
                                    style: DocDefineTableData.customTextStyle(
                                        context)),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                Text('Eligibility Status:',
                                    style: DocDefineTableData.customTextStyle(
                                        context)),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('NOT REQUIRED',
                                    style: CustomTextStylesCommon.commonStyle(
                                      //  color:Color(0xFF575757),
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff04BF00),
                                    )),
                                SizedBox(
                                  height: AppSize.s10,
                                ),
                                Text('Active Coverage',
                                    style: ThemeManagerDarkFont.customTextStyle(context)),
                              ],
                            )
                          ],
                        ),
                      ),

                      ///
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 20, bottom: 200),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_outlined,
                                color: ColorManager.bluebottom,
                                size: IconSize.I22,
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(),

            SizedBox(
              height: 20,
            ),
            BlueBGHeadConst(HeadText: "Suggested Care & Diagnosis"),
            SizedBox(
              height: 30,
            ),
            BlueBGHeadConst(HeadText: "Attachments"),
          ],
        ),
      ),
    );
  }
}
