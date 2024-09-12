import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/theme_manager.dart';

import '../../../../../../../../../app/resources/color.dart';
import '../../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../widgets/button_constant.dart';
import '../../../../../../widgets/text_form_field_const.dart';

///Add new popup
class AddNewOrgDocButton extends StatefulWidget {
  final TextEditingController idDocController;
  final TextEditingController nameDocController;
  final TextEditingController calenderController;
  final VoidCallback onPressed;
  final double? height;
  Widget? child;
  Widget? child1;
  final String title;
  final Widget? radioButton;
  final Visibility? child2;
  final Visibility? child3;
  final bool? loadingDuration;
  final String? selectedSubDocType;
  AddNewOrgDocButton(
      {super.key,
        required this.idDocController,
        required this.nameDocController,
        this.child,
        this.child1,
        required this.onPressed,
        required this.calenderController,
        this.radioButton,
        this.loadingDuration,
        required this.title,
        this.child2,
        this.child3,
        this.height, this.selectedSubDocType});

  @override
  State<AddNewOrgDocButton> createState() => _AddOrgDocButtonState();
}

class _AddOrgDocButtonState extends State<AddNewOrgDocButton> {
  bool _isFormValid = true;

  // Error messages for each text field
  String? _idDocError;
  String? _nameDocError;

  String? _validateTextField(String value, String fieldName) {
    if (value.isEmpty) {
      _isFormValid = false;
      return "Please Enter $fieldName";
    }
    // if (value.isEmpty) {
    //   _isFormValid = false;
    //   return "$fieldName must start with a capital letter";
    // }
    return null;
  }

  void _validateForm() {
    setState(() {
      _isFormValid = true;
      _idDocError = _validateTextField(widget.idDocController.text, 'ID of the Document');
      _nameDocError = _validateTextField(widget.nameDocController.text, 'Name of the Document');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s420,
        height: widget.height ?? AppSize.s560,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: AppSize.s40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ColorManager.bluebottom,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s13,
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p3,
                horizontal: AppPadding.p20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// ID of the Document
                  SMTextFConst(
                    controller: widget.idDocController,
                    keyboardType: TextInputType.text,
                    text: AppString.id_of_the_document,
                  ),
                  if (_idDocError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        _idDocError!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ),
                  SizedBox(height: AppSize.s13),

                  /// Name of the Document
                  FirstSMTextFConst(
                    controller: widget.nameDocController,
                    keyboardType: TextInputType.text,
                    text: AppString.name_of_the_document,
                  ),
                  if (_nameDocError != null) // Display error if any
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        _nameDocError!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ),
                  SizedBox(height: AppSize.s13),

                  /// Type of the Document
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.type_of_the_document,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.mediumgrey,
                        ),
                      ),
                      SizedBox(height: AppSize.s5),
                      widget.child ?? Offstage(),
                    ],
                  ),
                  SizedBox(height: AppSize.s13),

                  /// Sub Type of the Document
                  if (widget.child1 != null) ...[
                    Text(
                      AppString.sub_type_of_the_document,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.mediumgrey,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: AppSize.s5),
                  ],
                  widget.child1 ?? Offstage(),
                ],
              ),
            ),
            SizedBox(height: AppSize.s10),

            /// Radio Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
              child: Row(
                children: [
                  widget.radioButton!,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p20,
                      right: AppPadding.p20,
                    ),
                    child: widget.child3,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.s10),
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              child: widget.child2,
            ),

            ///button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
              child: Center(
                child: widget.loadingDuration == true
                    ? SizedBox(
                  height: AppSize.s25,
                  width: AppSize.s25,
                  child: CircularProgressIndicator(
                    color: ColorManager.blueprime,
                  ),
                )
                    : CustomElevatedButton(
                  width: AppSize.s105,
                  height: AppSize.s30,
                  text: AppStringEM.add,
                  onPressed: () {
                    _validateForm(); // Validate the form on button press
                    if (_isFormValid) {
                      widget.onPressed();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


///edit popup
class CCScreenEditNewPopup extends StatefulWidget {
  final String? idOfDoc;
  final TextEditingController idOfDocController;
  final TextEditingController nameDocController;
  final TextEditingController? calenderController;
  final VoidCallback? onSavePressed;
  final Widget child;
  final Widget? child1;
  final Widget? child2;
  final Widget? child3;
  final double? height;
  final Widget? radioButton;
  bool? loadingDuration;
  final String title;

  CCScreenEditNewPopup({
    super.key,
    required this.idOfDocController,
    required this.nameDocController,
    this.onSavePressed,
    required this.child,
    this.child1,
    this.child2,
    this.child3,
    this.idOfDoc,
    this.radioButton,
    this.calenderController,
    this.loadingDuration,
    required this.title,
    this.height,
  });

  @override
  State<CCScreenEditNewPopup> createState() => _CCScreenEditPopupState();
}

class _CCScreenEditPopupState extends State<CCScreenEditNewPopup> {
  String? _expiryType;
  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s420,
        height: widget.height == null ? AppSize.s550 : widget.height,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorManager.bluebottom,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              height: AppSize.s35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s13,
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p18,
                horizontal: AppPadding.p18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SMTextFConst(
                    enable: false,
                    // readOnly: true,
                    controller: widget.idOfDocController,
                    keyboardType: TextInputType.text,
                    text: AppString.id_of_the_document,
                  ),
                  SizedBox(height: AppSize.s12),
                  SMTextFConst(
                    controller: widget.nameDocController,
                    keyboardType: TextInputType.text,
                    text: AppString.name_of_the_document,
                  ),
                  SizedBox(height: AppSize.s12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.type_of_the_document,
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeightManager.bold,
                          color: ColorManager.mediumgrey,
                          //decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: AppSize.s5),
                      widget.child!,
                    ],
                  ),
                  SizedBox(height: AppSize.s10),
                  if (widget.child1 != null) ...[
                    Text(
                      AppString.sub_type_of_the_document,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.mediumgrey,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: AppSize.s5),
                  ],
                  widget.child1 ?? Offstage(),
                ],
              ),
            ),
            SizedBox(height: AppSize.s5),
            ///radio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
              child: Row(
                children: [
                  widget.radioButton!,
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p20,
                      right: AppPadding.p20,
                    ),
                    child: widget.child3,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.s10),

            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p20,
                right: AppPadding.p20,
              ),
              child: widget.child2,
            ),
            SizedBox(height: AppSize.s20),

            ///button
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p10),
              child: Center(
                child: widget.loadingDuration == true
                    ? SizedBox(
                  height: AppSize.s25,
                  width: AppSize.s25,
                  child: CircularProgressIndicator(
                    color: ColorManager.blueprime,
                  ),
                )
                    : CustomElevatedButton(
                  width: AppSize.s105,
                  height: AppSize.s30,
                  text: AppStringEM.save, //submit
                  onPressed: () {
                    widget.onSavePressed!();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}