// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prohealth/app/resources/color.dart';
// import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
// import 'package:prohealth/app/resources/font_manager.dart';
// import 'package:prohealth/app/resources/value_manager.dart';
// import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
// import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
// import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';
//
// class CompensationAddEditPopup extends StatefulWidget {
//   final TextEditingController idController;
//   final TextEditingController nameController;
//   final String labelName;
//   String expiryType;
//   final Future<void> Function() onSavePredded;
//   CompensationAddEditPopup({
//     super.key,
//     required this.idController,
//     required this.nameController,
//     required this.labelName,
//     required this.onSavePredded,
//     required this.expiryType,
//   });
//
//   @override
//   State<CompensationAddEditPopup> createState() => _CompensationAddEditPopupState();
// }
//
// class _CompensationAddEditPopupState extends State<CompensationAddEditPopup> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Dialog(
//         backgroundColor: Colors.transparent,
//         child: Container(
//           width: AppSize.s400,
//           height: AppSize.s500,
//           decoration: BoxDecoration(
//             color: ColorManager.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Container(
//                   height: 34,
//                   decoration: BoxDecoration(
//                     color: Color(0xff50B5E5),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.labelName,
//                           style: GoogleFonts.firaSans(
//                             fontSize: FontSize.s14,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(Icons.close, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: AppPadding.p3,
//                     horizontal: AppPadding.p20,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       FormField<String>(
//                         builder: (FormFieldState<String> field) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SMTextFConst(
//                                 controller: widget.idController,
//                                 keyboardType: TextInputType.text,
//                                 text: 'ID of the Document',
//                               ),
//                               if (field.hasError)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: Text(
//                                     field.errorText!,
//                                     style: TextStyle(color: Colors.red, fontSize: 12),
//                                   ),
//                                 ),
//                             ],
//                           );
//                         },
//                         validator: (value) {
//                           if (widget.idController.text.isEmpty) {
//                             return 'Please enter Id of the document';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: AppSize.s8),
//                       FormField<String>(
//                         builder: (FormFieldState<String> field) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SMTextFConst(
//                                 controller: widget.nameController,
//                                 keyboardType: TextInputType.text,
//                                 text: 'Name of the Document',
//                               ),
//                               if (field.hasError)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0),
//                                   child: Text(
//                                     field.errorText!,
//                                     style: TextStyle(color: Colors.red, fontSize: 12),
//                                   ),
//                                 ),
//                             ],
//                           );
//                         },
//                         validator: (value) {
//                           if (widget.nameController.text.isEmpty) {
//                             return 'Please Enter Name of the Document';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: AppSize.s8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Type',
//                             style: GoogleFonts.firaSans(
//                               fontSize: FontSize.s12,
//                               fontWeight: FontWeight.w700,
//                               color: ColorManager.mediumgrey,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           CICCDropdown(
//                             initialValue: 'Compensation',
//                             items: [
//                               DropdownMenuItem(value: 'Type 1', child: Text('Type 1')),
//                               DropdownMenuItem(value: 'Type 2', child: Text('Type 2')),
//                               DropdownMenuItem(value: 'Type 3', child: Text('Type 3')),
//                               DropdownMenuItem(value: 'Type 4', child: Text('Type 4')),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: AppSize.s12),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: AppPadding.p3,
//                     horizontal: AppPadding.p20,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Expiry Type',
//                         style: GoogleFonts.firaSans(
//                           fontSize: FontSize.s12,
//                           fontWeight: FontWeight.w700,
//                           color: ColorManager.mediumgrey,
//                           decoration: TextDecoration.none,
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           RadioListTile<String>(
//                             title: Text(
//                               'Not Applicable',
//                               style: GoogleFonts.firaSans(
//                                 fontSize: FontSize.s10,
//                                 fontWeight: FontWeightManager.medium,
//                                 color: ColorManager.mediumgrey,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                             value: 'type1',
//                             groupValue: widget.expiryType,
//                             onChanged: (value) {
//                               setState(() {
//                                 widget.expiryType = value!;
//                               });
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text(
//                               'Scheduled',
//                               style: GoogleFonts.firaSans(
//                                 fontSize: FontSize.s10,
//                                 fontWeight: FontWeightManager.medium,
//                                 color: ColorManager.mediumgrey,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                             value: 'type2',
//                             groupValue: widget.expiryType,
//                             onChanged: (value) {
//                               setState(() {
//                                 widget.expiryType = value!;
//                               });
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text(
//                               'Issuer Expiry',
//                               style: GoogleFonts.firaSans(
//                                 fontSize: FontSize.s10,
//                                 fontWeight: FontWeightManager.medium,
//                                 color: ColorManager.mediumgrey,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                             value: 'type3',
//                             groupValue: widget.expiryType,
//                             onChanged: (value) {
//                               setState(() {
//                                 widget.expiryType = value!;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: AppPadding.p24),
//                   child: Center(
//                     child: CustomElevatedButton(
//                       width: AppSize.s105,
//                       height: AppSize.s30,
//                       text: AppStringEM.submit,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           widget.onSavePredded();
//                           Navigator.pop(context);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/text_form_field_const.dart';

class CompensationAddEditPopup extends StatefulWidget {
  final TextEditingController idController;
  final TextEditingController nameController;
  final String labelName;
  String expiryType;
  final Future<void> Function() onSavePredded;

  CompensationAddEditPopup({
    super.key,
    required this.idController,
    required this.nameController,
    required this.labelName,
    required this.onSavePredded,
    required this.expiryType,
  });

  @override
  State<CompensationAddEditPopup> createState() => _CompensationAddEditPopupState();
}

class _CompensationAddEditPopupState extends State<CompensationAddEditPopup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? expiryTypeError;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: AppSize.s400,
          height: AppSize.s500,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xff50B5E5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.labelName,
                          style: GoogleFonts.firaSans(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
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
                      FormField<String>(
                        builder: (FormFieldState<String> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SMTextFConst(
                                controller: widget.idController,
                                keyboardType: TextInputType.text,
                                text: 'ID of the Document',
                              ),
                              if (field.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(color: Colors.red, fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                        validator: (value) {
                          if (widget.idController.text.isEmpty) {
                            return 'Please enter Id of the document';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSize.s8),
                      FormField<String>(
                        builder: (FormFieldState<String> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SMTextFConst(
                                controller: widget.nameController,
                                keyboardType: TextInputType.text,
                                text: 'Name of the Document',
                              ),
                              if (field.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(color: Colors.red, fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                        validator: (value) {
                          if (widget.nameController.text.isEmpty) {
                            return 'Please Enter Name of the Document';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSize.s8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type',
                            style: GoogleFonts.firaSans(
                              fontSize: FontSize.s12,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          CICCDropdown(
                            initialValue: 'Compensation',
                            items: [
                              DropdownMenuItem(value: 'Type 1', child: Text('Type 1')),
                              DropdownMenuItem(value: 'Type 2', child: Text('Type 2')),
                              DropdownMenuItem(value: 'Type 3', child: Text('Type 3')),
                              DropdownMenuItem(value: 'Type 4', child: Text('Type 4')),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s12),
                      Text(
                        'Expiry Type',
                        style: GoogleFonts.firaSans(
                          fontSize: FontSize.s12,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.mediumgrey,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioListTile<String>(
                            title: Text(
                              'Not Applicable',
                              style: GoogleFonts.firaSans(
                                fontSize: FontSize.s10,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.mediumgrey,
                              ),
                            ),
                            value: 'type1',
                            groupValue: widget.expiryType,
                            onChanged: (value) {
                              setState(() {
                                widget.expiryType = value!;
                                expiryTypeError = null; // Clear error when a valid option is selected
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: Text(
                              'Scheduled',
                              style: GoogleFonts.firaSans(
                                fontSize: FontSize.s10,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.mediumgrey,
                              ),
                            ),
                            value: 'type2',
                            groupValue: widget.expiryType,
                            onChanged: (value) {
                              setState(() {
                                widget.expiryType = value!;
                                expiryTypeError = null; // Clear error when a valid option is selected
                              });
                            },
                          ),
                          RadioListTile<String>(
                            title: Text(
                              'Issuer Expiry',
                              style: GoogleFonts.firaSans(
                                fontSize: FontSize.s10,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.mediumgrey,
                              ),
                            ),
                            value: 'type3',
                            groupValue: widget.expiryType,
                            onChanged: (value) {
                              setState(() {
                                widget.expiryType = value!;
                                expiryTypeError = null; // Clear error when a valid option is selected
                              });
                            },
                          ),
                          if (expiryTypeError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                expiryTypeError!,
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p24),
                  child: Center(
                    child: CustomElevatedButton(
                      width: AppSize.s105,
                      height: AppSize.s30,
                      text: AppStringEM.add,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.expiryType.isEmpty) {
                            setState(() {
                              expiryTypeError = 'Please select Expiry Type';
                            });
                          } else {
                            setState(() {
                              expiryTypeError = null; // Clear error when a valid option is selected
                            });
                            widget.onSavePredded();
                            Navigator.pop(context);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
