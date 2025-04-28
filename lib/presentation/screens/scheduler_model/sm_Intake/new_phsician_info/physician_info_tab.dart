import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/office_location_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';
import '../widgets/intake_flow_contgainer_const.dart';

class PhysicianInfoTab extends StatefulWidget {
  const PhysicianInfoTab({super.key});

  @override
  State<PhysicianInfoTab> createState() => _PhysicianInfoTabState();
}

class _PhysicianInfoTabState extends State<PhysicianInfoTab> {

  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController suffixController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController suitapiController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController faxnumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController npiController = TextEditingController();
  TextEditingController upiController = TextEditingController();
  TextEditingController protocalController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController pecosController = TextEditingController();
  TextEditingController verificationController = TextEditingController();
  TextEditingController trakingController = TextEditingController();


  String? statustype;

  @override
  Widget build(BuildContext context) {
    return
 Consumer<SmIntakeProviderManager>(
   builder: (context,providerState,child) {
     return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(right: providerState.isContactTrue ? 0 : 35, left:  35),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Review and confirm the data pulled is correct',
                    style: SMItalicTextConst.customTextStyle(context))

                ],),
            ),

            BlueBGHeadConst(HeadText: "Certifying F2F Physician Or Allowed Practitioner"),
            SizedBox(height: AppSize.s10,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal:  providerState.isContactTrue ? 0 : 25),
              child: Column(
                children: [
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Flexible(
                        child: CustomDropdownTextFieldsm(
                            headText: providerState.isContactTrue ? 'Select from\nDatabase' : 'Select from Database',
                            items: ['Spouse','Patient',],
                            //dropDownMenuList: dropDownList,
                            onChanged: (newValue) {

                            }),
                      ),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: nameController,
                              labelText: 'First Name*',
                              initialValue: 'A')),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: lastController,
                              labelText: "Last Name*")),
                      SizedBox(width: AppSize.s35),
                     providerState.isContactTrue ? Offstage() : Flexible(
                          child: SchedularTextField(
                              controller: suffixController,
                              labelText: "Suffix")),
                      providerState.isContactTrue ? Offstage() :  SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ? Offstage() : Flexible(
                          child: SizedBox(width:0)),
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Flexible(
                          child: SchedularTextField(
                            controller: streetController,
                            labelText: 'Street*',
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                            controller: suitapiController,
                            labelText: 'Suite/Apt#',
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                            controller: cityController,
                            labelText: 'City*',
                          )),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : Flexible(child: SchedularTextField(
                            controller: stateController,
                            labelText: 'State*',
                          )),
                      providerState.isContactTrue ?Offstage() :  SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() :  Flexible(
                          child: SchedularTextField(
                              controller: zipcodeController,
                              onlyAllowNumbers: true,
                              labelText: "Zip Code*")
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                    Flexible(
                          child: SchedularTextField(
                            phoneField: true,
                            controller: phonenumberController,
                            labelText: "Phone Number*",
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: faxnumController,
                              labelText: "Fax Number",
                              phoneField:true)),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: emailController,
                              labelText: "Email")),
                    //  SizedBox(width: AppSize.s35),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() :  Flexible(
                          child: SizedBox(child: Image.asset("images/sm/contact_text.png",height: 60,),)),
                      providerState.isContactTrue ?Offstage() : SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() :  Flexible(child: SizedBox(width:0)),
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Flexible(
                          child: SchedularTextField(
                            controller: npiController,
                            labelText: "NPI Number",
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                            controller: upiController,
                            labelText: "UPI Number",
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                            controller: protocalController,
                            labelText: "Protocols",
                            isIconVisible: true,
                          )),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() :  Flexible(
                          child: SchedularTextField(
                            controller: noteController,
                            labelText: "Notes",
                            isIconVisible: true,
                          )),
                      providerState.isContactTrue ?Offstage() :  SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() :  Flexible(child: SizedBox(width:0)),
                    ],
                  ),
                  SizedBox(height: AppSize.s25),
                  providerState.isContactTrue ?  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Row(
                      children: [
                        Flexible(
                            child: SchedularTextField(
                                controller: suffixController,
                                labelText: "Suffix")),
                        SizedBox(width: AppSize.s35),
                        Flexible(
                            child: SchedularTextField(
                              controller: stateController,
                              labelText: 'State*',
                            )),

                        SizedBox(width: AppSize.s35),
                        Flexible(
                            child: SchedularTextField(
                                controller: zipcodeController,
                                onlyAllowNumbers: true,
                                labelText: "Zip Code*")
                        )
                      ],
                    ),
                  ) : Offstage(),
                  SizedBox(height: AppSize.s25,),
                  providerState.isContactTrue ?
                  Row(
                    children: [
                      Flexible(
                          child: SchedularTextField(
                            controller: noteController,
                            labelText: "Notes",
                            isIconVisible: true,
                          )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SizedBox(child: Image.asset("images/sm/contact_text.png",height: 60,),)),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : Flexible(
                          child: SchedularTextField(
                              controller: suffixController,
                              labelText: "Suffix")),
                      providerState.isContactTrue ?Offstage() :  SizedBox(width: AppSize.s35),

                    ],
                  ) : SizedBox(),
                  SizedBox(height: AppSize.s25,),
                  Row(
                    children: [
                      Text("Check PECOS Eligibility Status",style: CustomTextStylesCommon.commonStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.bluebottom,
                      ),)
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Physician Verified',
                                style:  providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                              //AllPopupHeadings.customTextStyle(context)
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                CustomRadioListTileSMp(
                                  title: 'No',
                                  value: 'No',
                                  groupValue: statustype,
                                  onChanged: (value) {
                                    setState(() {
                                      statustype = value;
                                    });
                                  },
                                ),
                                CustomRadioListTileSMp(
                                  title: 'Yes',
                                  value: 'Yes',
                                  groupValue: statustype,
                                  onChanged: (value) {
                                    setState(() {
                                      statustype = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: pecosController,
                              labelText: "PECOS Status")),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SizedBox(width:0)),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SizedBox(width:0)),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SizedBox(width:0)),
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left:providerState.isContactTrue?25 :50),
                        child: SchedularTextField(
                            width: providerState.isContactTrue?200 :400,
                            controller: verificationController,
                            isIconVisible: true,
                            labelText: "Verification Details"),
                      ),
                      SizedBox(width: AppSize.s35),
                      SchedularTextField(
                        width:  providerState.isContactTrue?200 :400,
                          controller: trakingController,
                          isIconVisible: true,
                          labelText: "Tracking Notes"),
                      // Flexible(
                      //     child: SizedBox(width:0)),
                    ],
                  ),



                          ]),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Divider(),
            ),
            BlueBGHeadConst(HeadText: "Other Physicians Or Allowed Practitioner"),
            SizedBox(height: AppSize.s20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton.icon(onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AddPopupConstant(title: 'Add Face to Face Attachment',);
                    //   },
                    // );
                  },
                    label: Text(
                        "Add Physician",
                        style: TextStyle(
                          fontSize: FontSize.s13,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.white,
                          decoration: TextDecoration.none,
                        )//BlueButtonTextConst.customTextStyle(context),
                    ),
                    icon:Icon(Icons.add),

                    style: ElevatedButton.styleFrom(
                      backgroundColor:  ColorManager.bluebottom,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                      ),),
                  ),
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 117,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorManager.bluebottom,
                            width: 1,
                          ),
                        ),),
                      child: Text('Skip',
                        style: TransparentButtonTextConst.customTextStyle(context),
                      ),),
                  ),


                  const SizedBox(width: AppSize.s30,),
                  Container(
                    //color: Colors.white,
                    width: 117,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(backgroundColor:ColorManager.bluebottom,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),),
                      child: Text('Save',
                        style:  TextStyle(
                          fontSize: FontSize.s13,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.white,
                          decoration: TextDecoration.none,
                        ),
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     );
   }
 );

  }
}
