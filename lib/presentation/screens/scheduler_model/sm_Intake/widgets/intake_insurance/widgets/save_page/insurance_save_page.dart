import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/intake/patient_insurance_manager.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/patient_insurance_data.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../intake_flow_contgainer_const.dart';

class InsuranceSavePage extends StatelessWidget {
  final VoidCallback onBack;
  final int patientId;
   InsuranceSavePage(
      {super.key, required this.onBack, required this.patientId,});

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);

    // print('Passed object data ${patientData}');
    return FutureBuilder<List<PatientInsuranceInfoData>>(
      future: getPatientInsuranceinfo(context: context,ptId:diagnosisProvider.patientId),
      builder: (context,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
              child: CircularProgressIndicator(color: ColorManager.blueprime,)
          );
        }
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
                  height: 320,
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
                                    height: AppSize.s15,
                                  ),
                                  Text('Code:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  // const SizedBox(height: AppSize.s15),
                                  // Text('Street:',
                                  //     style: DocDefineTableData.customTextStyle(
                                  //         context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('Street:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text('Suite/Apt#:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text('City:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('State:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('Zip Code:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
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
                                  Text(snapshot.data![0].rptiName ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text(snapshot.data![0].rptiGroupNumber.toString() ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiStreet ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiSuite ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  SizedBox(
                                    height: AppSize.s15,
                                  ),
                                  Text(snapshot.data![0].rptiCity ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiState ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiZipcode ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiContact ?? '',
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
                                  const SizedBox(height: AppSize.s15,),
                                  Text('Type:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('Policy/HIC Number:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('Group Number:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text('Group Name:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text('Effective From:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('Effective To:',
                                      style: DocDefineTableData.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('',
                                      style: ThemeManagerDark.customTextStyle(
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
                                  Text(snapshot.data![0].rptiCategory ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text(snapshot.data![0].rptiType ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiPolicy ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiGroupNumber.toString() ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text(snapshot.data![0].rptiGroupName ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  SizedBox(height: AppSize.s15,),
                                  Text(snapshot.data![0].rptiEffectiveFrom ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text(snapshot.data![0].rptiEffectiveTo ?? '',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),
                                  const SizedBox(height: AppSize.s15),
                                  Text('',
                                      style: ThemeManagerDarkFont.customTextStyle(
                                          context)),

                                ],
                              )
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
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
                                      height: AppSize.s15,
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
                                    Text(snapshot.data![0].rptiAuthorization ? 'NOT REQUIRED' : 'REQUIRED',
                                        style: CustomTextStylesCommon.commonStyle(
                                          //  color:Color(0xFF575757),
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff04BF00),
                                        )),
                                    SizedBox(height: AppSize.s15,),
                                    Text(snapshot.data![0].rptiEligibility ? 'Active Coverage' : 'Inactive Coverage',
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
                                  onPressed: () {
                                    onBack();
                                  },
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
                  height: 50,
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length - 1,
                    itemBuilder: (context,index) {
                      final item = snapshot.data![index + 1];
                      return Container(
                        height: 320,
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
                                        const SizedBox(height: AppSize.s15,),
                                        Text('Code:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('Street:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text('Suite/Apt#:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text('City:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('State:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('Zip Code:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
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
                                        Text(item.rptiName,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiGroupNumber.toString(),
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiStreet,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiSuite,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiCity,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiState,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiZipcode,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiContact,
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
                                        const SizedBox(height: AppSize.s15,),
                                        Text('Type:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('Policy/HIC Number:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('Group Number:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text('Group Name:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text('Effective From:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('Effective To:',
                                            style: DocDefineTableData.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('',
                                            style: ThemeManagerDark.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
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
                                        Text(item.rptiCategory,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiType,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiPolicy,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiGroupNumber.toString(),
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiGroupName,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        SizedBox(height: AppSize.s15,),
                                        Text(item.rptiEffectiveFrom,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text(item.rptiEffectiveTo,
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
                                        Text('',
                                            style: ThemeManagerDarkFont.customTextStyle(
                                                context)),
                                        const SizedBox(height: AppSize.s15),
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
                                            height: AppSize.s15,
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
                                          Text(item.rptiAuthorization ? 'NOT REQUIRED' : 'REQUIRED',
                                              style: CustomTextStylesCommon.commonStyle(
                                                //  color:Color(0xFF575757),
                                                fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff04BF00),
                                              )),
                                          SizedBox(
                                            height: AppSize.s15,
                                          ),
                                          Text(item.rptiEligibility ? 'Active Coverage' : 'Inactive Coverage',
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
                                        onPressed: () {
                                          onBack();
                                        },
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
                      );
                    }
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
    );
  }
}
