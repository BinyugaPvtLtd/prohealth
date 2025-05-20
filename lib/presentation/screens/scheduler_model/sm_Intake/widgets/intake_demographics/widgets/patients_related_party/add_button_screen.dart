


import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../widgets/constant_widgets/dropdown_constant_sm.dart';

class EmergencyContactProvider extends ChangeNotifier {
  final List<GlobalKey<AddEemergencyContactState>> _addEmergencyContactKeys = [];
  bool _isVisible = false;

  List<GlobalKey<AddEemergencyContactState>> get addEmergencyContactKeys => _addEmergencyContactKeys;
  bool get isVisible => _isVisible;

  EmergencyContactProvider() {
    // Add first form by default
    if (_addEmergencyContactKeys.isEmpty) {
      addEmergency(initial: true);
    }
  }

  void addEmergency({bool initial = false}) {
    _addEmergencyContactKeys.add(GlobalKey<AddEemergencyContactState>());
    if (!initial) notifyListeners(); // Avoid notifying twice during initialization
  }

  void removeEmergency(GlobalKey<AddEemergencyContactState> key) {
    _addEmergencyContactKeys.remove(key);
    notifyListeners();
  }

  void toggleVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void setVisibility(bool value) {
    _isVisible = value;
    notifyListeners();
  }
}













class AddEemergencyContact extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  const AddEemergencyContact({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible});

  @override
  AddEemergencyContactState createState() => AddEemergencyContactState();
}

class AddEemergencyContactState extends State<AddEemergencyContact> {
  @override
  Widget build(BuildContext context) {

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController suitAptController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    String? selectedRelationshipEC;

    final AddemergencyProvider = Provider.of<SmIntakeProviderManager>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.index > 1)
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
