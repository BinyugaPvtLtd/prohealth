import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/dialogue_template.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/profilebar_editor.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/establishment_manager/zone_manager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/profile_mnager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/register_manager/register_manager.dart';
import '../../../../../data/api_data/api_data.dart';
import '../../../../../data/api_data/establishment_data/zone/zone_model_data.dart';
import '../../../../../data/api_data/hr_module_data/profile_editor/profile_editor.dart';
import '../../../../screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import '../../../../screens/em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../../screens/hr_module/register/offer_letter_screen.dart';

class ProfileBarAddPopup extends StatefulWidget {
  final int employeeId;
  final int employeeEnrollId;
  final VoidCallback onRefresh;

  const ProfileBarAddPopup({
    super.key,
    required this.employeeId,
    required this.employeeEnrollId, required this.onRefresh,
  });

  @override
  State<ProfileBarAddPopup> createState() => _ProfileBarAddPopupState();
}
class _ProfileBarAddPopupState extends State<ProfileBarAddPopup> {
  int selectedZoneId = 0;
  int selectedCountyId = 0;
  String? selectedZone;
  String? selectedCounty;
  Map<String, bool> checkedZipCodes = {};
  List<String> selectedZipCodes = [];
  String selectedZipCodesString = '';
  List<int> zipCodes = [];
  String? selectedZipCodeZone;
  int docZoneId = 0;

  String selectedCovrageCounty = "Select County";
  String selectedCovrageZone = "Select Zone";

