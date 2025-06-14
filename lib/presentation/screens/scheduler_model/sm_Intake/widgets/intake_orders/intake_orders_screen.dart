import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_flow_contgainer_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/textfield_dropdown_constant/schedular_textfield_const.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/constant_widgets/dropdown_constant_sm.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/constants/app_config.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/master_patient_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/patient_insurances_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import '../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../em_module/widgets/dialogue_template.dart';
import '../../../../em_module/widgets/text_form_field_const.dart';
import '../../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../widgets/constant_widgets/schedular_success_popup.dart';


import 'package:flutter/material.dart';

class PriDiagnosisProvider with ChangeNotifier {
  bool _ordersSignAndDate = false;
  bool _isLoading = false;

  bool get ordersSignAndDate => _ordersSignAndDate;
  bool get isLoading => _isLoading;

  void toggleOrdersSignAndDate(bool? value) {
    _ordersSignAndDate = value ?? false;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}





class SMIntakeOrdersScreen extends StatefulWidget {
  final int patientId;

   SMIntakeOrdersScreen({super.key,
    required this.patientId
   });

  @override
  State<SMIntakeOrdersScreen> createState() => _SMIntakeOrdersScreenState();
}

class _SMIntakeOrdersScreenState extends State<SMIntakeOrdersScreen> {
  // int selectedIndex = 0;
  final StreamController<List<PatientDiagnosisWithIdData>> _streamDignosis = StreamController<List<PatientDiagnosisWithIdData>>.broadcast();

  TextEditingController possible = TextEditingController();

  TextEditingController icd = TextEditingController();

  TextEditingController pdgm = TextEditingController();

  int dgnIdSelected = 0;

  String dgnNameSelected = 'Select';

  bool dgnAddLoader = false;
  bool ordersSignAndDate = false;

  @override
  void initState() {
    super.initState();

    _prefillData();
    // ✅ Ensure patientId is set in DiagnosisProvider before fetching
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
    //   diagnosisProvider.patientId;
    //   _prefillData();
    // }); // Loads the data before the build method runs
  }


  //final GlobalKey<_OrdersCheckboxState> _checkboxKey = GlobalKey();

  Future<void> _prefillData() async {
    try {
      final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
      final priDiagnosisProvider = Provider.of<PriDiagnosisProvider>(context, listen: false);

      final orders = await getPatientOrderprifill(
        context: context,
        patientId: diagnosisProvider.patientId,
      );

      if (orders.isNotEmpty) {
        final firstOrder = orders.first;

       // priDiagnosisProvider.toggleOrdersSignAndDate(firstOrder.ordersSignedDate == true);
        print(";;;;;;;Referral Source ID: ${firstOrder.referralSourceId}");
        print("Special Order IDs: ${firstOrder.specialOrderIds}");
        print(";;;;;Orders Signed Date: ${firstOrder.ordersSignedDate}");


        setState(() {
          ordersSignAndDate = firstOrder.ordersSignedDate;
          receivedDateController.text = firstOrder.dateReceived;
          orderDateController.text = firstOrder.orderDate;
          caseManagerController.text = firstOrder.caseManager;
          trackingNotesController.text = firstOrder.trackingNotes;
          trueSelectedList = firstOrder.ptDisciplines;
          Marketerid = firstOrder.marketerId;
          refersourceid = firstOrder.referralSourceId;
          selectedOrderIds = firstOrder.specialOrderIds;

        });



      }
    } catch (e) {
      print("❌ Error in _prefillData: $e");
    }
  }


  // Future<void> _prefillData() async {
  //   try {
  //     final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
  //     final priDiagnosisProvider = Provider.of<PriDiagnosisProvider>(context, listen: false);
  //
  //     final patientId = diagnosisProvider.patientId;
  //     print("👤 Current Patient ID: $patientId");
  //
  //     final orders = await getPatientOrderprifill(
  //       context: context,
  //       patientId: patientId,
  //     );
  //
  //     print("📦 Orders fetched: ${orders.length}");
  //
  //     if (orders.isNotEmpty) {
  //       final firstOrder = orders.first;
  //
  //       // ✅ Only update checkbox if patientId matches
  //       if (firstOrder.patientId == patientId) {
  //         priDiagnosisProvider.toggleOrdersSignAndDate(firstOrder.ordersSignedDate == true);
  //         print("☑️ Checkbox updated to: ${firstOrder.ordersSignedDate}");
  //       } else {
  //         print("❌ Checkbox not updated — patientId mismatch");
  //       }
  //
  //       // ✅ Always update text fields and lists
  //       setState(() {
  //         receivedDateController.text = firstOrder.dateReceived;
  //         orderDateController.text = firstOrder.orderDate;
  //         caseManagerController.text = firstOrder.caseManager;
  //         trackingNotesController.text = firstOrder.trackingNotes;
  //         trueSelectedList = firstOrder.ptDisciplines;
  //         Marketerid = firstOrder.marketerId;
  //         refersourceid = firstOrder.referralSourceId;
  //         selectedOrderIds = firstOrder.specialOrderIds;
  //       });
  //     } else {
  //       print("❌ No orders returned.");
  //     }
  //   } catch (e) {
  //     print("❌ Error in _prefillData: $e");
  //   }
  // }



  @override
  void dispose() {
    possible.dispose();
    icd.dispose();
    pdgm.dispose();
    receivedDateController.dispose();
    orderDateController.dispose();
    caseManagerController.dispose();
    trackingNotesController.dispose();
    residencyController.dispose();
    _streamDignosis.close();
    super.dispose();
  }

  TextEditingController receivedDateController = TextEditingController();
  TextEditingController orderDateController = TextEditingController();
  TextEditingController caseManagerController = TextEditingController();
  TextEditingController trackingNotesController = TextEditingController();
  int? Marketerid = 0;
  String? selectedSource ="Select";
  int? refersourceid = 0;
  TextEditingController residencyController = TextEditingController();

