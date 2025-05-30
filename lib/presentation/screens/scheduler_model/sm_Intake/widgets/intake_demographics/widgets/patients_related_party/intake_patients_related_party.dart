import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/intake/related_parties_manager.dart';
import '../../../../../../../../app/services/api/managers/sm_module_manager/sm_intake_manager/intake_demographics/intake_demographic_dropdown_manager.dart';
import '../../../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographics_dropdown_data.dart';
import '../../../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/related_parties_data.dart';
import '../../../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../../../em_module/widgets/button_constant.dart';
import '../../../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../../../../textfield_dropdown_constant/schedular_textfield_withbutton_const.dart';
import '../../../../../widgets/constant_widgets/button_constant.dart';
import '../../../intake_flow_contgainer_const.dart';
import 'add_button_screen.dart';
class EmergencyContactProvider extends ChangeNotifier {
  // === Emergency Contact State ===
  final List<GlobalKey<_AddEemergencyContactState>> _addEmergencyContactKeys = [];
  bool _isEmergencyVisible = false;

  // === Primary Caregiver State ===
  final List<GlobalKey<PrimaryCaregiverState>> _primaryCaregiverKeys = [];
  bool _isCaregiverVisible = false;

  // === Representative State ===
  final List<GlobalKey<_RepresentativeState>> _representativeKeys = [];
  bool _isRepresentativeVisible = false;

  // === Constructor ===
  EmergencyContactProvider() {
    if (_addEmergencyContactKeys.isEmpty) {
      // addEmergency(initial: true);
    }
    if (_primaryCaregiverKeys.isEmpty) {
      addCaregiver(initial: true);
    }
    if (_representativeKeys.isEmpty) {
     // addRepresentative(initial: true);
    }
  }

  // === Emergency Contact Methods ===
  List<GlobalKey<_AddEemergencyContactState>> get addEmergencyContactKeys => _addEmergencyContactKeys;
  // List<EmergencyContactData> _emergencyContactData = [];

  // List<EmergencyContactData> get emergencyContactData => _emergencyContactData;
  bool get isEmergencyVisible => _isEmergencyVisible;

  void loadDiagnosisFromApi(List<EmergencyContactData> apiData) {
    _addEmergencyContactKeys.clear();
    // _emergencyContactData = apiData;
    for (var _ in apiData) {
      _addEmergencyContactKeys.add(GlobalKey<_AddEemergencyContactState>());
    }
    notifyListeners();
  }

  void addEmergency({bool initial = false}) {
    _addEmergencyContactKeys.add(GlobalKey<_AddEemergencyContactState>());

    // _emergencyContactData.add(
      // EmergencyContactData(
      //     contactId: 0,
      //     fk_pt_id: 0,
      //     firstName: '',
      //     lastName: '',
      //     fk_Relationship: 0,
      //     street: '',
      //     suite: '',
      //     city: '',
      //     state: '',
      //     zipCode: '',
      //     phoneNumber: '',
      //     email: ''
      //   // assuming 2 is default for white
      // ),
    // );
    notifyListeners();
    //if (!initial) notifyListeners();
  }
  void updateEmergencyContact(int index, EmergencyContactData model) {
    // if (index >= 0 && index < _emergencyContactData.length) {
    //   _emergencyContactData[index] = model;
    //   notifyListeners();
    // }
  }
  void removeEmergency(GlobalKey<_AddEemergencyContactState> key) {
    int index = _addEmergencyContactKeys.indexOf(key);
    if (index != -1) {
      _addEmergencyContactKeys.removeAt(index);
      // _emergencyContactData!.removeAt(index);
      notifyListeners();
    }
    // _addEmergencyContactKeys.remove(key);
    // _emergencyContactData!.removeAt(index);
    // notifyListeners();
  }

  void setEmergencyVisibility(bool value) {
    _isEmergencyVisible = value;
    notifyListeners();
  }

  void toggleEmergencyVisibility() {
    _isEmergencyVisible = !_isEmergencyVisible;
    notifyListeners();
  }

  // === Primary Caregiver Methods ===
  List<GlobalKey<PrimaryCaregiverState>> get primaryCaregiverKeys => _primaryCaregiverKeys;
  bool get isCaregiverVisible => _isCaregiverVisible;

  void addCaregiver({bool initial = false}) {
    _primaryCaregiverKeys.add(GlobalKey<PrimaryCaregiverState>());
     if (!initial) notifyListeners();
  }

  void removeCaregiver(GlobalKey<PrimaryCaregiverState> key) {
    _primaryCaregiverKeys.remove(key);
    notifyListeners();
  }

  void setCaregiverVisibility(bool value) {
    _isCaregiverVisible = value;
    notifyListeners();
  }

  void toggleCaregiverVisibility() {
    _isCaregiverVisible = !_isCaregiverVisible;
    notifyListeners();
  }

  // === Representative Methods ===
  List<PatientRepresentativeData> _patientRepresentativeData = [];
  List<GlobalKey<_RepresentativeState>> get representativeKeys => _representativeKeys;
  bool get isRepresentativeVisible => _isRepresentativeVisible;
  List<PatientRepresentativeData> get patientRepresentativeData => _patientRepresentativeData;


  void loadRepresentativeFromApi(List<PatientRepresentativeData> apiData) {
    _representativeKeys.clear();
    _patientRepresentativeData = apiData;
    for (var _ in apiData) {
      _representativeKeys.add(GlobalKey<_RepresentativeState>());
    }
    notifyListeners();
  }
  void addRepresentative({bool initial = false}) {
    _representativeKeys.add(GlobalKey<_RepresentativeState>());
    // _patientRepresentativeData.add(
    //   PatientRepresentativeData(
    //       representiveId: 0,
    //       fk_pt_id: 0,
    //       firstName: '',
    //       lastName: '',
    //       fk_Relationship: 0,
    //       street: '',
    //       suite: '',
    //       city: '',
    //       state: '',
    //       zipCode: '',
    //       phoneNumber: '',
    //       email: '',
    //       RoleId: 0,
    //       typeId: 0
    //     // assuming 2 is default for white
    //   ),
    // );
    notifyListeners();
    // if (!initial) notifyListeners();
  }
  void updateRepresentative(int index, PatientRepresentativeData model) {
    if (index >= 0 && index < _patientRepresentativeData.length) {
      _patientRepresentativeData[index] = model;
      notifyListeners();
    }
  }
  void removeRepresentative(GlobalKey<_RepresentativeState> key) {
    int index = _representativeKeys.indexOf(key);
    if (index != -1) {
      _representativeKeys.removeAt(index);
      _patientRepresentativeData!.removeAt(index);
      notifyListeners();
    }
    // _representativeKeys.remove(key);
    // notifyListeners();
  }

  void setRepresentativeVisibility(bool value) {
    _isRepresentativeVisible = value;
    notifyListeners();
  }

  void toggleRepresentativeVisibility() {
    _isRepresentativeVisible = !_isRepresentativeVisible;
    notifyListeners();
  }
}
class IntakeRelatedPartiesScreen extends StatefulWidget {
  final int patientId;

   IntakeRelatedPartiesScreen({
    super.key,
    required this.patientId,
  });

  @override
  State<IntakeRelatedPartiesScreen> createState() => _IntakeRelatedPartiesScreenState();
}

class _IntakeRelatedPartiesScreenState extends State<IntakeRelatedPartiesScreen> {
   List<GlobalKey<_AddEemergencyContactState>> addEmergencyContactKeys = [];
   List<PatientRepresentativeData> patientRepresentativeData = [];
    List<GlobalKey<_RepresentativeState>> representativeKeys = [];
   List<EmergencyContactData> prefilledData = [];
   bool isLoading = false;
   bool isVisibleContact = false;
   void addRepresentative() {
     setState(() {
       representativeKeys.add(GlobalKey<_RepresentativeState>());
     });
   }
   void removeRepresentative(GlobalKey<_RepresentativeState> key) {
     setState(() {
       representativeKeys.remove(key);
     });
   }
   void addEmergency() {
     setState(() {
       addEmergencyContactKeys.add(GlobalKey<_AddEemergencyContactState>());
     });
   }
   void removeEmploymentForm(GlobalKey<_AddEemergencyContactState> key) {
     setState(() {
       addEmergencyContactKeys.remove(key);
     });
   }
  @override
  void initState() {
    // TODO: implement initState
    loadInitialemergencyData();
    loadInitialrepresentative();
    super.initState();
  }
  Future<void> loadInitialrepresentative() async{
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    final providerState = Provider.of<EmergencyContactProvider>(context, listen: false);
    List<PatientRepresentativeData> apiDataRepresentative = await getPatientRepresentative(context: context, ptId: provider.patientId);
    if(apiDataRepresentative.isEmpty){
      setState(() {
        addRepresentative();
      });

    }else{
      setState(() {
        patientRepresentativeData = apiDataRepresentative; // Store the prefilled data
        representativeKeys = List.generate(
          patientRepresentativeData.length,
              (index) => GlobalKey<_RepresentativeState>(),
        );
        // final providerState = Provider.of<HrProgressMultiStape>(context,listen: false);
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     providerState.a();
        //   });
        // });
      });
    }
    // providerState.loadRepresentativeFromApi(apiDataRepresentative);
  }
  Future<void> loadInitialemergencyData() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    final providerState = Provider.of<EmergencyContactProvider>(context, listen: false);
    List<EmergencyContactData> apiData = await getPatientEmergencyContact(context: context, ptId: provider.patientId);