  final StreamController<List<CountyWiseZoneModal>> _zoneController = StreamController<List<CountyWiseZoneModal>>.broadcast();
  final StreamController<List<ZipcodeByCountyIdAndZoneIdData>> _countyStreamController = StreamController<List<ZipcodeByCountyIdAndZoneIdData>>.broadcast();
  List<ApiAddCovrageData> addCovrage = [];
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _fetchCountyWiseZone();
  }
  Widget _buildPlaceholder({String text = ""}) {
    return Container(
      width: 354,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.containerBorderGrey, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(child: Text(text, style: AllNoDataAvailable.customTextStyle(context))),
    );
  }

  void _fetchCountyWiseZone() async {
    if (selectedCountyId > 0) {
      try {
        List<CountyWiseZoneModal> data = await fetchCountyWiseZone(context, selectedCountyId);
        _zoneController.add(data);

        if (data.isNotEmpty) {
          // Auto-select the first zone
          setState(() {
            selectedZipCodeZone = data.first.zoneName;
            selectedCovrageZone = data.first.zoneName;
            docZoneId = data.first.zone_id;
          });

          // Fetch zip codes for the selected county and first zone
          _fetchZipCodes();
        }
      } catch (e) {
        _zoneController.addError("Error fetching zones");
      }
    }
  }

  void _fetchZipCodes() async {
    if (selectedCountyId > 0 && docZoneId > 0) {
      try {
        List<
            ZipcodeByCountyIdAndZoneIdData> data = await getZipcodeByCountyIdAndZoneId(
          context: context,
          countyId: selectedCountyId,
          zoneId: docZoneId,
        );
        _countyStreamController.add(data);
      } catch (e) {
        _countyStreamController.addError("Error fetching zip codes");
      }
    }
  }

  // void _updateButtonState() {
  //   setState(() {
  //     isButtonEnabled = selectedCounty != null &&
  //         selectedCounty!.isNotEmpty &&
  //         (zipCodes.isEmpty || selectedZipCodes.isNotEmpty) &&
  //         selectedZipCodeZone != null &&
  //         selectedZipCodeZone!.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DialogueTemplate(
      width: 420,
      height: 560,
      title: 'Add Coverage',
      body: [
        Column(
          children: [

            /// County & Zone
            Container(
              height: 130,
              width: 354,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('County',
                      style: AllPopupHeadings.customTextStyle(context)),
                  const SizedBox(height: 5),
                  FutureBuilder<List<AllCountyGetList>>(
                    future: getCountyZoneList(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CICCDropdown(
                            width: 354, hintText: 'Select County', items: []);
                      }
                      if (snapshot.hasError) {
                        return const Text("Error fetching counties");
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No Data available');
                      }

                      List<DropdownMenuItem<String>> countyDropDownList = snapshot.data!
                          .map((county) =>
                          DropdownMenuItem<String>(
                            value: county.countyName,
                            child: Text(county.countyName),
                          ))
                          .toList();

                      return CICCDropdown(
                        items: countyDropDownList,
                        initialValue: selectedCounty,
                        width: 354,
                        onChange: (newValue) {
                          setState(() {
                            selectedCounty = newValue;
                            selectedCovrageCounty = newValue;
                            selectedCountyId = snapshot.data!.firstWhere((county) =>
                            county.countyName == newValue)
                                .countyId;
                            _fetchCountyWiseZone(); // Fetch zones based on selected county
                          //  _updateButtonState();
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) setState) { return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Zone',
                            style: AllPopupHeadings.customTextStyle(context)),
                        const SizedBox(height: 5),
                        FutureBuilder<List<CountyWiseZoneModal>>(
                          future: fetchCountyWiseZone(context ,selectedCountyId),
                          // future: _zoneController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return _buildPlaceholder();
                            }
                            if(selectedCountyId == 0 ){
                              return _buildPlaceholder(text: " ");
                            }
                            if ( !snapshot.hasData || snapshot.data!.isEmpty) {
                              return _buildPlaceholder(text: "No zones available");
                            }

                            List<DropdownMenuItem<String>> zoneDropDownList = snapshot.data!
                                .map((zone) => DropdownMenuItem<String>(
                              value: zone.zoneName,
                              child: Text(zone.zoneName),
                            ))
                                .toList();

                            return CICCDropdown(
                              width: 354,
                              initialValue: selectedZipCodeZone, // Set the auto-selected zone
                              onChange: (val) {
                                setState(() {
                                  selectedZipCodeZone = val;
                                  selectedCovrageZone = val;
                                  docZoneId = snapshot.data!.firstWhere((zone) => zone.zoneName == val).zone_id;
                                });

                                _fetchZipCodes(); // Fetch zip codes for the selected zone
                               // _updateButtonState();
                              },
                              items: zoneDropDownList,
                            );
                          },
                        ),
                      ],
                    );  },

                  )

                  // StreamBuilder<List<CountyWiseZoneModal>>(
                  //   stream: _zoneController.stream,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState ==
                  //         ConnectionState.waiting) {
                  //       return _buildPlaceholder();
                  //     }
                  //     if (selectedCountyId == 0 || !snapshot.hasData ||
                  //         snapshot.data!.isEmpty) {
                  //       return _buildPlaceholder(text: "No zones available");
                  //     }
                  //
                  //     List<DropdownMenuItem<
                  //         String>> zoneDropDownList = snapshot.data!
                  //         .map((zone) =>
                  //         DropdownMenuItem<String>(
                  //           value: zone.zoneName,
                  //           child: Text(zone.zoneName),
                  //         ))
                  //         .toList();
                  //
                  //     return CICCDropdown(
                  //       width: 354,
                  //       initialValue: selectedZipCodeZone ??
                  //           zoneDropDownList.first.value,
                  //       onChange: (val) {
                  //         setState(() {
                  //           selectedZipCodeZone = val;
                  //           selectedCovrageZone = val;
                  //           docZoneId = snapshot.data!
                  //               .firstWhere((zone) => zone.zoneName == val)
                  //               .zone_id;
                  //           _fetchZipCodes(); // Fetch zip codes based on selected zone
                  //           _updateButtonState();
                  //         });
                  //       },
                  //       items: zoneDropDownList,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),

            SizedBox(height: 25),

            /// Zip Codes
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) { return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Zip Codes',
                            style: AllPopupHeadings.customTextStyle(context)),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 350,
                        height: 200,
                        child: StreamBuilder<List<ZipcodeByCountyIdAndZoneIdData>>(
                          stream: _countyStreamController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const SizedBox();
                            }
                            if (selectedCountyId == 0 || !snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                child: Text(
                                  selectedCountyId == 0
                                      ? 'Select County'
                                      : 'No Zipcode Available!',
                                  style: NumberTExtFieldLegalDoc.customTextStyle(context),
                                ),
                              );
                            }

                            List<ZipcodeByCountyIdAndZoneIdData> zipCodeList = snapshot.data!;

                            // If only one zip code is available, set it as checked
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (zipCodeList.length == 1) {
                                String singleZip = zipCodeList.first.zipCode;
                                if (!checkedZipCodes.containsKey(singleZip)) {
                                  setState(() {
                                    checkedZipCodes[singleZip] = true;
                                    selectedZipCodes.add(singleZip);
                                    zipCodes.add(int.parse(singleZip));
                                    selectedZipCodesString = selectedZipCodes.join(', ');
                                   // _updateButtonState();
                                  });
                                }
                              }
                            });

                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Two items per row
                                childAspectRatio: 6,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: zipCodeList.length,
                              itemBuilder: (context, index) {
                                String zipCode = zipCodeList[index].zipCode;
                                bool isChecked = checkedZipCodes[zipCode] ?? false;

                                return CheckBoxTileConst(
                                  text: zipCode,
                                  value: isChecked,
                                  onChanged: (bool? val) {
                                    setState(() {
                                      checkedZipCodes[zipCode] = val ?? false;
                                      if (val == true) {
                                        selectedZipCodes.add(zipCode);
                                        zipCodes.add(int.parse(zipCode));
                                      } else {
                                        selectedZipCodes.remove(zipCode);
                                        zipCodes.remove(int.parse(zipCode));
                                      }
                                      selectedZipCodesString = selectedZipCodes.join(', ');
                                    //  _updateButtonState();
                                    });
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ); },

            ),
          ],
        ),
      ],
      bottomButtons: CustomButton(
        height: AppPadding.p30,
        width: AppSize.s100,
        text: 'Save',
        onPressed: () => _handleSave()

        // onPressed: isButtonEnabled
        //     ? () => _handleSave()
        //     : null, // Disable button if fields are empty
      ),
    );
  }

  Future<void> _handleSave() async {
    if (selectedCounty == null || selectedCounty!.isEmpty) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddErrorPopup(
            message: 'Please select a county',
          );
        },
      );
      return;
    }

    if (selectedZipCodes.isEmpty) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddErrorPopup(
            message: 'Please select at least one zip code',
          );
        },
      );
      return;
    }

    if (selectedZipCodeZone == null || selectedZipCodeZone!.isEmpty) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddErrorPopup(
            message: 'Please select a zone',
          );
        },
      );
      return;
    }

    addCovrage.add(await ApiAddCovrageData(
      city: '',
      countyId: selectedCountyId,
      zoneId: docZoneId,
      zipCodes: zipCodes,
    ));

    print('County ID:===== ${selectedCountyId}');
    print('Zone ID:::::::::=>> ${docZoneId}');
    print('Zip Codes:====== ${zipCodes}');

    await addEmpEnrollAddCoverage(
        context, widget.employeeEnrollId, widget.employeeId!, addCovrage
    );

    widget.onRefresh();
    Navigator.pop(context);
  }
}

