import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/medications/pharmacy_vendor_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/physician_info/physician_info_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_dropdown_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../intake_flow_contgainer_const.dart';

class IntakePrimaryScreen extends StatelessWidget {
  final int patientId;
  final VoidCallback onSave;
  IntakePrimaryScreen({super.key, required this.patientId,   required this.onSave,});


  @override
  Widget build(BuildContext context) {
    TextEditingController pharmaSelectDB = TextEditingController();
    TextEditingController pharmaName = TextEditingController();
    TextEditingController pharmaphone = TextEditingController();
    TextEditingController pharmaType = TextEditingController();
    TextEditingController pharmaCategory = TextEditingController();
    TextEditingController pharmaSuitApt = TextEditingController();
    TextEditingController pharmacyaddress = TextEditingController();
    TextEditingController pharmacyzipcode = TextEditingController();
    TextEditingController pharmaPolicyHicNo = TextEditingController();
    TextEditingController pharmaGrpName = TextEditingController();
    TextEditingController pharmaGrpNo = TextEditingController();
    TextEditingController pharmaEmail = TextEditingController();
    TextEditingController pharmaAuth = TextEditingController();
    TextEditingController pharmaEftDateForm = TextEditingController();
    TextEditingController pharmaEftDateFormTo = TextEditingController();
    TextEditingController pharmacycontactsecond = TextEditingController();
    TextEditingController dummyCtrl = TextEditingController();
    String? statustype;
    String? dmeSupplies;
    String? pharmacydd;
    String? pharmacystate;
    String? pharmacycity;
    return
      // backgroundColor: ColorManager.white,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(right: 90), // Shift left by 10
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       // Your onPressed action here
      //     },
      //     backgroundColor: ColorManager.bluebottom,
      //     child: Padding(
      //       padding: const EdgeInsets.all(5),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(Icons.call,size: 22,),
      //           SizedBox(height: 3,),
      //           Text(
      //             "Contact",
      //             style: CustomTextStylesCommon.commonStyle(
      //               fontSize: FontSize.s10,
      //               fontWeight: FontWeight.w500,
      //               color: ColorManager.white,
      //             ),
      //             textAlign: TextAlign.center,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      Consumer<SmIntakeProviderManager>(
        builder: (context,providerstate,child) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Review and confirm the data pulled is correct',
                            style: SMItalicTextConst.customTextStyle(context))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Policy Details"),
                  ),
                  IntakeFlowContainerConst(
                    height: providerstate.isContactTrue ?AppSize.s550 :AppSize.s400,
                    containerPadding: providerstate.isContactTrue ? EdgeInsets.only(left: AppPadding.p20, top: AppPadding.p30,bottom: AppPadding.p30) : null,
                    //child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          providerstate.isContactTrue ?
                          Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Select from Database',items: ["A",'B'],
                                      onChanged: (newValue) {
                                      })),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaName, labelText: 'Name*')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaType,
                                    labelText: 'Type*',
                                  )),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: providerstate.isContactTrue ? 'Select from\nDatabase' : 'Select from Database',items: ["A",'B'],
                          onChanged: (newValue) {
                          })),

                                  // SchedularTextField(
                                  //     controller: pharmaSelectDB,
                                  //     labelText: 'Select from Database')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaName, labelText: 'Name*')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaType,
                                      labelText: 'Type*',
                                      )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    isIconVisible: true,
                                      controller: pharmaCategory, labelText: 'Category')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SizedBox()),
                            ],
                          ),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ? Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      isIconVisible: true,
                                      controller: pharmaCategory, labelText: 'Category')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyaddress,
                                      labelText: 'Street*')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaSuitApt,
                                      labelText: 'Suite/Apt#')),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyaddress,
                                      labelText: 'Street*')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaSuitApt,
                                      labelText: 'Suite/Apt#')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                child: FutureBuilder<List<CityData>>(
                                  future: getCityDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SchedularTextField(
                                        controller: dummyCtrl,
                                        labelText: 'City',);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.cityName!),
                                          value: i.cityName,
                                        ));
                                      }
                                      return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.cityName == newValue) {
                                                pharmacycity = a.cityName!;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          });
                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                                // child: SchedularTextField(
                                //     controller: pharmacycity, labelText: 'City'),
                              ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<StateData>>(
                                  future: getStateDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SchedularTextField(
                                          controller: dummyCtrl,
                                          labelText: 'State');
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.name),
                                          value: i.name,
                                        ));
                                      }
                                      return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.name == newValue) {
                                                pharmacystate = a.name;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          });
                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyzipcode,
                                      onlyAllowNumbers: true,
                                      labelText: 'Zip Code*')),


                            ],
                          ),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                child: FutureBuilder<List<CityData>>(
                                  future: getCityDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SchedularTextField(
                                        controller: dummyCtrl,
                                        labelText: 'City',);
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.cityName!),
                                          value: i.cityName,
                                        ));
                                      }
                                      return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.cityName == newValue) {
                                                pharmacycity = a.cityName!;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          });
                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                                // child: SchedularTextField(
                                //     controller: pharmacycity, labelText: 'City'),
                              ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                child:FutureBuilder<List<StateData>>(
                                  future: getStateDropDown(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SchedularTextField(
                                          controller: dummyCtrl,
                                          labelText: 'State');
                                    }
                                    if (snapshot.hasData) {
                                      List<DropdownMenuItem<String>> dropDownList = [];
                                      for (var i in snapshot.data!) {
                                        dropDownList.add(DropdownMenuItem<String>(
                                          child: Text(i.name),
                                          value: i.name,
                                        ));
                                      }
                                      return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {
                                            for (var a in snapshot.data!) {
                                              if (a.name == newValue) {
                                                pharmacystate = a.name;
                                                //country = a
                                                // int? docType = a.companyOfficeID;
                                              }
                                            }
                                          });
                                    } else {
                                      return const Offstage();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmacyzipcode,
                                      onlyAllowNumbers: true,
                                      labelText: 'Zip Code*')),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaphone,
                                      phoneField:true,
                                      labelText: 'Phone Number')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaAuth,
                                      labelText: 'Auth Status',
                                      )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaEftDateForm, labelText: 'Effective From',
                                  showDatePicker: true,)),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaEftDateFormTo, labelText: 'Effective to',
                                  showDatePicker: true,)),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Eligibility Status',items: ['Santa Clara','A'],
                                      onChanged: (newValue) {
                                      })),
                            ],
                          ),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaphone,
                                      phoneField:true,
                                      labelText: 'Phone Number')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaAuth,
                                    labelText: 'Auth Status',
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateForm, labelText: 'Effective From',
                                    showDatePicker: true,)),
                            ],
                          ):
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaPolicyHicNo,
                                      labelText: 'Policy/HIC Number')),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpNo,
                                    labelText: 'Group Number',
                                    )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpName, labelText: 'Group Name',
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEmail, labelText: 'Primary Email',
                                    )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Insurance Verified',
                                        style:providerstate.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                        //AllPopupHeadings.customTextStyle(context)
                                        ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomRadioListTileSMp(
                                            title: 'Yes',
                                            value: 'Yes',
                                            groupValue: statustype,
                                            onChanged: (value) {
                                              // setState(() {
                                                statustype = value;
                                              // });
                                            },
                                          ),
                                        ),

                                        Expanded(
                                          child: CustomRadioListTileSMp(
                                            title: 'No',
                                            value: 'No',
                                            groupValue: statustype,
                                            onChanged: (value) {
                                              // setState(() {
                                                statustype = value;
                                              // });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ?  Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEftDateFormTo, labelText: 'Effective to',
                                    showDatePicker: true,)),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: CustomDropdownTextFieldsm(headText: 'Eligibility Status',items: ['Santa Clara','A'],
                                      onChanged: (newValue) {
                                      })),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                      controller: pharmaPolicyHicNo,
                                      labelText: 'Policy/HIC Number')),
                            ],
                          ) : Offstage(),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ? Row(
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpNo,
                                    labelText: 'Group Number',
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaGrpName, labelText: 'Group Name',
                                  )),
                              SizedBox(width: AppSize.s35),
                              Flexible(
                                  child: SchedularTextField(
                                    controller: pharmaEmail, labelText: 'Primary Email',
                                  )),
                            ],
                          ) : Offstage(),
                          SizedBox(height: AppSize.s16),
                          providerstate.isContactTrue ?SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Insurance Verified',
                                          style:providerstate.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context)  :SMTextfieldHeadings.customTextStyle(context)
                                        //AllPopupHeadings.customTextStyle(context)
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomRadioListTileSMp(
                                              title: 'Yes',
                                              value: 'Yes',
                                              groupValue: statustype,
                                              onChanged: (value) {
                                                // setState(() {
                                                statustype = value;
                                                // });
                                              },
                                            ),
                                          ),

                                          Expanded(
                                            child: CustomRadioListTileSMp(
                                              title: 'No',
                                              value: 'No',
                                              groupValue: statustype,
                                              onChanged: (value) {
                                                // setState(() {
                                                statustype = value;
                                                // });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ):Offstage(),
                        ],
                      ),
                   // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Suggested Care & Diagnosis"),
                  ),
                  SizedBox(height: AppSize.s40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Attachments"),
                  ),
                  IntakeFlowContainerConst(
                    height: AppSize.s200,
                      containerPadding: providerstate.isContactTrue ? EdgeInsets.symmetric(horizontal: AppPadding.p0, vertical: AppPadding.p30) : null,
                    //child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.s65,
                          // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30, vertical: AppPadding.p15),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            // borderRadius: BorderRadius.circular(5),
                            // border: Border.symmetric(vertical: BorderSide(width: 0.2,color: ColorManager.grey),horizontal: BorderSide(width: 0.2,color: ColorManager.grey),),//all(width: 1, color: Color(0xFFBCBCBC)),
                            border: Border(
                              bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                            ),//all(width: 1, color: Color(0xFFBCBCBC)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorManager.black.withOpacity(0.2),
                            //     spreadRadius: 0,
                            //     blurRadius: 4,
                            //     offset: Offset(0, 4),
                            //   ),
                            // ],
                          ),child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            VerticalDivider(
                              color: Color(0xFF50B5E5),
                              thickness: 4.5,
                            ),
                            SizedBox(width: AppSize.s20,),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text('CWF.pdf',
                                    style: DocDefineTableData.customTextStyle(context)),
                                SizedBox(height: AppSize.s8,),
                                Text("Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                                    style:  DocDefineTableDataID.customTextStyle(context)),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              child: Image.asset("images/sm/telegram.png", height:  providerstate.isContactTrue?IconSize.I16 :IconSize.I22,),
                              onTap: () {
                              },
                            ),
                            SizedBox(width: AppSize.s10,),
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.print_outlined,
                                color: Color(0xFF686464),
                              ),
                              iconSize: providerstate.isContactTrue?IconSize.I16 :IconSize.I22,
                            ),
                            SizedBox(width: AppSize.s10,),
                            ///download
                            IconButton(
                              onPressed: () {

                              },
                              icon: Icon(
                                Icons.save_alt_outlined,
                                color: Color(0xFF686464),
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              iconSize: providerstate.isContactTrue?IconSize.I16 :IconSize.I22,
                            ),
                            SizedBox(width: AppSize.s10,),
                            ///delete
                            IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Color(0xFF686464),
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              iconSize:providerstate.isContactTrue?IconSize.I16 :IconSize.I22,
                            ),
                          ],
                        )
                      ],
                    ),
                        ), SizedBox(height: AppSize.s16),
                        CustomIconButtonConst(
                            width: 150,
                            text: 'Add Attachment',
                            icon: Icons.add,
                            onPressed: () {

                            }),])),
                  SizedBox(height: AppSize.s40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CustomButtonTransparent(
                        text: "Skip",
                        onPressed: () {

                        },
                      ),
                      CustomElevatedButton(
                        width: AppSize.s100,
                        text: AppString.save,
                        onPressed: onSave,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s30),
                      ],
                    )
                    ),
                    // ),
                  );
        }
      );


  }
}