    if (apiData.isEmpty) {
      // If no data exists, allow user to add a new form
      setState(() {
        addEmergency();
      });
    } else {
      setState(() {
        prefilledData = apiData; // Store the prefilled data
        addEmergencyContactKeys = List.generate(
          prefilledData.length,
              (index) => GlobalKey<_AddEemergencyContactState>(),
        );
        // final providerState = Provider.of<HrProgressMultiStape>(context,listen: false);
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     providerState.a();
      //   });
      // });
    });
    // ← Your API call
    //provider.setVisibility(true);
  }
          // providerState.loadDiagnosisFromApi(apiData);

  }
  @override
  Widget build(BuildContext context) {
    final providerPtId = Provider.of<DiagnosisProvider>(context, listen: false);
    bool noEmergencyData = false;

    return Scaffold(
      backgroundColor: ColorManager.white,
      body:  Center(
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
                  const SizedBox(height: 20,),
                  // InkWell(
                  //     splashColor: Colors.transparent,
                  //     highlightColor: Colors.transparent,
                  //     hoverColor: Colors.transparent,
                  //     onTap:(){},
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                  //       child: Row(
                  //         children: [
                  //           Icon(
                  //             Icons.arrow_back,
                  //             size: IconSize.I16,
                  //             color: ColorManager.mediumgrey,
                  //
                  //           ),
                  //           SizedBox(width: 5,),
                  //           Text(
                  //             'Go Back',
                  //            style:TextStyle(
                  //              fontSize: FontSize.s14,
                  //              fontWeight: FontWeight.w700,
                  //              color: ColorManager.mediumgrey,
                  //            ),
                  //           ),
                  //         ],
                  //       ),
                  //     )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Emergency Contact*"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p50,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: AppSize.s16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CheckboxTile(
                              title: 'No Emergency Contact',
                              initialValue: noEmergencyData,
                              onChanged: (value) {

                              },
                            )
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),


                        Column(
                          children: addEmergencyContactKeys.asMap().entries.map((entry) {
                            int index = entry.key;
                            GlobalKey<_AddEemergencyContactState> key = entry.value;
                            // List<EmergencyContactData> data = provider.emergencyContactData;
                            // print('Provider data ${data.length}');
                            return AddEemergencyContact(
                              // onChanged: (int index, EmergencyContactData updatedModel) {
                              //   provider.updateEmergencyContact(index, updatedModel);
                              // },
                              key: key,
                              index: index + 1,
                              onRemove: () => removeEmploymentForm,
                              patientId: widget.patientId,
                              isVisible: isVisibleContact, //emergencyContactData: data,
                            );
                          }).toList(),
                        ),

                      //   providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNameController,
                      //             labelText: 'First Name*',
                      //           )),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: lastNameController,
                      //             labelText: 'Last Name*',
                      //           )),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.relationship == newValue) {
                      //                       selectedRelationshipEC = a.relationship!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNameController,
                      //             labelText: 'First Name*',
                      //           )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: lastNameController,
                      //               labelText: 'Last Name*',
                      //               )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.relationship == newValue) {
                      //                       selectedRelationshipEC = a.relationship!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       const Flexible(
                      //           child: SizedBox()),
                      //       const SizedBox(width: AppSize.s35),
                      //       const Flexible(
                      //           child: SizedBox()),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetController,
                      //               labelText: "Street*")),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptController,
                      //               labelText: "Suite/Apt#")),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         child: FutureBuilder<List<CityData>>(
                      //           future: getCityDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'City*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.cityName!),
                      //                   value: i.cityName,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.cityName == newValue) {
                      //                       selectedCityEC = a.cityName!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //               //   SizedBox(
                      //               //   height: 27,
                      //               //   child: DropdownButtonFormField<String>(
                      //               //     decoration: InputDecoration(
                      //               //       labelText: 'City',
                      //               //       labelStyle: GoogleFonts.firaSans(
                      //               //         fontSize: 10.0,
                      //               //         fontWeight: FontWeight.w400,
                      //               //         color: ColorManager.greylight,
                      //               //       ),
                      //               //       focusedBorder: OutlineInputBorder(
                      //               //         borderSide: BorderSide(
                      //               //             color: ColorManager
                      //               //                 .containerBorderGrey),
                      //               //       ),
                      //               //       border: OutlineInputBorder(
                      //               //         borderRadius:
                      //               //         BorderRadius.circular(4.0),
                      //               //         borderSide: const BorderSide(
                      //               //             color: Colors.grey),
                      //               //       ),
                      //               //       contentPadding:
                      //               //       const EdgeInsets.symmetric(
                      //               //         //   //  vertical: 5,
                      //               //           horizontal: 12),
                      //               //     ),
                      //               //     // value: selectedCountry,
                      //               //     icon: Icon(
                      //               //       Icons.arrow_drop_down,
                      //               //       color: ColorManager.blueprime,
                      //               //     ),
                      //               //     iconSize: 24,
                      //               //     elevation: 16,
                      //               //     style: GoogleFonts.firaSans(
                      //               //       fontSize: 10.0,
                      //               //       fontWeight: FontWeight.w400,
                      //               //       color: const Color(0xff686464),
                      //               //     ),
                      //               //
                      //               //     onChanged: (newValue) {
                      //               //       for (var a in snapshot.data!) {
                      //               //         if (a.cityName == newValue) {
                      //               //          selectedCityEC = a.cityName!;
                      //               //           //country = a
                      //               //           // int? docType = a.companyOfficeID;
                      //               //         }
                      //               //       }
                      //               //     },
                      //               //     items: dropDownList.map((String value) {
                      //               //       return DropdownMenuItem<String>(
                      //               //         value: value,
                      //               //         child: Text(
                      //               //           value,
                      //               //           style: GoogleFonts.firaSans(
                      //               //             fontSize: 12,
                      //               //             color: Color(0xff575757),
                      //               //             fontWeight: FontWeight.w400,
                      //               //           ),
                      //               //         ),
                      //               //       );
                      //               //     }).toList(),
                      //               //   ),
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //
                      //         // child: SchedularTextField(
                      //         //     controller: ctlrCity,
                      //         //     labelText: AppString.city),
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetController,
                      //               labelText: "Street*")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptController,
                      //               labelText: "Suite/Apt#")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child: FutureBuilder<List<CityData>>(
                      //           future: getCityDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'City*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.cityName!),
                      //                   value: i.cityName,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.cityName == newValue) {
                      //                       selectedCityEC = a.cityName!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //               //   SizedBox(
                      //               //   height: 27,
                      //               //   child: DropdownButtonFormField<String>(
                      //               //     decoration: InputDecoration(
                      //               //       labelText: 'City',
                      //               //       labelStyle: GoogleFonts.firaSans(
                      //               //         fontSize: 10.0,
                      //               //         fontWeight: FontWeight.w400,
                      //               //         color: ColorManager.greylight,
                      //               //       ),
                      //               //       focusedBorder: OutlineInputBorder(
                      //               //         borderSide: BorderSide(
                      //               //             color: ColorManager
                      //               //                 .containerBorderGrey),
                      //               //       ),
                      //               //       border: OutlineInputBorder(
                      //               //         borderRadius:
                      //               //         BorderRadius.circular(4.0),
                      //               //         borderSide: const BorderSide(
                      //               //             color: Colors.grey),
                      //               //       ),
                      //               //       contentPadding:
                      //               //       const EdgeInsets.symmetric(
                      //               //         //   //  vertical: 5,
                      //               //           horizontal: 12),
                      //               //     ),
                      //               //     // value: selectedCountry,
                      //               //     icon: Icon(
                      //               //       Icons.arrow_drop_down,
                      //               //       color: ColorManager.blueprime,
                      //               //     ),
                      //               //     iconSize: 24,
                      //               //     elevation: 16,
                      //               //     style: GoogleFonts.firaSans(
                      //               //       fontSize: 10.0,
                      //               //       fontWeight: FontWeight.w400,
                      //               //       color: const Color(0xff686464),
                      //               //     ),
                      //               //
                      //               //     onChanged: (newValue) {
                      //               //       for (var a in snapshot.data!) {
                      //               //         if (a.cityName == newValue) {
                      //               //          selectedCityEC = a.cityName!;
                      //               //           //country = a
                      //               //           // int? docType = a.companyOfficeID;
                      //               //         }
                      //               //       }
                      //               //     },
                      //               //     items: dropDownList.map((String value) {
                      //               //       return DropdownMenuItem<String>(
                      //               //         value: value,
                      //               //         child: Text(
                      //               //           value,
                      //               //           style: GoogleFonts.firaSans(
                      //               //             fontSize: 12,
                      //               //             color: Color(0xff575757),
                      //               //             fontWeight: FontWeight.w400,
                      //               //           ),
                      //               //         ),
                      //               //       );
                      //               //     }).toList(),
                      //               //   ),
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //
                      //         // child: SchedularTextField(
                      //         //     controller: ctlrCity,
                      //         //     labelText: AppString.city),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<StateData>>(
                      //           future: getStateDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'State*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.name),
                      //                   value: i.name,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.name == newValue) {
                      //                       selectedStateEC = a.name!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //               // return SchedularDropdown(
                      //               //   labelText: 'State',
                      //               //   // labelStyle: GoogleFonts.firaSans(
                      //               //   //   fontSize: 12,
                      //               //   //   color: Color(0xff575757),
                      //               //   //   fontWeight: FontWeight.w400,
                      //               //   // ),
                      //               //   // labelFontSize: 12,
                      //               //   items: dropDownList,
                      //               //   onChanged: (newValue) {
                      //               //     for (var a in snapshot.data!) {
                      //               //       if (a.name == newValue) {
                      //               //         selectedStatepr = a.name!;
                      //               //         // stateId = a.stateId!;
                      //               //         //  print("Dept ID ${stateId}");
                      //               //         // int docType = a.employeeTypesId;
                      //               //         // Do something with docType
                      //               //       }
                      //               //     }
                      //               //   },
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodeController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //         child:FutureBuilder<List<StateData>>(
                      //           future: getStateDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'State*',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.name),
                      //                   value: i.name,
                      //                 ));
                      //               }
                      //
                      //               return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //                 onChanged: (newValue) {
                      //                   for (var a in snapshot.data!) {
                      //                     if (a.name == newValue) {
                      //                       selectedStateEC = a.name!;
                      //                       //country = a
                      //                       // int? docType = a.companyOfficeID;
                      //                     }
                      //                   }
                      //                 },);
                      //
                      //               // return SchedularDropdown(
                      //               //   labelText: 'State',
                      //               //   // labelStyle: GoogleFonts.firaSans(
                      //               //   //   fontSize: 12,
                      //               //   //   color: Color(0xff575757),
                      //               //   //   fontWeight: FontWeight.w400,
                      //               //   // ),
                      //               //   // labelFontSize: 12,
                      //               //   items: dropDownList,
                      //               //   onChanged: (newValue) {
                      //               //     for (var a in snapshot.data!) {
                      //               //       if (a.name == newValue) {
                      //               //         selectedStatepr = a.name!;
                      //               //         // stateId = a.stateId!;
                      //               //         //  print("Dept ID ${stateId}");
                      //               //         // int docType = a.employeeTypesId;
                      //               //         // Do something with docType
                      //               //       }
                      //               //     }
                      //               //   },
                      //               // );
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodeController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberController,
                      //               phoneField: true,
                      //               labelText: "Phone Number*")),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberController,
                      //               phoneField: true,
                      //               labelText: "Phone Number*")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailController,
                      //               labelText: "Email")),
                      //        // Empty container for alignment
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(child: Container()),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailController,
                      //               labelText: "Email")),
                      //       // Empty container for alignment
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(child: Container()),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(child: Container()),
                      //     ],
                      //   )
                      //     : const Offstage(),


                      ///
                        const SizedBox(height: AppSize.s16),
                        CustomIconButtonConst(
                            width:  AppSize.s200,
                            text: 'Add Emergency Contact',
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                isVisibleContact = true;
                                addEmergency();
                              });

                              //Provider.of<EmergencyContactProvider>(context,listen: false).addEmergency();
                            }),
                        const SizedBox(height: AppSize.s16),
                        const Divider(),
                      ],
                    ),
                  ),

                  // const SizedBox(height: AppSize.s40),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  //   child: BlueBGHeadConst(HeadText: "Primary Caregiver*"),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: AppPadding.p50,),
                  //   child: Column(
                  //     children: [
                  //     //   Row(
                  //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //     children: [
                  //     //       Row(
                  //     //         mainAxisAlignment: MainAxisAlignment.start,
                  //     //         spacing: 20,
                  //     //         children: [
                  //     //           CheckboxTile(
                  //     //             title: 'Copy Emergency Contact',
                  //     //             initialValue: copyEmergencyContactPC,
                  //     //             onChanged: (value) {
                  //     //               // setState(() {
                  //     //               //
                  //     //               // });
                  //     //             },
                  //     //           ),
                  //     //           CheckboxTile(
                  //     //             title: 'Copy Patient Representative',
                  //     //             initialValue: copyPatientPC,
                  //     //             onChanged: (value) {
                  //     //
                  //     //             },
                  //     //           )
                  //     //         ],
                  //     //       ),
                  //     //       CheckboxTile(
                  //     //         title: 'No Caregiver Available',
                  //     //         initialValue: noPCData,
                  //     //         onChanged: (value) {
                  //     //
                  //     //         },
                  //     //       )
                  //     //
                  //     //     ],
                  //     //   ),
                  //     //   const SizedBox(height: AppSize.s16),
                  //     // providerState.isContactTrue ?  Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //             controller: firstNamePCController,
                  //     //             labelText: 'First Name*',
                  //     //
                  //     //           )),
                  //     //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //             controller: lastNamePCController,
                  //     //             labelText: 'Last Name*',
                  //     //           )),
                  //     //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //         child:FutureBuilder<List<RelationshipData>>(
                  //     //           future: getRelationshipDropDown(context),
                  //     //           builder: (context, snapshot) {
                  //     //             if (snapshot.connectionState ==
                  //     //                 ConnectionState.waiting) {
                  //     //               return CustomDropdownTextFieldsm(
                  //     //                 initialValue: 'Select',
                  //     //                 headText: 'Relationship',items: [],
                  //     //                 onChanged: (newValue) {
                  //     //
                  //     //                 },);
                  //     //             }
                  //     //             if (snapshot.hasData) {
                  //     //               List<DropdownMenuItem<String>> dropDownList = [];
                  //     //               for (var i in snapshot.data!) {
                  //     //                 dropDownList.add(DropdownMenuItem<String>(
                  //     //                   child: Text(i.relationship!),
                  //     //                   value: i.relationship,
                  //     //                 ));
                  //     //               }
                  //     //
                  //     //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                  //     //                 onChanged: (newValue) {
                  //     //                   for (var a in snapshot.data!) {
                  //     //                     if (a.relationship == newValue) {
                  //     //                       selectedRelationshipEC = a.relationship!;
                  //     //                       //country = a
                  //     //                       // int? docType = a.companyOfficeID;
                  //     //                     }
                  //     //                   }
                  //     //                 },);
                  //     //
                  //     //
                  //     //             } else {
                  //     //               return const Offstage();
                  //     //             }
                  //     //           },
                  //     //         ),
                  //     //       ),
                  //     //     ],
                  //     //   ):
                  //     //   Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //             controller: firstNamePCController,
                  //     //             labelText: 'First Name*',
                  //     //
                  //     //           )),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: lastNamePCController,
                  //     //               labelText: 'Last Name*',
                  //     //               )),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //         child:FutureBuilder<List<RelationshipData>>(
                  //     //           future: getRelationshipDropDown(context),
                  //     //           builder: (context, snapshot) {
                  //     //             if (snapshot.connectionState ==
                  //     //                 ConnectionState.waiting) {
                  //     //               return CustomDropdownTextFieldsm(
                  //     //                 initialValue: 'Select',
                  //     //                 headText: 'Relationship',items: [],
                  //     //                 onChanged: (newValue) {
                  //     //
                  //     //                 },);
                  //     //             }
                  //     //             if (snapshot.hasData) {
                  //     //               List<DropdownMenuItem<String>> dropDownList = [];
                  //     //               for (var i in snapshot.data!) {
                  //     //                 dropDownList.add(DropdownMenuItem<String>(
                  //     //                   child: Text(i.relationship!),
                  //     //                   value: i.relationship,
                  //     //                 ));
                  //     //               }
                  //     //
                  //     //               return CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                  //     //                 onChanged: (newValue) {
                  //     //                   for (var a in snapshot.data!) {
                  //     //                     if (a.relationship == newValue) {
                  //     //                       selectedRelationshipEC = a.relationship!;
                  //     //                       //country = a
                  //     //                       // int? docType = a.companyOfficeID;
                  //     //                     }
                  //     //                   }
                  //     //                 },);
                  //     //
                  //     //
                  //     //             } else {
                  //     //               return const Offstage();
                  //     //             }
                  //     //           },
                  //     //         ),
                  //     //       ),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       const Flexible(
                  //     //           child: SizedBox()),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       const Flexible(
                  //     //           child: SizedBox()),
                  //     //     ],
                  //     //   ),
                  //     //   const SizedBox(height: AppSize.s16),
                  //     //   providerState.isContactTrue ?  Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: streetPCController,
                  //     //               icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                  //     //               labelText: "Street*")),
                  //     //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: suitAptPCController,
                  //     //               labelText: "Suite/Apt#")),
                  //     //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //         // child: FutureBuilder<List<CityData>>(
                  //     //         //   future: getCityDropDown(context),
                  //     //         //   builder: (context, snapshot) {
                  //     //         //     if (snapshot.connectionState ==
                  //     //         //         ConnectionState.waiting) {
                  //     //         //       return CustomDropdownTextFieldsm(
                  //     //         //         initialValue: 'Select',
                  //     //         //         headText: 'City*',items: [],
                  //     //         //         onChanged: (newValue) {
                  //     //         //
                  //     //         //         },);
                  //     //         //     }
                  //     //         //     if (snapshot.hasData) {
                  //     //         //       List<DropdownMenuItem<String>> dropDownList = [];
                  //     //         //       for (var i in snapshot.data!) {
                  //     //         //         dropDownList.add(DropdownMenuItem<String>(
                  //     //         //           child: Text(i.cityName!),
                  //     //         //           value: i.cityName,
                  //     //         //         ));
                  //     //         //       }
                  //     //         //
                  //     //         //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                  //     //         //         onChanged: (newValue) {
                  //     //         //           for (var a in snapshot.data!) {
                  //     //         //             if (a.cityName == newValue) {
                  //     //         //               selectedCityEC = a.cityName!;
                  //     //         //               //country = a
                  //     //         //               // int? docType = a.companyOfficeID;
                  //     //         //             }
                  //     //         //           }
                  //     //         //         },);
                  //     //         //       //   SizedBox(
                  //     //         //       //   height: 27,
                  //     //         //       //   child: DropdownButtonFormField<String>(
                  //     //         //       //     decoration: InputDecoration(
                  //     //         //       //       labelText: 'City',
                  //     //         //       //       labelStyle: GoogleFonts.firaSans(
                  //     //         //       //         fontSize: 10.0,
                  //     //         //       //         fontWeight: FontWeight.w400,
                  //     //         //       //         color: ColorManager.greylight,
                  //     //         //       //       ),
                  //     //         //       //       focusedBorder: OutlineInputBorder(
                  //     //         //       //         borderSide: BorderSide(
                  //     //         //       //             color: ColorManager
                  //     //         //       //                 .containerBorderGrey),
                  //     //         //       //       ),
                  //     //         //       //       border: OutlineInputBorder(
                  //     //         //       //         borderRadius:
                  //     //         //       //         BorderRadius.circular(4.0),
                  //     //         //       //         borderSide: const BorderSide(
                  //     //         //       //             color: Colors.grey),
                  //     //         //       //       ),
                  //     //         //       //       contentPadding:
                  //     //         //       //       const EdgeInsets.symmetric(
                  //     //         //       //         //   //  vertical: 5,
                  //     //         //       //           horizontal: 12),
                  //     //         //       //     ),
                  //     //         //       //     // value: selectedCountry,
                  //     //         //       //     icon: Icon(
                  //     //         //       //       Icons.arrow_drop_down,
                  //     //         //       //       color: ColorManager.blueprime,
                  //     //         //       //     ),
                  //     //         //       //     iconSize: 24,
                  //     //         //       //     elevation: 16,
                  //     //         //       //     style: GoogleFonts.firaSans(
                  //     //         //       //       fontSize: 10.0,
                  //     //         //       //       fontWeight: FontWeight.w400,
                  //     //         //       //       color: const Color(0xff686464),
                  //     //         //       //     ),
                  //     //         //       //
                  //     //         //       //     onChanged: (newValue) {
                  //     //         //       //       for (var a in snapshot.data!) {
                  //     //         //       //         if (a.cityName == newValue) {
                  //     //         //       //          selectedCityEC = a.cityName!;
                  //     //         //       //           //country = a
                  //     //         //       //           // int? docType = a.companyOfficeID;
                  //     //         //       //         }
                  //     //         //       //       }
                  //     //         //       //     },
                  //     //         //       //     items: dropDownList.map((String value) {
                  //     //         //       //       return DropdownMenuItem<String>(
                  //     //         //       //         value: value,
                  //     //         //       //         child: Text(
                  //     //         //       //           value,
                  //     //         //       //           style: GoogleFonts.firaSans(
                  //     //         //       //             fontSize: 12,
                  //     //         //       //             color: Color(0xff575757),
                  //     //         //       //             fontWeight: FontWeight.w400,
                  //     //         //       //           ),
                  //     //         //       //         ),
                  //     //         //       //       );
                  //     //         //       //     }).toList(),
                  //     //         //       //   ),
                  //     //         //       // );
                  //     //         //     } else {
                  //     //         //       return const Offstage();
                  //     //         //     }
                  //     //         //   },
                  //     //         // ),
                  //     //
                  //     //         child: SchedularTextField(
                  //     //             controller: ctlrCity,
                  //     //             labelText: AppString.city),
                  //     //       ),
                  //     //     ],
                  //     //   ):
                  //     //   Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: streetPCController,
                  //     //               icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                  //     //
                  //     //               labelText: "Street*")),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: suitAptPCController,
                  //     //               labelText: "Suite/Apt#")),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //         // child: FutureBuilder<List<CityData>>(
                  //     //         //   future: getCityDropDown(context),
                  //     //         //   builder: (context, snapshot) {
                  //     //         //     if (snapshot.connectionState ==
                  //     //         //         ConnectionState.waiting) {
                  //     //         //       return CustomDropdownTextFieldsm(
                  //     //         //         initialValue: 'Select',
                  //     //         //         headText: 'City*',items: [],
                  //     //         //         onChanged: (newValue) {
                  //     //         //
                  //     //         //         },);
                  //     //         //     }
                  //     //         //     if (snapshot.hasData) {
                  //     //         //       List<DropdownMenuItem<String>> dropDownList = [];
                  //     //         //       for (var i in snapshot.data!) {
                  //     //         //         dropDownList.add(DropdownMenuItem<String>(
                  //     //         //           child: Text(i.cityName!),
                  //     //         //           value: i.cityName,
                  //     //         //         ));
                  //     //         //       }
                  //     //         //
                  //     //         //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                  //     //         //         onChanged: (newValue) {
                  //     //         //           for (var a in snapshot.data!) {
                  //     //         //             if (a.cityName == newValue) {
                  //     //         //               selectedCityEC = a.cityName!;
                  //     //         //               //country = a
                  //     //         //               // int? docType = a.companyOfficeID;
                  //     //         //             }
                  //     //         //           }
                  //     //         //         },);
                  //     //         //       //   SizedBox(
                  //     //         //       //   height: 27,
                  //     //         //       //   child: DropdownButtonFormField<String>(
                  //     //         //       //     decoration: InputDecoration(
                  //     //         //       //       labelText: 'City',
                  //     //         //       //       labelStyle: GoogleFonts.firaSans(
                  //     //         //       //         fontSize: 10.0,
                  //     //         //       //         fontWeight: FontWeight.w400,
                  //     //         //       //         color: ColorManager.greylight,
                  //     //         //       //       ),
                  //     //         //       //       focusedBorder: OutlineInputBorder(
                  //     //         //       //         borderSide: BorderSide(
                  //     //         //       //             color: ColorManager
                  //     //         //       //                 .containerBorderGrey),
                  //     //         //       //       ),
                  //     //         //       //       border: OutlineInputBorder(
                  //     //         //       //         borderRadius:
                  //     //         //       //         BorderRadius.circular(4.0),
                  //     //         //       //         borderSide: const BorderSide(
                  //     //         //       //             color: Colors.grey),
                  //     //         //       //       ),
                  //     //         //       //       contentPadding:
                  //     //         //       //       const EdgeInsets.symmetric(
                  //     //         //       //         //   //  vertical: 5,
                  //     //         //       //           horizontal: 12),
                  //     //         //       //     ),
                  //     //         //       //     // value: selectedCountry,
                  //     //         //       //     icon: Icon(
                  //     //         //       //       Icons.arrow_drop_down,
                  //     //         //       //       color: ColorManager.blueprime,
                  //     //         //       //     ),
                  //     //         //       //     iconSize: 24,
                  //     //         //       //     elevation: 16,
                  //     //         //       //     style: GoogleFonts.firaSans(
                  //     //         //       //       fontSize: 10.0,
                  //     //         //       //       fontWeight: FontWeight.w400,
                  //     //         //       //       color: const Color(0xff686464),
                  //     //         //       //     ),
                  //     //         //       //
                  //     //         //       //     onChanged: (newValue) {
                  //     //         //       //       for (var a in snapshot.data!) {
                  //     //         //       //         if (a.cityName == newValue) {
                  //     //         //       //          selectedCityEC = a.cityName!;
                  //     //         //       //           //country = a
                  //     //         //       //           // int? docType = a.companyOfficeID;
                  //     //         //       //         }
                  //     //         //       //       }
                  //     //         //       //     },
                  //     //         //       //     items: dropDownList.map((String value) {
                  //     //         //       //       return DropdownMenuItem<String>(
                  //     //         //       //         value: value,
                  //     //         //       //         child: Text(
                  //     //         //       //           value,
                  //     //         //       //           style: GoogleFonts.firaSans(
                  //     //         //       //             fontSize: 12,
                  //     //         //       //             color: Color(0xff575757),
                  //     //         //       //             fontWeight: FontWeight.w400,
                  //     //         //       //           ),
                  //     //         //       //         ),
                  //     //         //       //       );
                  //     //         //       //     }).toList(),
                  //     //         //       //   ),
                  //     //         //       // );
                  //     //         //     } else {
                  //     //         //       return const Offstage();
                  //     //         //     }
                  //     //         //   },
                  //     //         // ),
                  //     //
                  //     //         child: SchedularTextField(
                  //     //             controller: ctlrCity,
                  //     //             labelText: AppString.city),
                  //     //       ),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       ///state
                  //     //       Flexible(
                  //     //         // child:FutureBuilder<List<StateData>>(
                  //     //         //   future: getStateDropDown(context),
                  //     //         //   builder: (context, snapshot) {
                  //     //         //     if (snapshot.connectionState ==
                  //     //         //         ConnectionState.waiting) {
                  //     //         //       return CustomDropdownTextFieldsm(
                  //     //         //         initialValue: 'Select',
                  //     //         //         headText: 'State*',items: [],
                  //     //         //         onChanged: (newValue) {
                  //     //         //
                  //     //         //         },);
                  //     //         //     }
                  //     //         //     if (snapshot.hasData) {
                  //     //         //       List<DropdownMenuItem<String>> dropDownList = [];
                  //     //         //       for (var i in snapshot.data!) {
                  //     //         //         dropDownList.add(DropdownMenuItem<String>(
                  //     //         //           child: Text(i.name),
                  //     //         //           value: i.name,
                  //     //         //         ));
                  //     //         //       }
                  //     //         //
                  //     //         //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                  //     //         //         onChanged: (newValue) {
                  //     //         //           for (var a in snapshot.data!) {
                  //     //         //             if (a.name == newValue) {
                  //     //         //               selectedStateEC = a.name!;
                  //     //         //               //country = a
                  //     //         //               // int? docType = a.companyOfficeID;
                  //     //         //             }
                  //     //         //           }
                  //     //         //         },);
                  //     //         //
                  //     //         //       // return SchedularDropdown(
                  //     //         //       //   labelText: 'State',
                  //     //         //       //   // labelStyle: GoogleFonts.firaSans(
                  //     //         //       //   //   fontSize: 12,
                  //     //         //       //   //   color: Color(0xff575757),
                  //     //         //       //   //   fontWeight: FontWeight.w400,
                  //     //         //       //   // ),
                  //     //         //       //   // labelFontSize: 12,
                  //     //         //       //   items: dropDownList,
                  //     //         //       //   onChanged: (newValue) {
                  //     //         //       //     for (var a in snapshot.data!) {
                  //     //         //       //       if (a.name == newValue) {
                  //     //         //       //         selectedStatepr = a.name!;
                  //     //         //       //         // stateId = a.stateId!;
                  //     //         //       //         //  print("Dept ID ${stateId}");
                  //     //         //       //         // int docType = a.employeeTypesId;
                  //     //         //       //         // Do something with docType
                  //     //         //       //       }
                  //     //         //       //     }
                  //     //         //       //   },
                  //     //         //       // );
                  //     //         //     } else {
                  //     //         //       return const Offstage();
                  //     //         //     }
                  //     //         //   },
                  //     //         // ),
                  //     //         child: SchedularTextField(
                  //     //             controller: ctlrCity,
                  //     //             labelText: AppString.city),
                  //     //       ),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: zipCodePCController,
                  //     //               onlyAllowNumbers: true,
                  //     //               labelText: "Zip Code*")),
                  //     //
                  //     //     ],
                  //     //   ),
                  //     //   const SizedBox(height: AppSize.s16),
                  //     //   providerState.isContactTrue ?  Row(
                  //     //     children: [
                  //     //       ///state
                  //     //       Flexible(
                  //     //         child:FutureBuilder<List<StateData>>(
                  //     //           future: getStateDropDown(context),
                  //     //           builder: (context, snapshot) {
                  //     //             if (snapshot.connectionState ==
                  //     //                 ConnectionState.waiting) {
                  //     //               return CustomDropdownTextFieldsm(
                  //     //                 initialValue: 'Select',
                  //     //                 headText: 'State*',items: [],
                  //     //                 onChanged: (newValue) {
                  //     //
                  //     //                 },);
                  //     //             }
                  //     //             if (snapshot.hasData) {
                  //     //               List<DropdownMenuItem<String>> dropDownList = [];
                  //     //               for (var i in snapshot.data!) {
                  //     //                 dropDownList.add(DropdownMenuItem<String>(
                  //     //                   child: Text(i.name),
                  //     //                   value: i.name,
                  //     //                 ));
                  //     //               }
                  //     //
                  //     //               return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                  //     //                 onChanged: (newValue) {
                  //     //                   for (var a in snapshot.data!) {
                  //     //                     if (a.name == newValue) {
                  //     //                       selectedStateEC = a.name!;
                  //     //                       //country = a
                  //     //                       // int? docType = a.companyOfficeID;
                  //     //                     }
                  //     //                   }
                  //     //                 },);
                  //     //
                  //     //               // return SchedularDropdown(
                  //     //               //   labelText: 'State',
                  //     //               //   // labelStyle: GoogleFonts.firaSans(
                  //     //               //   //   fontSize: 12,
                  //     //               //   //   color: Color(0xff575757),
                  //     //               //   //   fontWeight: FontWeight.w400,
                  //     //               //   // ),
                  //     //               //   // labelFontSize: 12,
                  //     //               //   items: dropDownList,
                  //     //               //   onChanged: (newValue) {
                  //     //               //     for (var a in snapshot.data!) {
                  //     //               //       if (a.name == newValue) {
                  //     //               //         selectedStatepr = a.name!;
                  //     //               //         // stateId = a.stateId!;
                  //     //               //         //  print("Dept ID ${stateId}");
                  //     //               //         // int docType = a.employeeTypesId;
                  //     //               //         // Do something with docType
                  //     //               //       }
                  //     //               //     }
                  //     //               //   },
                  //     //               // );
                  //     //             } else {
                  //     //               return const Offstage();
                  //     //             }
                  //     //           },
                  //     //         ),
                  //     //       ),
                  //     //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: zipCodePCController,
                  //     //               onlyAllowNumbers: true,
                  //     //               labelText: "Zip Code*")),
                  //     //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: phoneNumberPCController,
                  //     //               phoneField:true,
                  //     //               labelText: "Phone Number*")),
                  //     //     ],
                  //     //   ):
                  //     //   Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: phoneNumberPCController,
                  //     //               phoneField:true,
                  //     //               labelText: "Phone Number*")),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: emailPCController,
                  //     //               labelText: "Email")),
                  //     //       // Empty container for alignment
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(child: Container()),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(child: Container()),
                  //     //       const SizedBox(width: AppSize.s35),
                  //     //       Flexible(child: Container()),
                  //     //     ],
                  //     //   ),
                  //     //   const SizedBox(height: AppSize.s16),
                  //     // providerState.isContactTrue ?  Row(
                  //     //     children: [
                  //     //       Flexible(
                  //     //           child: SchedularTextField(
                  //     //               controller: emailPCController,
                  //     //               labelText: "Email")),
                  //     //       // Empty container for alignment
                  //     //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(child: Container()),
                  //     //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                  //     //       Flexible(child: Container()),
                  //     //     ],
                  //     //   )
                  //     //     : const Offstage(),
                  //   ///
                  //       ///
                  //       Consumer<EmergencyContactProvider>(
                  //         builder: (context, provider, _) {
                  //           return Column(
                  //             children: provider.primaryCaregiverKeys.asMap().entries.map((entry) {
                  //               int index = entry.key;
                  //               var key = entry.value;
                  //               return PrimaryCaregiver(
                  //                 key: key,
                  //                 index: index + 1,
                  //                 onRemove: () => provider.removeCaregiver(key),
                  //                 patientId: patientId,
                  //                 isVisible: provider.isCaregiverVisible,
                  //               );
                  //             }).toList(),
                  //           );
                  //         },
                  //       ),
                  //
                  //
                  //       const SizedBox(height: AppSize.s16),
                  //       CustomIconButtonConst(
                  //           width: AppSize.s140,
                  //           text: 'Add Caregiver',
                  //           icon: Icons.add,
                  //           onPressed: () {
                  //             context.read<EmergencyContactProvider>().addCaregiver();
                  //           }),
                  //       const SizedBox(height: AppSize.s16),
                  //       const Divider(),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Patient Representative*"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         spacing: 20,
                      //         children: [
                      //           CheckboxTile(
                      //             title: 'Copy Emergency Contact',
                      //             initialValue: copyEmergencyContactPR,
                      //             onChanged: (value) {
                      //               // setState(() {
                      //               //
                      //               // });
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Copy Primary Caregiver',
                      //             initialValue: copyPrimaryCaregiverPR,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           )
                      //         ],
                      //       ),
                      //       CheckboxTile(
                      //         title: 'No Selected Representative',
                      //         initialValue: noPRData,
                      //         onChanged: (value) {
                      //
                      //         },
                      //       )
                      //
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNamePRController,
                      //             labelText: 'First Name*',
                      //
                      //           )),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: lastNamePRController,
                      //             labelText: 'Last Name*',
                      //           )),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return
                      //                 CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                   onChanged: (newValue) {
                      //                     for (var a in snapshot.data!) {
                      //                       if (a.relationship == newValue) {
                      //                         selectedRelationshipEC = a.relationship!;
                      //                         //country = a
                      //                         // int? docType = a.companyOfficeID;
                      //                       }
                      //                     }
                      //                   },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //             controller: firstNamePRController,
                      //             labelText: 'First Name*',
                      //
                      //           )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: lastNamePRController,
                      //               labelText: 'Last Name*',
                      //              )),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         child:FutureBuilder<List<RelationshipData>>(
                      //           future: getRelationshipDropDown(context),
                      //           builder: (context, snapshot) {
                      //             if (snapshot.connectionState ==
                      //                 ConnectionState.waiting) {
                      //               return CustomDropdownTextFieldsm(
                      //                 initialValue: 'Select',
                      //                 headText: 'Relationship',items: [],
                      //                 onChanged: (newValue) {
                      //
                      //                 },);
                      //             }
                      //             if (snapshot.hasData) {
                      //               List<DropdownMenuItem<String>> dropDownList = [];
                      //               for (var i in snapshot.data!) {
                      //                 dropDownList.add(DropdownMenuItem<String>(
                      //                   child: Text(i.relationship!),
                      //                   value: i.relationship,
                      //                 ));
                      //               }
                      //
                      //               return
                      //                 CustomDropdownTextFieldsm(headText: 'Relationship*',dropDownMenuList: dropDownList,
                      //                   onChanged: (newValue) {
                      //                     for (var a in snapshot.data!) {
                      //                       if (a.relationship == newValue) {
                      //                         selectedRelationshipEC = a.relationship!;
                      //                         //country = a
                      //                         // int? docType = a.companyOfficeID;
                      //                       }
                      //                     }
                      //                   },);
                      //
                      //
                      //             } else {
                      //               return const Offstage();
                      //             }
                      //           },
                      //         ),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                      //             onChanged: (newValue) {
                      //
                      //             },)),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                      //             onChanged: (newValue) {
                      //
                      //             },)),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: CustomDropdownTextFieldsm(headText: 'Role*',items: ['Health Care Decisions','A'],
                      //             onChanged: (newValue) {
                      //
                      //             },)),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //           child: CustomDropdownTextFieldsm(headText: 'Type*',items: ['Legal Representative','A'],
                      //             onChanged: (newValue) {
                      //
                      //             },)),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetPRController,
                      //               icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                      //               labelText: "Street*")),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: streetPRController,
                      //               icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                      //               labelText: "Street*")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptPRController,
                      //               labelText: "Suite/Apt#")),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         // child: FutureBuilder<List<CityData>>(
                      //         //   future: getCityDropDown(context),
                      //         //   builder: (context, snapshot) {
                      //         //     if (snapshot.connectionState ==
                      //         //         ConnectionState.waiting) {
                      //         //       return CustomDropdownTextFieldsm(
                      //         //         initialValue: 'Select',
                      //         //         headText: 'City*',items: [],
                      //         //         onChanged: (newValue) {
                      //         //
                      //         //         },);
                      //         //     }
                      //         //     if (snapshot.hasData) {
                      //         //       List<DropdownMenuItem<String>> dropDownList = [];
                      //         //       for (var i in snapshot.data!) {
                      //         //         dropDownList.add(DropdownMenuItem<String>(
                      //         //           child: Text(i.cityName!),
                      //         //           value: i.cityName,
                      //         //         ));
                      //         //       }
                      //         //
                      //         //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //         //         onChanged: (newValue) {
                      //         //           for (var a in snapshot.data!) {
                      //         //             if (a.cityName == newValue) {
                      //         //               selectedCityEC = a.cityName!;
                      //         //               //country = a
                      //         //               // int? docType = a.companyOfficeID;
                      //         //             }
                      //         //           }
                      //         //         },);
                      //         //
                      //         //     } else {
                      //         //       return const Offstage();
                      //         //     }
                      //         //   },
                      //         // ),
                      //
                      //         child: SchedularTextField(
                      //             controller: ctlrCity,
                      //             labelText: AppString.city),
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //         // child:FutureBuilder<List<StateData>>(
                      //         //   future: getStateDropDown(context),
                      //         //   builder: (context, snapshot) {
                      //         //     if (snapshot.connectionState ==
                      //         //         ConnectionState.waiting) {
                      //         //       return CustomDropdownTextFieldsm(
                      //         //         initialValue: 'Select',
                      //         //         headText: 'State*',items: [],
                      //         //         onChanged: (newValue) {
                      //         //
                      //         //         },);
                      //         //     }
                      //         //     if (snapshot.hasData) {
                      //         //       List<DropdownMenuItem<String>> dropDownList = [];
                      //         //       for (var i in snapshot.data!) {
                      //         //         dropDownList.add(DropdownMenuItem<String>(
                      //         //           child: Text(i.name),
                      //         //           value: i.name,
                      //         //         ));
                      //         //       }
                      //         //
                      //         //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //         //         onChanged: (newValue) {
                      //         //           for (var a in snapshot.data!) {
                      //         //             if (a.name == newValue) {
                      //         //               selectedStateEC = a.name!;
                      //         //               //country = a
                      //         //               // int? docType = a.companyOfficeID;
                      //         //             }
                      //         //           }
                      //         //         },);
                      //         //
                      //         //
                      //         //     } else {
                      //         //       return const Offstage();
                      //         //     }
                      //         //   },
                      //         // ),
                      //         //
                      //         child: SchedularTextField(
                      //           labelText: "State*",
                      //           controller: ctlrState,
                      //         )
                      //       ),
                      //       const SizedBox(width: AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodePRController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: suitAptPRController,
                      //               labelText: "Suite/Apt#")),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //         // child: FutureBuilder<List<CityData>>(
                      //         //   future: getCityDropDown(context),
                      //         //   builder: (context, snapshot) {
                      //         //     if (snapshot.connectionState ==
                      //         //         ConnectionState.waiting) {
                      //         //       return CustomDropdownTextFieldsm(
                      //         //         initialValue: 'Select',
                      //         //         headText: 'City*',items: [],
                      //         //         onChanged: (newValue) {
                      //         //
                      //         //         },);
                      //         //     }
                      //         //     if (snapshot.hasData) {
                      //         //       List<DropdownMenuItem<String>> dropDownList = [];
                      //         //       for (var i in snapshot.data!) {
                      //         //         dropDownList.add(DropdownMenuItem<String>(
                      //         //           child: Text(i.cityName!),
                      //         //           value: i.cityName,
                      //         //         ));
                      //         //       }
                      //         //
                      //         //       return CustomDropdownTextFieldsm(headText: 'City*',dropDownMenuList: dropDownList,
                      //         //         onChanged: (newValue) {
                      //         //           for (var a in snapshot.data!) {
                      //         //             if (a.cityName == newValue) {
                      //         //               selectedCityEC = a.cityName!;
                      //         //               //country = a
                      //         //               // int? docType = a.companyOfficeID;
                      //         //             }
                      //         //           }
                      //         //         },);
                      //         //
                      //         //     } else {
                      //         //       return const Offstage();
                      //         //     }
                      //         //   },
                      //         // ),
                      //
                      //         child: SchedularTextField(
                      //             controller: ctlrCity,
                      //             labelText: AppString.city),
                      //       ),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //         // child:FutureBuilder<List<StateData>>(
                      //         //   future: getStateDropDown(context),
                      //         //   builder: (context, snapshot) {
                      //         //     if (snapshot.connectionState ==
                      //         //         ConnectionState.waiting) {
                      //         //       return CustomDropdownTextFieldsm(
                      //         //         initialValue: 'Select',
                      //         //         headText: 'State*',items: [],
                      //         //         onChanged: (newValue) {
                      //         //
                      //         //         },);
                      //         //     }
                      //         //     if (snapshot.hasData) {
                      //         //       List<DropdownMenuItem<String>> dropDownList = [];
                      //         //       for (var i in snapshot.data!) {
                      //         //         dropDownList.add(DropdownMenuItem<String>(
                      //         //           child: Text(i.name),
                      //         //           value: i.name,
                      //         //         ));
                      //         //       }
                      //         //
                      //         //       return CustomDropdownTextFieldsm(headText: 'State*',dropDownMenuList: dropDownList,
                      //         //         onChanged: (newValue) {
                      //         //           for (var a in snapshot.data!) {
                      //         //             if (a.name == newValue) {
                      //         //               selectedStateEC = a.name!;
                      //         //               //country = a
                      //         //               // int? docType = a.companyOfficeID;
                      //         //             }
                      //         //           }
                      //         //         },);
                      //         //
                      //         //
                      //         //     } else {
                      //         //       return const Offstage();
                      //         //     }
                      //         //   },
                      //         // ),
                      //
                      //         child: SchedularTextField(
                      //           labelText: "State*",
                      //           controller: ctlrState,
                      //         )
                      //       ),
                      //     ],
                      //   ):
                      //   Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberPRController,
                      //               phoneField:true,
                      //               labelText: "Phone Number*")),
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailPRController,
                      //               labelText: "Email")),
                      //       // Empty container for alignment
                      //       SizedBox(width: providerState.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
                      //       Flexible(child: Container()),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(child: Container()),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(child: Container()),
                      //     ],
                      //   ),
                      //   const SizedBox(height: AppSize.s16),
                      // providerState.isContactTrue ?  Row(
                      //     children: [
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: zipCodePRController,
                      //               onlyAllowNumbers: true,
                      //               labelText: "Zip Code*")),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: phoneNumberPRController,
                      //               phoneField:true,
                      //               labelText: "Phone Number*")),
                      //       SizedBox(width:providerState.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
                      //       Flexible(
                      //           child: SchedularTextField(
                      //               controller: emailPRController,
                      //               labelText: "Email")),
                      //     ],
                      //   ):
                      // const Offstage(),
                    ///
                        ///
                        Column(
                          children: representativeKeys.asMap().entries.map((entry) {
                            int index = entry.key;
                            GlobalKey<_RepresentativeState> key = entry.value;
                            //List<PatientRepresentativeData> data = provider._patientRepresentativeData;
                            return Representative(
                              key: key,
                              index: index + 1,
                              onRemove: () => removeRepresentative(key),
                              patientId: widget.patientId,
                              isVisible: isVisibleContact,
                              // patientRepresentativeData: data,
                              // onChanged: (int index, PatientRepresentativeData updatedModel) {
                              //   provider.updateRepresentative(index, updatedModel);
                              // },
                            );
                          }).toList(),
                        ),


                        const SizedBox(height: AppSize.s16),
                        CustomIconButtonConst(
                            width:  AppSize.s170,
                            text: 'Add Representative',
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                addRepresentative();
                              });

                            }),
                        const SizedBox(height: AppSize.s16),
                        const Divider(),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CustomButtonTransparent(
                        text: "Skip",
                        onPressed: () {

                        },
                      ),
                      isLoading ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(color: ColorManager.blueprime,),
                      ) :CustomElevatedButton(
                        width: AppSize.s100,
                        text: AppString.save,
                        onPressed: () async{
                          try{
                            setState(() {
                              isLoading = true; // Start loading
                            });
                            for (var key in addEmergencyContactKeys) {
                              final state = key.currentState!;
                              print('Prefill state ${state.isPrefill}');
                              try {
                                  if(state.isPrefill == false){
                                    // Proceed with posting the employment data if the conditions are met
                                    var response = await addPatientEmergencyContact(
                                        context: context,
                                        fk_pt_id: providerPtId.patientId,
                                        firstName: state.firstNameController.text,
                                        lastname: state.lastNameController.text,
                                        relationshipId: state.relationShipId,
                                        street: state.streetController.text,
                                        suite: state.suitAptController.text,
                                        city: state.cityController.text,
                                        state: state.stateController.text,
                                        zipCode: state.zipCodeController.text,
                                        phoneNumber: state.phoneNumberController.text,
                                        email: state.emailController.text
                                    );

                                    if (response.statusCode == 200 || response.statusCode == 201) {
                                       showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddSuccessPopup(
                                            message: 'Data Saved',
                                          );
                                        },
                                      );

                                      setState(() {
                                        isLoading = false; // End loading
                                      });


                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddSuccessPopup(
                                            message: 'Failed To Save Employment Data',
                                          );
                                        },
                                      );
                                    }
                                  }
                                  else{
                                    print('No Data Updated');
                                  }

                              } catch (e) {
                                print(e);
                              }
                            }
                            for (var key in representativeKeys) {
                              final state = key.currentState!;
                              print('Prefill PR state ${state.prefillDataRepresent}');
                              try {
                                if(state.prefillDataRepresent == false){
                                  // Proceed with posting the employment data if the conditions are met
                                  var response = await addPatientRepresentative(
                                      context: context,
                                      fk_pt_id: providerPtId.patientId,
                                      firstName: state.firstNamePRController.text,
                                      lastname: state.lastNamePRController.text,
                                      relationshipId: state.relationshipId,
                                      street: state.streetPRController.text,
                                      suite: state.suitAptPRController.text,
                                      city: state.ctlrCity.text,
                                      state: state.ctlrState.text,
                                      zipCode: state.zipCodePRController.text,
                                      phoneNumber: state.phoneNumberPRController.text,
                                      email: state.emailPRController.text,
                                      fk_role: state.roleId,
                                      fk_type: state.typeId
                                  );

                                  if (response.statusCode == 200 || response.statusCode == 201) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddSuccessPopup(
                                          message: 'Data Saved',
                                        );
                                      },
                                    );
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddSuccessPopup(
                                          message: 'Failed To Save Employment Data',
                                        );
                                      },
                                    );
                                  }
                                }
                                else{
                                  print('No Represent Data Updated');
                                }

                              } catch (e) {
                                print(e);
                              }
                            }
                          }finally{
                            loadInitialrepresentative();
                            loadInitialemergencyData();
                            setState(() {
                              isLoading = false; // Start loading
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s30),

                ],
              ),
            ),
          ),

    );
  }
}