  String? selectedMarketer ="Select";
  List<int> trueSelectedList = [];
  List<int> falseSelectedList = [];
  Map<String, Set<int>> selectedTitleToIds = {};

   List<int> selectedOrderIds = [];


  @override
  Widget build(BuildContext context) {

     return Consumer<SmIntakeProviderManager>(
          builder: (context, providerState, child) {
            final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);
          //  final priDiagnosisProvider = Provider.of<PriDiagnosisProvider>(context, listen: false);
            return Padding(
             padding: const EdgeInsets.only(top: 5),
             child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10,right: 35,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Review and confirm the data pulled is correct',
                            style: SMItalicTextConst.customTextStyle(context))
                      ],
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Order Details"),
                  ),
                  IntakeFlowContainerConst(
                    height: AppSize.s370,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SchedularTextField(
                                    width:providerState.isContactTrue ? AppSize.s200 :AppSize.s300,
                                    controller: receivedDateController,
                                    labelText: 'Date Received',
                                    enable: false,
                                    showDatePicker:true,
                                  ),
                                  const SizedBox(height: AppSize.s14,),

                                     SchedularTextField(
                                      width:providerState.isContactTrue ? AppSize.s200 :AppSize.s300,
                                      controller: orderDateController,
                                      labelText: 'Order Date',
                                       enable: false,
                                      showDatePicker:true,
                                    ),

                                  const SizedBox(height: AppSize.s14,),
                                  // SizedBox(
                                  //   width: 210,
                                  //   child: Consumer<PriDiagnosisProvider>(
                                  //     builder: (context, priDiagnosisProvider, child) {
                                  //       return ExpCheckboxTile(
                                  //         title: 'Orders Signed and Date',
                                  //         initialValue: priDiagnosisProvider.ordersSignAndDate,
                                  //         isInfoIconVisible: true,
                                  //         onChanged: (value) {
                                  //           priDiagnosisProvider.toggleOrdersSignAndDate(value);
                                  //         },
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  ///

                                  // SizedBox(
                                  //   width: 210,
                                  //   child: OrdersCheckbox(
                                  //     key: _checkboxKey,
                                  //     initialValue: ordersSignAndDate,
                                  //     onChanged: (value) {
                                  //       ordersSignAndDate = value;
                                  //     },
                                  //   ),
                                  // ),



                                  StatefulBuilder(
                                    builder: (context, setLocalState) {
                                      return SizedBox(
                                        width: 210,
                                        child:  ExpCheckboxTileoo(
                                          title: 'Orders Signed and Date',
                                          value: ordersSignAndDate,
                                          isInfoIconVisible: true,
                                          onChanged: (value) {
                                            setLocalState(() {
                                              ordersSignAndDate = value! ;
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              flex: 3,

                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: providerState.isContactTrue ? 7 : 7),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Disciplines',
                                                style: AllPopupHeadings.customTextStyle(context),
                                              ),
                                              const SizedBox(width: 10),
                                              SvgPicture.asset(
                                                'images/sm/sm_refferal/i_circle.svg',
                                                height: 20,
                                                width: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),




                                        ///no api
                                        // Container(
                                        //   height: providerState.isContactTrue ? AppSize.s150 : AppSize.s200,
                                        //   width: providerState.isContactTrue ? AppSize.s350 : AppSize.s480,
                                        //   child: SingleChildScrollView(
                                        //     child: Row(
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       children: [
                                        //         /// Column 1
                                        //         Expanded(
                                        //           flex: providerState.isContactTrue ? 4 : 3,
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.start,
                                        //             children: [
                                        //               ExpCheckboxTile(
                                        //                 title: 'Nursing',
                                        //                 initialValue: isNursing,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               ExpCheckboxTile(
                                        //                 title: 'Physical Therapy',
                                        //                 initialValue: isPhysicalThe,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               ExpCheckboxTile(
                                        //                 title: providerState.isContactTrue
                                        //                     ? 'Speech Therapy'
                                        //                     : 'Home Health Aide',
                                        //                 initialValue: providerState.isContactTrue
                                        //                     ? isOccupationalThe
                                        //                     : isSpeechThe,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               if (providerState.isContactTrue)
                                        //                 CheckboxTile(
                                        //                   title: 'Dietician',
                                        //                   initialValue: isMedicalSocialThe,
                                        //                   onChanged: (value) {},
                                        //                 ),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //
                                        //         SizedBox(width: providerState.isContactTrue ? 3 : 8),
                                        //
                                        //         /// Column 2
                                        //         Expanded(
                                        //           flex: providerState.isContactTrue ? 5 : 4,
                                        //           child: Column(
                                        //             mainAxisAlignment: MainAxisAlignment.start,
                                        //             children: [
                                        //               ExpCheckboxTile(
                                        //                 title: providerState.isContactTrue
                                        //                     ? 'Home Health Aide'
                                        //                     : 'Speech Therapy',
                                        //                 initialValue: providerState.isContactTrue
                                        //                     ? isSpeechThe
                                        //                     : isOccupationalThe,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               ExpCheckboxTile(
                                        //                 title: 'Medical Social Services',
                                        //                 initialValue: isSpeechThe,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               ExpCheckboxTile(
                                        //                 title: 'Occupational Therapy',
                                        //                 initialValue: isPhysicalThe,
                                        //                 onChanged: (value) {},
                                        //               ),
                                        //               if (providerState.isContactTrue)
                                        //                 const SizedBox(height: 30),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //
                                        //         /// Column 3 (only when isContactTrue == false)
                                        //         if (!providerState.isContactTrue)
                                        //           Expanded(
                                        //             flex: 2,
                                        //             child: Column(
                                        //               mainAxisAlignment: MainAxisAlignment.start,
                                        //               children: [
                                        //                 ExpCheckboxTile(
                                        //                   title: 'Dietician',
                                        //                   initialValue: isMedicalSocialThe,
                                        //                   onChanged: (value) {},
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),

                                        ///api
                                        // FutureBuilder<List<EmployeeClinicalData>>(
                                        //   future: getEmployeeClinicalInReffreals(context: context),
                                        //   builder: (context, snapshot) {
                                        //     if (snapshot.connectionState == ConnectionState.waiting) {
                                        //       return const Center(child: CircularProgressIndicator());
                                        //     }
                                        //
                                        //     if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                                        //       return const SizedBox.shrink();
                                        //     }
                                        //
                                        //     final clinicalData = snapshot.data!;
                                        //
                                        //     final titleMapping = {
                                        //       'Nursing': ['Nurse'],
                                        //       'Speech Therapy': ['Speech Therapist'],
                                        //       'Occupational Therapy': ['Occupational Therapist'],
                                        //       'Physical Therapy': ['Therapist'],
                                        //       'Home Health Aide': ['Clinical'],
                                        //       'Medical Social Services': ['Clinical'],
                                        //       'Dietician': ['Dietician'],
                                        //     };
                                        //
                                        //     bool shouldShowCheckbox(String title) {
                                        //       final keywords = titleMapping[title];
                                        //       if (keywords == null) return false;
                                        //       return clinicalData.any((e) =>
                                        //           keywords.any((keyword) =>
                                        //           e.empType.trim().toLowerCase() == keyword.trim().toLowerCase()));
                                        //     }
                                        //
                                        //     final visibleTitles = titleMapping.keys
                                        //         .where((title) => shouldShowCheckbox(title))
                                        //         .toList();
                                        //
                                        //     // Group into columns of 3
                                        //     List<List<String>> columnGroups = [];
                                        //     for (int i = 0; i < visibleTitles.length; i += 3) {
                                        //       columnGroups.add(
                                        //         visibleTitles.sublist(
                                        //           i,
                                        //           i + 3 > visibleTitles.length ? visibleTitles.length : i + 3,
                                        //         ),
                                        //       );
                                        //     }
                                        //
                                        //     return Container(
                                        //      // width: providerState.isContactTrue ? AppSize.s350 : AppSize.s480,
                                        //       padding: const EdgeInsets.all(12),
                                        //       child: Row(
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         children: columnGroups.map((group) {
                                        //           return Padding(
                                        //             padding: const EdgeInsets.only(right: 20.0),
                                        //             child: Column(
                                        //               crossAxisAlignment: CrossAxisAlignment.start,
                                        //               children: group.map((title) {
                                        //                 return StatefulBuilder(
                                        //                   builder: (context, setTileState) {
                                        //                     bool isChecked = false;
                                        //
                                        //                     return SizedBox(
                                        //                       width: 180,
                                        //                       child: ExpCheckboxTile(
                                        //                         title: title,
                                        //                         initialValue: isChecked,
                                        //                         onChanged: (value) {
                                        //                           setTileState(() {
                                        //                             isChecked = value ?? false;
                                        //
                                        //                             if (isChecked) {
                                        //                               if (!trueSelectedList.contains(title)) {
                                        //                                 trueSelectedList.add(title);
                                        //                               }
                                        //                               falseSelectedList.remove(title);
                                        //                             } else {
                                        //                               if (!falseSelectedList.contains(title)) {
                                        //                                 falseSelectedList.add(title);
                                        //                               }
                                        //                               trueSelectedList.remove(title);
                                        //                             }
                                        //                           });
                                        //                         },
                                        //                       ),
                                        //                     );
                                        //                   },
                                        //                 );
                                        //               }).toList(),
                                        //             ),
                                        //           );
                                        //         }).toList(),
                                        //       ),
                                        //     );
                                        //   },
                                        // )

                                        ///


                                        FutureBuilder<List<EmployeeClinicalData>>(
                                          future: getEmployeeClinicalInReffreals(context: context),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return const Center(child: CircularProgressIndicator());
                                            }

                                            if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                                              return const SizedBox.shrink();
                                            }

                                            final clinicalData = snapshot.data!;

                                            final titleMapping = {
                                              'Nursing': ['Nurse'],
                                              'Speech Therapy': ['Speech Therapist'],
                                              'Occupational Therapy': ['Occupational Therapist'],
                                              'Physical Therapy': ['Therapist'],
                                              'Home Health Aide': ['Clinical'],
                                              'Medical Social Services': ['Clinical'],
                                              'Dietician': ['Dietician'],
                                            };

                                            // Map title to the set of matching empTypeIds
                                            final Map<String, Set<int>> titleToEmpTypeIds = {};

                                            for (final title in titleMapping.keys) {
                                              final keywords = titleMapping[title]!;
                                              final matchedIds = clinicalData
                                                  .where((e) =>
                                                  keywords.any((kw) =>
                                                  e.empType.trim().toLowerCase() == kw.trim().toLowerCase()))
                                                  .map((e) => e.emptypeId)
                                                  .toSet();

                                              if (matchedIds.isNotEmpty) {
                                                titleToEmpTypeIds[title] = matchedIds;
                                              }
                                            }

                                            final visibleTitles = titleToEmpTypeIds.keys.toList();

                                            return Container(
                                              padding: const EdgeInsets.all(12),
                                              child: Wrap(
                                                spacing: 20.0,
                                                runSpacing: 12.0,
                                                children: visibleTitles.map((title) {
                                                  // return StatefulBuilder(
                                                  //   builder: (context, setTileState) {
                                                  //     bool isChecked = false;
                                                  //
                                                  //     return SizedBox(
                                                  //       width: 180,
                                                  //       child: ExpCheckboxTile(
                                                  //         title: title,
                                                  //         initialValue: isChecked,
                                                  //         onChanged: (value) {
                                                  //           setTileState(() {
                                                  //             isChecked = value ?? false;
                                                  //             final ids = titleToEmpTypeIds[title]!;
                                                  //
                                                  //             if (isChecked) {
                                                  //               for (var id in ids) {
                                                  //                 if (!trueSelectedList.contains(id)) {
                                                  //                   trueSelectedList.add(id);
                                                  //                 }
                                                  //                 falseSelectedList.remove(id);
                                                  //               }
                                                  //               selectedTitleToIds[title] = ids;
                                                  //             } else {
                                                  //               for (var id in ids) {
                                                  //                 if (!falseSelectedList.contains(id)) {
                                                  //                   falseSelectedList.add(id);
                                                  //                 }
                                                  //                 trueSelectedList.remove(id);
                                                  //               }
                                                  //               selectedTitleToIds.remove(title);
                                                  //             }
                                                  //
                                                  //             // 🔍 Print selected IDs and titles
                                                  //             print("✅ Selected Titles and IDs:");
                                                  //             selectedTitleToIds.forEach((key, value) {
                                                  //               print('Title: $key, IDs: ${value.join(", ")}');
                                                  //             });
                                                  //           });
                                                  //         },
                                                  //
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  // );

                                                  return StatefulBuilder(
                                                    builder: (context, setTileState) {
                                                      // Check if any ID for this title is in trueSelectedList
                                                      final ids = titleToEmpTypeIds[title]!;
                                                      bool isChecked = ids.any((id) => trueSelectedList.contains(id));

                                                      return SizedBox(
                                                        width: 180,
                                                        child: ExpCheckboxTile(
                                                          title: title,
                                                          initialValue: isChecked,
                                                          onChanged: (value) {
                                                            setTileState(() {
                                                              isChecked = value ?? false;

                                                              if (isChecked) {
                                                                for (var id in ids) {
                                                                  if (!trueSelectedList.contains(id)) {
                                                                    trueSelectedList.add(id);
                                                                  }
                                                                  falseSelectedList.remove(id);
                                                                }
                                                                selectedTitleToIds[title] = ids;
                                                              } else {
                                                                for (var id in ids) {
                                                                  if (!falseSelectedList.contains(id)) {
                                                                    falseSelectedList.add(id);
                                                                  }
                                                                  trueSelectedList.remove(id);
                                                                }
                                                                selectedTitleToIds.remove(title);
                                                              }

                                                              // Optional: print updated list
                                                              print("✅ Selected Titles and IDs:");
                                                              selectedTitleToIds.forEach((key, value) {
                                                                print('Title: $key, IDs: ${value.join(", ")}');
                                                              });
                                                            });
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );



                                                }).toList(),
                                              ),
                                            );
                                          },
                                        ),

                                        ///
                                      ],
                                    ),
                                  ),

                            ),

///
                            ///
                            // Expanded(
                            //   flex: 2,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(left: 100),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Padding(
                            //           padding: EdgeInsets.only(left: providerState.isContactTrue ? 0 :7),
                            //           child: Row(
                            //            // mainAxisAlignment: MainAxisAlignment.start,
                            //             spacing: 5,
                            //             children: [
                            //               Text('Disciplines',style:
                            //              // providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                            //               AllPopupHeadings.customTextStyle(context),),
                            //               const SizedBox(width: AppSize.s10,),
                            //               SvgPicture.asset(
                            //                 'images/sm/sm_refferal/i_circle.svg',
                            //                 height: IconSize.I20,
                            //                 width: IconSize.I20,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //         const SizedBox(height: 10),
                            //         Container(
                            //           height:providerState.isContactTrue ? AppSize.s150 :AppSize.s100,
                            //           width:providerState.isContactTrue ? AppSize.s350 :AppSize.s480,
                            //           child: Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: providerState.isContactTrue ? 4: 3,
                            //                 child: Container(
                            //                   child: Column(
                            //                     //alignment: WrapAlignment.start,
                            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                     // spacing: 10,
                            //                     // runSpacing: 5,
                            //                     children: [
                            //                       CheckboxTile(
                            //                         title: 'Nursing',
                            //                         initialValue: isNursing,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Physical\nTherapy' :
                            //                         'Physical Therapy',
                            //                         initialValue: isPhysicalThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ?
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Speech\nTherapy' :
                            //                         'Speech Therapy',
                            //                         initialValue: isOccupationalThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       )
                            //                       : CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Home Health\nAide' :
                            //                         'Home Health Aide',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ? CheckboxTile(
                            //                         title: 'Dietician',
                            //                         initialValue: isMedicalSocialThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ): const Offstage()
                            //
                            //
                            //
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //               SizedBox(width:providerState.isContactTrue ?  3 : 8 ,),
                            //               Expanded(
                            //                 flex: providerState.isContactTrue ? 5: 4,
                            //                 child: Container(
                            //                   child: Column(
                            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //                     children: [
                            //                       providerState.isContactTrue ?
                            //                       CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Home Health\nAide' :
                            //                         'Home Health Aide',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ) : CheckboxTile(
                            //                         title: //providerState.isContactTrue ?'Speech\nTherapy' :
                            //                         'Speech Therapy',
                            //                         initialValue: isOccupationalThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: // providerState.isContactTrue ?'Medical Social\nServices' :
                            //                         'Medical Social Services',
                            //                         initialValue: isSpeechThe,
                            //                         onChanged: (value) {
                            //
                            //                         },
                            //                       ),
                            //                       CheckboxTile(
                            //                         title: // providerState.isContactTrue ?'Occupational\nTherapy' :
                            //                         'Occupational Therapy',
                            //                         initialValue: isPhysicalThe,
                            //                         onChanged: (value) {
                            //                         },
                            //                       ),
                            //                       providerState.isContactTrue ? Container(height: 30,): const Offstage()
                            //                     ],
                            //                   ),
                            //                 ),
                            //               ),
                            //               providerState.isContactTrue ? const Offstage() : Expanded(
                            //                 flex: 2,
                            //                 child: Column(
                            //                   mainAxisAlignment: MainAxisAlignment.start,
                            //                   children: [
                            //                     CheckboxTile(
                            //                       title: 'Dietician',
                            //                       initialValue: isMedicalSocialThe,
                            //                       onChanged: (value) {
                            //                       },
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FutureBuilder<List<PatientMarketerData>>(
                                    future: getMarketerWithDeptId(context: context, deptId: AppConfig.salesId),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {


                                        return SchedularTextField(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            controller:residencyController ,
                                            labelText: 'Marketer');
                                      }
                                      if (snapshot.hasData) {
                                        List<DropdownMenuItem<String>> dropDownList = [];
                                        for (var i in snapshot.data!) {
                                          dropDownList.add(DropdownMenuItem<String>(
                                            child: Text(i.firstName),
                                            value: i.firstName,
                                          ));
                                          if (i.employeeId == Marketerid ) {
                                            selectedMarketer = i.firstName;
                                          }
                                        }
                                        String initialValue = selectedMarketer ?? "Select";


                                        return Padding(
                                          padding:  const EdgeInsets.symmetric(vertical: 4),
                                          child: CustomDropdownTextFieldsm(
                                              width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                              headText: 'Marketer',
                                              dropDownMenuList: dropDownList,
                                              //initialValue:selectedMarketer ,
                                              hintText:initialValue ,
                                              onChanged: (newValue) {
                                                for (var a in snapshot.data!) {
                                                  if (a.firstName == newValue) {
                                                    selectedMarketer = a.firstName;
                                                    Marketerid =a.employeeId;

                                                    // _checkFormValidity();
                                                    //country = a
                                                    // int? docType = a.companyOfficeID;
                                                  }
                                                }
                                              }),
                                        );
                                      } else {
                                        return const Offstage();
                                      }
                                    },
                                  ),


                                  const SizedBox(height: AppSize.s14,),
                                  FutureBuilder<List<ReferralSourcesData>>(
                                    future: getReferalSourceDD(context: context,),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {


                                        return SchedularTextField(
                                            width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                            controller:residencyController ,
                                            labelText: 'Referral Source');
                                      }
                                      if (snapshot.hasData) {
                                        List<DropdownMenuItem<String>> dropDownList = [];
                                        for (var i in snapshot.data!) {
                                          dropDownList.add(DropdownMenuItem<String>(
                                            child: Text(i.sourcename),
                                            value: i.sourcename,
                                          ));
                                          if (i.refsouid == refersourceid) {
                                            selectedSource = i.sourcename;
                                          }
                                        }
                                        String initialValue =  selectedSource ?? "Select";

                                        return Padding(
                                          padding: const  EdgeInsets.symmetric(vertical: 4),
                                          child: CustomDropdownTextFieldsm(
                                              width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                              headText: 'Referral Source',
                                              hintText: initialValue,
                                              dropDownMenuList: dropDownList,
                                              onChanged: (newValue) {
                                                for (var a in snapshot.data!) {
                                                  if (a.sourcename == newValue) {
                                                    selectedSource = a.sourcename;
                                                    refersourceid =a.refsouid;
                                                    // _checkFormValidity();
                                                    //country = a
                                                    // int? docType = a.companyOfficeID;
                                                  }
                                                }
                                              }),
                                        );
                                      } else {
                                        return const Offstage();
                                      }
                                    },
                                  ),

                                  const SizedBox(height: AppSize.s14,),
                                  SchedularTextField(
                                    width:providerState.isContactTrue ? AppSize.s190 :AppSize.s300,
                                    controller: caseManagerController,
                                    labelText: 'Case Manager',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 15,
                          children: [
                            Padding(
                              padding:const EdgeInsets.symmetric(vertical: 13),
                                child: Text('Tracking Notes',style:
                                //providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                                SMTextfieldHeadings.customTextStyle(context)
                                  //AllPopupHeadings.customTextStyle(context)
                                )),
                            const SizedBox(width: AppSize.s10,),
                            SchedularTextField(
                              isIconVisible:true,

                              width: 350,
                              controller: trackingNotesController,
                              labelText: '',
                              hintText: 'Enter Text',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Primary Diagnosis"),
                  ),
                  Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 10),
                        child: StreamBuilder<List<PatientDiagnosisWithIdData>>(
                            stream: _streamDignosis.stream,
                            builder: (context,snapshotDiagnosis) {
                              getPatientDiagnosisData(context: context, ptId: diagnosisProvider.patientId,).then((data) {
                                _streamDignosis.add(data);
                              }).catchError((error) {
                                // Handle error
                              });
                              if(snapshotDiagnosis.connectionState == ConnectionState.waiting){
                                return Center(
                                  child: CircularProgressIndicator(color: ColorManager.blueprime,),
                                );
                              }
                              if(snapshotDiagnosis.data!.isEmpty){
                                return  Center(
                                    child: Padding(
                                      padding:const EdgeInsets.symmetric(vertical: 76),
                                      child: Text(
                                        AppStringSMModule.patientDiagnosisNoData,
                                        style: AllNoDataAvailable.customTextStyle(context),
                                      ),
                                    ));
                              }
                              if(snapshotDiagnosis.hasData){
                                return Container(
                                  // height: 300,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshotDiagnosis.data!.length,
                                      itemBuilder: (context,index) {
                                        possible = TextEditingController(text: snapshotDiagnosis.data![index].dgnName);
                                        icd = TextEditingController(text: snapshotDiagnosis.data![index].dgnCode);
                                        pdgm = TextEditingController(text: snapshotDiagnosis.data![index].pdgm ? 'YES' : 'NO');
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(height: 90,width: 5,color:
                                                  snapshotDiagnosis.data![index].colorId == 0
                                                      ? ColorManager.red
                                                      : snapshotDiagnosis.data![index].colorId == 1
                                                      ? ColorManager.greenDark
                                                      : Colors.white,
                                                  ),
                                                  const SizedBox(width: AppSize.s30,),
                                                  Expanded(
                                                    child: SchedularTextField(controller: possible,
                                                       // isAsteric: false,
                                                        isIconVisible: false,
                                                      //  keyboardType: TextInputType.text,
                                                        labelText: "Possible Diagnosis"),
                                                  ),
                                                  const SizedBox(width: AppSize.s60,),
                                                  Expanded(
                                                    child: SchedularTextField(controller: icd,
                                                       // isAsteric: false,
                                                        isIconVisible: false,
                                                        //keyboardType: TextInputType.text,
                                                        labelText: "ICD Code"),
                                                  ),
                                                  const SizedBox(width: AppSize.s60,),
                                                  Expanded(
                                                    child: SchedularTextField(controller: pdgm,
                                                       // isAsteric: false,
                                                        isIconVisible: true,
                                                        textColor:
                                                        snapshotDiagnosis.data![index].colorId == 0
                                                            ? ColorManager.red
                                                            : snapshotDiagnosis.data![index].colorId == 1
                                                            ? ColorManager.greenDark
                                                            : Colors.black,
                                                        //keyboardType: TextInputType.text,
                                                        labelText: "PDGM - Acceptable"),
                                                  ),
                                                  const SizedBox(width: AppSize.s30,),
                                                  Expanded(
                                                    child: Container(
                                                      height: 30,
                                                      width: AppSize.s354,
                                                    ),
                                                  ),
                                                  const SizedBox(width: AppSize.s30,),
                                                  Expanded(
                                                    child: Container(
                                                      height: 30,
                                                      width: AppSize.s354,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: ColorManager.containerBorderGrey,
                                                thickness: 1,
                                                height: 2,
                                              ),
                                              const SizedBox(height: AppSize.s30,),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                );
                              }
                              else{
                                return const Offstage();
                              }

                            }
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ Container(
                          height: AppSize.s30,
                          child: CustomIconButton(
                            color:  ColorManager.bluebottom,
                            icon: Icons.add,
                            textWeight: FontWeight.w700,
                            textSize: FontSize.s12,
                            text: "Add Diagnosis",
                            onPressed: ()async {
                              showDialog(context: context, builder: (BuildContext context){
                                return StatefulBuilder(
                                    builder: (BuildContext context, StateSetter setState){
                                      return DialogueTemplate(
                                        title: "Add Diagnosis",
                                        width: AppSize.s407,
                                        height: AppSize.s260,
                                        body: [
                                          Padding(padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13),
                                            child: Column(
                                              children: [
                                                FutureBuilder<
                                                    List<PatientDiagnosisMasterData>>(
                                                    future: getPatientDiagnosisMaster(context: context),
                                                    builder: (context, snapshotDgn) {
                                                      if (snapshotDgn.connectionState ==
                                                          ConnectionState.waiting) {
                                                        return Container(
                                                          width: 354,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorManager
                                                                    .containerBorderGrey,
                                                                width: AppSize.s1),
                                                            borderRadius:
                                                            BorderRadius.circular(4),
                                                          ),
                                                          child:  Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 10),
                                                              child: Text(
                                                                  dgnNameSelected,
                                                                  //AppString.dataNotFound,
                                                                  style: DocumentTypeDataStyle.customTextStyle(context)
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      if (snapshotDgn.data!.isEmpty) {
                                                        return Container(
                                                          width: 354,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorManager
                                                                    .containerBorderGrey,
                                                                width: AppSize.s1),
                                                            borderRadius:
                                                            BorderRadius.circular(4),
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 10),
                                                              child: Text(
                                                                  'No Diagnosis',
                                                                  //AppString.dataNotFound,
                                                                  style: DocumentTypeDataStyle.customTextStyle(context)
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      if (snapshotDgn.hasData) {
                                                        List dropDown = [];
                                                        int docType = 0;
                                                        List<DropdownMenuItem<String>>
                                                        dropDownTypesList = [];
                                                        for (var i in snapshotDgn.data!) {
                                                          dropDownTypesList.add(
                                                            DropdownMenuItem<String>(
                                                              value: i.dgnName,
                                                              child: Text(i.dgnName),
                                                            ),
                                                          );
                                                        }
                                                        // if (snapshotDgn == null) {
                                                        //   dgnNameSelected = 'Select County';
                                                        // }

                                                        return CICCDropdown(
                                                            initialValue:
                                                            dgnNameSelected,
                                                             onChange: (val) {
                                                              for (var a
                                                              in snapshotDgn.data!) {
                                                                if (a.dgnName == val) {
                                                                  dgnNameSelected = a.dgnName;
                                                                  docType = a.dgnId;
                                                                  dgnIdSelected = docType;
                                                                }
                                                              }
                                                              print(":::${docType}");

                                                            },
                                                            items: dropDownTypesList);
                                                      }
                                                      return const SizedBox();
                                                    }),
                                              ],
                                            ),)
                                        ],
                                        bottomButtons: dgnAddLoader ? Center(
                                          child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(color: ColorManager.blueprime,)),
                                        ):CustomElevatedButton(
                                          text: 'Add',
                                          onPressed: () async{
                                            try{
                                              setState(() {
                                                dgnAddLoader = true;
                                              });
                                              var response = await addPatientDiagnosis(
                                                  context: context,
                                                  dgnId: dgnIdSelected,
                                                  fk_pt_id:diagnosisProvider.patientId);
                                              if(response.statusCode == 200 || response.statusCode == 201){
                                                Navigator.pop(context);
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return const AddSuccessPopup(
                                                      message: 'Data Added Successfully',
                                                    );
                                                  },
                                                );
                                              }
                                              if(response.statusCode == 400){
                                                Navigator.pop(context);
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return  AddSuccessPopup(
                                                      title: "Error",
                                                      message: response.message,
                                                    );
                                                  },
                                                );
                                              }
                                            }finally{
                                              setState(() {
                                                dgnAddLoader = false;
                                              });
                                            }
                                          },),
                                      );}
                                );
                              });
                              //Provider.of<DiagnosisProvider>(context, listen: false).addDiagnosis();
                              // providerAddState.setVisibility(true);
                              // providerAddState.addDiagnosis();
                            },
                          ),
                        ),],
                      ),






