import 'package:flutter/material.dart';
import '../../../../widgets/widgets/constant_textfield/const_textfield.dart';
import 'mcq_widget_add-employee.dart';

///prachi
class AdministartionTab extends StatelessWidget {
  final TextEditingController _sale1Controller = TextEditingController();
  final TextEditingController _socialsecuritynoController =
      TextEditingController();
  final TextEditingController _workemailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _personalnoController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _worknoController = TextEditingController();
  final TextEditingController _dateofbirthController = TextEditingController();
  final TextEditingController _personalemailController =
      TextEditingController();

  int? _selectedItemIndex;
  @override
  Widget build(BuildContext context) {
    double containerHeight1 = MediaQuery.of(context).size.height * 0.3;
    double containerHeight2 = MediaQuery.of(context).size.height * 0.2;
    double textFieldWidth = 200;
    double textFieldHeight = 38;
    FocusNode _focusNode = FocusNode();
    return Column(children: [
      /// first container
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 70),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // width: containerWidth,
                  height: containerHeight1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffB7B7B7),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///1st column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomDropdownTextField(
                            labelText: 'Designation',
                            labelStyle: TextStyle(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                            items: ['A', 'B', 'C', 'D'],
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Social Security Number',
                            labelStyle: TextStyle(),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Color(0xff50B5E5),
                              size: MediaQuery.of(context).size.width / 99,
                            ),
                            controller: _sale1Controller,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Work Email',
                            labelStyle: TextStyle(),
                            controller: _workemailController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                        ],
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'First Name',
                            labelStyle: TextStyle(),
                            controller: _addressController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Personal Phone Number',
                            labelStyle: TextStyle(),
                            controller: _firstnameController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                          CustomTextField(
                              width: textFieldWidth,
                              height: textFieldHeight,
                              cursorHeight: 22,
                              labelText: 'Address',
                              labelStyle: TextStyle(),
                              controller: _personalnoController,
                              focusNode: FocusNode(),
                              labelFontSize:
                                  MediaQuery.of(context).size.width / 99),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Last Name',
                            labelStyle: TextStyle(),
                            controller: _dateofbirthController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                          CustomDropdownTextField(
                            labelText: 'Reporting Office',
                            labelStyle: TextStyle(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                            items: ['A', 'B', 'C', 'D'],
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(),
                            controller: _personalemailController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownTextField(
                            labelText: 'Speciality',
                            labelStyle: TextStyle(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                            items: ['A', 'B', 'C', 'D'],
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'City',
                            labelStyle: TextStyle(),
                            controller: _lastnameController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                          CustomTextField(
                            width: textFieldWidth,
                            height: textFieldHeight,
                            cursorHeight: 22,
                            labelText: 'Personal Email',
                            labelStyle: TextStyle(),
                            controller: _worknoController,
                            focusNode: FocusNode(),
                            labelFontSize:
                                MediaQuery.of(context).size.width / 99,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),

      /// second Container
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 70),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // width: containerWidth,
                  height: containerHeight2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: Color(0xffB7B7B7),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      McqWidget(
                        title: 'Employment',
                        items: [
                          'Full Time',
                          'Contract',
                          'Part Time',
                          'Per Diem'
                        ],
                        onChanged: (selectedIndex) {
                          print('Selected index: $selectedIndex');
                          _selectedItemIndex = selectedIndex;
                        },
                      ),
                      McqWidget(
                        title: 'Gender',
                        items: [
                          'Male',
                          'Female',
                          'Other',
                        ],
                        onChanged: (int) {},
                      ),
                      McqWidget(
                        title: 'Status',
                        items: ['Active', 'Trainee', 'Inactive'],
                        onChanged: (int) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
