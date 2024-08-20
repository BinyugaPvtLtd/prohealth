import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/sm_module_manager/lab_report/lab_report_manager.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/child_tabbar_screen/equipment_child/equipment_head_tabbar.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_lab_result/widget/lab_result_add_pop_up.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/widgets/patients_compliance/widget/compliance_add_popup.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/patient_data/patient_data_compliance.dart';
import '../../../../../../data/api_data/sm_data/patient_data/patient_data_compliance.dart';
import '../../../../em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import '../../../widgets/constant_widgets/button_constant.dart';

class IntakeLabResultScreen extends StatefulWidget {
  const IntakeLabResultScreen({super.key});

  @override
  State<IntakeLabResultScreen> createState() => _IntakeLabResultScreenState();
}

class _IntakeLabResultScreenState extends State<IntakeLabResultScreen> {
  final StreamController<List<LabReportModal>> _lapReportController =
      StreamController<List<LabReportModal>>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController docTypecontroller = TextEditingController();
  TextEditingController patientIdcontroller = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  TextEditingController calenderController = TextEditingController();
  final StreamController<List<PDComplianceModal>>
  _compliancePatientDataController =
  StreamController<List<PDComplianceModal>>();
  int docTypeId = 0;
  bool _isLoading = false;
  String? expiryType;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Status: Not Completed',
                    style: GoogleFonts.firaSans(
                        decoration: TextDecoration.none,
                        fontSize: 12.0,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.burnt_red),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 60),
                  Container(
                    height: AppSize.s32,
                    width: AppSize.s105,
                    child: SchedularIconButtonConst(
                        text: AppString.add_new,
                        icon: Icons.add,
                        onPressed: () async {
                          String? selectedDocType;
                          String? selectedExpiryType = expiryType;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context,
                                      void Function(void Function()) setState) {
                                return ComplianceAddPopUp(
                                  calenderController: calenderController,
                                  idDocController: docIdController,

                                  nameDocController: namecontroller,
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    String expiryTypeToSend =
                                        selectedExpiryType == "Not Applicable"
                                            ? "--"
                                            : calenderController.text;
                                    try {
                                      await addLabReport(
                                        context: context,
                                        patientId: 1,
                                        docTypeId: 1,
                                        docType: docTypecontroller.text,
                                        name: namecontroller.text,
                                        docUrl: "url",
                                        createdAt: "2024-08-16T09:39:48.030Z",
                                        expDate: "2024-08-16T09:39:48.030Z",
                                        // // patientId: widget.patientId,
                                        // patientId: 1,
                                        // docTypeId: docTypeId,
                                        // // docTypeId: 24,
                                        // docName: docNamecontroller.text,
                                        // docUrl: 'url',
                                        // expDate: "2024-08-16T09:39:48.030Z",
                                      );
                                      print("DocName${namecontroller.text}");
                                      GetLabReport(context, 1);
                                      Navigator.pop(context);
                                      setState(() {
                                        expiryType = '';
                                        calenderController.clear();
                                        docIdController.clear();
                                        namecontroller.clear();
                                      });
                                    } finally {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  child: FutureBuilder<List<PatientDataComplianceDoc>>(
                                    future:
                                    getpatientDataComplianceDoc(context),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Container(
                                          width: 350,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                        );
                                      }
                                      if (snapshot.data!.isEmpty) {
                                        return Center(
                                          child: Text(
                                            AppString.dataNotFound,
                                            style: CustomTextStylesCommon
                                                .commonStyle(
                                              fontWeight:
                                              FontWeightManager.medium,
                                              fontSize: FontSize.s12,
                                              color: ColorManager.mediumgrey,
                                            ),
                                          ),
                                        );
                                      }
                                      if (snapshot.hasData) {
                                        List<DropdownMenuItem<String>>
                                        dropDownMenuItems = snapshot.data!
                                            .map((doc) =>
                                            DropdownMenuItem<String>(
                                              value: doc.docType,
                                              child: Text(doc.docType!),
                                            ))
                                            .toList();
                                        return CICCDropdown(
                                          initialValue: selectedDocType ??
                                              dropDownMenuItems[0].value,
                                          onChange: (val) {
                                            setState(() {
                                              selectedDocType = val;
                                              for (var doc in snapshot.data!) {
                                                if (doc.docType == val) {
                                                  docTypeId = doc.docTypeId!;
                                                }
                                              }
                                              getComplianceByPatientId(
                                                  context,
                                                  1
                                              ).then((data) {
                                                _compliancePatientDataController
                                                    .add(data!);
                                              }).catchError((error) {
                                                // Handle error
                                              });
                                            });
                                          },
                                          items: dropDownMenuItems,
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    },
                                  ),
                                  radioButton: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expiry Type",
                                        style: GoogleFonts.firaSans(
                                          fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w700,
                                          color: ColorManager.mediumgrey,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      CustomRadioListTile(
                                        value: "Not Applicable",
                                        groupValue: selectedExpiryType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedExpiryType = value;
                                          });
                                        },
                                        title: "Not Applicable",
                                      ),
                                      CustomRadioListTile(
                                        value: 'Scheduled',
                                        groupValue: selectedExpiryType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedExpiryType = value;
                                          });
                                        },
                                        title: 'Scheduled',
                                      ),
                                      CustomRadioListTile(
                                        value: 'Issuer Expiry',
                                        groupValue: selectedExpiryType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedExpiryType = value;
                                          });
                                        },
                                        title: 'Issuer Expiry',
                                      ),
                                    ],
                                  ),
                                  child2: Visibility(
                                    visible: selectedExpiryType ==
                                            "Scheduled" ||
                                        selectedExpiryType == "Issuer Expiry",
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Expiry Date",
                                          style: GoogleFonts.firaSans(
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        FormField<String>(
                                          builder:
                                              (FormFieldState<String> field) {
                                            return SizedBox(
                                              width: 354,
                                              height: 30,
                                              child: TextFormField(
                                                controller: calenderController,
                                                cursorColor: ColorManager.black,
                                                style: GoogleFonts.firaSans(
                                                  fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      ColorManager.mediumgrey,
                                                  //decoration: TextDecoration.none,
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ColorManager
                                                            .fmediumgrey,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: ColorManager
                                                            .fmediumgrey,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  hintText: 'mm-dd-yyyy',
                                                  hintStyle:
                                                      GoogleFonts.firaSans(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        ColorManager.mediumgrey,
                                                    //decoration: TextDecoration.none,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: ColorManager
                                                            .fmediumgrey),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16),
                                                  suffixIcon: Icon(
                                                      Icons
                                                          .calendar_month_outlined,
                                                      color: ColorManager
                                                          .blueprime),
                                                  errorText: field.errorText,
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(3101),
                                                  );
                                                  if (pickedDate != null) {
                                                    calenderController.text =
                                                        DateFormat('MM-dd-yyyy')
                                                            .format(pickedDate);
                                                  }
                                                },
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'please select birth date';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: 'Add New Lab Report',
                                );
                              });
                            },
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.width * 0.3,
                // width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: StreamBuilder<List<LabReportModal>>(
                            stream: _lapReportController.stream,
                            builder: (context, snapshot) {
                              GetLabReport(context, 1, ).then((data) {
                                _lapReportController.add(data);
                              }).catchError((error) {
                                // Handle error
                              });
                              print('55555555');
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.blueprime,
                                  ),
                                );
                              }
                              if (snapshot.data!.isEmpty) {
                                return Center(
                                  child: Text(
                                    AppString.dataNotFound,
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontWeight: FontWeightManager.medium,
                                      fontSize: FontSize.s12,
                                      color: ColorManager.mediumgrey,
                                    ),
                                  ),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 40),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: AppSize.s65,
                                            // width: 1109, //1109
                                            decoration: BoxDecoration(
                                              color: ColorManager.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Container(
                                                        color: ColorManager
                                                            .blueprime,
                                                        height: AppSize.s45,
                                                        width: AppSize.s62,
                                                        child: Icon(
                                                          Icons
                                                              .remove_red_eye_outlined,
                                                          color: ColorManager
                                                              .white,
                                                          size: AppSize.s24,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            120),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 11.5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          //  snapshot
                                                          //                                                                 .data![index]
                                                          //                                                                 .complianceId
                                                          //                                                                 .toString(),
                                                          Text(
                                                            snapshot.data![index].docType.toString(),
                                                            style: GoogleFonts.firaSans(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize:
                                                                    FontSize
                                                                        .s10,
                                                                fontWeight:
                                                                    FontWeightManager
                                                                        .medium,
                                                                color: ColorManager
                                                                    .granitegray),
                                                          ),
                                                          SizedBox(height: 3.5),
                                                          Text(
                                                            snapshot.data![index].labReportId.toString(),
                                                            style: GoogleFonts.firaSans(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize:
                                                                    FontSize
                                                                        .s12,
                                                                fontWeight:
                                                                    FontWeightManager
                                                                        .bold,
                                                                color: ColorManager
                                                                    .granitegray),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  AppSize.s1),
                                                          Text(
                                                              snapshot.data![index].expDate.toString(),
                                                            style: GoogleFonts.firaSans(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize:
                                                                    FontSize
                                                                        .s10,
                                                                fontWeight:
                                                                    FontWeightManager
                                                                        .lightbold,
                                                                color: ColorManager
                                                                    .granitegray),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(width: MediaQuery.of(context).size.width/4.5), //3.5
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 50.0),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.history,
                                                          color: ColorManager
                                                              .granitegray,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              120),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.print_outlined,
                                                          color: ColorManager
                                                              .granitegray,
                                                        ),
                                                        onPressed: () async {
                                                          final pdf =
                                                              pw.Document();

                                                          pdf.addPage(
                                                            pw.Page(
                                                              build: (pw.Context
                                                                      context) =>
                                                                  pw.Center(
                                                                child: pw.Text(
                                                                    'Hello, this is a test print!'),
                                                              ),
                                                            ),
                                                          );

                                                          await Printing
                                                              .layoutPdf(
                                                            onLayout: (PdfPageFormat
                                                                    format) async =>
                                                                pdf.save(),
                                                          );
                                                        },
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              120),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons
                                                              .file_download_outlined,
                                                          color: ColorManager
                                                              .granitegray,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              120),
                                                      IconButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                context,
                                                                builder:
                                                                    (context) =>
                                                                    StatefulBuilder(
                                                                      builder:
                                                                          (BuildContext context, void Function(void Function()) setState) {
                                                                        return DeletePopup(
                                                                            title: 'Delete license',
                                                                            loadingDuration: _isLoading,
                                                                            onCancel: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            onDelete: () async {
                                                                              setState(() {
                                                                                _isLoading = true;
                                                                              });
                                                                              try {
                                                                                await deleteIntakeLabReport(context, snapshot.data![index].labReportId!);
                                                                                setState(() async {
                                                                                  await GetLabReport(
                                                                                      context, 1
                                                                                  ).then((data) {
                                                                                    _lapReportController.add(data);
                                                                                  }).catchError((error) {
                                                                                    // Handle error
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                });
                                                                              } finally {
                                                                                setState(() {
                                                                                  _isLoading = false;
                                                                                });
                                                                              }
                                                                            });
                                                                      },
                                                                    ));
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            size: 18,
                                                            color: ColorManager
                                                                .red,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                              return Offstage();
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
