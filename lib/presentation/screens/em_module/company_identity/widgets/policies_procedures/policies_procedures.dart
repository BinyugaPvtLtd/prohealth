import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/ci_org_doc_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/manage_insurance_manager/manage_corporate_compliance.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/org_doc_ccd.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/establishment_data/company_identity/ci_org_document.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/pagination_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../app/services/api/managers/establishment_manager/newpopup_manager.dart';
import '../../../../../../data/api_data/establishment_data/ci_manage_button/manage_corporate_conpliance_data.dart';
import '../../../../../../data/api_data/establishment_data/ci_manage_button/newpopup_data.dart';
import '../../../manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import '../ci_corporate_compliance_doc/widgets/newpopup.dart';
import 'widgets/add_policies_popup.dart';

class CiPoliciesAndProcedures extends StatefulWidget {
  final int docID;
  final int subDocID;
  final int companyID;
  final String officeId;
  const CiPoliciesAndProcedures(
      {super.key,
      required this.docID,
      required this.subDocID,
      required this.companyID,
      required this.officeId});

  @override
  State<CiPoliciesAndProcedures> createState() =>
      _CiPoliciesAndProceduresState();
}

class _CiPoliciesAndProceduresState extends State<CiPoliciesAndProcedures> {
  TextEditingController nameOfDocController = TextEditingController();
  TextEditingController idOfDocController = TextEditingController();
  TextEditingController docNamecontroller = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  final StreamController<List<ManageCCDoc>> _controller =
      StreamController<List<ManageCCDoc>>();
  TextEditingController calenderController = TextEditingController();
  final StreamController<List<IdentityDocumentIdData>> _identityDataController =
      StreamController<List<IdentityDocumentIdData>>.broadcast();

  int docTypeMetaId = AppConfig.policiesAndProcedure;
  int docSubTypeMetaId = AppConfig.subDocId0;
  String? expiryType;
  bool _isLoading = false;

  int currentPage = 1;
  int docTypeId = 0;
  final int itemsPerPage = 10;
  final int totalPages = 5;

  void onPageNumberPressed(int pageNumber) {
    setState(() {
      currentPage = pageNumber;
    });
  }



