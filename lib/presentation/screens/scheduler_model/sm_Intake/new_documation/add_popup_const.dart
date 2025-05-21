import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../em_module/widgets/dialogue_template.dart';
import '../../../em_module/widgets/header_content_const.dart';

class AddPopupConstant extends StatefulWidget {
  final String title;
   AddPopupConstant({super.key, required this.title});

  @override
  State<AddPopupConstant> createState() => _AddPopupConstantState();
}

class _AddPopupConstantState extends State<AddPopupConstant> {

  String fileName = '';
  dynamic _filePath;
  bool _fileAbove20Mb = false;

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


  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        height: 450,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff1696C8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child:  Text(
                      widget.title,
                      style:PopupBlueBarText.customTextStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.type_of_the_document,
                    content: Container(
                      width: 354,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: DocumentTypeDataStyle.customTextStyle(context),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ///
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.name_of_the_document,
                    content: Container(
                      width: 354,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: DocumentTypeDataStyle.customTextStyle(context),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  /// upload  doc
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.upload_document,
                    content: InkWell(
                      onTap:()async{
                        pickAckFile();
                      },
                      child: Container(
                        height: AppSize.s30,
                        width: AppSize.s354,
                        padding: EdgeInsets.only(left: AppPadding.p10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.containerBorderGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
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
                                    onPressed: ()async{
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

                ],
              ),
            ),

Spacer(),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomElevatedButton(
        width: AppSize.s105,
        height: AppSize.s30,
        text: AppStringEM.submit,
        onPressed: () {},
      ),
    ],
  ),
)



          ],
        ),
      ),

    );




  }
}






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
  final bool isContact;
  final VoidCallback onHistoryTap;
  final VoidCallback onTelegramTap;
  final VoidCallback onPrintTap;
  final VoidCallback onDownloadTap;
  final VoidCallback onDeleteTap;

  const FileInfoCard({
    Key? key,
    required this.fileName,
    required this.uploadedInfo,
    required this.isContact,
    required this.onHistoryTap,
    required this.onTelegramTap,
    required this.onPrintTap,
    required this.onDownloadTap,
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = isContact ? IconSize.I18 : IconSize.I24;
    final horizontalPadding = isContact ? 0.0 : 35.0;
    final contentText = isContact
        ? "Contents: Progress Notes,\nMedication Profile, Demographics"
        : "Contents: Progress Notes, Medication Profile, Demographics";

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
                Row(
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
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      contentText,
                      style: CustomTextStylesCommon.commonStyle(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.cream,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: Icon(Icons.history, size: iconSize, color: ColorManager.granitegray),
                          onPressed: onHistoryTap,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          child: Image.asset("images/sm/telegram.png", height: iconSize),
                          onTap: onTelegramTap,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: Icon(Icons.print_outlined, size: iconSize, color: ColorManager.granitegray),
                          onPressed: onPrintTap,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: Icon(Icons.file_download_outlined, size: iconSize, color: const Color(0xff686464)),
                          onPressed: onDownloadTap,
                        ),
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
}
