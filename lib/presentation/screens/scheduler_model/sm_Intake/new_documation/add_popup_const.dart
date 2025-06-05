import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/textfield_dropdown_constant/schedular_textfield_const.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../data/api_data/api_data.dart';
import '../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../em_module/widgets/dialogue_template.dart';
import '../../../em_module/widgets/header_content_const.dart';
import '../../../hr_module/onboarding/download_doc_const.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';

class AddPopupConstant extends StatefulWidget {
  final String title;
  final int docTypeId;
   AddPopupConstant({super.key, required this.title, required this.docTypeId});

  @override
  State<AddPopupConstant> createState() => _AddPopupConstantState();
}

class _AddPopupConstantState extends State<AddPopupConstant> {
  bool isLoading = false;
  bool fileAbove20Mb = false;
  String fileName = '';
  dynamic _filePath;
  bool _fileAbove20Mb = false;
  TextEditingController DocNameController = TextEditingController();

  void pickAckFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final fileSize = result?.files.first.size; // File size in bytes
    final isAbove20MB = fileSize! > (20 * 1024 * 1024); // 20MB in bytes
    if (result != null) {
      _filePath = result.files.first.bytes;
      fileName = result.files.first.name;
      _fileAbove20Mb = !isAbove20MB;
      //notifyListeners();
    }
  }
  String? selectedFileName;

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context,listen: false);
    final int patientId = diagnosisProvider.patientId;

    return DialogueTemplate(width: 400, height: 320, body: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// upload  doc
            HeaderContentConst(
              isAsterisk: false,
              styleHeading: SMTextfieldHeadings.customTextStyle(context),
              heading: AppString.upload_document,
              content: InkWell(
                onTap:()async{
                  //pickAckFile();
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (result != null) {
                    final fileSize = result.files.first.size;
                    final isAbove20MB = fileSize > (20 * 1024 * 1024);

                    setState(() {
                      _filePath = result.files.first.bytes;
                      fileName = result.files.first.name;
                      _fileAbove20Mb = !isAbove20MB;
                    });

                    // This updates the UI inside the StatefulBuilder
                   // localSetState(() {});
                  }
                },
                child: Container(
                  height: AppSize.s30,
                  // width: AppSize.s354,
                  padding: EdgeInsets.only(left: AppPadding.p10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.containerBorderGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) localSetState) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                fileName,
                                style: DropdownItemStyle.customTextStyle(context),
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(4),
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf'],
                                );
                                if (result != null) {
                                  final fileSize = result.files.first.size;
                                  final isAbove20MB = fileSize > (20 * 1024 * 1024);

                                  setState(() {
                                    _filePath = result.files.first.bytes;
                                    fileName = result.files.first.name;
                                    _fileAbove20Mb = !isAbove20MB;
                                  });

                                  // This updates the UI inside the StatefulBuilder
                                  localSetState(() {});
                                }
                              },
                              icon: Icon(
                                Icons.file_upload_outlined,
                                color: ColorManager.black,
                                size: 20,
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
              ),
            ),
            SizedBox(height: 10,),
            SchedularTextField(
              isIconVisible: true,
              labelText:  "Content of Document",
              controller: DocNameController,),
          ],
        ),
      ),
    ],
        bottomButtons: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: ColorManager.blueprime,
                ),
              )
                  : CustomElevatedButton(
                width: AppSize.s105,
                height: AppSize.s30,
                text: AppStringEM.submit,
                onPressed: () async {
                  if (_filePath != null && fileName.isNotEmpty && !_fileAbove20Mb) {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddErrorPopup(
                          message: 'File is too large!',
                        );
                      },
                    );

                    setState(() {
                      isLoading = false;
                    });

                    return; // Early return to stop further execution
                  }

                  setState(() {
                    isLoading = true; // Start loading
                  });
                  // if (_filePath == null || fileName.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text("Please select a file first.")),
                  //   );
                  //   return;
                  // }

                  ApiData apiData = await postReferralPatientDocuments(
                    context: context,
                    fk_pt_id: patientId,
                    document_name: fileName,
                    rptd_document_type:  widget.docTypeId,
                    rptd_content: DocNameController.text,
                  );

                  print(apiData.rptd_id);
                  if (apiData.statusCode == 200 || apiData.statusCode == 201) {
                    var uploadPatientDoc = await uploadPatientReffrelsDocuments(
                      context: context,
                      rptd_id: apiData.rptd_id!,
                      documentFile: _filePath,
                      documentName: fileName,
                    );

                    print(uploadPatientDoc.statusCode);
                    if (uploadPatientDoc.statusCode == 200 || uploadPatientDoc.statusCode == 201) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AddSuccessPopup(
                            message: 'Document Uploaded Successfully',
                          );
                        },
                      );
                    }
                    setState(() {
                      isLoading = false; // End loading
                    });
                  }
                },
              ),
            ],
          ),
        ),
        title: widget.title);




  }
}

