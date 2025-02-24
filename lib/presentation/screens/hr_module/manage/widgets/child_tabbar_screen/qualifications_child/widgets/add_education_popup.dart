import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/register/taxtfield_constant.dart';

class AddEducationPopup extends StatefulWidget {
  final TextEditingController collegeUniversityController;
  final TextEditingController phoneController;
  final TextEditingController calenderController;
  final TextEditingController cityController;
  final TextEditingController degreeController;
  final TextEditingController stateController;
  final TextEditingController majorSubjectController;
  final TextEditingController countryNameController;
  final VoidCallback onpressedClose;
   Future<void> Function() onpressedSave;
  final String title;
  final Widget? radioButton;

  AddEducationPopup({
    super.key,
    required this.collegeUniversityController,
    required this.phoneController,
    required this.calenderController,
    required this.cityController,
    required this.degreeController,
    required this.stateController,
    required this.majorSubjectController,
    required this.countryNameController,
    required this.onpressedClose,
    required this.onpressedSave,
    this.radioButton,
    required this.title,
  });

  @override
  State<AddEducationPopup> createState() => _AddEducationPopupState();
}

class _AddEducationPopupState extends State<AddEducationPopup> {
  final DateTime _selectedStartDate = DateTime.now();
  bool isLoading = false;
  bool _collegeUniversityError = false;
  bool _phoneError = false;
  bool _calendarError = false;
  bool _cityError = false;
  bool _degreeError = false;
  bool _stateError = false;
  bool _majorSubjectError = false;
  bool _countryNameError = false;
  bool _isRadioButtonSelected = false;
 // bool _radioButtonError = false;



