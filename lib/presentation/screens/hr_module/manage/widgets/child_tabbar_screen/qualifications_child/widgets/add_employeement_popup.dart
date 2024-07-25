// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:prohealth/app/resources/color.dart';
// import 'package:prohealth/app/resources/const_string.dart';
// import 'package:prohealth/app/resources/font_manager.dart';
// import 'package:prohealth/app/resources/value_manager.dart';
// import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
// import 'package:prohealth/presentation/screens/hr_module/register/taxtfield_constant.dart';
//
// class AddEmployeementPopup extends StatefulWidget {
//   final TextEditingController positionTitleController;
//   final TextEditingController leavingResonController;
//   final TextEditingController startDateContoller;
//   final TextEditingController endDateController;
//   final TextEditingController lastSupervisorNameController;
//   final TextEditingController supervisorMobileNumber;
//   final TextEditingController cityNameController;
//   final TextEditingController employeerController;
//   final TextEditingController emergencyMobileNumber;
//   final String tite;
//   final VoidCallback onpressedClose;
//    Future<void> Function() onpressedSave;
//   final Widget checkBoxTile;
//    AddEmployeementPopup({super.key, required this.positionTitleController, required this.leavingResonController, required this.startDateContoller, required this.endDateController, required this.lastSupervisorNameController, required this.supervisorMobileNumber, required this.cityNameController, required this.employeerController, required this.emergencyMobileNumber, required this.onpressedSave, required this.checkBoxTile, required this.tite, required this.onpressedClose});
//
//   @override
//   State<AddEmployeementPopup> createState() => _AddEmployeementPopupState();
// }
//
// class _AddEmployeementPopupState extends State<AddEmployeementPopup> {
//   final DateTime _selectedStartDate = DateTime.now();
//   final DateTime _selectedEndDate = DateTime.now();
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         width: MediaQuery.of(context).size.width/1.5,
//         height: AppSize.s400,
//         decoration: BoxDecoration(
//           color: ColorManager.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 34,
//                 decoration: BoxDecoration(
//                   color: Color(0xff50B5E5),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12),
//                     topRight: Radius.circular(12),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding:  EdgeInsets.only(left: 10.0),
//                       child: Text(widget.tite,style: GoogleFonts.firaSans(
//                         fontSize: FontSize.s16,
//                         fontWeight: FontWeightManager.bold,
//                         color: Colors.white,
//                         decoration: TextDecoration.none,
//                       ),),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.close,color: Colors.white,),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height/13,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.positionTitleController,
//                     labelText: "Final Position Title",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.leavingResonController,
//                     labelText: "Reason For Leaving",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.startDateContoller,
//                     labelText: "Start Date",
//                     keyboardType: TextInputType.text,
//                     suffixIcon: Icon(Icons.calendar_month_outlined,color: ColorManager.blueprime,),
//                     padding:  EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onTap: () async{
//                       DateTime? date = await showDatePicker(
//                         context: context,
//                         initialDate: _selectedStartDate,
//                         firstDate: DateTime(1100),
//                         lastDate: DateTime(2025),
//                       );
//                       if (date != null) {
//                         String formattedDate = DateFormat('yyyy-MM-dd').format(date);
//                         widget.startDateContoller.text = formattedDate;
//                         //field.didChange(formattedDate);
//                       }
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height/20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.endDateController,
//                     labelText: "End Date",
//                     keyboardType: TextInputType.text,
//                     suffixIcon: Icon(Icons.calendar_month_outlined,color: ColorManager.blueprime,),
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onTap: () async{
//                       DateTime? date = await showDatePicker(
//                         context: context,
//                         initialDate: _selectedEndDate,
//                         firstDate: DateTime(1100),
//                         lastDate: DateTime(2025),
//                       );
//                       if (date != null) {
//                         String formattedDate = DateFormat('yyyy-MM-dd').format(date);
//                         widget.endDateController.text = formattedDate;
//                         //field.didChange(formattedDate);
//                       }
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.lastSupervisorNameController,
//                     labelText: "Last Supervisor’s Name",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.supervisorMobileNumber,
//                     labelText: "Supervisor’s Mobile Number",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//
//                 ],
//               ),
//               //SizedBox(height:MediaQuery.of(context).size.height/50),
//               Padding(
//                 padding:  EdgeInsets.only(left: 30.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     widget.checkBoxTile,
//                   ],
//                 ),
//               ),
//              // SizedBox(height:MediaQuery.of(context).size.height/50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.cityNameController,
//                     labelText: "City",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.employeerController,
//                     labelText: "Employer",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextFieldRegister(
//                     height: AppSize.s30,
//                     width: MediaQuery.of(context).size.width/6,
//                     controller: widget.emergencyMobileNumber,
//                     labelText: "Emergency Mobile Number",
//                     keyboardType: TextInputType.text,
//                     padding: const EdgeInsets.only(bottom:AppPadding.p5,left: AppPadding.p20),
//                     onChanged: (value) {
//
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return AppString.enterText;
//                       }
//                       return null;
//                     },
//                   ),
//
//                 ],
//               ),
//               SizedBox(height:MediaQuery.of(context).size.height/15),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     CustomButtonTransparent(text: "Cancel", onPressed: () {
//                      // widget.onpressedClose();
//                       Navigator.pop(context);
//                     }),
//                     SizedBox(width: 10,),
//                     isLoading
//                         ? SizedBox(
//                       height: 25,
//                         width: 25,
//                         child: CircularProgressIndicator( color: ColorManager.blueprime,))
//                         : CustomElevatedButton(text: "Save",onPressed: () async{
//                       setState(() {
//                         isLoading = true;
//                       });
//                       try {
//                         await widget.onpressedSave();
//                       } finally {
//                         setState(() {
//                           isLoading = false;
//                         });
//                         Navigator.pop(context);
//                         widget.startDateContoller.clear();
//                         widget.endDateController.clear();
//                         widget.leavingResonController.clear();
//                         widget.cityNameController.clear();
//                         widget.lastSupervisorNameController.clear();
//                         widget.supervisorMobileNumber.clear();
//                         widget.employeerController.clear();
//                         widget.positionTitleController.clear();
//                         widget.emergencyMobileNumber.clear();
//                       }
//
//                     }),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
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
  final String tite;
  final VoidCallback onpressedClose;
  Future<void> Function() onpressedSave;
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
  });

  @override
  State<AddEmployeementPopup> createState() => _AddEmployeementPopupState();
}