///f2f doc add
class AddF2FPopupConstant extends StatefulWidget {
  final String title;
  final String ffDate;
  final int marketerId;
  final String postOpDate;
  final String visitNote;
  final int docTypeId;
  const AddF2FPopupConstant({super.key, required this.title,
    required this.ffDate,
    required this.marketerId,
    required this.postOpDate,
    required this.visitNote,
    required this.docTypeId,});

  @override
  State<AddF2FPopupConstant> createState() => _AddF2FPopupConstantState();
}

class _AddF2FPopupConstantState extends State<AddF2FPopupConstant> {
  String fileName = '';
  dynamic _filePath;
  bool isLoading = false;
  bool _fileAbove20Mb = false;
  TextEditingController DocNameController = TextEditingController();

  void pickAckFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final fileSize = result?.files.first.size; // File size in bytes
    final isAbove20MB = fileSize! > (20 * 1024 * 1024); // 20MB in bytes
    if (result != null) {
      _filePath = result.files.first.bytes;
      fileName = result.files.first.name;
      _fileAbove20Mb = !isAbove20MB;
      //notifyListeners();
    }
  }
  String? selectedFileName;

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = Provider.of<DiagnosisProvider>(context,listen: false);
    final int patientId = diagnosisProvider.patientId;

    return DialogueTemplate(width: 400, height: 320, body: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// upload  doc
            HeaderContentConst(
              isAsterisk: false,
              styleHeading: SMTextfieldHeadings.customTextStyle(context),
              heading: AppString.upload_document,
              content: InkWell(
                onTap:()async{
                  pickAckFile();
                },
                child: Container(
                  height: AppSize.s30,
                  // width: AppSize.s354,
                  padding: EdgeInsets.only(left: AppPadding.p10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.containerBorderGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) localSetState) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                fileName,
                                style: DocumentTypeDataStyle.customTextStyle(context),
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(4),
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['pdf'],
                                );
                                if (result != null) {
                                  final fileSize = result.files.first.size;
                                  final isAbove20MB = fileSize > (20 * 1024 * 1024);

                                  setState(() {
                                    _filePath = result.files.first.bytes;
                                    fileName = result.files.first.name;
                                    _fileAbove20Mb = !isAbove20MB;
                                  });

                                  // This updates the UI inside the StatefulBuilder
                                  localSetState(() {});
                                }
                              },
                              icon: Icon(
                                Icons.file_upload_outlined,
                                color: ColorManager.black,
                                size: 20,
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
              ),
            ),
            SizedBox(height: 10,),
            SchedularTextField(
              isIconVisible: true,
              labelText:  "Content of Document",
              controller: DocNameController,),
          ],
        ),
      ),
    ],
        bottomButtons: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading ?Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(color: ColorManager.blueprime,),
                ),
              ) :CustomElevatedButton(
                width: AppSize.s105,
                height: AppSize.s30,
                text: AppStringEM.submit,
                onPressed: () async {
                  // if (_filePath == null || fileName.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text("Please select a file first.")),
                  //   );
                  //   return;
                  // }

                  try{
                    setState(() {
                      isLoading = true;
                    });
                    print("maketer id ::::::::: ${widget.marketerId}");
                    ApiData apiData = await F2FAddDocuments(
                      context: context,
                      fk_pt_id: patientId,
                      rptd_F2FDate: widget.ffDate,
                      fk_marketerId: widget.marketerId,
                      rptd_visitNote: widget.visitNote,
                      rptd_F2Fappointment: widget.postOpDate,
                    );

                    print(apiData.f2f_id);
                    if (apiData.statusCode == 200 || apiData.statusCode == 201) {
                      var F2FAdd = await uploadF2FDocumentsAdd(
                        context: context,
                        fk_f2f_id: apiData.f2f_id!,
                        f2f_doc_url: "--",
                        f2f_doc_name: fileName,
                        f2f_doc_content: DocNameController.text,
                      );

                      print(F2FAdd.f2f_doc_id);
                      if (F2FAdd.statusCode == 200 || F2FAdd.statusCode == 201) {
                        var uploadF2FDoc = await uploadF2FDocumentsBase64(
                          context: context,
                          f2f_doc_id: F2FAdd.f2f_doc_id!,
                          documentFile: _filePath,
                          documentName: fileName,
                        );

                        print(uploadF2FDoc.statusCode);
                        if (uploadF2FDoc.statusCode == 200 || uploadF2FDoc.statusCode == 201) {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AddSuccessPopup(
                                message: 'Document Uploaded Successfully',
                              );
                            },
                          );
                        }
                      }
                    }
                  }finally{
                    setState(() {
                      isLoading = false;
                    });
                  }

                  },
              ),
            ],
          ),
        ),
        title: widget.title);




  }
}

