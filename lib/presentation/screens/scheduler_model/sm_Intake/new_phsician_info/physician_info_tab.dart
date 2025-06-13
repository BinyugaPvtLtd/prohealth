import 'package:flutter/material.dart';
import 'package:prohealth/app/services/api/managers/sm_module_manager/intake/intake_physician_info_manager.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/office_location_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/new_phsician_info/physician_info_save_page.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../data/api_data/sm_data/sm_intake_data/sm_physician_info/physician_info.dart';
import '../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
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

  TextEditingController physicianIdController = TextEditingController();
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
  PhysicianInfoPrefillData? _prefillData;
  String? statustype;

  @override
  void initState() {
    super.initState();
    _prefillPhysicianData();
  }
  Future<void> _prefillPhysicianData() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    try {
      List<PhysicianInfoPrefillData> prefilledData =  await getPhysicianInfoById(context: context,
          patientId: provider.patientId);

      // Print the patient ID
      print(";;;;;Patient ID: ${provider.patientId}");

      if (prefilledData.isNotEmpty) {
        final data = prefilledData.first;

        // Print the physician ID
        print(":::::::::::::Physician ID: ${data.phyId}");

        setState(() {
          physicianIdController = TextEditingController(text: data.phyId.toString());
          nameController.text = data.phyFirstName;
          lastController.text = data.phyLastName;
          suffixController.text = data.phySuffix ?? '';
          streetController.text = data.phyStreet ?? '';
          suitapiController.text = data.phySuite ?? '';
          cityController.text = data.phyCity ?? '';
          stateController.text = data.phyState ?? '';
          zipcodeController.text = data.phyZipCode ?? '';
          phonenumberController.text = data.phyContact;
          faxnumController.text = data.phyFax ?? '';
          emailController.text = data.phyEmail;
        //  npiController.text = data.phyNPI.toString();
          upiController.text = data.phyUPI ?? '';
          protocalController.text = data.phyProtocols ?? '';
          noteController.text = data.phyNotes ?? '';
          verificationController.text = data.phyVerificationDetails ?? '';
          trakingController.text = data.phyTrackingNotes ?? '';
          pecosController.text = data.phyPicoNo;
        });
      }
    } catch (e) {
      print('Failed to load prefilled data: $e');
    }
  }


  bool isSaved = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context,listen: false);
    final int patientId = diagnosisProvider.patientId;

    return Consumer<SmIntakeProviderManager>(
   builder: (context,providerState,child) {
     return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(right: 35, left:  35),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppSize.s25,bottom: 10,),
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
            isSaved
                ? SavePagePhysicianInfo(
              onEdit: () {
              setState(() {
                isSaved = false;
              });
            },)
                :Padding(
              padding: EdgeInsets.only(left: 25, right: providerState.isContactTrue ? 0 : 25),
              child: Column(
                children: [
                  SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Flexible(
                        child:
                        SchedularTextField(labelText: 'Select from Database',
                          controller: physicianIdController,
                          enable: true,
                        ),
                        // CustomDropdownTextFieldsm(
                        //     headText: 'Select from Database',
                        //     items: ['Spouse','Patient',],
                        //     //dropDownMenuList: dropDownList,
                        //     onChanged: (newValue) {
                        //
                        //     }),
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
                            icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
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
                              )),
                      SizedBox(width: AppSize.s35),
                      Flexible(
                          child: SchedularTextField(
                              controller: emailController,
                              labelText: "Email")),
                    //  SizedBox(width: AppSize.s35),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : Flexible(child: Container()),
                      // providerState.isContactTrue ?Offstage() :  Flexible(
                      //     child: SizedBox(child: Image.asset("images/sm/contact_text.png",height: 60,),)),
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
                  providerState.isContactTrue
                      ?  Padding(
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
                      Flexible(child: Container()),
                      SizedBox(width: AppSize.s35),
                      Flexible(child: Container()),
                      // Flexible(
                      //     child: SizedBox(child: Image.asset("images/sm/contact_text.png",height: 60,),)),
                      SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : Flexible(
                          child: SchedularTextField(
                              controller: suffixController,
                              labelText: "Suffix")),
                      providerState.isContactTrue ?Offstage() :  SizedBox(width: AppSize.s35),

                    ],
                  ) : SizedBox(),
                  providerState.isContactTrue ?   SizedBox(height: AppSize.s25,) : Offstage(),
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
                                style: // providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :
                                SMTextfieldHeadings.customTextStyle(context)
                              //AllPopupHeadings.customTextStyle(context)
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              width: 200,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomRadioListTileSMp(
                                      title: 'No',
                                      value: 'No',
                                      groupValue: statustype,
                                      onChanged: (value) {
                                        setState(() {
                                          statustype = value;
                                        });
                                      },
                                    ),
                                  ),
                                  providerState.isContactTrue ? SizedBox(width: 15,) : Offstage(),
                                  Expanded(
                                    child: CustomRadioListTileSMp(
                                      title: 'Yes',
                                      value: 'Yes',
                                      groupValue: statustype,
                                      onChanged: (value) {
                                        setState(() {
                                          statustype = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppSize.s90),
                      Padding(
                        padding: EdgeInsets.only(right: providerState.isContactTrue ?140 :0),
                        child: SizedBox(
                          width: 250,
                          child: SchedularTextField(
                            width: 250 ,
                              controller: pecosController,
                              textStyle: TextStyle(fontWeight: FontWeight.w700,
                              fontSize: FontSize.s14,
                              color: ColorManager.greenDark,
                              ),
                              labelText: "PECOS Status"),
                        ),
                      ),
                     // providerState.isContactTrue ?Offstage() : SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : SizedBox(width:0),
                      providerState.isContactTrue ?Offstage() :  SizedBox(width: AppSize.s35),
                      SizedBox(width:0),
                      providerState.isContactTrue ?Offstage() : SizedBox(width: AppSize.s35),
                      providerState.isContactTrue ?Offstage() : SizedBox(width:0),
                    ],
                  ),
                  SizedBox(height: AppSize.s16),
                  Padding(
                    padding:  EdgeInsets.only(left: providerState.isContactTrue
                        ?230 :0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SchedularTextField(
                              width: providerState.isContactTrue?250 :400,
                              controller: verificationController,
                              isIconVisible: true,
                              labelText: "Verification Details"),
                        ),
                        SizedBox(width: AppSize.s35),
                        Flexible(
                          child: SchedularTextField(
                            width:  providerState.isContactTrue?250 :400,
                              controller: trakingController,
                              isIconVisible: true,
                              labelText: "Tracking Notes"),
                        ),
                        // Flexible(
                        //     child: SizedBox(width:0)),
                      ],
                    ),
                  ),



                          ]),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Divider(),
            ),
            ///dont delete temp hide
            // BlueBGHeadConst(HeadText: "Other Physicians Or Allowed Practitioner"),
            // SizedBox(height: AppSize.s20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: 160,
            //       height: 35,
            //       child: ElevatedButton.icon(onPressed: () {
            //         // showDialog(
            //         //   context: context,
            //         //   builder: (BuildContext context) {
            //         //     return AddPopupConstant(title: 'Add Face to Face Attachment',);
            //         //   },
            //         // );
            //       },
            //         label: Text(
            //             "Add Physician",
            //             style: TextStyle(
            //               fontSize: FontSize.s13,
            //               fontWeight: FontWeight.w600,
            //               color: ColorManager.white,
            //               decoration: TextDecoration.none,
            //             )//BlueButtonTextConst.customTextStyle(context),
            //         ),
            //         icon:Icon(Icons.add),
            //
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor:  ColorManager.bluebottom,
            //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
            //           ),),
            //       ),
            //     )
            //
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 25,bottom: 10),
            //   child: Divider(),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CustomButtonTransparent(
                    text: "Skip",
                    onPressed: () {
                    },
                  ),
                  const SizedBox(width: AppSize.s30,),
                  isLoading
                      ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(),
                  )
                      :CustomElevatedButton(
                    width: 100,
                    text: AppString.save,
                    onPressed: () async {
                      setState(() {
                        isLoading = true; // ✅ Start loader
                      });

                      try {
                        var response = await updatePhysicianMasterPatch(
                          context: context,
                          phyId: int.parse(physicianIdController.text),
                          phyFirstName: nameController.text,
                          phyLastName: lastController.text,
                          phySuffix: suffixController.text,
                          phyPicoNo: pecosController.text,
                          phyPicoStatus: true,
                          phyEmail: emailController.text,
                          phyContact: phonenumberController.text,
                          phyStreet: streetController.text,
                          phySuite: suitapiController.text,
                          phyCity: cityController.text,
                          phyState: stateController.text,
                          phyZipCode: zipcodeController.text,
                          phyFax: faxnumController.text,
                          phyNPI: int.parse(physicianIdController.text),
                          phyUPI: upiController.text,
                          phyProtocols: protocalController.text,
                          phyNotes: noteController.text,
                          phyVerified: true,
                          phyVerificationDetails: verificationController.text,
                          phyTrackingNotes: trakingController.text,
                        );

                        if (response.statusCode == 200 || response.statusCode == 201) {
                        await  showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AddSuccessPopup(
                                message: 'Physician Info Updated Successfully',
                              );
                            },
                          );
                        } else {
                          print('❌ API error: ${response.statusCode}');
                        }

                        setState(() {
                          isSaved = true;
                        });
                      } catch (e) {
                        print('Error saving physician info: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('An error occurred while saving')),
                        );
                      } finally {
                        setState(() {
                          isLoading = false; // ✅ Stop loader
                        });
                      }
                    },
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
