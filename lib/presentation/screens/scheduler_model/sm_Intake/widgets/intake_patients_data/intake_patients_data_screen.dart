import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/sm_module_manager/patient_data/patient_data_info_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_compliance/intake_patients_compliance.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_info/intake_patients_info.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_related_party/intake_patients_related_party.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_stay_info/intake_patients_stay_info.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_profile_bar.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/physician_info/physician_info_manager.dart';
import '../../../../../../app/services/token/token_manager.dart';
import '../../../../../../data/api_data/sm_data/scheduler_create_data/create_data.dart';
import '../../../textfield_dropdown_constant/schedular_textfield_const.dart';

class SmIntakeDemographicsScreen extends StatefulWidget {
  final Function(int) onPatientIdGenerated;
  final VoidCallback iButtonClickd;
  SmIntakeDemographicsScreen({super.key, required this.onPatientIdGenerated, required this.iButtonClickd});

  @override
  State<SmIntakeDemographicsScreen> createState() => _SmIntakeDemographicsScreenState();
}

class _SmIntakeDemographicsScreenState extends State<SmIntakeDemographicsScreen> {
  int selectedIndex = 0;
  bool showProfileBar = false;
  final PageController smIntakePageController = PageController();
  TextEditingController ctlrSos = TextEditingController();
  TextEditingController ctlrMedicalRecord = TextEditingController();
  TextEditingController ctlrfirstName = TextEditingController();
  TextEditingController ctlrMI = TextEditingController();
  TextEditingController ctlrLastName = TextEditingController();
  TextEditingController ctlrSuffix = TextEditingController();
  TextEditingController ctlrDate = TextEditingController();
  TextEditingController ctlrStreet = TextEditingController();
  TextEditingController ctlrZipCode = TextEditingController();
  TextEditingController ctlrApartment = TextEditingController();
  TextEditingController ctlrCity = TextEditingController();
  TextEditingController dummyCtrl = TextEditingController();

  TextEditingController ctlrMajorStreet = TextEditingController();
  TextEditingController ctlrPrimeNo = TextEditingController();
  TextEditingController ctlrSecNo = TextEditingController();
  TextEditingController ctlrEmail = TextEditingController();
  TextEditingController ctlrSocialSec = TextEditingController();

  TextEditingController ctlrDischargeResaon = TextEditingController();

  TextEditingController ctlrDateOfDeath = TextEditingController();
  String? statusType;
  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });

    smIntakePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void toggleProfileBar() {
    setState(() {
      showProfileBar = true;
    });
  }

  // Function to validate text fields
  // bool _validateInputs() {
  //   return ctlrMedicalRecord.text.isNotEmpty &&
  //       ctlrfirstName.text.isNotEmpty &&
  //       ctlrLastName.text.isNotEmpty &&
  //       ctlrMI.text.isNotEmpty &&
  //       ctlrSuffix.text.isNotEmpty &&
  //       ctlrStreet.text.isNotEmpty &&
  //       ctlrZipCode.text.isNotEmpty &&
  //       ctlrCity.text.isNotEmpty &&
  //       ctlrEmail.text.isNotEmpty &&
  //       ctlrSocialSec.text.isNotEmpty &&
  //       ctlrDischargeResaon.text.isNotEmpty;
  // }

