


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
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../widgets/constant_widgets/dropdown_constant_sm.dart';

import 'package:flutter/material.dart';
















class AddEemergencyContact extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  final List<EmergencyContactData> emergencyContactData;
  final Function(int index, EmergencyContactData updatedModel) onChanged;
   AddEemergencyContact({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible, required this.emergencyContactData, required this.onChanged});

  @override
  AddEemergencyContactState createState() => AddEemergencyContactState();
}

class AddEemergencyContactState extends State<AddEemergencyContact> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController suitAptController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (widget.emergencyContactData.length >= widget.index) {
      final data = widget.emergencyContactData[widget.index];
      firstNameController.text = data.firstName;
      lastNameController.text = data.lastName;
      suitAptController.text = data.suite;
      streetController.text = data.street;
      stateController.text = data.state;
      cityController.text = data.city;
      phoneNumberController.text = data.phoneNumber;
      zipCodeController.text = data.zipCode;
      emailController.text = data.email;
    }

    firstNameController.addListener(_updateModel);
    lastNameController.addListener(_updateModel);
    suitAptController.addListener(_updateModel);
    streetController.addListener(_updateModel);
    stateController.addListener(_updateModel);
    cityController.addListener(_updateModel);
    phoneNumberController.addListener(_updateModel);
    zipCodeController.addListener(_updateModel);
    emailController.addListener(_updateModel);
  }
  void _updateModel() {
    final updatedModel = EmergencyContactData(
        contactId: 0,
        fk_pt_id: 0,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        fk_Relationship: 1,
        street: streetController.text,
        suite: suitAptController.text,
        city: cityController.text,
        state: stateController.text,
        zipCode: zipCodeController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text

    );

    widget.onChanged(widget.index, updatedModel);
  }
  @override
  Widget build(BuildContext context) {
    print('First name ${firstNameController.text}');
    String? selectedRelationshipEC;
    final AddemergencyProvider = Provider.of<SmIntakeProviderManager>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.index >= 1)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 60,
                    child:Column(
                     children: [
                       const Divider(),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           IconButton(
                             splashColor: Colors.transparent,
                             highlightColor: Colors.transparent,
                             hoverColor: Colors.transparent,
                             icon: Icon(Icons.delete_outline_rounded, color:   ColorManager.bluebottom, ),
                             onPressed: widget.onRemove,
                           ),
                         ],
                       )
                     ],
                    ) ,),
              ),
        SizedBox(height: 16,),
        AddemergencyProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                  controller: firstNameController,
                  labelText: 'First Name*',
                )),
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNameController,
                  labelText: 'Last Name*',
                )),
            SizedBox(width: AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
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
                  controller: firstNameController,
                  labelText: 'First Name*',
                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNameController,
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
        AddemergencyProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: streetController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: suitAptController,
                    labelText: "Suite/Apt#")),
            SizedBox(width: AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),
    ///
              child: SchedularTextField(
                  controller: cityController,
                  labelText: "City*"),
            ),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: streetController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: suitAptController,
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),
    ///
              child: SchedularTextField(
                  controller: cityController,
                  labelText: "City*"),
            ),
            const SizedBox(width: AppSize.s35),
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
              //
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
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: zipCodeController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),

          ],
        ),
        const SizedBox(height: AppSize.s16),
        AddemergencyProvider.isContactTrue ?  Row(
          children: [
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
              //
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
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: zipCodeController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),
            SizedBox(width: AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberController,
                    phoneField: true,
                    labelText: "Phone Number*")),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberController,
                    phoneField: true,
                    labelText: "Phone Number*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: emailController,
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
        AddemergencyProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: emailController,
                    labelText: "Email")),
            // Empty container for alignment
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(child: Container()),
            SizedBox(width: AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(child: Container()),
          ],
        )
            : const Offstage(),
      ],
    );
  }
}






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






class Representative extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  final List<PatientRepresentativeData> patientRepresentativeData;
  final Function(int index, PatientRepresentativeData updatedModel) onChanged;
   Representative({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible, required this.patientRepresentativeData, required this.onChanged});

  @override
  RepresentativeState createState() => RepresentativeState();
}

class RepresentativeState extends State<Representative> {
  TextEditingController firstNamePRController = TextEditingController();

  TextEditingController lastNamePRController = TextEditingController();
  TextEditingController streetPRController = TextEditingController();

  TextEditingController ctlrCity = TextEditingController();
  TextEditingController suitAptPRController = TextEditingController();
  TextEditingController phoneNumberPRController = TextEditingController();

  TextEditingController zipCodePRController = TextEditingController();

  TextEditingController emailPRController = TextEditingController();