// HeaderContentConst(
//   isAsterisk: false,
//   heading: AppString.type_of_the_document,
//   content: Container(
//     width: 354,
//     padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//     decoration: BoxDecoration(
//       color: ColorManager.white,
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: ColorManager.fmediumgrey, width: 1),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "",
//           style: DocumentTypeDataStyle.customTextStyle(context),
//         ),
//         Icon(
//           Icons.arrow_drop_down,
//           color: Colors.black,
//         ),
//       ],
//     ),
//   ),
// ),
// SizedBox(height: 10,),
///
// HeaderContentConst(
//   isAsterisk: false,
//   heading: AppString.name_of_the_document,
//   content: Container(
//     width: 354,
//     padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//     decoration: BoxDecoration(
//       color: ColorManager.white,
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: ColorManager.fmediumgrey, width: 1),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           "",
//           style: DocumentTypeDataStyle.customTextStyle(context),
//         ),
//         Icon(
//           Icons.arrow_drop_down,
//           color: Colors.transparent,
//         ),
//       ],
//     ),
//   ),
// ),




class CustomAddButtonsm extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomAddButtonsm({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 35,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(
          text,
          style: TextStyle(
            fontSize: FontSize.s13,
            fontWeight: FontWeight.w600,
            color: ColorManager.white,
            decoration: TextDecoration.none,
          ),
        ),
        icon: const Icon(Icons.add),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.bluebottom,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}





class FileInfoCard extends StatelessWidget {
  final String fileName;
  final String uploadedInfo;
  final String documentName;
  final String content;
  final bool isContact;
  var fileUrl;
  // final VoidCallback onHistoryTap;
  // final VoidCallback onTelegramTap;
  final VoidCallback onPrintTap;
  final VoidCallback onDownloadTap;
  final VoidCallback onDeleteTap;

  FileInfoCard({
    Key? key,
    required this.fileName,
    required this.uploadedInfo,
    required this.isContact,
    required this.documentName,
    required this.content,
    // required this.onHistoryTap,
    // required this.onTelegramTap,
    required this.onPrintTap,
    required this.onDownloadTap,
    required this.onDeleteTap,
    required this.fileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = isContact ? IconSize.I18 : IconSize.I24;
    final horizontalPadding = isContact ? 0.0 : 35.0;
    // final contentText = isContact
    //     ? "Contents: Progress Notes,\nMedication Profile, Demographics"
    //     : "Contents: Progress Notes, Medication Profile, Demographics";
    return Consumer<SmIntakeProviderManager>(
        builder: (context,providerState,child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        color: ColorManager.blueprime,
                        height: AppSize.s45,
                        width: AppSize.s65,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("images/sm/eye_outline.png"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fileName,
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s12,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.mediumgrey,
                            ),
                          ),
                          const SizedBox(height: AppSize.s3),
                          Text(
                            uploadedInfo,
                            style: TextStyle(
                              fontSize: isContact ? FontSize.s12 : FontSize.s11,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: ColorManager.granitegray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Content: $content",
                    style: CustomTextStylesCommon.commonStyle(
                      fontSize: FontSize.s12,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.cream,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              providerState.isContactTrue? Offstage() : Expanded(child: Container()),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   child: IconButton(
                      //     splashColor: Colors.transparent,
                      //     highlightColor: Colors.transparent,
                      //     hoverColor: Colors.transparent,
                      //     icon: Icon(Icons.history, size: iconSize, color: ColorManager.granitegray),
                      //     onPressed: onHistoryTap,
                      //   ),
                      // ),
                      // Expanded(
                      //   child: InkWell(
                      //     splashColor: Colors.transparent,
                      //     highlightColor: Colors.transparent,
                      //     hoverColor: Colors.transparent,
                      //     child: Image.asset("images/sm/telegram.png", height: iconSize),
                      //     onTap: onTelegramTap,
                      //   ),
                      // ),
                      Expanded(
                        child:  IconButton(
                          onPressed: () {
                            downloadFile(fileUrl);
                          },
                          icon: Icon(
                            Icons.print_outlined,
                            size: iconSize,color: ColorManager.mediumgrey,
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                        ),

                        // IconButton(
                        //   splashColor: Colors.transparent,
                        //   highlightColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   icon: Icon(Icons.print_outlined, size: iconSize, color: ColorManager.granitegray),
                        //   onPressed: onPrintTap,
                        // ),
                      ),
                      Expanded(
                        child: PdfDownloadButton(apiUrl: fileUrl,
                          iconColor: ColorManager.mediumgrey,
                          iconsize: IconSize.I22,
                          documentName: documentName,//policiesdata.docName!
                        ),
                        // IconButton(
                        //   splashColor: Colors.transparent,
                        //   highlightColor: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   icon: Icon(Icons.file_download_outlined, size: iconSize, color: const Color(0xff686464)),
                        //   onPressed: onDownloadTap,
                        // ),
                      ),
                      Expanded(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: Icon(Icons.delete_outline, size: iconSize, color: const Color(0xff686464)),
                          onPressed: onDeleteTap,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  );
  }
}