class _AddEmployeementPopupState extends State<AddEmployeementPopup> {
  final DateTime _selectedStartDate = DateTime.now();
  final DateTime _selectedEndDate = DateTime.now();
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
  };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: AppSize.s395, // Increased height
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(12),
        ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.tite,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTextField(
                  controller: widget.cityNameController,
                  labelText: "City",
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonTransparent(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 10),
                  isLoading
                      ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(color: ColorManager.blueprime),
                  )
                      : CustomElevatedButton(
                    text: "Save",
                    onPressed: _handleSave,
                  ),
                ],
              ),
            )
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
          height: AppSize.s30,
          width: MediaQuery.of(context).size.width / 6,
          controller: controller,
          labelText: labelText,
          keyboardType: TextInputType.text,
          padding: const EdgeInsets.only(bottom: AppPadding.p5, left: AppPadding.p20),
          suffixIcon: suffixIcon,
          onTap: onTap,
          onChanged: (value) {
            setState(() {
              errorStates[errorKey] = value.isEmpty;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppString.enterText;
            }
            return null;
          },
        ),
        if (errorStates[errorKey]!)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Please enter $labelText',
              style: TextStyle(color: Colors.red, fontSize: 10),
            ),
          ),
      ],
    );
  }

  Future<void> _selectDate(TextEditingController controller, DateTime initialDate) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1100),
      lastDate: DateTime(2025),
    );
    if (date != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      controller.text = formattedDate;
      setState(() {
        errorStates[controller == widget.startDateContoller ? 'startDate' : 'endDate'] = false;
      });
    }
  }

  void _handleSave() async {
    setState(() {
      isLoading = true;
      errorStates['positionTitle'] = widget.positionTitleController.text.isEmpty;
      errorStates['leavingReason'] = widget.leavingResonController.text.isEmpty;
      errorStates['startDate'] = widget.startDateContoller.text.isEmpty;
      errorStates['endDate'] = widget.endDateController.text.isEmpty;
      errorStates['lastSupervisorName'] = widget.lastSupervisorNameController.text.isEmpty;
      errorStates['supervisorMobileNumber'] = widget.supervisorMobileNumber.text.isEmpty;
      errorStates['cityName'] = widget.cityNameController.text.isEmpty;
      errorStates['employer'] = widget.employeerController.text.isEmpty;
      errorStates['emergencyMobileNumber'] = widget.emergencyMobileNumber.text.isEmpty;
    });

    if (!errorStates.values.contains(true)) {
      try {
        await widget.onpressedSave();
      } finally {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context);
        _clearControllers();
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _clearControllers() {
    widget.startDateContoller.clear();
    widget.endDateController.clear();
    widget.leavingResonController.clear();
    widget.cityNameController.clear();
    widget.lastSupervisorNameController.clear();
    widget.supervisorMobileNumber.clear();
    widget.employeerController.clear();
    widget.positionTitleController.clear();
    widget.emergencyMobileNumber.clear();
  }
}