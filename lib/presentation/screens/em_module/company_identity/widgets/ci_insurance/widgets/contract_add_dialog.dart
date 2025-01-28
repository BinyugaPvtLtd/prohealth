import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
import '../../../../../../../app/constants/app_config.dart';
import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../app/resources/const_string.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/services/api/managers/establishment_manager/manage_insurance_manager/insurance_vendor_contract_manager.dart';
import '../../../../../../widgets/error_popups/failed_popup.dart';
import '../../../../../../widgets/error_popups/four_not_four_popup.dart';
import '../../../../manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../widgets/dialogue_template.dart';
import '../../../../widgets/header_content_const.dart';
import '../../whitelabelling/success_popup.dart';

class ContractAddDialog extends StatefulWidget {
  final String title;
  final int selectedVendorId;
  final String officeid;

  ContractAddDialog({
    Key? key,
    required this.title,
    required this.selectedVendorId,
    required this.officeid,
  }) : super(key: key);

  @override
  State<ContractAddDialog> createState() => _ContractAddDialogState();
}

class _ContractAddDialogState extends State<ContractAddDialog> {
  TextEditingController birthdayController = TextEditingController();

  TextEditingController contractNmaeController = TextEditingController();
  TextEditingController contractIdController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController daysController = TextEditingController(text: "1");

  bool loading = false;
  bool _isFormValid = true;
  String selectedExpiryType = AppConfig.scheduled;

  // Error messages for each text field
  String? _idDocError;
  String? _nameDocError;
  String? _expiryDateError;
  String? selectedYear = AppConfig.year;
  bool showExpiryDateField = false;

  String? _validateTextField(String value, String fieldName) {
    if (value.isEmpty) {
      _isFormValid = false;
      return "Please Enter $fieldName";
    }
    return null;
  }