/// Emergency contact
class AddEemergencyContact extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  // final List<EmergencyContactData> emergencyContactData;
  // final Function(int index, EmergencyContactData updatedModel) onChanged;
  AddEemergencyContact({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible,
    // required this.emergencyContactData,
    // required this.onChanged
  });

  @override
  _AddEemergencyContactState createState() => _AddEemergencyContactState();
}

class _AddEemergencyContactState extends State<AddEemergencyContact> {
  bool isPrefill = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController suitAptController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int relationShipId = 0;
  int contactId = 0;
  int ptId = 0;

  @override
  void initState() {
    super.initState();
    _initializeFormWithPrefilledData();
    // if (widget.emergencyContactData.length >= widget.index) {
    //   final data = widget.emergencyContactData[widget.index];
    //   firstNameController.text = data.firstName;
    //   lastNameController.text = data.lastName;
    //   suitAptController.text = data.suite;
    //   streetController.text = data.street;
    //   stateController.text = data.state;
    //   cityController.text = data.city;
    //   phoneNumberController.text = data.phoneNumber;
    //   zipCodeController.text = data.zipCode;
    //   emailController.text = data.email;
    //   relationShipId = data.fk_Relationship;
    //   contactId = data.contactId;
    //   ptId = data.fk_pt_id;
    // }
    //
    // firstNameController.addListener(_updateModel);
    // lastNameController.addListener(_updateModel);
    // suitAptController.addListener(_updateModel);
    // streetController.addListener(_updateModel);
    // stateController.addListener(_updateModel);
    // cityController.addListener(_updateModel);
    // phoneNumberController.addListener(_updateModel);
    // zipCodeController.addListener(_updateModel);
    // emailController.addListener(_updateModel);
  }
  // void _updateModel() {
  //   final updatedModel = EmergencyContactData(
  //       contactId: contactId,
  //       fk_pt_id: ptId,
  //       firstName: firstNameController.text,
  //       lastName: lastNameController.text,
  //       fk_Relationship: relationShipId,
  //       street: streetController.text,
  //       suite: suitAptController.text,
  //       city: cityController.text,
  //       state: stateController.text,
  //       zipCode: zipCodeController.text,
  //       phoneNumber: phoneNumberController.text,
  //       email: emailController.text
  //
  //   );
  //
  //   widget.onChanged(widget.index, updatedModel);
  // }
  Future<void> _initializeFormWithPrefilledData() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    try {
      List<EmergencyContactData> prefilledData =  await getPatientEmergencyContact(context: context, ptId: provider.patientId);
      if (prefilledData.isNotEmpty) {
        var data = prefilledData[widget.index - 1]; // Assuming index matches the data list
        setState(() {
          firstNameController.text = data.firstName ?? '';
          cityController.text = data.city ?? '';
          lastNameController.text = data.lastName ?? '';
          cityController.text = data.city ?? '';
          suitAptController.text = data.suite ?? '';
          stateController.text = data.state ?? '';
          streetController.text = data.street ?? '';
          relationShipId = data.fk_Relationship??0;
          emailController.text = data.email ?? '';
          phoneNumberController.text = data.phoneNumber ?? '';
          zipCodeController.text = data.zipCode ?? '';
          contactId = data.contactId ??0;
          ptId = data.fk_pt_id ?? 0;


        });
      }
    } catch (e) {
      print('Failed to load prefilled data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    print('First name ${firstNameController.text}');
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
                  onChanged: (value){
                    if(value.isNotEmpty ){
                      isPrefill= false;
                    }
                  },
                )),
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNameController,
                  labelText: 'Last Name*',
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
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
                            relationShipId = a.relationshipId;

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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  controller: lastNameController,
                  labelText: 'Last Name*',
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
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
                            relationShipId = a.relationshipId;
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
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
                    controller: streetController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
                  controller: cityController,
                  labelText: "City*"),
            ),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
                    controller: streetController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
                  controller: stateController,
                  labelText: "State*"),
            ),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      isPrefill= false;
                    }
                  },
                  controller: stateController,
                  labelText: "State*"),
            ),
            SizedBox(width:AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
                    controller: zipCodeController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),
            SizedBox(width: AddemergencyProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty ){
                        isPrefill= false;
                      }
                    },
                    controller: phoneNumberController,
                    phoneField: true,
                    labelText: "Phone Number*")),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
                    controller: phoneNumberController,
                    phoneField: true,
                    labelText: "Phone Number*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
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
                    onChanged: (value){
                      if(value.isNotEmpty){
                        isPrefill= false;
                      }
                    },
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


