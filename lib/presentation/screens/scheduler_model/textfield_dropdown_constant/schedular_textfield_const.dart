import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/establishment_resources/establish_theme_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import 'package:provider/provider.dart';

import '../../../../app/resources/color.dart';
import '../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';


class SchedularTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  //final TextInputType keyboardType;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;
  final double? width;
  final ValueChanged<String>? onChanged;
  bool? phoneField;
  final FocusNode? focusNode;
  final bool? enable;
  final bool showDatePicker;
  final Icon? icon;
  final Widget? prefixWidget;
  final VoidCallback? onChange;
  final bool? isIconVisible;
  final double? borderRadius;
  final bool? onlyAllowNumbers;
  final VoidCallback? isIClicked;
  final bool? isPasswordField;

   SchedularTextField({
    Key? key,
     this.isIClicked,
     this.textStyle,
     this.isIconVisible = false,
    this.phoneField = false,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.suffixIcon, this.validator, this.width,
    this.onChanged,
     this.focusNode,
     //required this.keyboardType,
     this.icon,
     this.onChange,
     this.enable,
     this.prefixWidget,
     this.showDatePicker = false, this.hintText,this.borderRadius,
     this.onlyAllowNumbers = false,
     this.isPasswordField = false,
  }) : super(key: key);

  @override
  _SchedularTextFieldState createState() => _SchedularTextFieldState();
}

class _SchedularTextFieldState extends State<SchedularTextField> {
  late TextEditingController _controller;
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    // _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _obscureText = widget.isPasswordField ?? false;
    // If onChanged is provided, listen to controller changes
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text); // Trigger the onChanged callback
      }
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2031),
    );
    if (pickedDate != null) {
      widget.controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<SmIntakeProviderManager>(
        builder: (context,providerState,child) {
          return Padding(
            padding:  const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widget.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(widget.labelText,
                            style:SMTextfieldHeadings.customTextStyle(context),
                            //providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) : SMTextfieldHeadings.customTextStyle(context)
                          //AllPopupHeadings.customTextStyle(context)
                        ),
                      ),
                      widget.isIconVisible!? SizedBox(height:7) :
                      InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: widget.isIClicked,
                        child: SvgPicture.asset(
                          'images/sm/sm_refferal/i_circle.svg',
                          height: IconSize.I20,
                          width: IconSize.I20,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap:widget.showDatePicker ? ()=> _selectDate(context):null,
                  child: AbsorbPointer(
                    absorbing: widget.showDatePicker,
                    child: Container(
                    width: widget.width,
                    height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB1B1B1), width: 1),
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                      ),
                    child: TextFormField(
                      focusNode: widget.focusNode,
                      autofocus: false,
                      enabled: widget.enable == null ? true : false,
                      controller: widget.controller,
                      obscureText: _obscureText,
                     onChanged: widget.onChanged,
                     // keyboardType: widget.keyboardType,
                      cursorHeight: 17,
                      cursorColor: Colors.black,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: widget.showDatePicker
                            ? GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Icon(Icons.calendar_month_outlined,color: ColorManager.blueprime,size: IconSize.I22,),
                        )
                            : widget.isPasswordField == true
                            ? GestureDetector(
                          child: Icon(
                            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: ColorManager.blueprime,
                            size: IconSize.I20,
                          ),
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                            : widget.icon,
                        prefix: widget.prefixWidget,
                        prefixIcon: widget.suffixIcon,
                        hintText: widget.hintText,
                        prefixStyle: DropdownItemStyle.customTextStyle(context),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom:AppPadding.p20, left: AppPadding.p10),
                      ),
                      style: widget.textStyle ?? DropdownItemStyle.customTextStyle(context),
                      //validator: widget.validator,
                      onTap: widget.onChange,
                      validator: widget.validator,
                      inputFormatters: widget.phoneField!
                          ? [PhoneNumberInputFormatter() ]
                          : widget.onlyAllowNumbers!
                          ? [FilteringTextInputFormatter.digitsOnly]
                         : [],
                      // onTap: widget.onChange,
                    ),
                        ),
                  ),
                ),
              ],
            ),
          );
        }
      );
  }
}