  TextEditingController ctlrState = TextEditingController();
  @override
  void initState() {
    super.initState();

    if (widget.patientRepresentativeData.length >= widget.index) {
      final data = widget.patientRepresentativeData[widget.index];
      firstNamePRController.text = data.firstName;
      lastNamePRController.text = data.lastName;
      suitAptPRController.text = data.suite;
      streetPRController.text = data.street;
      ctlrCity.text = data.city;
      phoneNumberPRController.text = data.phoneNumber;
      zipCodePRController.text = data.zipCode;
      emailPRController.text = data.email;
    }

    firstNamePRController.addListener(_updateModel);
    lastNamePRController.addListener(_updateModel);
    suitAptPRController.addListener(_updateModel);
    streetPRController.addListener(_updateModel);
    ctlrCity.addListener(_updateModel);
    phoneNumberPRController.addListener(_updateModel);
    zipCodePRController.addListener(_updateModel);
    emailPRController.addListener(_updateModel);
  }
  void _updateModel() {
    final updatedModel = PatientRepresentativeData(
        representiveId: 0,
        fk_pt_id: 0,
        firstName: firstNamePRController.text,
        lastName: lastNamePRController.text,
        fk_Relationship: 1,
        street: streetPRController.text,
        suite: suitAptPRController.text,
        city: ctlrCity.text,
        zipCode: zipCodePRController.text,
        phoneNumber: phoneNumberPRController.text,
        email: emailPRController.text, state: '', RoleId: 0, typeId: 0

    );

    widget.onChanged(widget.index, updatedModel);
  }
  @override
  Widget build(BuildContext context) {
    final RepresentativeProvider = Provider.of<SmIntakeProviderManager>(context, listen: false);



    String? selectedRelationshipEC;
    String? selectedRole;
    String? selectedType;

    bool copyEmergencyContactPR = false;
    bool copyPrimaryCaregiverPR = false;
    bool noPRData = false;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.index > 1) ...[
          const Divider(),
          const SizedBox(height: 20),
        ],
        Padding(
          padding: EdgeInsets.only(top: widget.index > 1 ? 10 : 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CheckboxTile(
                    title: 'Copy Emergency Contact',
                    initialValue: copyEmergencyContactPR,
                    onChanged: (value) {
                      // Handle state change
                    },
                  ),
                  const SizedBox(width: 20),
                  CheckboxTile(
                    title: 'Copy Primary Caregiver',
                    initialValue: copyPrimaryCaregiverPR,
                    onChanged: (value) {
                      // Handle state change
                    },
                  ),
                ],
              ),
              (widget.index >= 1)
                  ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                icon: Icon(Icons.delete_outline_rounded, color: ColorManager.bluebottom),
                onPressed: widget.onRemove,
              )
                  : CheckboxTile(
                title: 'No Selected Representative',
                initialValue: noPRData,
                onChanged: (value) {
                  // Handle state change
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s16),
        RepresentativeProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                  controller: firstNamePRController,
                  labelText: 'First Name*',

                )),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNamePRController,
                  labelText: 'Last Name*',
                )),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
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

                    return
                      CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
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
                  controller: firstNamePRController,
                  labelText: 'First Name*',

                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNamePRController,
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

                    return
                      CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
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
            Flexible(
                child: FutureBuilder<List<RelatedPartiesRoleData>>(
                  future: getRelataedRoleDropDown(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CustomDropdownTextFieldsm(
                        initialValue: 'Select',
                        headText: 'Role*',items: [],
                        onChanged: (newValue) {

                        },);
                    }
                    if (snapshot.hasData) {
                      List<DropdownMenuItem<String>> dropDownList = [];
                      for (var i in snapshot.data!) {
                        dropDownList.add(DropdownMenuItem<String>(
                          child: Text(i.roleName!),
                          value: i.roleName,
                        ));
                      }

                      return
                        CustomDropdownTextFieldsm(headText: 'Role*',dropDownMenuList: dropDownList,
                          onChanged: (newValue) {
                            for (var a in snapshot.data!) {
                              if (a.roleName == newValue) {
                                selectedRole = a.roleName!;
                                //country = a
                                // int? docType = a.companyOfficeID;
                              }
                            }
                          },);


                    } else {
                      return const Offstage();
                    }
                  },
                ),),
            const SizedBox(width: AppSize.s35),
            Flexible(
              child: FutureBuilder<List<RelatedPatiesTypeData>>(
                future: getRelataedTypeDropDown(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CustomDropdownTextFieldsm(
                      initialValue: 'Select',
                      headText: 'Type*',items: [],
                      onChanged: (newValue) {

                      },);
                  }
                  if (snapshot.hasData) {
                    List<DropdownMenuItem<String>> dropDownList = [];
                    for (var i in snapshot.data!) {
                      dropDownList.add(DropdownMenuItem<String>(
                        child: Text(i.typeName!),
                        value: i.typeName,
                      ));
                    }

                    return
                      CustomDropdownTextFieldsm(headText: 'Type*',dropDownMenuList: dropDownList,
                        onChanged: (newValue) {
                          for (var a in snapshot.data!) {
                            if (a.typeName == newValue) {
                              selectedType = a.typeName!;
                              //country = a
                              // int? docType = a.companyOfficeID;
                            }
                          }
                        },);
                  } else {
                    return const Offstage();
                  }
                },
              ),),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        RepresentativeProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                  onChanged: (newValue) {

                  },)),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                  onChanged: (newValue) {

                  },)),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: streetPRController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: streetPRController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: suitAptPRController,
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),

              child: SchedularTextField(
                  controller: ctlrCity,
                  labelText: AppString.city),
            ),
            const SizedBox(width: AppSize.s35),
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),
              //
                child: SchedularTextField(
                  labelText: "State*",
                  controller: ctlrState,
                )
            ),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: zipCodePRController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),

          ],
        ),
        const SizedBox(height: AppSize.s16),
        RepresentativeProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: suitAptPRController,
                    labelText: "Suite/Apt#")),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),

              child: SchedularTextField(
                  controller: ctlrCity,
                  labelText: AppString.city),
            ),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
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
              //
              //     } else {
              //       return const Offstage();
              //     }
              //   },
              // ),

                child: SchedularTextField(
                  labelText: "State*",
                  controller: ctlrState,
                )
            ),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberPRController,
                    phoneField:true,
                    labelText: "Phone Number*")),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: emailPRController,
                    labelText: "Email")),
            // Empty container for alignment
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(child: Container()),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(child: Container()),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(child: Container()),
          ],
        ),
        const SizedBox(height: AppSize.s16),
        RepresentativeProvider.isContactTrue ?  Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    controller: zipCodePRController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: phoneNumberPRController,
                    phoneField:true,
                    labelText: "Phone Number*")),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    controller: emailPRController,
                    labelText: "Email")),
          ],
        ):
        const Offstage(),
      ],
    );
  }
}