  String? documentTypeName;
  dynamic filePath;
  String? selectedDocType;
  String fileName = '';
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.first.bytes;
        fileName = result.files.first.name;
        print('File path ${filePath}');
        print('File name ${fileName}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIconButton(
                      icon: CupertinoIcons.plus,
                      text: "Add Doctype",
                      onPressed: () async {
                        String? selectedExpiryType = expiryType;
                        calenderController.clear();
                        docIdController.clear();
                        docNamecontroller.clear();
                        selectedExpiryType = "";

                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    void Function(void Function()) setState) {
                                  return VCScreenPopupADDConst(
                                    // calenderController: calenderController,
                                    // idDocController: docIdController,
                                    // nameDocController: docNamecontroller,
                                    loadingDuration: _isLoading,
                                    onPressed: () async {
                                    //  print('File path on pressed ${filePath}');
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      // String expiryTypeToSend =
                                      //     selectedExpiryType == "Not Applicable"
                                      //         ? "Not Applicable"
                                      //         : calenderController.text;
                                      try {
                                        ApiData response =
                                            await addOrgDocPPPost(
                                                context: context,
                                                orgDocumentSetupid: docTypeId,
                                                idOfDocument: "PPP",
                                                expiryDate: "2024-09-10T07:04:41.358Z",
                                                docCreatedat: "2024-08-16T09:39:48.030Z",
                                                companyid: widget.companyID,
                                                url: "url",
                                                officeid: widget.officeId,);
                                         if (response.statusCode ==200 || response.statusCode==201){
                                           await uploadDocumentsoffice(context: context, documentFile: filePath, orgOfficeDocumentId: response.orgOfficeDocumentId!);
                                         }

                                        // await addManageCCVCPPPost(
                                        //   context: context,
                                        //   name: docNamecontroller.text,
                                         // docTypeID: docTypeMetaId,
                                        //   docSubTypeID: docSubTypeMetaId,
                                        //   expiryType: selectedExpiryType.toString(),
                                        //   expiryDate: calenderController.text,//expiryTypeToSend,
                                        //   expiryReminder: selectedExpiryType.toString(),
                                        //   officeId: widget.officeId,
                                        //   idOfDoc: docIdController.text
                                        // );
                                        // Navigator.pop(context);
                                      } finally {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    },
                                    child: FutureBuilder<List<TypeofDocpopup>>(
                                      future: getTypeofDoc(context,
                                          widget.docID, widget.subDocID),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Container(
                                            width: 350,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                                        value: doc.docname,
                                                        child:
                                                            Text(doc.docname!),
                                                      ))
                                                  .toList();
                                          return CICCDropdown(
                                            initialValue: "Select",
                                            onChange: (val) {
                                              //   setState(() {
                                              // selectedDocType = val;
                                              for (var doc in snapshot.data!) {
                                                if (doc.docname == val) {
                                                  docTypeId =
                                                      doc.orgDocumentSetupid!;
                                                }
                                              }
                                              // getTypeofDoc(context ,widget.docId,widget.subDocId).then((data) {
                                              //   _compliancePatientDataController
                                              //       .add(data!);
                                              // }).catchError((error) {
                                              //   // Handle error
                                              // });
                                              // });
                                            },
                                            items: dropDownMenuItems,
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                    ),

                                    uploadField: Container(
                                      height: AppSize.s30,
                                      width: AppSize.s354,
                                      // margin: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(

                                        border: Border.all(

                                          color: ColorManager.containerBorderGrey,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: StatefulBuilder(
                                        builder: (BuildContext context,
                                            void Function(void Function()) setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  fileName,
                                                  style: GoogleFonts.firaSans(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeightManager.regular,
                                                    color: ColorManager.lightgreyheading,
                                                  ),
                                                ),
                                                IconButton(
                                                  padding: EdgeInsets.all(4),
                                                  onPressed: _pickFile,
                                                  icon: Icon(
                                                    Icons.file_upload_outlined,
                                                    color: ColorManager.black,
                                                    size: 17,
                                                  ),
                                                  splashColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),



                                    // FutureBuilder<List<DocumentTypeData>>(
                                    //   future: documentTypeGet(context),
                                    //   builder: (context, snapshot) {
                                    //     if (snapshot.connectionState == ConnectionState.waiting) {
                                    //       return Container(
                                    //         width: 300,
                                    //         child: Text(
                                    //           'Loading...',
                                    //           style: CustomTextStylesCommon.commonStyle(
                                    //             fontWeight: FontWeightManager.medium,
                                    //             fontSize: FontSize.s12,
                                    //             color: ColorManager.mediumgrey,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    //     if (snapshot.data!.isEmpty) {
                                    //       return Center(
                                    //         child: Text(
                                    //           AppString.dataNotFound,
                                    //           style: CustomTextStylesCommon.commonStyle(
                                    //             fontWeight: FontWeightManager.medium,
                                    //             fontSize: FontSize.s12,
                                    //             color: ColorManager.mediumgrey,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    //     if (snapshot.hasData) {
                                    //       List<DropdownMenuItem<String>> dropDownMenuItems = [];
                                    //       int docType = snapshot.data![0].docID;
                                    //       docTypeMetaId = docType;
                                    //
                                    //       for (var i in snapshot.data!) {
                                    //         dropDownMenuItems.add(
                                    //           DropdownMenuItem<String>(
                                    //             child: Text(i.docType),
                                    //             value: i.docType,
                                    //           ),
                                    //         );
                                    //       }
                                    //       return CICCDropdown(
                                    //         initialValue: dropDownMenuItems[0].value,
                                    //         onChange: (val) {
                                    //           for (var a in snapshot.data!) {
                                    //             if (a.docType == val) {
                                    //               docType = a.docID;
                                    //               docTypeMetaId = docType;
                                    //             }
                                    //           }
                                    //           identityDocumentTypeGet(context, docTypeMetaId).then((data) {
                                    //             _identityDataController.add(data);
                                    //           }).catchError((error) {
                                    //             // Handle error
                                    //           });
                                    //         },
                                    //         items: dropDownMenuItems,
                                    //       );
                                    //     } else {
                                    //       return SizedBox();
                                    //     }
                                    //   },
                                    // ),
                                    /// doc sub type
                                    // child1: StreamBuilder<List<IdentityDocumentIdData>>(
                                    //   stream: _identityDataController.stream,
                                    //   builder: (context, snapshot) {
                                    //     if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                                    //       List<DropdownMenuItem<String>> dropDownMenuItems = [];
                                    //
                                    //       // Add a placeholder item for "Select Subdocument"
                                    //       dropDownMenuItems.add(
                                    //         DropdownMenuItem<String>(
                                    //           value: "Select Sub Document",
                                    //           child: Text("Select Sub Document"),
                                    //         ),
                                    //       );
                                    //
                                    //       for (var i in snapshot.data!) {
                                    //         dropDownMenuItems.add(
                                    //           DropdownMenuItem<String>(
                                    //             value: i.subDocType,
                                    //             child: Text(i.subDocType),
                                    //           ),
                                    //         );
                                    //       }
                                    //
                                    //       return CICCDropdown(
                                    //         initialValue: "Select Sub Document",  // Set initial value to the placeholder
                                    //         onChange: (val) {
                                    //           if (val != "Select Sub Document") {
                                    //             for (var a in snapshot.data!) {
                                    //               if (a.subDocType == val) {
                                    //                 docSubTypeMetaId = a.subDocID;
                                    //               }
                                    //             }
                                    //           }
                                    //         },
                                    //         items: dropDownMenuItems,
                                    //       );
                                    //     } else if (snapshot.connectionState == ConnectionState.waiting) {
                                    //       // Optionally, you can still show a placeholder or nothing here
                                    //       return SizedBox();
                                    //     } else {
                                    //       return Center(
                                    //         child: Text(
                                    //           AppString.dataNotFound,
                                    //           style: CustomTextStylesCommon.commonStyle(
                                    //             fontWeight: FontWeightManager.medium,
                                    //             fontSize: FontSize.s12,
                                    //             color: ColorManager.mediumgrey,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    //   },
                                    // ),
                                    // radioButton: Padding(
                                    //   padding: const EdgeInsets.only(left: 10.0),
                                    //   child: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         "Expiry Type",
                                    //         style: GoogleFonts.firaSans(
                                    //           fontSize: FontSize.s12,
                                    //           fontWeight: FontWeight.w700,
                                    //           color: ColorManager.mediumgrey,
                                    //           decoration: TextDecoration.none,
                                    //         ),
                                    //       ),
                                    //       CustomRadioListTile(
                                    //         value: "Not Applicable",
                                    //         groupValue: selectedExpiryType,
                                    //         onChanged: (value) {
                                    //           setState(() {
                                    //             selectedExpiryType = value;
                                    //           });
                                    //         },
                                    //         title: "Not Applicable",
                                    //       ),
                                    //       CustomRadioListTile(
                                    //         value: 'Scheduled',
                                    //         groupValue: selectedExpiryType,
                                    //         onChanged: (value) {
                                    //           setState(() {
                                    //             selectedExpiryType = value;
                                    //           });
                                    //         },
                                    //         title: 'Scheduled',
                                    //       ),
                                    //       CustomRadioListTile(
                                    //         value: 'Issuer Expiry',
                                    //         groupValue: selectedExpiryType,
                                    //         onChanged: (value) {
                                    //           setState(() {
                                    //             selectedExpiryType = value;
                                    //           });
                                    //         },
                                    //         title: 'Issuer Expiry',
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // child2: Visibility(
                                    //   visible: selectedExpiryType == "Scheduled" || selectedExpiryType == "Issuer Expiry",
                                    //   child: Column(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         "Expiry Date",
                                    //         style: GoogleFonts.firaSans(
                                    //           fontSize: FontSize.s12,
                                    //           fontWeight: FontWeight.w700,
                                    //           color: ColorManager.mediumgrey,
                                    //           decoration: TextDecoration.none,
                                    //         ),
                                    //       ),
                                    //       SizedBox(height: AppSize.s5,),
                                    //       FormField<String>(
                                    //         builder: (FormFieldState<String> field) {
                                    //           return SizedBox (
                                    //             width: 354,
                                    //             height: 30,
                                    //             child:   TextFormField(
                                    //               controller: calenderController,
                                    //               cursorColor: ColorManager.black,
                                    //               style: GoogleFonts.firaSans(
                                    //                 fontSize: FontSize.s12,
                                    //                 fontWeight: FontWeight.w700,
                                    //                 color: ColorManager.mediumgrey,
                                    //                 //decoration: TextDecoration.none,
                                    //               ),
                                    //               decoration: InputDecoration(
                                    //                 enabledBorder: OutlineInputBorder(
                                    //                   borderSide: BorderSide(color: ColorManager.fmediumgrey, width: 1),
                                    //                   borderRadius: BorderRadius.circular(8),
                                    //                 ),
                                    //                 focusedBorder: OutlineInputBorder(
                                    //                   borderSide: BorderSide(color: ColorManager.fmediumgrey, width: 1),
                                    //                   borderRadius: BorderRadius.circular(8),
                                    //                 ),
                                    //                 hintText: 'mm-dd-yyyy',
                                    //                 hintStyle: GoogleFonts.firaSans(
                                    //                   fontSize: FontSize.s12,
                                    //                   fontWeight: FontWeight.w700,
                                    //                   color: ColorManager.mediumgrey,
                                    //                   //decoration: TextDecoration.none,
                                    //                 ),
                                    //                 border: OutlineInputBorder(
                                    //                   borderRadius: BorderRadius.circular(8),
                                    //                   borderSide: BorderSide(width: 1,color: ColorManager.fmediumgrey),
                                    //                 ),
                                    //                 contentPadding:
                                    //                 EdgeInsets.symmetric(horizontal: 16),
                                    //                 suffixIcon: Icon(Icons.calendar_month_outlined,
                                    //                     color: ColorManager.blueprime),
                                    //                 errorText: field.errorText,
                                    //               ),
                                    //               onTap: () async {
                                    //                 DateTime? pickedDate = await showDatePicker(
                                    //                   context: context,
                                    //                   initialDate: DateTime.now(),
                                    //                   firstDate: DateTime(1901),
                                    //                   lastDate: DateTime(3101),
                                    //                 );
                                    //                 if (pickedDate != null) {
                                    //                   calenderController.text =
                                    //                       DateFormat('MM-dd-yyyy').format(pickedDate);
                                    //                 }
                                    //               },
                                    //               validator: (value) {
                                    //                 if (value == null || value.isEmpty) {
                                    //                   return 'please select birth date';
                                    //                 }
                                    //                 return null;
                                    //               },
                                    //             ),
                                    //           );
                                    //         },
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    title: 'Add Policies And Procedure',
                                  );
                                },
                              );
                            });
                      }),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<ManageCCDoc>>(
                  stream: _controller.stream,
                  builder: (context, snapshot) {
                    getManageCorporate(context, widget.officeId, widget.docID,
                            widget.subDocID, 1, 20)
                        .then((data) {
                      _controller.add(data);
                    }).catchError((error) {
                      // Handle error
                    });
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.blueprime,
                        ),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          ErrorMessageString.noPolicyProcedure,
                          style: CustomTextStylesCommon.commonStyle(
                            fontWeight: FontWeightManager.medium,
                            fontSize: FontSize.s12,
                            color: ColorManager.mediumgrey,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      int totalItems = snapshot.data!.length;
                      int totalPages = (totalItems / itemsPerPage).ceil();
                      List<ManageCCDoc> paginatedData = snapshot.data!
                          .skip((currentPage - 1) * itemsPerPage)
                          .take(itemsPerPage)
                          .toList();
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: paginatedData.length,
                                itemBuilder: (context, index) {
                                  int serialNumber = index +
                                      1 +
                                      (currentPage - 1) * itemsPerPage;
                                  String formattedSerialNumber =
                                      serialNumber.toString().padLeft(2, '0');
                                  ManageCCDoc policiesdata =
                                      paginatedData[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xff000000)
                                                      .withOpacity(0.25),
                                                  spreadRadius: 0,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            height: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons
                                                                .remove_red_eye_outlined,
                                                            color: ColorManager
                                                                .blueprime,
                                                          )),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "ID : ${policiesdata.idOfDoc}",
                                                            // policiesdata.doccreatedAt.toString(),textAlign:TextAlign.center,
                                                            style: GoogleFonts
                                                                .firaSans(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: const Color(
                                                                  0xff686464),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                          Text(
                                                            policiesdata.docname
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .firaSans(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: const Color(
                                                                  0xff686464),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  //  Text(''),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          String?
                                                              selectedExpiryType =
                                                              expiryType;
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return FutureBuilder<
                                                                  CorporatePrefillCCVVPP>(
                                                                future: getManageCCPrefill(
                                                                    context,
                                                                    policiesdata
                                                                        .docId),
                                                                builder: (context,
                                                                    snapshotPrefill) {
                                                                  if (snapshotPrefill
                                                                          .connectionState ==
                                                                      ConnectionState
                                                                          .waiting) {
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: ColorManager
                                                                            .blueprime,
                                                                      ),
                                                                    );
                                                                  }

                                                                  // Prefill values from API
                                                                  var documentPreId =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .documentId;
                                                                  docIdController =
                                                                      TextEditingController(
                                                                    text: snapshotPrefill
                                                                        .data!
                                                                        .documentId
                                                                        .toString(),
                                                                  );

                                                                  //
                                                                  // var documentTypePreId = snapshotPrefill.data!.documentTypeId;
                                                                  // docTypeMetaId = documentTypePreId;

                                                                  var documentSubPreId =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .documentSubTypeId;
                                                                  docSubTypeMetaId =
                                                                      documentSubPreId;

                                                                  var name =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .docName;
                                                                  nameOfDocController =
                                                                      TextEditingController(
                                                                    text: snapshotPrefill
                                                                        .data!
                                                                        .docName,
                                                                  );

                                                                  var calender =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .expiryDate;
                                                                  calenderController =
                                                                      TextEditingController(
                                                                    text: snapshotPrefill
                                                                        .data!
                                                                        .expiryDate,
                                                                  );

                                                                  var expiry =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .expiryType;
                                                                  expiryType =
                                                                      expiry;

                                                                  var idOfDoc =
                                                                      snapshotPrefill
                                                                          .data!
                                                                          .idOfDoc;
                                                                  idOfDocController = TextEditingController(
                                                                      text: snapshotPrefill
                                                                          .data!
                                                                          .idOfDoc
                                                                          .toString());

                                                                  return StatefulBuilder(
                                                                    builder: (BuildContext
                                                                            context,
                                                                        void Function(void Function())
                                                                            setState) {
                                                                      return VCScreenPopupEditConst(
                                                                        title:
                                                                            'Edit Policies And Procedure',
                                                                        //id: documentPreId,
                                                                        // idOfDocController: idOfDocController,
                                                                        // nameDocController: nameOfDocController,
                                                                        // calenderController: calenderController,
                                                                        loadingDuration:
                                                                            _isLoading,
                                                                        onSavePressed:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            _isLoading =
                                                                                true;
                                                                          });
                                                                          try {
                                                                            String expiryTypeToSend = selectedExpiryType == "Not Applicable"
                                                                                ? "Not Applicable"
                                                                                : calenderController.text;
                                                                            await updateCorporateDocumentPost(
                                                                                context: context,
                                                                                docId: documentPreId,
                                                                                name: name == nameOfDocController.text ? name.toString() : nameOfDocController.text,
                                                                                docTypeID: AppConfig.policiesAndProcedure,
                                                                                docSubTypeID: documentSubPreId == docSubTypeMetaId ? documentSubPreId : docSubTypeMetaId,
                                                                                docCreated: DateTime.now().toString(),
                                                                                url: "url",
                                                                                expiryType: expiry == expiryType.toString() ? expiry.toString() : expiryType.toString(),
                                                                                expiryDate: expiryTypeToSend, //calender == calenderController.text ? calender.toString() : calenderController.text,
                                                                                expiryReminder: selectedExpiryType == selectedExpiryType.toString() ? selectedExpiryType.toString() : expiryType.toString(),
                                                                                officeId: widget.officeId,
                                                                                idOfDoc: snapshotPrefill.data!.idOfDoc);
                                                                          } finally {
                                                                            setState(() {
                                                                              _isLoading = false;
                                                                            });
                                                                            Navigator.pop(context);
                                                                          }
                                                                        },

                                                                        child: FutureBuilder<
                                                                            List<TypeofDocpopup>>(
                                                                          future: getTypeofDoc(
                                                                              context,
                                                                              widget.docID,
                                                                              widget.subDocID),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            if (snapshot.connectionState ==
                                                                                ConnectionState.waiting) {
                                                                              return Container(
                                                                                width: 350,
                                                                                height: 30,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(8),
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
                                                                              List<DropdownMenuItem<String>> dropDownMenuItems = snapshot.data!
                                                                                  .map((doc) => DropdownMenuItem<String>(
                                                                                        value: doc.docname,
                                                                                        child: Text(doc.docname!),
                                                                                      ))
                                                                                  .toList();
                                                                              return CICCDropdown(
                                                                                initialValue: "Select",
                                                                                onChange: (val) {
                                                                                  //   setState(() {
                                                                                  // selectedDocType = val;
                                                                                  for (var doc in snapshot.data!) {
                                                                                    if (doc.docname == val) {
                                                                                      docTypeId = doc.documenttypeid!;
                                                                                    }
                                                                                  }
                                                                                  // getTypeofDoc(context ,widget.docId,widget.subDocId).then((data) {
                                                                                  //   _compliancePatientDataController
                                                                                  //       .add(data!);
                                                                                  // }).catchError((error) {
                                                                                  //   // Handle error
                                                                                  // });
                                                                                  // });
                                                                                },
                                                                                items: dropDownMenuItems,
                                                                              );
                                                                            } else {
                                                                              return SizedBox();
                                                                            }
                                                                          },
                                                                        ),

                                                                        // child: FutureBuilder<List<DocumentTypeData>>(
                                                                        //    future: documentTypeGet(context),
                                                                        //    builder: (context, snapshot) {
                                                                        //      if (snapshot.connectionState == ConnectionState.waiting) {
                                                                        //        return Container(
                                                                        //          width: 300,
                                                                        //          child: Text(
                                                                        //            'Loading...',
                                                                        //            style: CustomTextStylesCommon.commonStyle(
                                                                        //              fontWeight: FontWeightManager.medium,
                                                                        //              fontSize: FontSize.s12,
                                                                        //              color: ColorManager.mediumgrey,
                                                                        //            ),
                                                                        //          ),
                                                                        //        );
                                                                        //      }
                                                                        //      if (snapshot.data!.isEmpty) {
                                                                        //        return Center(
                                                                        //          child: Text(
                                                                        //            AppString.dataNotFound,
                                                                        //            style: CustomTextStylesCommon.commonStyle(
                                                                        //              fontWeight: FontWeightManager.medium,
                                                                        //              fontSize: FontSize.s12,
                                                                        //              color: ColorManager.mediumgrey,
                                                                        //            ),
                                                                        //          ),
                                                                        //        );
                                                                        //      }
                                                                        //      if (snapshot.hasData) {
                                                                        //        String selectedDocType = "";
                                                                        //        int docType = snapshot.data![0].docID;
                                                                        //
                                                                        //        for (var i in snapshot.data!) {
                                                                        //          if (i.docID == AppConfig.policiesAndProcedure) {
                                                                        //            selectedDocType = i.docType;
                                                                        //            docType = i.docID;
                                                                        //            break;
                                                                        //          }
                                                                        //        }
                                                                        //
                                                                        //        docTypeMetaId = docType;
                                                                        //
                                                                        //        identityDocumentTypeGet(context, docTypeMetaId).then((data) {
                                                                        //          _identityDataController.add(data);
                                                                        //        }).catchError((error) {
                                                                        //          // Handle error
                                                                        //        });
                                                                        //
                                                                        //        return Container(
                                                                        //          width: 354,
                                                                        //          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                                                                        //          decoration: BoxDecoration(
                                                                        //            color: ColorManager.white,
                                                                        //            borderRadius: BorderRadius.circular(8),
                                                                        //            border: Border.all(color: ColorManager.fmediumgrey,width: 1),
                                                                        //          ),
                                                                        //          child: Row(
                                                                        //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        //            children: [
                                                                        //              Text(
                                                                        //                selectedDocType,
                                                                        //                style: CustomTextStylesCommon.commonStyle(
                                                                        //                  fontWeight: FontWeightManager.medium,
                                                                        //                  fontSize: FontSize.s12,
                                                                        //                  color: ColorManager.mediumgrey,
                                                                        //                ),
                                                                        //              ),
                                                                        //              Icon(
                                                                        //                Icons.arrow_drop_down,
                                                                        //                color: Colors.transparent,
                                                                        //              ),
                                                                        //            ],
                                                                        //          ),
                                                                        //        );
                                                                        //      } else {
                                                                        //        return SizedBox();
                                                                        //      }
                                                                        //    },
                                                                        //  ),
                                                                        // radioButton: Padding(
                                                                        //   padding: const EdgeInsets.only(left: 10.0),
                                                                        //   child: Column(
                                                                        //     mainAxisAlignment: MainAxisAlignment.start,
                                                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                                                        //     children: [
                                                                        //       Text(
                                                                        //         "Expiry Type",
                                                                        //         style: GoogleFonts.firaSans(
                                                                        //           fontSize: FontSize.s12,
                                                                        //           fontWeight: FontWeight.w700,
                                                                        //           color: ColorManager.mediumgrey,
                                                                        //           decoration: TextDecoration.none,
                                                                        //         ),
                                                                        //       ),
                                                                        //       CustomRadioListTile(
                                                                        //         value: "Not Applicable",
                                                                        //         groupValue: selectedExpiryType,
                                                                        //         onChanged: (value) {
                                                                        //           setState(() {
                                                                        //             selectedExpiryType = value;
                                                                        //           });
                                                                        //         },
                                                                        //         title: "Not Applicable",
                                                                        //       ),
                                                                        //       CustomRadioListTile(
                                                                        //         value: 'Scheduled',
                                                                        //         groupValue: selectedExpiryType,
                                                                        //         onChanged: (value) {
                                                                        //           setState(() {
                                                                        //             selectedExpiryType = value;
                                                                        //           });
                                                                        //         },
                                                                        //         title: 'Scheduled',
                                                                        //       ),
                                                                        //       CustomRadioListTile(
                                                                        //         value: 'Issuer Expiry',
                                                                        //         groupValue: selectedExpiryType,
                                                                        //         onChanged: (value) {
                                                                        //           setState(() {
                                                                        //             selectedExpiryType = value;
                                                                        //           });
                                                                        //         },
                                                                        //         title: 'Issuer Expiry',
                                                                        //       ),
                                                                        //     ],
                                                                        //   ),
                                                                        // ),
                                                                        // child2: Visibility(
                                                                        //   visible: selectedExpiryType == "Scheduled" || selectedExpiryType == "Issuer Expiry",
                                                                        //   child: Column(
                                                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                                                        //     children: [
                                                                        //       Padding(
                                                                        //         padding: const EdgeInsets.only(left: 2),
                                                                        //         child: Text(
                                                                        //           "Expiry Date",
                                                                        //           style: GoogleFonts.firaSans(
                                                                        //             fontSize: FontSize.s12,
                                                                        //             fontWeight: FontWeight.w700,
                                                                        //             color: ColorManager.mediumgrey,
                                                                        //             decoration: TextDecoration.none,
                                                                        //           ),
                                                                        //         ),
                                                                        //       ),
                                                                        //       SizedBox(height: 5,),
                                                                        //       FormField<String>(
                                                                        //         builder: (FormFieldState<String> field) {
                                                                        //           return SizedBox (
                                                                        //             width: 354,
                                                                        //             height: 30,
                                                                        //             child:   TextFormField(
                                                                        //               controller: calenderController,
                                                                        //               cursorColor: ColorManager.black,
                                                                        //               style: GoogleFonts.firaSans(
                                                                        //                 fontSize: FontSize.s12,
                                                                        //                 fontWeight: FontWeight.w700,
                                                                        //                 color: ColorManager.mediumgrey,
                                                                        //                 //decoration: TextDecoration.none,
                                                                        //               ),
                                                                        //               decoration: InputDecoration(
                                                                        //                 enabledBorder: OutlineInputBorder(
                                                                        //                   borderSide: BorderSide(color: ColorManager.fmediumgrey, width: 1),
                                                                        //                   borderRadius: BorderRadius.circular(8),
                                                                        //                 ),
                                                                        //                 focusedBorder: OutlineInputBorder(
                                                                        //                   borderSide: BorderSide(color: ColorManager.fmediumgrey, width: 1),
                                                                        //                   borderRadius: BorderRadius.circular(8),
                                                                        //                 ),
                                                                        //                 hintText: 'mm-dd-yyyy',
                                                                        //                 hintStyle: GoogleFonts.firaSans(
                                                                        //                   fontSize: FontSize.s12,
                                                                        //                   fontWeight: FontWeight.w700,
                                                                        //                   color: ColorManager.mediumgrey,
                                                                        //                   //decoration: TextDecoration.none,
                                                                        //                 ),
                                                                        //                 border: OutlineInputBorder(
                                                                        //                   borderRadius: BorderRadius.circular(8),
                                                                        //                   borderSide: BorderSide(width: 1,color: ColorManager.fmediumgrey),
                                                                        //                 ),
                                                                        //                 contentPadding:
                                                                        //                 EdgeInsets.symmetric(horizontal: 16),
                                                                        //                 suffixIcon: Icon(Icons.calendar_month_outlined,
                                                                        //                     color: ColorManager.blueprime),
                                                                        //                 errorText: field.errorText,
                                                                        //               ),
                                                                        //               onTap: () async {
                                                                        //                 DateTime? pickedDate = await showDatePicker(
                                                                        //                   context: context,
                                                                        //                   initialDate: DateTime.now(),
                                                                        //                   firstDate: DateTime(1901),
                                                                        //                   lastDate: DateTime(3101),
                                                                        //                 );
                                                                        //                 if (pickedDate != null) {
                                                                        //                   calenderController.text =
                                                                        //                       DateFormat('MM-dd-yyyy').format(pickedDate);
                                                                        //                 }
                                                                        //               },
                                                                        //               validator: (value) {
                                                                        //                 if (value == null || value.isEmpty) {
                                                                        //                   return 'please select birth date';
                                                                        //                 }
                                                                        //                 return null;
                                                                        //               },
                                                                        //             ),
                                                                        //           );
                                                                        //         },
                                                                        //       ),
                                                                        //     ],
                                                                        //   ),
                                                                        // ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.edit_outlined,
                                                          size: 18,
                                                          color: ColorManager
                                                              .bluebottom,
                                                        ),
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                      ),
                                                      IconButton(
                                                          splashColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    DeletePopup(
                                                                        title:
                                                                            'Delete Policies Procedure',
                                                                        onCancel:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        onDelete:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          setState(
                                                                              () async {
                                                                            await deleteManageCorporate(context,
                                                                                policiesdata.docId);
                                                                            getManageCorporate(context, widget.officeId, widget.docID, widget.subDocID, 1, 20).then((data) {
                                                                              _controller.add(data);
                                                                            }).catchError((error) {
                                                                              // Handle error
                                                                            });
                                                                          });
                                                                        }));
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            size: 18,
                                                            color: ColorManager
                                                                .red,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          PaginationControlsWidget(
                            currentPage: currentPage,
                            items: snapshot.data!,
                            itemsPerPage: itemsPerPage,
                            onPreviousPagePressed: () {
                              setState(() {
                                currentPage =
                                    currentPage > 1 ? currentPage - 1 : 1;
                              });
                            },
                            onPageNumberPressed: (pageNumber) {
                              setState(() {
                                currentPage = pageNumber;
                              });
                            },
                            onNextPagePressed: () {
                              setState(() {
                                currentPage = currentPage < totalPages
                                    ? currentPage + 1
                                    : totalPages;
                              });
                            },
                          ),
                        ],
                      );
                    }
                    return const Offstage();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
