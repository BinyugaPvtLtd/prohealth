import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/register/taxtfield_constant.dart';

class AddEmployeementPopup extends StatefulWidget {
  final TextEditingController positionTitleController;
  final TextEditingController leavingResonController;
  final TextEditingController startDateContoller;
  final TextEditingController endDateController;
  final TextEditingController lastSupervisorNameController;
  final TextEditingController supervisorMobileNumber;
  final TextEditingController cityNameController;
  final TextEditingController employeerController;
  final TextEditingController emergencyMobileNumber;
  final TextEditingController countryController;
  final String tite;
  final VoidCallback onpressedClose;
  final Future<void> Function() onpressedSave;
  final Widget checkBoxTile;

  AddEmployeementPopup({
    super.key,
    required this.positionTitleController,
    required this.leavingResonController,
    required this.startDateContoller,
    required this.endDateController,
    required this.lastSupervisorNameController,
    required this.supervisorMobileNumber,
    required this.cityNameController,
    required this.employeerController,
    required this.emergencyMobileNumber,
    required this.onpressedSave,
    required this.checkBoxTile,
    required this.tite,
    required this.onpressedClose,
    required this.countryController,
  });

  @override
  State<AddEmployeementPopup> createState() => _AddEmployeementPopupState();
}

class _AddEmployeementPopupState extends State<AddEmployeementPopup> {
  DateTime _selectedStartDate = DateTime.now();
  DateTime _selectedEndDate = DateTime.now();
  bool isLoading = false;

  // Error states
  Map<String, bool> errorStates = {
    'positionTitle': false,
    'leavingReason': false,
    'startDate': false,
    'endDate': false,
    'lastSupervisorName': false,
    'supervisorMobileNumber': false,
    'cityName': false,
    'employer': false,
    'emergencyMobileNumber': false,
    'countryname': false,
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.6,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              height: AppSize.s34,
              decoration: BoxDecoration(
                color: ColorManager.blueprime,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45.0),
                    child: Text(
                      widget.tite,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _clearControllers();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(
                  controller: widget.positionTitleController,
                  labelText: "Final Position Title",
                  errorKey: 'positionTitle',
                ),
                _buildTextField(
                  controller: widget.leavingResonController,
                  labelText: "Reason For Leaving",
                  errorKey: 'leavingReason',
                ),
                _buildTextField(
                  controller: widget.startDateContoller,
                  labelText: "Start Date",
                  errorKey: 'startDate',
                  suffixIcon: Icon(Icons.calendar_month_outlined, color: ColorManager.blueprime),
                  onTap: () => _selectDate(widget.startDateContoller, _selectedStartDate),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(
                  controller: widget.endDateController,
                  labelText: "End Date",
                  errorKey: 'endDate',
                  suffixIcon: Icon(Icons.calendar_month_outlined, color: ColorManager.blueprime),
                  onTap: () => _selectDate(widget.endDateController, _selectedEndDate),
                ),
                _buildTextField(
                  controller: widget.lastSupervisorNameController,
                  labelText: "Last Supervisor's Name",
                  errorKey: 'lastSupervisorName',
                ),
                _buildTextField(
                  controller: widget.supervisorMobileNumber,
                  labelText: "Supervisor's Mobile Number",
                  errorKey: 'supervisorMobileNumber',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.checkBoxTile,
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(
                  controller: widget.cityNameController,
                  labelText: AppString.city,
                  errorKey: 'cityName',
                ),
                _buildTextField(
                  controller: widget.employeerController,
                  labelText: "Employer",
                  errorKey: 'employer',
                ),
                _buildTextField(
                  controller: widget.emergencyMobileNumber,
                  labelText: "Emergency Mobile Number",
                  errorKey: 'emergencyMobileNumber',
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextField(
                  controller: widget.countryController,
                  labelText: "Country Name",
                  errorKey: 'countryname',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonTransparent(
                    text: AppString.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                      _clearControllers();
                    },
                  ),
                  SizedBox(width: AppSize.s10),
                  isLoading
                      ? SizedBox(
                    height: AppSize.s25,
                    width: AppSize.s25,
                    child: CircularProgressIndicator(color: ColorManager.blueprime),
                  )
                      : CustomElevatedButton(
                    width: AppSize.s100,
                    text: AppString.save,
                    onPressed: _handleSave,
                  ),
                ],
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
    required String errorKey,
    Widget? suffixIcon,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFieldRegister(
          phoneNumberField: errorKey == 'supervisorMobileNumber' || errorKey == 'emergencyMobileNumber' ? true : false,
          height: AppSize.s30,
          width: MediaQuery.of(context).size.width / 6,
          controller: controller,
          labelText: labelText,
          keyboardType: TextInputType.text, // Ensure the keyboard type is text except for phone fields
          padding: const EdgeInsets.only(bottom: AppPadding.p5, left: AppPadding.p20),
          suffixIcon: suffixIcon,
          onTap: onTap,
          onChanged: (value) {
            setState(() {
              // General validation for empty fields
              errorStates[errorKey] = value.isEmpty;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            }
            return null;
          },
        ),
        if (errorStates[errorKey] == true)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Please fill this field',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }

  void _handleSave() {
    setState(() {
      isLoading = true;
    });

    bool hasError = false;
    errorStates.forEach((key, value) {
      if (key != 'supervisorMobileNumber' && key != 'emergencyMobileNumber') {
        errorStates[key] = controllerByErrorKey(key).text.isEmpty;
        if (errorStates[key] == true) {
          hasError = true;
        }
      }
    });

    if (hasError) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    widget.onpressedSave();
  }

  TextEditingController controllerByErrorKey(String errorKey) {
    switch (errorKey) {
      case 'positionTitle':
        return widget.positionTitleController;
      case 'leavingReason':
        return widget.leavingResonController;
      case 'startDate':
        return widget.startDateContoller;
      case 'endDate':
        return widget.endDateController;
      case 'lastSupervisorName':
        return widget.lastSupervisorNameController;
      case 'supervisorMobileNumber':
        return widget.supervisorMobileNumber;
      case 'cityName':
        return widget.cityNameController;
      case 'employer':
        return widget.employeerController;
      case 'emergencyMobileNumber':
        return widget.emergencyMobileNumber;
      case 'countryname':
        return widget.countryController;
      default:
        return TextEditingController();
    }
  }

  void _clearControllers() {
    widget.positionTitleController.clear();
    widget.leavingResonController.clear();
    widget.startDateContoller.clear();
    widget.endDateController.clear();
    widget.lastSupervisorNameController.clear();
    widget.supervisorMobileNumber.clear();
    widget.cityNameController.clear();
    widget.employeerController.clear();
    widget.emergencyMobileNumber.clear();
    widget.countryController.clear();
  }

  Future<void> _selectDate(TextEditingController controller, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }
}