                      const SizedBox(height: AppSize.s16),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(),
                      )
                    ],
                  ),
                  const SizedBox(height: AppSize.s40),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35),
                    child: BlueBGHeadConst(HeadText: "Special Orders"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Padding(
                              padding:const EdgeInsets.only(top: 20,),
                              child: Text('Flags',style:
                              //providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) :
                              SMTextfieldHeadings.customTextStyle(context)
                                //AllPopupHeadings.customTextStyle(context)
                              )),
                        ],),
                        const SizedBox(height: 10,),
                      // providerState.isContactTrue?
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //         crossAxisAlignment:CrossAxisAlignment.start,
                      //         children:[
                      //           CheckboxTile(
                      //             title: 'Dementia',
                      //             initialValue: isDementia,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Catheter Care',
                      //             initialValue: isCatheterCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Labs Ordered',
                      //             initialValue: isLabsOrder,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Infusion/IV',
                      //             initialValue: isInfusionIv,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           )
                      //
                      //         ]
                      //     ),
                      //     Column(
                      //         crossAxisAlignment:CrossAxisAlignment.start,
                      //         children:[
                      //           CheckboxTile(
                      //             title: 'Wound Care',
                      //             initialValue: isWoundCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Zen Med',
                      //             initialValue: isZenMed,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Ostomy Care',
                      //             initialValue: isOstomyCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'Rehospitalization Risk',
                      //             initialValue: isRehospicRisk,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           )
                      //
                      //         ]
                      //     ),
                      //     Column(
                      //         crossAxisAlignment:CrossAxisAlignment.start,
                      //         children:[
                      //           CheckboxTile(
                      //             title: 'Ortho Patient',
                      //             initialValue: isOrthoPatient,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'PT/INR',
                      //             initialValue: isPtInr,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'ECH',
                      //             initialValue: isEch,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           ),
                      //           CheckboxTile(
                      //             title: 'ECH SNF',
                      //             initialValue: isEchSnf,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {
                      //
                      //             },
                      //           )
                      //
                      //         ]
                      //     ),
                      //   ],
                      // ):

                      // Wrap(
                      //   spacing: 16.0,
                      //   runSpacing: 16.0,
                      //   children: [
                      //     SizedBox(
                      //       width: 180, // Adjust width as needed
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'Dementia',
                      //             initialValue: isDementia,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'Catheter Care',
                      //             initialValue: isCatheterCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 180,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'Wound Care',
                      //             initialValue: isWoundCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'Zen Med',
                      //             initialValue: isZenMed,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 180,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'Ortho Patient',
                      //             initialValue: isOrthoPatient,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'PT/INR',
                      //             initialValue: isPtInr,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 180,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'Labs Ordered',
                      //             initialValue: isLabsOrder,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'Infusion/IV',
                      //             initialValue: isInfusionIv,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 200,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'Ostomy Care',
                      //             initialValue: isOstomyCare,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'Rehospitalization Risk',
                      //             initialValue: isRehospicRisk,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 180,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           ExpCheckboxTile(
                      //             title: 'ECH',
                      //             initialValue: isEch,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           ),
                      //           ExpCheckboxTile(
                      //             title: 'ECH SNF',
                      //             initialValue: isEchSnf,
                      //             isInfoIconVisible: true,
                      //             onChanged: (value) {},
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
////////
                      ///
                      // FutureBuilder<List<SpacialOrderData>>(
                      //   future: getSpecialOrder(context: context),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState == ConnectionState.waiting) {
                      //       return const Center(child: CircularProgressIndicator());
                      //     } else if (snapshot.hasError) {
                      //       return const Text("Failed to load special orders.");
                      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      //       return const Text("No special orders found.");
                      //     }
                      //
                      //     final specialOrders = snapshot.data!;
                      //
                      //     // ✅ Print names from API
                      //     for (var order in specialOrders) {
                      //       print("API returned: ${order.spcialordername}");
                      //     }
                      //
                      //     final Map<int, bool> selectedOrders = {
                      //       for (var item in specialOrders) item.spcialorderid: false,
                      //     };
                      //
                      //   //  return final List<int> selectedOrderIds = [];
                      //
                      //     return Wrap(
                      //       spacing: 16.0,
                      //       runSpacing: 16.0,
                      //       children: specialOrders.map((order) {
                      //         return StatefulBuilder(
                      //           builder: (context, setTileState) {
                      //             bool isChecked = selectedOrderIds.contains(order.spcialorderid);
                      //
                      //             return SizedBox(
                      //               width: 180,
                      //               child: ExpCheckboxTile(
                      //                 title: order.spcialordername,
                      //                 initialValue: isChecked,
                      //                 isInfoIconVisible: true,
                      //                 onChanged: (value) {
                      //                   setTileState(() {
                      //                     if (value == true) {
                      //                       if (!selectedOrderIds.contains(order.spcialorderid)) {
                      //                         selectedOrderIds.add(order.spcialorderid);
                      //                       }
                      //                     } else {
                      //                       selectedOrderIds.remove(order.spcialorderid);
                      //                     }
                      //
                      //                     // 🔍 Print current selected IDs in order
                      //                     print("Selected Order IDs in Order: $selectedOrderIds");
                      //                   });
                      //                 },
                      //               ),
                      //             );
                      //           },
                      //         );
                      //       }).toList(),
                      //     );
                      //
                      //     // return Wrap(
                      //     //   spacing: 16.0,
                      //     //   runSpacing: 16.0,
                      //     //   children: specialOrders.map((order) {
                      //     //     return SizedBox(
                      //     //       width: 180,
                      //     //       child: ExpCheckboxTile(
                      //     //         title: order.spcialordername,
                      //     //         initialValue: selectedOrders[order.spcialorderid] ?? false,
                      //     //         isInfoIconVisible: true,
                      //     //         onChanged: (value) {
                      //     //           selectedOrders[order.spcialorderid] = value!;
                      //     //         },
                      //     //       ),
                      //     //     );
                      //     //   }).toList(),
                      //     // );
                      //   },
                      // ),
                        ///
                        FutureBuilder<List<SpacialOrderData>>(
                          future: getSpecialOrder(context: context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return const Text("Failed to load special orders.");
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Text("No special orders found.");
                            }

                            final specialOrders = snapshot.data!;
                            return Wrap(
                              spacing: 80.0,
                              runSpacing: 0.0,
                              children: specialOrders.map((order) {
                                return StatefulBuilder(
                                  builder: (context, setTileState) {
                                    bool isChecked = selectedOrderIds.contains(order.spcialorderid);

                                    return SizedBox(
                                      width: 160,
                                      child: ExpCheckboxTile(
                                        title: order.spcialordername,
                                        initialValue: isChecked,
                                        isInfoIconVisible: true,
                                        onChanged: (value) {
                                          setTileState(() {
                                            if (value == true) {
                                              if (!selectedOrderIds.contains(order.spcialorderid)) {
                                                selectedOrderIds.add(order.spcialorderid);
                                              }
                                            } else {
                                              selectedOrderIds.remove(order.spcialorderid);
                                            }

                                            print("✅ Selected Special Order IDs: $selectedOrderIds");
                                          });
                                        },
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          },
                        ),

                        ///

                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Divider(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CustomButtonTransparent(
                        text: "Skip",
                        onPressed: () {

                        },
                      ),

                      Consumer<PriDiagnosisProvider>(
                        builder: (context, priDiagnosisProvider, child) {
                          return priDiagnosisProvider.isLoading
                              ? const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(),
                          )
                              : CustomElevatedButton(
                            width: AppSize.s100,
                            text: AppString.save,
                            onPressed: () async {
                              priDiagnosisProvider.setLoading(true);

                              final diagnosisProvider = Provider.of<DiagnosisProvider>(context, listen: false);

                              // ✅ Print all relevant data before API call
                              print('🔽 Submitting Data to API:');
                              print('📌 Patient ID: ${diagnosisProvider.patientId}');
                              print('📝 Selected Special Order IDs: $selectedOrderIds');
                              print('📅 Date Received: ${receivedDateController.text}');
                              print('📅 Order Date: ${orderDateController.text}');
                              print('🩺 Selected PT Discipline IDs: $trueSelectedList');
                              print('📈 Marketer ID: $Marketerid');
                              print('📊 Referral Source ID: $refersourceid');
                              print('👩‍⚕️ Case Manager: ${caseManagerController.text}');
                              print('🗒️ Tracking Notes: ${trackingNotesController.text}');
                              print('✍️ Order Signature + Date: $ordersSignAndDate');

                              // 🔁 API Call
                              var response = await postOrderPatient(
                                context: context,
                                patientid: diagnosisProvider.patientId,
                                specialOrderId: selectedOrderIds,
                                dateReceived: receivedDateController.text,
                                orderdate: orderDateController.text,
                                ptDisciplines: trueSelectedList,
                                merkatereid: Marketerid!,
                                refersourceid: refersourceid!,
                                casemanger: caseManagerController.text,
                                trackingnote: trackingNotesController.text,
                                ordersignature: ordersSignAndDate,
                              );

                              if (response.statusCode == 200 || response.statusCode == 201) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AddSuccessPopup(
                                      message: 'Patient Order Successfully',
                                    );
                                  },
                                );
                              } else {
                                print('❌ API error: ${response.statusCode}');
                              }

                              priDiagnosisProvider.setLoading(false);
                            },
                          );
                        },
                      ),



                      ///
                      ///
                      ///
            //           CustomElevatedButton(
            //             width: AppSize.s100,
            //             text: AppString.save,
            //             onPressed: ()async{
            //
            //
            //               print('🔽 Submitting Data to API:');
            //
            //               print('📌 Patient ID: ${diagnosisProvider.patientId}');
            //               print('📝 Selected Special Order IDs: $selectedOrderIds');
            //               print('📅 Date Received: ${receivedDateController.text}');
            //               print('📅 Order Date: ${orderDateController.text}');
            //               print('🩺 Selected PT Discipline IDs: $trueSelectedList');
            //               print('📈 Marketer ID: $Marketerid');
            //               print('📊 Referral Source ID: $refersourceid');
            //               print('👩‍⚕️ Case Manager: ${caseManagerController.text}');
            //               print('🗒️ Tracking Notes: ${trackingNotesController.text}');
            //               print('✍️ Order Signature + Date: ${priDiagnosisProvider.ordersSignAndDate}');
            //
            //         var  response =  await postOrderPatient(
            //                 context: context,
            //                 patientid: diagnosisProvider.patientId, // patientid
            //                 specialOrderId: selectedOrderIds,    //      [1, 2], // specialOrderId
            //                 dateReceived:receivedDateController.text, // dateReceived
            //                 orderdate: orderDateController.text, // orderDate
            //                 ptDisciplines:  trueSelectedList,         //  [3, 4], // ptDisciplines
            //                 merkatereid:  Marketerid!, // merkatereid
            //                 refersourceid: refersourceid!, // refersourceid
            //                 casemanger: caseManagerController.text, // casemanger
            //                 trackingnote: trackingNotesController.text, // trackingnote
            //                 ordersignature: priDiagnosisProvider.ordersSignAndDate,
            //               );
            //         if (response.statusCode ==200 || response.statusCode==201){
            // showDialog(
            // context: context,
            // builder: (BuildContext context) {
            // return const AddSuccessPopup(
            // message: 'Patient Order Updated Successfully',
            // );
            // },
            // );
            // }else{
            // print('Api error');
            // }
            //
            //             },
            //           ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s30),
                ],
              ),
                   ),
           );
         }
       );

  }
}






class OrdersCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const OrdersCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _OrdersCheckboxState createState() => _OrdersCheckboxState();
}

class _OrdersCheckboxState extends State<OrdersCheckbox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.initialValue;
  }

  // Call this externally to update the checkbox
  void update(bool value) {
    setState(() {
      _checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpCheckboxTile(
      title: 'Orders Signed and Date',
      initialValue: _checked,
      isInfoIconVisible: true,
      onChanged: (value) {
        setState(() {
          _checked = value ?? false;
        });
        widget.onChanged(_checked);
      },
    );
  }
}
