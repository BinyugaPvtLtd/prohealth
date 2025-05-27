


import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/intake/related_parties_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographics_dropdown_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/related_parties_data.dart';
import '../../../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../widgets/constant_widgets/dropdown_constant_sm.dart';

import 'package:flutter/material.dart';























class PrimaryCaregiver extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  const PrimaryCaregiver({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible});

  @override
  PrimaryCaregiverState createState() => PrimaryCaregiverState();
}

class PrimaryCaregiverState extends State<PrimaryCaregiver> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNamePCController = TextEditingController();
    TextEditingController lastNamePCController = TextEditingController();
    TextEditingController streetPCController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController cityController = TextEditingController();
   TextEditingController suitAptPCController = TextEditingController();
   TextEditingController phoneNumberPCController = TextEditingController();
   TextEditingController zipCodePCController = TextEditingController();
   TextEditingController emailPCController = TextEditingController();

    bool copyEmergencyContactPC = false;
    bool copyPatientPC = false;

    bool noPCData = false;
    bool noPRData = false;
    bool noEmergencyData = false;

    String? status = 'Active';

    String? selectedRelationshipEC;





    final CaregiverProvider = Provider.of<SmIntakeProviderManager>(context, listen: false);
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.index > 1) ...[
          const Divider(),
          const SizedBox(height: 20),
        ],
        Padding(
          padding:EdgeInsets.only(top: widget.index > 1 ? 10 : 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20,
                children: [
                  CheckboxTile(
                    title: 'Copy Emergency Contact',
                    initialValue: copyEmergencyContactPC,
                    onChanged: (value) {
                      // setState(() {
                      //
                      // });
                    },
                  ),
                  CheckboxTile(
                    title: 'Copy Patient Representative',
                    initialValue: copyPatientPC,
                    onChanged: (value) {

                    },
                  )
                ],
              ),
              (widget.index > 1)
                  ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.delete_outline_rounded, color: ColorManager.bluebottom),
                onPressed: widget.onRemove,
              )
                  : CheckboxTile(
                title: 'No Caregiver Available',
                initialValue: noPCData,
                onChanged: (value) {
                  // update state accordingly
                },
              ),

            ],
          ),
        ),
        const SizedBox(height: AppSize.s16),
        CaregiverProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                  controller: firstNamePCController,
                  labelText: 'First Name*',

                )),
            SizedBox(width:CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNamePCController,
                  labelText: 'Last Name*',
                )),
            SizedBox(width:CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
              child:FutureBuilder<List<RelationshipData>>(
                future: getRelationshipDropDown(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CustomDropdownTextFieldsm(
                      initialValue: 'Select',
                      headText: 'Relationship',items: [],
                      onChanged: (newValue) {

                      },);
                  }
                  if (snapshot.hasData) {
                    List<DropdownMenuItem<String>> dropDownList = [];
                    for (var i in snapshot.data!) {
                      dropDownList.add(DropdownMenuItem<String>(
                        child: Text(i.relationship!),
                        value: i.relationship,
                      ));
                    }

                    return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      onChanged: (newValue) {
                        for (var a in snapshot.data!) {
                          if (a.relationship == newValue) {
                            selectedRelationshipEC = a.relationship!;
                            //country = a
                            // int? docType = a.companyOfficeID;
                          }
                        }
                      },);


                  } else {
                    return const Offstage();
                  }
                },
              ),
            ),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                  controller: firstNamePCController,
                  labelText: 'First Name*',

                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNamePCController,
                  labelText: 'Last Name*',
                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
              child:FutureBuilder<List<RelationshipData>>(
                future: getRelationshipDropDown(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CustomDropdownTextFieldsm(
                      initialValue: 'Select',
                      headText: 'Relationship',items: [],
                      onChanged: (newValue) {

                      },);
                  }
                  if (snapshot.hasData) {
                    List<DropdownMenuItem<String>> dropDownList = [];
                    for (var i in snapshot.data!) {
                      dropDownList.add(DropdownMenuItem<String>(
                        child: Text(i.relationship!),
                        value: i.relationship,
                      ));
                    }

                    return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      onChanged: (newValue) {
                        for (var a in snapshot.data!) {
                          if (a.relationship == newValue) {
                            selectedRelationshipEC = a.relationship!;
                            //country = a
                            // int? docType = a.companyOfficeID;
                          }
                        }
                      },);


                  } else {
                    return const Offstage();
                  }
                },
              ),
            ),
            const SizedBox(width: AppSize.s35),
            const Flexible(
                child: SizedBox()),
            const SizedBox(width: AppSize.s35),
            const Flexible(
                child: SizedBox()),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        CaregiverProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: streetPCController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            SizedBox(width:CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: suitAptPCController,
                    labelText: "Suite/Apt#")),
            SizedBox(width:CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
              // child: FutureBuilder<List<CityData>>(
              //   future: getCityDropDown(context),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return CustomDropdownTextFieldsm(
              //         initialValue: 'Select',
              //         headText: 'City*',items: [],
              //         onChanged: (newValue) {
              //
              //         },);
              //     }
              //     if (snapshot.hasData) {
              //       List<DropdownMenuItem<String>> dropDownList = [];
              //       for (var i in snapshot.data!) {
              //         dropDownList.add(DropdownMenuItem<String>(
              //           child: Text(i.cityName!),
              //           value: i.cityName,
              //         ));
              //       }
              //
              //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
              //         onChanged: (newValue) {
              //           for (var a in snapshot.data!) {
              //             if (a.cityName == newValue) {
              //               selectedCityEC = a.cityName!;
              //               //country = a
              //               // int? docType = a.companyOfficeID;
              //             }
              //           }
              //         },);
              //       //   SizedBox(
              //       //   height: 27,
              //       //   child: DropdownButtonFormField<String>(
              //       //     decoration: InputDecoration(
              //       //       labelText: 'City',
              //       //       labelStyle: GoogleFonts.firaSans(
              //       //         fontSize: 10.0,
              //       //         fontWeight: FontWeight.w400,
              //       //         color: ColorManager.greylight,
              //       //       ),
              //       //       focusedBorder: OutlineInputBorder(
              //       //         borderSide: BorderSide(
              //       //             color: ColorManager
              //       //                 .containerBorderGrey),
              //       //       ),
              //       //       border: OutlineInputBorder(
              //       //         borderRadius:
              //       //         BorderRadius.circular(4.0),
              //       //         borderSide: const BorderSide(
              //       //             color: Colors.grey),
              //       //       ),
              //       //       contentPadding:
              //       //       const EdgeInsets.symmetric(
              //       //         //   //  vertical: 5,
              //       //           horizontal: 12),
              //       //     ),
              //       //     // value: selectedCountry,
              //       //     icon: Icon(
              //       //       Icons.arrow_drop_down,
              //       //       color: ColorManager.blueprime,
              //       //     ),
              //       //     iconSize: 24,
              //       //     elevation: 16,
              //       //     style: GoogleFonts.firaSans(
              //       //       fontSize: 10.0,
              //       //       fontWeight: FontWeight.w400,
              //       //       color: const Color(0xff686464),
              //       //     ),
              //       //
              //       //     onChanged: (newValue) {
              //       //       for (var a in snapshot.data!) {
              //       //         if (a.cityName == newValue) {
              //       //          selectedCityEC = a.cityName!;
              //       //           //country = a
              //       //           // int? docType = a.companyOfficeID;
              //       //         }
              //       //       }
              //       //     },
              //       //     items: dropDownList.map((String value) {
              //       //       return DropdownMenuItem<String>(
              //       //         value: value,
              //       //         child: Text(
              //       //           value,
              //       //           style: GoogleFonts.firaSans(
              //       //             fontSize: 12,
              //       //             color: Color(0xff575757),
              //       //             fontWeight: FontWeight.w400,
              //       //           ),
              //       //         ),
              //       //       );
              //       //     }).toList(),
              //       //   ),
              //       // );
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),

              child: SchedularTextField(
                  controller: cityController,
                  labelText: AppString.city),
            ),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: streetPCController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),

                    labelText: "Street*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: suitAptPCController,
                    labelText: "Suite/Apt#")),
            const SizedBox(width: AppSize.s35),
            Flexible(
              // child: FutureBuilder<List<CityData>>(
              //   future: getCityDropDown(context),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return CustomDropdownTextFieldsm(
              //         initialValue: 'Select',
              //         headText: 'City*',items: [],
              //         onChanged: (newValue) {
              //
              //         },);
              //     }
              //     if (snapshot.hasData) {
              //       List<DropdownMenuItem<String>> dropDownList = [];
              //       for (var i in snapshot.data!) {
              //         dropDownList.add(DropdownMenuItem<String>(
              //           child: Text(i.cityName!),
              //           value: i.cityName,
              //         ));
              //       }
              //
              //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
              //         onChanged: (newValue) {
              //           for (var a in snapshot.data!) {
              //             if (a.cityName == newValue) {
              //               selectedCityEC = a.cityName!;
              //               //country = a
              //               // int? docType = a.companyOfficeID;
              //             }
              //           }
              //         },);
              //       //   SizedBox(
              //       //   height: 27,
              //       //   child: DropdownButtonFormField<String>(
              //       //     decoration: InputDecoration(
              //       //       labelText: 'City',
              //       //       labelStyle: GoogleFonts.firaSans(
              //       //         fontSize: 10.0,
              //       //         fontWeight: FontWeight.w400,
              //       //         color: ColorManager.greylight,
              //       //       ),
              //       //       focusedBorder: OutlineInputBorder(
              //       //         borderSide: BorderSide(
              //       //             color: ColorManager
              //       //                 .containerBorderGrey),
              //       //       ),
              //       //       border: OutlineInputBorder(
              //       //         borderRadius:
              //       //         BorderRadius.circular(4.0),
              //       //         borderSide: const BorderSide(
              //       //             color: Colors.grey),
              //       //       ),
              //       //       contentPadding:
              //       //       const EdgeInsets.symmetric(
              //       //         //   //  vertical: 5,
              //       //           horizontal: 12),
              //       //     ),
              //       //     // value: selectedCountry,
              //       //     icon: Icon(
              //       //       Icons.arrow_drop_down,
              //       //       color: ColorManager.blueprime,
              //       //     ),
              //       //     iconSize: 24,
              //       //     elevation: 16,
              //       //     style: GoogleFonts.firaSans(
              //       //       fontSize: 10.0,
              //       //       fontWeight: FontWeight.w400,
              //       //       color: const Color(0xff686464),
              //       //     ),
              //       //
              //       //     onChanged: (newValue) {
              //       //       for (var a in snapshot.data!) {
              //       //         if (a.cityName == newValue) {
              //       //          selectedCityEC = a.cityName!;
              //       //           //country = a
              //       //           // int? docType = a.companyOfficeID;
              //       //         }
              //       //       }
              //       //     },
              //       //     items: dropDownList.map((String value) {
              //       //       return DropdownMenuItem<String>(
              //       //         value: value,
              //       //         child: Text(
              //       //           value,
              //       //           style: GoogleFonts.firaSans(
              //       //             fontSize: 12,
              //       //             color: Color(0xff575757),
              //       //             fontWeight: FontWeight.w400,
              //       //           ),
              //       //         ),
              //       //       );
              //       //     }).toList(),
              //       //   ),
              //       // );
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),

              child: SchedularTextField(
                  controller: cityController,
                  labelText: "City*"),
            ),
            const SizedBox(width: AppSize.s35),
            ///state
            Flexible(
              // child:FutureBuilder<List<StateData>>(
              //   future: getStateDropDown(context),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return CustomDropdownTextFieldsm(
              //         initialValue: 'Select',
              //         headText: 'State*',items: [],
              //         onChanged: (newValue) {
              //
              //         },);
              //     }
              //     if (snapshot.hasData) {
              //       List<DropdownMenuItem<String>> dropDownList = [];
              //       for (var i in snapshot.data!) {
              //         dropDownList.add(DropdownMenuItem<String>(
              //           child: Text(i.name),
              //           value: i.name,
              //         ));
              //       }
              //
              //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
              //         onChanged: (newValue) {
              //           for (var a in snapshot.data!) {
              //             if (a.name == newValue) {
              //               selectedStateEC = a.name!;
              //               //country = a
              //               // int? docType = a.companyOfficeID;
              //             }
              //           }
              //         },);
              //
              //       // return SchedularDropdown(
              //       //   labelText: 'State',
              //       //   // labelStyle: GoogleFonts.firaSans(
              //       //   //   fontSize: 12,
              //       //   //   color: Color(0xff575757),
              //       //   //   fontWeight: FontWeight.w400,
              //       //   // ),
              //       //   // labelFontSize: 12,
              //       //   items: dropDownList,
              //       //   onChanged: (newValue) {
              //       //     for (var a in snapshot.data!) {
              //       //       if (a.name == newValue) {
              //       //         selectedStatepr = a.name!;
              //       //         // stateId = a.stateId!;
              //       //         //  print("Dept ID ${stateId}");
              //       //         // int docType = a.employeeTypesId;
              //       //         // Do something with docType
              //       //       }
              //       //     }
              //       //   },
              //       // );
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),
              child: SchedularTextField(
                  controller: stateController,
                  labelText: "State*"),
            ),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: zipCodePCController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),

          ],
        ),
        const SizedBox(height: AppSize.s16),
        CaregiverProvider.isContactTrue ?  Row(
          children: [
            ///state
            Flexible(
              // child:FutureBuilder<List<StateData>>(
              //   future: getStateDropDown(context),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState ==
              //         ConnectionState.waiting) {
              //       return CustomDropdownTextFieldsm(
              //         initialValue: 'Select',
              //         headText: 'State*',items: [],
              //         onChanged: (newValue) {
              //
              //         },);
              //     }
              //     if (snapshot.hasData) {
              //       List<DropdownMenuItem<String>> dropDownList = [];
              //       for (var i in snapshot.data!) {
              //         dropDownList.add(DropdownMenuItem<String>(
              //           child: Text(i.name),
              //           value: i.name,
              //         ));
              //       }
              //
              //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
              //         onChanged: (newValue) {
              //           for (var a in snapshot.data!) {
              //             if (a.name == newValue) {
              //               selectedStateEC = a.name!;
              //               //country = a
              //               // int? docType = a.companyOfficeID;
              //             }
              //           }
              //         },);
              //
              //       // return SchedularDropdown(
              //       //   labelText: 'State',
              //       //   // labelStyle: GoogleFonts.firaSans(
              //       //   //   fontSize: 12,
              //       //   //   color: Color(0xff575757),
              //       //   //   fontWeight: FontWeight.w400,
              //       //   // ),
              //       //   // labelFontSize: 12,
              //       //   items: dropDownList,
              //       //   onChanged: (newValue) {
              //       //     for (var a in snapshot.data!) {
              //       //       if (a.name == newValue) {
              //       //         selectedStatepr = a.name!;
              //       //         // stateId = a.stateId!;
              //       //         //  print("Dept ID ${stateId}");
              //       //         // int docType = a.employeeTypesId;
              //       //         // Do something with docType
              //       //       }
              //       //     }
              //       //   },
              //       // );
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),
              ///
              child: SchedularTextField(
                  controller: stateController,
                  labelText: "State*"),
            ),
            SizedBox(width: CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: zipCodePCController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),
            SizedBox(width: CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberPCController,
                    phoneField:true,
                    labelText: "Phone Number*")),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberPCController,
                    phoneField:true,
                    labelText: "Phone Number*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: emailPCController,
                    labelText: "Email")),
            // Empty container for alignment
            const SizedBox(width: AppSize.s35),
            Flexible(child: Container()),
            const SizedBox(width: AppSize.s35),
            Flexible(child: Container()),
            const SizedBox(width: AppSize.s35),
            Flexible(child: Container()),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        CaregiverProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: emailPCController,
                    labelText: "Email")),
            // Empty container for alignment
            SizedBox(width: CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(child: Container()),
            SizedBox(width:CaregiverProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(child: Container()),
          ],
        ) : const Offstage(),


      ],
    );
  }
}