// Function to show an error message


  int patientId = 1;
  String? statustype;
  String? selectedStatus;
  String? selectedCountry;
  String? selectedRace;
  String? selectedState;
  String? selectedcity;
  String? selectedLanguage;
  String? selectedReligion;
  String? selectedMaritalStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (showProfileBar) IntakeProfileBar(),
         SizedBox(height: AppSize.s25),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Container(
                height: AppSize.s30,
                width: AppSize.s315,
                decoration: BoxDecoration(
                    boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.blueprime,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Shift & Batch Button
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () => selectButton(0),
                      child: Container(
                        height: AppSize.s30,
                        width: AppSize.s160,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Patient Info',
                            style: BlueBgTabbar.customTextStyle(
                                0, selectedIndex),
                          ),
                        ),
                      ),
                    ),
                    // Define Holiday Button
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () => selectButton(1),
                      child: Container(
                        height: AppSize.s30,
                        width: AppSize.s155,
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Related Parties',
                            style: BlueBgTabbar.customTextStyle(
                                1, selectedIndex),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        const SizedBox(height: AppSize.s10),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: PageView(
              controller: smIntakePageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                IntakePatientsDatatInfo(
                  ctlrSos: ctlrSos,
                  ctlrMedicalRecord: ctlrMedicalRecord,
                  ctlrfirstName: ctlrfirstName,
                  ctlrMI: ctlrMI,
                  ctlrLastName: ctlrLastName,
                  ctlrSuffix: ctlrSuffix,
                  ctlrDate: ctlrDate,
                  ctlrStreet: ctlrStreet,
                  ctlrZipCode: ctlrZipCode,
                  ctlrApartment: ctlrApartment,
                  // ctlrCity: ctlrCity,
                  ctlrMajorStreet: ctlrMajorStreet,
                  ctlrPrimeNo: ctlrPrimeNo,
                  ctlrSecNo: ctlrSecNo,
                  ctlrEmail: ctlrEmail,
                  ctlrSocialSec: ctlrSocialSec,
                  ctlrDischargeResaon: ctlrDischargeResaon,
                  ctlrDateOfDeath: ctlrDateOfDeath,
                  // childStatus:  FutureBuilder<List<PatientStatusData>>(
                  //   future: StatusChange(context),  // Call your API method here
                  //   builder: (BuildContext context, AsyncSnapshot<List<PatientStatusData>> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const CircularProgressIndicator();  // Show loading indicator while waiting
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');  // Show error if there's an issue
                  //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //       return const Text('No Data Available');  // Show message if no data
                  //     } else {
                  //       // Data is available, map it to dropdown items
                  //       List<String> statusOptions = snapshot.data!.map((statusData) {
                  //         return statusData.patientStatus;  // Use patientStatus for the dropdown item label
                  //       }).toList();
                  //
                  //       return Flexible(
                  //         child: SchedularDropdown(
                  //           labelText: AppString.status,  // Your dropdown label
                  //           items: statusOptions,  // Populate dropdown with API data
                  //           onChanged: (newValue) {
                  //             setState(() {
                  //               selectedStatus = newValue;
                  //               print(selectedStatus);
                  //             });
                  //           },
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  childStatus: FutureBuilder<List<PatientStatusData>>(
                    future: StatusChange(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                          controller: dummyCtrl,
                          labelText: 'Status',
                        );
                      }
                      // if (snapshot.hasData) {
                      //   List<PatientStatusData> statusList = snapshot.data!;
                      //   return DropdownButtonFormField<PatientStatusData>(
                      //     decoration: InputDecoration(
                      //       labelText: 'Status',
                      //       labelStyle: GoogleFonts.firaSans(
                      //         fontSize: 10.0,
                      //         fontWeight: FontWeight.w400,
                      //         color: ColorManager.greylight,
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: ColorManager.containerBorderGrey),
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(4.0),
                      //         borderSide: const BorderSide(color: Colors.grey),
                      //       ),
                      //       contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      //     ),
                      //     value: statusList.isNotEmpty ? statusList.first : null,
                      //     icon: Icon(Icons.arrow_drop_down, color: ColorManager.blueprime),
                      //     iconSize: 24,
                      //     elevation: 16,
                      //     style: GoogleFonts.firaSans(
                      //       fontSize: 10.0,
                      //       fontWeight: FontWeight.w400,
                      //       color: const Color(0xff686464),
                      //     ),
                      //     onChanged: (newValue) {
                      //       for (var a in snapshot.data!) {
                      //         if (a.patientStatus == newValue) {
                      //           selectedState = a.patientStatus!;
                      //           //country = a
                      //           // int? docType = a.companyOfficeID;
                      //         }
                      //       }
                      //     },
                      //     // onChanged: (newValue) {
                      //     //   if (newValue != null) {
                      //     //     controller.text = newValue.patientStatus!;
                      //     //     // Additional logic for selected value if needed
                      //     //   }
                      //     // },
                      //     items: statusList.map((PatientStatusData status) {
                      //       return DropdownMenuItem<PatientStatusData>(
                      //         value: status,
                      //         child: Text(
                      //           status.patientStatus!,
                      //           style: GoogleFonts.firaSans(
                      //             fontSize: 12,
                      //             color: Color(0xff575757),
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //         ),
                      //       );
                      //     }).toList(),
                      //   );
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.patientStatus!),
                            value: i.patientStatus,
                          ));
                        }
                        // List<String> statusList = [];
                        // for (var i in snapshot.data!) {
                        //   statusList.add(i.patientStatus);
                        // }

                        return CustomDropdownTextFieldsm(
                            headText: 'Status',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.patientStatus == newValue) {
                                  selectedStatus = a.patientStatus!;
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

                  ///
                  // FutureBuilder<List<PatientStatusData>>(
                  //   future: StatusChange(context),
                  //   builder: (BuildContext context, AsyncSnapshot<List<PatientStatusData>> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return SchedularTextField(
                  //         width: 350,
                  //         controller: dummyCtrl,
                  //         labelText: 'Status',
                  //         suffixIcon: Icon(
                  //           Icons.arrow_drop_down,
                  //           color: ColorManager.blueprime,
                  //         ),
                  //       );
                  //     } else if (snapshot.hasError) {
                  //       return Text('Error: ${snapshot.error}');
                  //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //       return const Text('No Data Available');
                  //     } else {
                  //
                  //       List<String> statusOptions = snapshot.data!.map((statusData) {
                  //         return statusData.patientStatus;
                  //       }).toList();
                  //
                  //       return DropdownButtonFormField<String>(
                  //         decoration: InputDecoration(
                  //           labelText: 'Status',
                  //           labelStyle: GoogleFonts.firaSans(
                  //             fontSize: 10.0,
                  //             fontWeight: FontWeight.w400,
                  //             color: ColorManager.greylight,
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: ColorManager.containerBorderGrey),
                  //           ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(4.0),
                  //             borderSide: const BorderSide(color: Colors.grey),
                  //           ),
                  //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  //         ),
                  //         value: selectedStatus,
                  //         icon: Icon(
                  //           Icons.arrow_drop_down,
                  //           color: ColorManager.blueprime,
                  //         ),
                  //         iconSize: 24,
                  //         elevation: 16,
                  //         style: GoogleFonts.firaSans(
                  //           fontSize: 10.0,
                  //           fontWeight: FontWeight.w400,
                  //           color: const Color(0xff686464),
                  //         ),
                  //         onChanged: (newValue) {
                  //           setState(() {
                  //             selectedStatus = newValue;
                  //             print(selectedStatus);
                  //           });
                  //         },
                  //         items: statusOptions.map((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(
                  //               value,
                  //               style: GoogleFonts.firaSans(
                  //                 fontSize: 12,
                  //                 color: Color(0xff575757),
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           );
                  //         }).toList(),
                  //       );
                  //     }
                  //   },
                  // ),
                  ///
                  // FutureBuilder<List<PatientStatusData>>(
                  //   future: StatusChange(context), // Call your API method here
                  //   builder: (BuildContext context, AsyncSnapshot<List<PatientStatusData>> snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return SchedularTextField(
                  //         width: 350,
                  //         controller: dummyCtrl,
                  //         labelText: 'Status',
                  //         suffixIcon: Icon(Icons.arrow_drop_down,
                  //           color: ColorManager
                  //               .blueprime,),); // Show loading indicator while waiting
                  //     } if (snapshot.hasData){
                  //       // Data is available, map it to dropdown items
                  //       List<String> statusOptions = snapshot.data!.map((statusData) {
                  //         return statusData.patientStatus; // Use patientStatus for the dropdown item label
                  //       }).toList();
                  //       return DropdownButtonFormField<String>(
                  //         decoration: InputDecoration(
                  //           labelText: 'Status',
                  //           labelStyle: GoogleFonts.firaSans(
                  //             fontSize: 10.0,
                  //             fontWeight: FontWeight.w400,
                  //             color: ColorManager.greylight,
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: ColorManager.containerBorderGrey),
                  //           ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(4.0),
                  //             borderSide: const BorderSide(color: Colors.grey),
                  //           ),
                  //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  //         ),
                  //         value: selectedStatus,
                  //         icon: Icon(
                  //           Icons.arrow_drop_down,
                  //           color: ColorManager.blueprime,
                  //         ),
                  //         iconSize: 24,
                  //         elevation: 16,
                  //         style: GoogleFonts.firaSans(
                  //           fontSize: 10.0,
                  //           fontWeight: FontWeight.w400,
                  //           color: const Color(0xff686464),
                  //         ),
                  //         onChanged: (newValue) {
                  //           setState(() {
                  //             selectedStatus = newValue;
                  //             print(selectedStatus);
                  //           });
                  //         },
                  //         items: statusOptions.map((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(
                  //               value,
                  //               style: GoogleFonts.firaSans(
                  //                 fontSize: 12,
                  //                 color: Color(0xff575757),
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           );
                  //         }).toList(),
                  //       );
                  //     } else {
                  //       return const Offstage();
                  //     }
                  //   },
                  // ),

                  childState: FutureBuilder<List<StateData>>(
                    future: getStateDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                            width: 350,
                            controller: dummyCtrl,
                            labelText: 'State*');
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.name!),
                            value: i.name,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'State*',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.name == newValue) {
                                  selectedState = a.name!;
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
                  childCountry: FutureBuilder<List<CountryData>>(
                    future: getCountryDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                            controller: dummyCtrl, labelText: 'Country*');
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.name!),
                            value: i.name,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'Country*',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.name == newValue) {
                                  selectedCountry = a.name!;
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
                  childReligion: FutureBuilder<List<ReligionData>>(
                    future: getReligionDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                          width: 500,
                          controller: dummyCtrl,
                          labelText: 'Religion',
                        );
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.religion!),
                            value: i.religion,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'Religion',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.religion == newValue) {
                                  selectedReligion = a.religion!;
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
                  childCity: FutureBuilder<List<CityData>>(
                    future: getCityDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                          width: 400,
                          controller: dummyCtrl,
                          labelText: 'City*',
                        );
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.cityName!),
                            value: i.cityName,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'City*',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.cityName == newValue) {
                                  selectedcity = a.cityName!;
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
                  childRace: FutureBuilder<List<RaceData>>(
                    future: getRaceDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                            controller: dummyCtrl, labelText: 'Residence Type');
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.race!),
                            value: i.race,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'Residence Type',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.race == newValue) {
                                  selectedRace = a.race!;
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
                  childLanguage: FutureBuilder<List<LanguageSpokenData>>(
                    future: getlanguageSpokenDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                          controller: dummyCtrl,
                          labelText: 'Language Spoken',
                        );
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.languageSpoken!),
                            value: i.languageSpoken,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'Language Spoken',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.languageSpoken == newValue) {
                                  selectedLanguage = a.languageSpoken!;
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
                  childMaritalStatus: FutureBuilder<List<MetrialStatusData>>(
                    future: getMaritalStatusDropDown(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SchedularTextField(
                          controller: dummyCtrl,
                          labelText: 'Marital Status',
                        );
                      }
                      if (snapshot.hasData) {
                        List<DropdownMenuItem<String>> dropDownList = [];
                        for (var i in snapshot.data!) {
                          dropDownList.add(DropdownMenuItem<String>(
                            child: Text(i.maritalStatus),
                            value: i.maritalStatus,
                          ));
                        }

                        return CustomDropdownTextFieldsm(
                            headText: 'Marital Status',
                            dropDownMenuList: dropDownList,
                            onChanged: (newValue) {
                              for (var a in snapshot.data!) {
                                if (a.maritalStatus == newValue) {
                                  selectedMaritalStatus = a.maritalStatus!;
                                  //country = a
                                  // int? docType = a.companyOfficeID;
                                }
                              }
                            });
                      } else {
                        return const Offstage();
                      }
                    },
                  ), isIButtonPressed: widget.iButtonClickd,
                ),
                IntakeRelatedPartiesScreen(
                  patientId: patientId,
                ),
                IntakePComplianceScreen(patientId: patientId),
                // IntakePlanCareScreen(patientId: patientId,),

                IntakePatientsStayInfoScreen(
                  patientId: patientId,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