// class _ProfileBarAddPopupState extends State<ProfileBarAddPopup> {
//   int selectedZoneId = 0;
//   int selectedCountyId = 0;
//   String? selectedZone;
//   String? selectedCounty;
//   Map<String, bool> checkedZipCodes = {};
//   Map<String, bool> checkedCityName = {};
//   List<String> selectedZipCodes = [];
//   List<String> selectedCityName = [];
//   String selectedZipCodesString = '';
//   List<int> zipCodes = [];
//   String? selectedZipCodeZone;
//   int docZoneId = 0;
//   List<DropdownMenuItem<String>> countyDropDownList = [];
//   List<DropdownMenuItem<String>> zoneDropDownList = [];
//   String selectedCovrageCounty = "Select County";
//   String selectedCovrageZone = "Select Zone";
//   final StreamController<List<CountyWiseZoneModal>> _zoneController = StreamController<List<CountyWiseZoneModal>>.broadcast();
//   final StreamController<List<ZipcodeByCountyIdAndZoneIdData>> _countyStreamController = StreamController<List<ZipcodeByCountyIdAndZoneIdData>>.broadcast();
//
//   String countyName = "";
//   String zoneName = "";
//   bool isButtonEnabled = false;
//
//   List<ApiAddCovrageData> addCovrage = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchCountyWiseZone(
//         context, selectedCountyId)
//         .then((data) {
//       _zoneController.add(data);
//     }).catchError((error) {});
//     super.initState();
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       isButtonEnabled = selectedCounty != null &&
//           selectedCounty!.isNotEmpty &&
//           (zipCodes.isEmpty || selectedZipCodes.isNotEmpty) &&
//           selectedZipCodeZone != null &&
//           selectedZipCodeZone!.isNotEmpty;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DialogueTemplate(
//       width: 420,
//       height: 560,
//       title: 'Add Coverage',
//       body: [
//         Padding(
//           padding: const EdgeInsets.only(left: 13),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   ///county zone
//                   Container(
//                     height: 130,
//                     width: 354,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('County',
//                           style: AllPopupHeadings.customTextStyle(context),),
//                         const SizedBox(height: 5),
//                         FutureBuilder<List<AllCountyGetList>>(
//                           future: getCountyZoneList(context),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState == ConnectionState.waiting) {
//                               return  CICCDropdown(
//                                 width: 354,
//                                 hintText: 'Select County',
//                                 items: [],
//                               );
//
//                             }
//                             else if (snapshot.hasError) {
//                               return const Text("Error fetching counties");
//                             }
//                             else if (snapshot.hasData) {
//                               countyDropDownList.clear();
//                               for (var county in snapshot.data!) {
//                                 countyDropDownList.add(
//                                   DropdownMenuItem<String>(
//                                     child: Text(county.countyName),
//                                     value: county.countyName,
//                                   ),
//                                 );
//                               }
//
//                               return StatefulBuilder(
//                                 builder: (BuildContext context, StateSetter setState) {
//                                   return Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       CICCDropdown(
//                                         items: countyDropDownList,
//                                         initialValue: selectedCounty,
//                                         width: 354,
//
//                                         onChange: (newValue) async {
//                                           setState(() {
//                                             selectedCounty = newValue;
//                                             selectedCovrageCounty = newValue;
//                                             _updateButtonState();
//                                           });
//                                           for (var county in snapshot.data!) {
//                                             if (county.countyName == newValue) {
//                                               selectedCountyId = county.countyId;
//                                               countyName = county.countyName;
//                                             }
//                                           }
//                                           print("Selected CountyId: $selectedCountyId");
//                                         },
//                                       ),
//                                       const SizedBox(height: 25),
//                                       Text('Zone', style: AllPopupHeadings.customTextStyle(context),),
//                                       const SizedBox(height: 5),
//                                       StreamBuilder<List<CountyWiseZoneModal>>(
//                                           stream: _zoneController.stream,
//                                           builder: (context, snapshotZone) {
//                                             fetchCountyWiseZone(
//                                                 context, selectedCountyId)
//                                                 .then((data) {
//                                               _zoneController.add(data);
//                                             }).catchError((error) {});
//                                             if (snapshotZone.connectionState == ConnectionState.waiting) {
//                                               return Container(
//                                                 width: 354,
//                                                 height: 30,
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       color: ColorManager
//                                                           .containerBorderGrey,
//                                                       width: AppSize.s1),
//                                                   borderRadius:
//                                                   BorderRadius.circular(4),
//                                                 ),
//                                                 child: const Text(
//                                                   "",
//                                                   //AppString.dataNotFound,
//                                                 ),
//                                               );
//                                             }
//                                             if(selectedCountyId == 0){
//                                               return Container(
//                                                 width: 354,
//                                                 height: 30,
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       color: ColorManager.containerBorderGrey,
//                                                       width: AppSize.s1),
//                                                   borderRadius: BorderRadius.circular(4),
//                                                 ),
//                                                 child: const Text(
//                                                   "",
//                                                 ),
//                                               );
//                                             }
//                                             if (snapshotZone.data!.isEmpty) {
//                                               return Container(
//                                                 width: 354,
//                                                 height: 30,
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                       color: ColorManager.containerBorderGrey, width: AppSize.s1),
//                                                   borderRadius: BorderRadius.circular(4),
//                                                 ),
//                                                 child: Align(
//                                                   alignment: Alignment.centerLeft,
//                                                   child: Padding(
//                                                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                                                     child: Text(
//                                                       ErrorMessageString.noZones,
//                                                       style: AllNoDataAvailable.customTextStyle(context),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               );
//                                             }
//                                             if (snapshotZone.hasData) {
//                                               List dropDown = [];
//                                               int docType = 0;
//                                               List<DropdownMenuItem<String>> dropDownTypesList = [];
//
//                                               for (var i in snapshotZone.data!) {
//                                                 dropDownTypesList.add(
//                                                   DropdownMenuItem<String>(
//                                                     value: i.zoneName,
//                                                     child: Text(i.zoneName),
//                                                   ),
//                                                 );
//                                               }
//                                               if (selectedZipCodeZone == null) {
//                                                 selectedZipCodeZone = snapshotZone.data![0].zoneName;
//                                               }
//                                               docZoneId = snapshotZone.data![0].zone_id;
//                                               return CICCDropdown(
//                                                   width: 354,
//                                                   initialValue:
//                                                   dropDownTypesList[0].value,
//                                                   onChange: (val) {
//                                                     selectedZipCodeZone = val;
//                                                     selectedCovrageZone = val;
//                                                     for (var a
//                                                     in snapshotZone.data!) {
//                                                       if (a.zoneName == val) {
//                                                         docType = a.zone_id;
//                                                         zoneName = a.zoneName;
//                                                         print("ZONE id :: ${a.zone_id}");
//                                                         docZoneId = docType;
//                                                       }
//                                                     }
//                                                     print(":::${docType}");
//                                                     print(":::<>${docZoneId}");
//                                                   },
//                                                   items: dropDownTypesList);
//                                             }
//                                             return const SizedBox();
//                                           }),
//                                     ],
//                                   );
//                                 },
//                               );
//                             }
//                             else {
//                               return const Text('No Data available');
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25,),
//               Row(
//                 children: [
//                   ///Zipcode
//                   Container(
//                     height: 200,
//                     width: 300,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Zip Codes',
//                           style: AllPopupHeadings.customTextStyle(context),),
//                         Expanded(
//                           child: StreamBuilder<List<ZipcodeByCountyIdAndZoneIdData>>(
//                             stream: _countyStreamController.stream,
//                             builder: (BuildContext context, snapshot) {
//                               getZipcodeByCountyIdAndZoneId(
//                                 context: context,
//                                 countyId: selectedCountyId,
//                                 zoneId: docZoneId,
//                               ).then((data) {
//                                 _countyStreamController.add(data);}).catchError((error) {
//                                 // Handle error
//                               });
//                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                 return SizedBox();
//                               }
//
//                               if (selectedCountyId == 0) {
//                                 return Center(
//                                   child: Text(
//                                     'Select county',
//                                     style: NumberTExtFieldLegalDoc.customTextStyle(context),
//                                   ),
//                                 );
//                               }
//
//                               if (snapshot.data!.isEmpty) {
//                                 return Center(
//                                   child: Text(
//                                     'No Zipcode Available!',
//                                     style: NumberTExtFieldLegalDoc.customTextStyle(context),
//                                   ),
//                                 );
//                               }
//
//                               List<ZipcodeByCountyIdAndZoneIdData> zipCodeList = snapshot.data!;
//                               if (zipCodeList.length == 1) {
//                                 String singleZipCode = zipCodeList[0].zipCode;
//                                 if (!checkedZipCodes.containsKey(singleZipCode)) {
//                                   checkedZipCodes[singleZipCode] = true;
//                                   selectedZipCodes.add(singleZipCode);
//                                   zipCodes.add(int.parse(singleZipCode));
//                                   selectedZipCodesString = selectedZipCodes.join(', ');
//                                 }
//                               }
//
//                               return Row(
//                                 children: [
//                                   StatefulBuilder(
//                                     builder: (BuildContext context, void Function(void Function()) setState) {
//                                       return Container(
//                                         width: 200,
//                                         height: 300,
//                                         child: ListView.builder(
//                                           itemCount: zipCodeList.length,
//                                           itemBuilder: (BuildContext context, int index) {
//                                             String zipCode = zipCodeList[index].zipCode;
//                                             bool isChecked = checkedZipCodes[zipCode] ?? false;
//
//                                             return CheckBoxTileConst(
//                                               text: zipCode,
//                                               value: isChecked,
//                                               onChanged: (bool? val) {
//                                                 setState(() {
//                                                   if (zipCodeList.length > 1) {
//                                                     checkedZipCodes[zipCode] = val ?? false;
//                                                   }
//                                                   if (val == true) {
//                                                     selectedZipCodes.add(zipCode);
//                                                     zipCodes.add(int.parse(zipCode));
//                                                   } else {
//                                                     selectedZipCodes.remove(zipCode);
//                                                     zipCodes.remove(int.parse(zipCode));
//                                                   }
//                                                   selectedZipCodesString = selectedZipCodes.join(', ');
//                                                   _updateButtonState();
//                                                 });
//                                               },
//                                             );
//                                           },
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//       bottomButtons: CustomButton(
//           height: AppPadding.p30,
//           width: AppSize.s100,
//           text: 'Save',
//         onPressed: isButtonEnabled ? () => _handleSave() : null, // Disable button if fields are empty
//         ),
//     );
//   }
//   Future<void> _handleSave() async {
//     if (selectedCounty == null || selectedCounty!.isEmpty) {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AddErrorPopup(
//             message: 'Please select a county',
//           );
//         },
//       );
//       return;
//     }
//
//     if (selectedZipCodes.isEmpty) {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AddErrorPopup(
//             message: 'Please select at least one zip code',
//           );
//         },
//       );
//       return;
//     }
//
//     if (selectedZipCodeZone == null || selectedZipCodeZone!.isEmpty) {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AddErrorPopup(
//             message: 'Please select a zone',
//           );
//         },
//       );
//       return;
//     }
//
//     addCovrage.add(await ApiAddCovrageData(
//       city: '',
//       countyId: selectedCountyId,
//       zoneId: docZoneId,
//       zipCodes: zipCodes,
//     ));
//
//     print('County ID:===== ${selectedCountyId}');
//     print('Zone ID:::::::::=>> ${docZoneId}');
//     print('Zip Codes:====== ${zipCodes}');
//
//     await addEmpEnrollAddCoverage(
//         context, widget.employeeEnrollId, widget.employeeId!, addCovrage
//     );
//
//     widget.onRefresh();
//     Navigator.pop(context);
//   }
//
// }
///
///
///
/// worked fine smooth