  DateTime? datePicked;
  void _validateForm() {
    setState(() {
      _isFormValid = true;
      _idDocError = _validateTextField(contractIdController.text, 'ID of the Contract');
      _nameDocError = _validateTextField(contractNmaeController.text, 'Name of the Contract');
      if (selectedExpiryType == AppConfig.issuer && expiryDateController.text.isEmpty) {
        _expiryDateError = 'Please select an expiry date';
        _isFormValid = false;
      } else {
        _expiryDateError = null; // Clear error if the date is selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DialogueTemplate(
      width: AppSize.s420,
      height: selectedExpiryType == AppConfig.issuer ? AppSize.s511 : AppSize.s440,
      body: [
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SMTextfieldAsteric(
               controller: contractNmaeController,
               keyboardType: TextInputType.text,
               text: AppStringEM.contractName,
               onChanged: (value){
                 setState(() {
                   _isFormValid = true;
                   _nameDocError = _validateTextField(contractNmaeController.text, 'Name of the Contract');
                 });
               },
             ),
             _nameDocError != null ?// Display error if any
               Text(
                 _nameDocError!,
                 style: CommonErrorMsg.customTextStyle(context),
               ): SizedBox(height: AppSize.s13,),

             SizedBox(height: AppSize.s10),
             SMTextfieldAsteric(
               controller: contractIdController,
               keyboardType: TextInputType.text,
               text: AppStringEM.contractId,
                 onChanged:  (value){
                 setState(() {
                   _isFormValid = true;
                   _idDocError = _validateTextField(contractIdController.text, 'ID of the Contract');
                 });
               },
             ),
             _idDocError != null ?
               Padding(
                 padding: const EdgeInsets.only(top: AppPadding.p2),
                 child: Text(
                   _idDocError!,
                   style: CommonErrorMsg.customTextStyle(context),
                 ),
               ): SizedBox(height: AppSize.s13,),

             SizedBox(height: AppSize.s10),
             Row(
               children: [
                 HeaderContentConst(
                   isAsterisk: true,
                   heading: AppString.expiry_type,
                   content: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       CustomRadioListTile(
                         value: AppConfig.scheduled,
                         groupValue: selectedExpiryType,
                         onChanged: (value) {
                           setState(() {
                             selectedExpiryType = value!;
                             _validateForm();
                           });
                         },
                         title: AppConfig.scheduled,
                       ),

                       CustomRadioListTile(
                         value: AppConfig.issuer,
                         groupValue: selectedExpiryType,
                         onChanged: (value) {
                           setState(() {
                             selectedExpiryType = value!;
                             _validateForm();
                           });
                         },
                         title: AppConfig.issuer,
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                       left: AppPadding.p20,
                       right: AppPadding.p20,
                       bottom: AppPadding.p10
                   ),
                   child: Visibility(
                     visible: selectedExpiryType == AppConfig.scheduled,
                     child: Row(
                       children: [
                         Container(
                           height: AppSize.s30,
                           width: AppSize.s50,
                           //color: ColorManager.red,
                           child: TextFormField(
                             textAlign: TextAlign.center,
                             controller: daysController, // Use the controller initialized with "1"
                             cursorColor: ColorManager.black,
                             cursorWidth: 1,
                             style:  DocumentTypeDataStyle.customTextStyle(context),
                             decoration: InputDecoration(
                               enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     color: ColorManager.fmediumgrey,
                                     width: 2),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     color: ColorManager.fmediumgrey,
                                     width: 2),
                                 borderRadius: BorderRadius.circular(8),
                               ),
                               contentPadding:
                               EdgeInsets.symmetric(horizontal: AppPadding.p10),
                             ),
                             keyboardType: TextInputType.number,
                             inputFormatters: [
                               FilteringTextInputFormatter
                                   .digitsOnly, // This ensures only digits are accepted
                             ],
                           ),
                         ),
                         SizedBox(width: AppSize.s10),
                         Container(
                           height: AppSize.s30,
                           width: AppSize.s80,
                           padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
                           decoration: BoxDecoration(
                             border: Border.all(
                                 color: ColorManager.fmediumgrey),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: DropdownButtonFormField<String>(
                             value:
                             selectedYear, // Initial value (you should define this variable)
                             items: [
                               DropdownMenuItem(
                                 value: AppConfig.year,
                                 child: Text(
                                   AppConfig.year,
                                   style:  DocumentTypeDataStyle.customTextStyle(context),
                                 ),
                               ),
                               DropdownMenuItem(
                                 value: AppConfig.month,
                                 child: Text(
                                   AppConfig.month,
                                   style:  DocumentTypeDataStyle.customTextStyle(context),
                                 ),
                               ),
                             ],
                             onChanged: (value) {
                               setState(() {
                                 selectedYear = value; // Update the selected option (Year/Month)
                               });
                             },
                             decoration: InputDecoration(
                               enabledBorder: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               hintText: AppConfig.year,
                               hintStyle:   DocumentTypeDataStyle.customTextStyle(context),
                               contentPadding: EdgeInsets.only(bottom: AppPadding.p20),
                             ),
                             icon: Icon(
                               Icons.arrow_drop_down,
                               color: ColorManager.black,
                               size: IconSize.I16,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
             Visibility(
               visible: selectedExpiryType == AppConfig.issuer,

               /// Conditionally display expiry date field
               child: HeaderContentConst(
                 isAsterisk: true,
                 heading: AppString.expiry_date,
                 content: FormField<String>(
                   builder: (FormFieldState<String> field) {
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 30,
                           child: TextFormField(
                             controller: expiryDateController,
                             cursorColor: ColorManager.black,
                             style: DocumentTypeDataStyle.customTextStyle(context),
                             decoration: InputDecoration(
                               enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     color: ColorManager.fmediumgrey, width: 1),
                                 borderRadius: BorderRadius.circular(6),
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     color: ColorManager.fmediumgrey, width: 1),
                                 borderRadius: BorderRadius.circular(6),
                               ),
                               hintText: 'yyyy-mm-dd',
                               hintStyle: DocumentTypeDataStyle.customTextStyle(context),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(6),
                                 borderSide: BorderSide(
                                     width: 1, color: ColorManager.fmediumgrey),
                               ),
                               contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                               suffixIcon: Icon(Icons.calendar_month_outlined,
                                   color: ColorManager.blueprime),
                               //errorText: _expiryDateError,
                             ),
                             onTap: () async {
                               DateTime? pickedDate = await showDatePicker(
                                 context: context,
                                 initialDate: datePicked,
                                 firstDate: DateTime(1901),
                                 lastDate: DateTime(3101),
                               );
                               if (pickedDate != null) {
                                 datePicked = pickedDate;
                                 expiryDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                 setState(() {
                                   _expiryDateError == null;
                                 });
                               }
                             },
                           ),
                         ),
                        _expiryDateError != null ?// Display the error message if it's not null
                           Padding(
                             padding: const EdgeInsets.only(top: 2.0),
                             child: Text(
                               _expiryDateError!,
                               style: CommonErrorMsg.customTextStyle(context),
                             ),
                           ) : SizedBox(height: AppSize.s12,),
                       ],
                     );
                   },
                 ),
               ),
             ),
           ],
         ),
       )
      ],
      bottomButtons: loading == true
          ? SizedBox(
              height: AppSize.s30,
              width: AppSize.s30,
              child: CircularProgressIndicator(
                color: ColorManager.blueprime,
              ),
            )
          : CustomElevatedButton(
              width: AppSize.s105,
              height: AppSize.s30,
              text: AppStringEM.save,
              onPressed: () async {
                _validateForm(); // Validate the form on button press
                if (_isFormValid) {
                  setState(() {
                    loading = true;
                  });
                  int threshold = 0;
                  if (selectedExpiryType == AppConfig.scheduled &&
                      daysController.text.isNotEmpty) {
                    int enteredValue = int.parse(daysController.text);
                    if (selectedYear == AppConfig.year) {
                      threshold = enteredValue * 365;
                    } else if (selectedYear == AppConfig.month) {
                      threshold = enteredValue * 30;
                    }
                  }
                  try {
                    String? expiryDate;
                    expiryDate = expiryDateController == AppConfig.issuer
                        ? datePicked!.toIso8601String() + "Z"
                        : null;
                    var response = await addVendorContract(
                        context,
                        widget.selectedVendorId,
                        contractNmaeController.text,
                        selectedExpiryType!.toString(),
                        threshold,
                        widget.officeid,
                        contractIdController.text,
                        expiryDateController.text);
                    if(response.statusCode == 200 || response.statusCode == 201) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddSuccessPopup(
                            message: 'Added Successfully',
                          );
                        },
                      );
                    }
                    else if(response.statusCode == 400 || response.statusCode == 404){
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const FourNotFourPopup(),
                      );
                    }
                    else {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => FailedPopup(text: response.message),
                      );
                    }
                  } finally {
                    setState(() {
                      loading = false;
                    });
                  }
                }
              }),
      title: widget.title,
    );
  }
}