class SchedularTextFieldcheckbox extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  //final TextInputType keyboardType;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;
  final double? width;
  final ValueChanged<String>? onChanged;
  bool? phoneField;
  final FocusNode? focusNode;
  final bool? enable;
  final bool showDatePicker;
  final Icon? icon;
  final Widget? prefixWidget;
  final VoidCallback? onChange;
  // ✅ New checkbox-related props
  final bool initialCheckboxValue;
  final ValueChanged<bool?>? onCheckboxChanged;


  SchedularTextFieldcheckbox({
    Key? key,
    this.phoneField = false,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.suffixIcon, this.validator, this.width,
    this.onChanged,
    this.focusNode,
    //required this.keyboardType,
    this.icon,
    this.onChange,
    this.enable,
    this.prefixWidget,
    this.showDatePicker = false, this.hintText,
    ///
    this.initialCheckboxValue = false,
    this.onCheckboxChanged,
  }) : super(key: key);

  @override
  _SchedularTextFieldcheckboxState createState() => _SchedularTextFieldcheckboxState();
}

class _SchedularTextFieldcheckboxState extends State<SchedularTextFieldcheckbox> {
  late TextEditingController _controller;
  bool? _checkboxValue;

  @override
  void initState() {
    super.initState();
    // _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _checkboxValue = widget.initialCheckboxValue;

    // If onChanged is provided, listen to controller changes
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text); // Trigger the onChanged callback
      }
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2031),
    );
    if (pickedDate != null) {
      widget.controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Consumer<SmIntakeProviderManager>(
        builder: (context,providerState,child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    splashRadius: 0,
                    value: _checkboxValue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _checkboxValue = newValue;
                      });
                      if (widget.onCheckboxChanged != null) {
                        widget.onCheckboxChanged!(newValue);
                      }
                    },
                  ),
                  SizedBox(width: 2,),
                  Flexible(
                    child: Text(
                        widget.labelText,
                        style: providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) : SMTextfieldHeadings.customTextStyle(context)
                      //AllPopupHeadings.customTextStyle(context)
                    ),
                  ),
                 // Icon(Icons.info_outline_rounded,color: Color(0xFF50B5E5),)
                ],
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap:widget.showDatePicker ? ()=> _selectDate(context):null,
                  child: AbsorbPointer(
                    absorbing: widget.showDatePicker,
                    child: Container(
                      width: widget.width,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB1B1B1), width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        focusNode: widget.focusNode,
                        autofocus: true,
                        enabled: widget.enable ?? false,
                        //enabled:  widget.enable == null ? true : false,
                        controller: widget.controller,
                        // keyboardType: widget.keyboardType,
                        cursorHeight: 17,
                        cursorColor: Colors.black,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          suffixIcon: widget.showDatePicker
                              ? GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Icon(Icons.calendar_month_outlined,color: ColorManager.blueprime,size: IconSize.I22,),
                          )
                              : widget.icon,
                          prefix: widget.prefixWidget,
                          prefixIcon: widget.suffixIcon,
                          hintText: widget.hintText,
                          prefixStyle: AllHRTableData.customTextStyle(context),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom:20, left: AppPadding.p15),
                        ),
                        style: TableSubHeading.customTextStyle(context),
                        //validator: widget.validator,
                        onTap: widget.onChange,
                        validator: widget.validator,
                        inputFormatters: widget.phoneField! ? [
                          PhoneNumberInputFormatter()
                        ]: [],
                        // onTap: widget.onChange,
                      ),
                      // TextFormField(
                      //   textCapitalization: TextCapitalization.sentences,
                      //   controller: _controller,
                      //   cursorHeight: 17,
                      //   style: DocumentTypeDataStyle.customTextStyle(context),
                      //   cursorColor: ColorManager.black,
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p15),
                      //     labelText: widget.labelText,
                      //     labelStyle:  DocumentTypeDataStyle.customTextStyle(context),
                      //     border: const OutlineInputBorder(),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: ColorManager.containerBorderGrey),
                      //     ),
                      //     suffixIcon: widget.suffixIcon != null
                      //         ? GestureDetector(
                      //       onTap: () async {
                      //         // Open the date picker when the calendar icon is tapped
                      //         DateTime? pickedDate = await showDatePicker(
                      //           context: context,
                      //           initialDate: DateTime.now(),
                      //           firstDate: DateTime(1900),
                      //           lastDate: DateTime(2101),
                      //         );
                      //
                      //         if (pickedDate != null) {
                      //           // Format the date and set it into the text field
                      //           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      //           _controller.text = formattedDate;
                      //         }
                      //       },
                      //       child: widget.suffixIcon,
                      //     )
                      //         : null,
                      //     // Do not show any icon if suffixIcon is null
                      // ),
                      //   validator: widget.validator,
                      //   inputFormatters: widget.phoneField! ? [
                      //     PhoneNumberInputFormatter()
                      //   ]: [],
                      // )
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      );
  }
}




