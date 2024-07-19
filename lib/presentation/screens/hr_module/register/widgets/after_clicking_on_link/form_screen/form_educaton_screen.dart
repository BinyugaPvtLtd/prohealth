import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/progress_form_manager/form_education_manager.dart';

import '../../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../taxtfield_constant.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {







  double textFieldWidth = 430;
  double textFieldHeight = 38;



  // Current step in the stepper
  int _currentStep = 0;

  bool isChecked = false;

  bool get isFirstStep => _currentStep == 0;



  String? _selectedDegree;

  String? _selectedTypeY;
  String? _selectedTypeN;




TextEditingController  collegeuniversity = TextEditingController();
TextEditingController   majorsubject = TextEditingController();
TextEditingController   phone = TextEditingController();
TextEditingController  city = TextEditingController();
TextEditingController  state = TextEditingController();








  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              'Education',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff50B5E5)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 60),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFE6F7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Your personal details will be required to proceed through the recruitment process.',
              style: GoogleFonts.firaSans(
                color: Color(0xFF686464),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.only(left: 166.0, right: 166),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Education # 1',
                  style: GoogleFonts.firaSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff686464)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'College/University',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          CustomTextFieldRegister(
                            controller: collegeuniversity,
                            hintText: 'Enter Text',
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                            height: 32,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  30),
                          Text(
                            'Graduate',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomRadioListTile(
                                title: 'Yes',
                                value: 'Yes',
                                groupValue: _selectedTypeY,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedTypeY = value;
                                  });
                                },
                              )),
                              Expanded(
                                child: CustomRadioListTile(
                                  title: 'No',
                                  value: 'No',
                                  groupValue: _selectedTypeN,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedTypeN = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  30),
                          Text(
                            'Degree',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          Container(
                            height: 32,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Select Degree',
                                hintStyle: GoogleFonts.firaSans(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff9B9B9B),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(4.0),
                                  borderSide:
                                      BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                              value: _selectedDegree,
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Color(0xff9B9B9B)),
                              iconSize: 24,
                              elevation: 16,
                              style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDegree = newValue;
                                });
                              },
                              items: <String>[
                                'Degee',
                                'Deree',
                                'Dgree',
                                'Degre'
                              ] // List of countries
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  30),
                          Text(
                            'Major Subject',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          CustomTextFieldRegister(
                            controller: majorsubject,
                            hintText: 'Enter Text',
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone ',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          CustomTextFieldRegister(
                            controller: phone,
                            hintText: 'Enter Text',
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                            height: 32,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  30),
                          Text(
                            'City',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          CustomTextFieldRegister(
                            controller: city,
                            hintText: 'Enter Text',
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                            height: 32,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  30),
                          Text(
                            'State',
                            style: GoogleFonts.firaSans(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff686464)),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height /
                                  60),
                          CustomTextFieldRegister(
                            controller: state,
                            hintText: 'Enter Text',
                            hintStyle: GoogleFonts.firaSans(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9B9B9B),
                            ),
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Upload your degree / certifications as a docx or pdf',
                        style: GoogleFonts.firaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff686464),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 20),
                    ElevatedButton.icon(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                        );
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          print('File picked: ${file.name}');
                        } else {
                          // User canceled the picker
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff50B5E5),
                        // padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(Icons.file_upload_outlined,
                          color: Colors.white),
                      label: Text(
                        'Upload Document',
                        style: GoogleFonts.firaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle add education action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff50B5E5),
                        // padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add Education',
                        style: GoogleFonts.firaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1696C8),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  await posteducationscreen(context, 0, "__", "__", majorsubject.text, city.text, collegeuniversity.text, phone.text, state.text, "__"); },
                child: Text(
                  'Save',
                  style: GoogleFonts.firaSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}