  // Error states
  Map<String, bool> errorStates = {
    'College/University': false,
    'phonenumber': false,
    'StartDate': false,
    'City': false,
    'Degree': false,
    'State': false,
    'majorsubject': false,
    'country': false,
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 450,
        width: 932,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height:AppSize.s50,
              decoration: BoxDecoration(
                color: ColorManager.blueprime,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 51),
                    child: Text(
                      widget.title,
                      style: PopupHeadingStyle.customTextStyle(context)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _clearControllers();
                      },
                      icon: Icon(
                        Icons.close,
                        color: IconColorManager.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.collegeUniversityController,
                            labelText: "College/University",
                            errorKey:  'College/University',
                            hintText: 'Enter College/University',
                          ),
                        ),
                        SizedBox(width: AppSize.s20),
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.phoneController,
                            labelText: "Phone",
                            errorKey:  'phonenumber', hintText: 'Enter Phone Number',
                          ),
                        ),
                        SizedBox(width: AppSize.s20),
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect: false,
                            controller: widget.calenderController,
                            labelText: "Start Date",
                            errorKey: 'StartDate',
                            suffixIcon: Icon(Icons.calendar_month_outlined, color: ColorManager.blueprime),
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: _selectedStartDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101),
                              );
                              if (date != null) {
                                String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                                widget.calenderController.text = formattedDate;
                                setState(() {
                                  _calendarError = formattedDate.isEmpty;
                                });
                              }
                            }, hintText: 'yyyy-mm-dd',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Graduate', style: AllPopupHeadings.customTextStyle(context),),
                              widget.radioButton ?? SizedBox.shrink(),
                             // if (_radioButtonError)
                               // Text('Please select an option', style: TextStyle(color: Colors.red, fontSize: 10)),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.cityController,
                            labelText: AppString.city,
                            errorKey: 'City', hintText: 'Enter City',
                          ),
                        ),
                        SizedBox(width: AppSize.s20),
                        Expanded(
                          child: _buildTextField(
                            controller: widget.degreeController,
                            labelText: "Degree",
                            errorKey: 'Degree', capitalIsSelect: false, hintText: 'Enter Degree',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.stateController,
                            labelText: AppString.state,
                            errorKey:  'State', hintText: 'Enter State',
                          ),
                        ),
                        SizedBox(width: AppSize.s20),
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.majorSubjectController,
                            labelText: "Major Subject",
                            errorKey: 'majorsubject', hintText: 'Enter Major Subject',
                          ),
                        ),
                        SizedBox(width: AppSize.s20),
                        Expanded(
                          child: _buildTextField(
                            capitalIsSelect:false,
                            controller: widget.countryNameController,
                            labelText: "Country Name",
                            errorKey: 'country', hintText: 'Enter Country Name',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.s35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButtonTransparent(
                          text: AppString.cancel,
                          onPressed: widget.onpressedClose,
                        ),
                        SizedBox(width: AppSize.s10),
                        isLoading
                            ? SizedBox(
                          height: AppSize.s25,
                          width: AppSize.s25,
                          child: CircularProgressIndicator(
                            color: ColorManager.blueprime,
                          ),
                        )
                            : CustomElevatedButton(
                          width: AppSize.s100,
                          text: AppString.save,
                          onPressed: _handleSave,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String errorKey,
    String? errorText,
    Widget? suffixIcon,
    required bool capitalIsSelect,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText, // Main text
            style: AllPopupHeadings.customTextStyle(context), // Main style
            children: [
              TextSpan(
                text: ' *', // Asterisk
                style: AllPopupHeadings.customTextStyle(context).copyWith(
                  color: ColorManager.red, // Asterisk color
                ),
              ),
            ],
          ),
        ),
        //Text(labelText,style: AllPopupHeadings.customTextStyle(context),),
        SizedBox(height: 4,),
        CustomTextFieldRegister(
          isDigitSelect: capitalIsSelect,
          phoneNumberField: labelText == "Phone", // Specify if this is the phone field
          height: AppSize.s30,
          controller: controller,
          hintText:hintText ,
          keyboardType: labelText == "Phone" ? TextInputType.phone : TextInputType.text,
          padding: EdgeInsets.only(bottom: AppPadding.p1, left: 2),
          suffixIcon: suffixIcon,
          onTap: onTap,
          onChanged: (value) {
            setState(() {
              if (value == null) {
                errorStates[errorKey] = value.isEmpty;
              } else {
                errorStates[errorKey] = value.isEmpty;
              }
              if (errorKey == 'phonenumber') {
                // Validate phone number fields
                String numericValue = value.replaceAll(RegExp(r'^\(\d{4}\) \d{3}-\d{4}$'), '');
                errorStates[errorKey] = numericValue.length != 14;
              }
            });
          },
          validator: (value) {

            if (errorKey == 'Phone') {
              String numericValue = value!.replaceAll(RegExp(r'^\(\d{4}\) \d{3}-\d{4}$'), '');
              if (numericValue.length != 14) {
                return 'Please enter a valid number';
              }
            }
            return null;
          },
          // onChanged: (value) {
          //   setState(() {
          //     // Update error state based on the field
          //     if (labelText == "College/University") _collegeUniversityError = value.isEmpty;
          //     if (labelText == "City") _cityError = value.isEmpty;
          //     if (labelText == "Phone") _phoneError = !_isPhoneValid(value); // Use custom phone validation
          //     if (labelText == "State") _stateError = value.isEmpty;
          //     if (labelText == "Major Subject") _majorSubjectError = value.isEmpty;
          //     if (labelText == "Country Name") _countryNameError = value.isEmpty;
          //     if (labelText == "Degree") _degreeError = value.isEmpty;
          //   });
          // },
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return AppString.enterText;
          //   }
          //   return null;
          // },
        ),
        errorStates[errorKey]! ?
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            // errorKey == 'mobileNumber'
            //     ? 'Please Enter a valid mobile number'
            //     :

            'Please Enter $labelText',
            style: TextStyle(
              color: ColorManager.red,
              fontSize: FontSize.s10,
            ),
          ),
        ): SizedBox(height: 13,)
      ],
    );
  }

  // Method to validate phone number with the USA phone mask
  bool _isPhoneValid(String phoneNumber) {
    // Define the regex pattern for (###) ###-####
    final RegExp phoneRegex = RegExp(r'^\(\d{3}\) \d{3}-\d{4}$');
    return phoneRegex.hasMatch(phoneNumber); // Checks if the phone number matches the pattern
  }

  void _handleSave() async {
    setState(() {
      errorStates['College/University']  = widget.collegeUniversityController.text.isEmpty;
      errorStates['phonenumber']  = !_isPhoneValid(widget.phoneController.text); // Update phone validation logic
      errorStates['StartDate']  = widget.calenderController.text.isEmpty;
      errorStates['City']  = widget.cityController.text.isEmpty;
      errorStates['Degree']  = widget.degreeController.text.isEmpty;
      errorStates['State']  = widget.stateController.text.isEmpty;
      errorStates['majorsubject']  = widget.majorSubjectController.text.isEmpty;
      errorStates['country']  = widget.countryNameController.text.isEmpty;
     // _radioButtonError = !_isRadioButtonSelected;
    });

    if (!errorStates.values.contains(true)) {
      try {
        setState(() {
          isLoading = true;
        });
        await widget.onpressedSave();
      } finally {
        setState(() {
          isLoading = false;
        });
        _clearControllers();
      }
    }

    // if (!_collegeUniversityError &&
    //     !_phoneError && // Make sure phone error is included
    //     !_calendarError &&
    //     !_cityError &&
    //     !_stateError &&
    //     !_majorSubjectError &&
    //     !_countryNameError
    //    // !_radioButtonError
    // ) {
    //   try {
    //     print("<<<<<<<<<<,,Start");
    //     await widget.onpressedSave();
    //   } finally {
    //     setState(() {
    //       isLoading = false;
    //     });
    //     _clearControllers();
    //   }
    // } else {
    //   setState(() {
    //     isLoading = false;
    //   });
    // }
  }


  void _clearControllers() {
    widget.countryNameController.clear();
    widget.degreeController.clear();
    widget.majorSubjectController.clear();
    widget.stateController.clear();
    widget.cityController.clear();
    widget.phoneController.clear();
    widget.collegeUniversityController.clear();
    widget.calenderController.clear();
  }
}