/// Representive screen
class Representative extends StatefulWidget {
  final int patientId;
  final VoidCallback onRemove;
  final int index;
  final bool isVisible;
  // final List<PatientRepresentativeData> patientRepresentativeData;
  // final Function(int index, PatientRepresentativeData updatedModel) onChanged;
  Representative({super.key, required this.patientId, required this.onRemove, required this.index, required this.isVisible,
    // required this.patientRepresentativeData, required this.onChanged
  });

  @override
  _RepresentativeState createState() => _RepresentativeState();
}

class _RepresentativeState extends State<Representative> {
  bool prefillDataRepresent = true;
  TextEditingController firstNamePRController = TextEditingController();
  TextEditingController lastNamePRController = TextEditingController();
  TextEditingController streetPRController = TextEditingController();
  TextEditingController ctlrCity = TextEditingController();
  TextEditingController suitAptPRController = TextEditingController();
  TextEditingController phoneNumberPRController = TextEditingController();
  TextEditingController zipCodePRController = TextEditingController();
  TextEditingController emailPRController = TextEditingController();
  TextEditingController ctlrState = TextEditingController();
  int relationshipId = 0;
  int roleId = 0;
  int typeId = 0;
  int ptId = 0;
  int representId = 0;
  @override
  void initState() {
    super.initState();
    _initializeFormWithPrefilledData();
  }
  Future<void> _initializeFormWithPrefilledData() async {
    final provider = Provider.of<DiagnosisProvider>(context, listen: false);
    try {
      List<PatientRepresentativeData> apiDataRepresentative = await getPatientRepresentative(context: context, ptId: provider.patientId);
      if (apiDataRepresentative.isNotEmpty) {
        var data = apiDataRepresentative[widget.index - 1]; // Assuming index matches the data list
        setState(() {
          firstNamePRController.text = data.firstName ?? '';
          ctlrCity.text = data.city ?? '';
          lastNamePRController.text = data.lastName ?? '';
          suitAptPRController.text = data.suite ?? '';
          ctlrState.text = data.state ?? '';
          streetPRController.text = data.street ?? '';
          relationshipId = data.fk_Relationship??0;
          emailPRController.text = data.email ?? '';
          phoneNumberPRController.text = data.phoneNumber ?? '';
          zipCodePRController.text = data.zipCode ?? '';
          representId = data.representiveId ??0;
          ptId = data.fk_pt_id ?? 0;
          roleId = data.RoleId ?? 0;
          typeId = data.typeId ?? 0;
        });
      }
    } catch (e) {
      print('Failed to load prefilled data: $e');
    }
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
              (widget.index > 1)
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
                  controller: firstNamePRController,
                  labelText: 'First Name*',

                )),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
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
                              relationshipId = a.relationshipId;
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
                  controller: firstNamePRController,
                  labelText: 'First Name*',

                )),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
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
                              relationshipId = a.relationshipId;
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
                              roleId = a.roleId;
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
                              typeId = a.typeId;
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
                              roleId = a.roleId;
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
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
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
                              typeId = a.typeId;
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
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: streetPRController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
          ],
        ):
        Row(
          children: [
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: streetPRController,
                    icon: Icon(Icons.location_on_outlined, color: ColorManager.blueprime,size: IconSize.I18,),
                    labelText: "Street*")),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
                  labelText: "State*",
                  controller: ctlrState,
                )
            ),
            const SizedBox(width: AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
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
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
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
                  onChanged: (value){
                    if(value.isNotEmpty){
                      prefillDataRepresent= false;
                    }
                  },
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
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: phoneNumberPRController,
                    phoneField:true,
                    labelText: "Phone Number*")),
            SizedBox(width: RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 : AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
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
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: zipCodePRController,
                    onlyAllowNumbers: true,
                    labelText: "Zip Code*")),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: phoneNumberPRController,
                    phoneField:true,
                    labelText: "Phone Number*")),
            SizedBox(width:RepresentativeProvider.isLeftSidebarOpen ?  AppSize.s70 :  AppSize.s35),
            Flexible(
                child: SchedularTextField(
                    onChanged: (value){
                      if(value.isNotEmpty){
                        prefillDataRepresent= false;
                      }
                    },
                    controller: emailPRController,
                    labelText: "Email")),
          ],
        ):
        const Offstage(),
      ],
    );
  }
}