class SchedularTextFieldno extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  //final TextInputType keyboardType;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;
  final double? width;
  final ValueChanged<String>? onChanged;
  bool? phoneField;
  final FocusNode? focusNode;
  final bool? enable;
  final bool showDatePicker;
  final Icon? icon;
  final Widget? prefixWidget;
  final VoidCallback? onChange;


  SchedularTextFieldno({
    Key? key,
    this.phoneField = false,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.suffixIcon, this.validator, this.width,
    this.onChanged,
    this.focusNode,
    //required this.keyboardType,
    this.icon,
    this.onChange,
    this.enable,
    this.prefixWidget,
    this.showDatePicker = false, this.hintText,
  }) : super(key: key);

  @override
  _SchedularTextFieldnoState createState() => _SchedularTextFieldnoState();
}

class _SchedularTextFieldnoState extends State<SchedularTextFieldno> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);

    // If onChanged is provided, listen to controller changes
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text); // Trigger the onChanged callback
      }
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2031),
    );
    if (pickedDate != null) {
      widget.controller!.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:  const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    widget.labelText,
                    style: SMTextfieldHeadings.customTextStyle(context)
                  //AllPopupHeadings.customTextStyle(context)
                ),
                // Icon(Icons.info_outline_rounded,color: Color(0xFF50B5E5),)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap:widget.showDatePicker ? ()=> _selectDate(context):null,
              child: AbsorbPointer(
                absorbing: widget.showDatePicker,
                child: Container(
                  width: widget.width,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFB1B1B1), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    focusNode: widget.focusNode,
                    autofocus: true,
                    enabled: widget.enable == null ? true : false,
                    controller: widget.controller,
                    // keyboardType: widget.keyboardType,
                    cursorHeight: 17,
                    cursorColor: Colors.black,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      suffixIcon: widget.showDatePicker
                          ? GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Icon(Icons.calendar_month_outlined,color: ColorManager.blueprime,size: 18,),
                      )
                          : widget.icon,
                      prefix: widget.prefixWidget,
                      prefixIcon: widget.suffixIcon,
                      hintText: widget.hintText,
                      prefixStyle: AllHRTableData.customTextStyle(context),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom:20, left: AppPadding.p15),
                    ),
                    style: TableSubHeading.customTextStyle(context),
                    //validator: widget.validator,
                    onTap: widget.onChange,
                    validator: widget.validator,
                    inputFormatters: widget.phoneField! ? [
                      PhoneNumberInputFormatter()
                    ]: [],
                    // onTap: widget.onChange,
                  ),
                  // TextFormField(
                  //   textCapitalization: TextCapitalization.sentences,
                  //   controller: _controller,
                  //   cursorHeight: 17,
                  //   style: DocumentTypeDataStyle.customTextStyle(context),
                  //   cursorColor: ColorManager.black,
                  //   decoration: InputDecoration(
                  //     contentPadding: EdgeInsets.only(bottom:18, left: AppPadding.p15),
                  //     labelText: widget.labelText,
                  //     labelStyle:  DocumentTypeDataStyle.customTextStyle(context),
                  //     border: const OutlineInputBorder(),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: ColorManager.containerBorderGrey),
                  //     ),
                  //     suffixIcon: widget.suffixIcon != null
                  //         ? GestureDetector(
                  //       onTap: () async {
                  //         // Open the date picker when the calendar icon is tapped
                  //         DateTime? pickedDate = await showDatePicker(
                  //           context: context,
                  //           initialDate: DateTime.now(),
                  //           firstDate: DateTime(1900),
                  //           lastDate: DateTime(2101),
                  //         );
                  //
                  //         if (pickedDate != null) {
                  //           // Format the date and set it into the text field
                  //           String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  //           _controller.text = formattedDate;
                  //         }
                  //       },
                  //       child: widget.suffixIcon,
                  //     )
                  //         : null,
                  //     // Do not show any icon if suffixIcon is null
                  // ),
                  //   validator: widget.validator,
                  //   inputFormatters: widget.phoneField! ? [
                  //     PhoneNumberInputFormatter()
                  //   ]: [],
                  // )
                ),
              ),
            ),
          ],
        ),
      );
  }
}