// StreamBuilder<List<ZipcodeByCountyIdAndZoneIdData>>(
//   stream: _countyStreamController.stream,
//   builder: (BuildContext context, snapshot) {
//     getZipcodeByCountyIdAndZoneId(
//       context: context,
//       countyId: selectedCountyId,
//       zoneId: docZoneId,
//     ).then((data) {
//       _countyStreamController.add(data);
//     }).catchError((error) {
//       // Handle error
//     });
//
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return SizedBox();
//     }
//
//     if (selectedCountyId == 0) {
//       return Center(
//         child: Text(
//           'Select county',
//           style: NumberTExtFieldLegalDoc.customTextStyle(context),
//         ),
//       );
//     }
//
//     if (snapshot.data!.isEmpty) {
//       return Center(
//         child: Text(
//           'No Zipcode Available!',
//           style: NumberTExtFieldLegalDoc.customTextStyle(context),
//         ),
//       );
//     }
//     if(snapshot.hasData){
//       return Row(
//         children: [
//           StatefulBuilder(
//             builder: (BuildContext context,
//                 void Function(void Function()) setState) {
//               return Container(
//                 width: 200,
//                 height: 300,
//                 child: ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     String zipCode = snapshot.data![index].zipCode;
//                     bool isChecked = checkedZipCodes[zipCode] ?? false;
//                     return CheckBoxTileConst(
//                       text: zipCode,
//                       value: isChecked,
//                       onChanged: (bool? val) {
//                         setState(() {
//                           print('Clicked check box 1');
//                           checkedZipCodes[zipCode] =
//                               val ?? false;
//                           if (val == true) {
//                             selectedZipCodes.add(zipCode);
//                             zipCodes.add(int.parse(snapshot.data![index].zipCode));
//                           } else {
//                             selectedZipCodes.remove(zipCode);
//                             zipCodes.remove(int.parse(snapshot.data![index].zipCode));
//                           }
//                           selectedZipCodesString = selectedZipCodes.join(', ');
//                         });
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     }else{
//       return SizedBox();
//     }
//   },
// ),