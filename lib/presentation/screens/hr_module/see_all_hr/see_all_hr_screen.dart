import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/dialogue_template.dart';
import 'package:prohealth/presentation/screens/hr_module/see_all_hr/sales_hr.dart';
import 'package:prohealth/presentation/widgets/widgets/constant_textfield/const_textfield.dart';
import '../../../../app/services/api/managers/hr_module_manager/manage_emp/search_byfilter.dart';
import 'administration_hr.dart';
import 'clinical_hr.dart';

///enums
enum OfficeLocation { sanJose, austin }
enum Zone { zone1, zone2 }
enum LicenseStatus { active, expired }
enum Availability { fullTime, partTime }
///
// class ProfilePatientPopUp extends StatefulWidget {
//   final VoidCallback onSearch;
//
//   const ProfilePatientPopUp({Key? key, required this.onSearch}) : super(key: key);
//
//   @override
//   State<ProfilePatientPopUp> createState() => _PopUpState();
// }
//
// class _PopUpState extends State<ProfilePatientPopUp> {
//   String? dropdownOfficeLocation;
//   String? dropdownZone;
//   String? dropdownLicenseStatus;
//   String? dropdownAvailability;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       titlePadding: EdgeInsets.zero,
//       backgroundColor: Colors.white,
//       title: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(8.0),
//             topRight: Radius.circular(8.0),
//           ),
//           color: Color(0xff50B5E5),
//         ),
//         height: 32,
//         width: 300,
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Patient Profile',
//                 style: GoogleFonts.firaSans(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Spacer(),
//             IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.close,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Other UI elements...
//             SizedBox(height: MediaQuery.of(context).size.height / 160),
//             Row(
//               children: [
//                 ConstantContainerWithText(text: 'RN'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'LVN'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'PT'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'PTA'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'HHA'),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 45),
//             Row(
//               children: [
//                 ConstantContainerWithText(text: 'COTA'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'ST'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'MSW'),
//                 SizedBox(width: MediaQuery.of(context).size.width / 90),
//                 ConstantContainerWithText(text: 'OT'),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 30),
//             Row(
//               children: [
//                 Text(
//                   'Office Location',
//                   style: GoogleFonts.firaSans(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xff737373),
//                   ),
//                 ),
//                 SizedBox(width: MediaQuery.of(context).size.width / 11),
//                 Text(
//                   'Zone',
//                   style: GoogleFonts.firaSans(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xff737373),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 60),
//             Row(
//               children: [
//                 Container(
//                   width: 120,
//                   height: 30,
//                   child: CustomDropDown(
//
//                     items: ['San Joes', 'Austin'],
//                     labelText: 'Office Location',
//                     labelStyle: GoogleFonts.firaSans(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff737373),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         dropdownOfficeLocation = value;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: MediaQuery.of(context).size.width / 20),
//                 Container(
//                   width: 120,
//                   height: 30,
//                   child: CustomDropDown(
//                     items: ['Zone 1', 'Zone 2'],
//                     labelText: 'Zone',
//                     labelStyle: GoogleFonts.firaSans(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff737373),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         dropdownZone = value;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 25),
//             Row(
//               children: [
//                 Text(
//                   'License status',
//                   style: GoogleFonts.firaSans(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xff737373),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 60),
//             Row(
//               children: [
//                 Container(
//                   width: 120,
//                   height: 30,
//                   child: CustomDropDown(
//
//                     items: ['Active', 'Expired'],
//                     labelText: 'License Status',
//                     labelStyle: GoogleFonts.firaSans(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff737373),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         dropdownLicenseStatus = value;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 25),
//             Row(
//               children: [
//                 Text(
//                   'Availability',
//                   style: GoogleFonts.firaSans(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xff737373),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 60),
//             Row(
//               children: [
//                 Container(
//                   width: 120,
//                   height: 30,
//                   child: CustomDropDown(
//
//                     items: ['Full-Time', 'Part-Time'],
//                     labelText: 'Availability',
//                     labelStyle: GoogleFonts.firaSans(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff737373),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         dropdownAvailability = value;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 25),
//             ElevatedButton(
//               onPressed: (){
//                 widget.onSearch();
//                 Navigator.pop(context);
//               },
//               child: Text('Search', style: GoogleFonts.firaSans(
//                 fontSize: 10,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.white,
//               ),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///
class ProfilePatientPopUp extends StatefulWidget {
  final Widget? zoneDropDown;
  final VoidCallback onSearch;
  final Widget clearFilter;
  final Widget officceIdWidget;
  final Widget licensesWidget;
  final Widget avabilityWidget;
  final Widget? abbrivationWidget;
  bool? isShown;
  ProfilePatientPopUp({Key? key,
    this.isShown = true,
    required this.clearFilter,
    required this.avabilityWidget,
    required this.licensesWidget,
     this.abbrivationWidget,
    required this.officceIdWidget,
    required this.onSearch, this.zoneDropDown,}) : super(key: key);

  @override
  State<ProfilePatientPopUp> createState() => _PopUpState();
}

class _PopUpState extends State<ProfilePatientPopUp> {
  String? dropdownValue;
  String? dropdownOfficeLocation;
  String? dropdownZone;
  String? dropdownLicenseStatus;
  String? dropdownAvailability;
  @override
  Widget build(BuildContext context) {
    return DialogueTemplate(
      width: 480, height: 450,
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Office Location',
                        style:AllPopupHeadings.customTextStyle(context)
                      ),
                      SizedBox(height: 5,),
                      widget.officceIdWidget
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 20),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Zone', style: AllPopupHeadings.customTextStyle(context)),
                        SizedBox(height: 5,),
                        widget.zoneDropDown == null ? Offstage() : widget.zoneDropDown!
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              Row(
                children: [
                  Text(
                    'License status',
                    style: AllPopupHeadings.customTextStyle(context)
                  ),
                  SizedBox(height:5),
                ],
              ),
              SizedBox(height: 5,),
              widget.licensesWidget,
              SizedBox(height: MediaQuery.of(context).size.height / 25),
              Row(
                children: [
                  Text(
                    'Availability',
                    style: AllPopupHeadings.customTextStyle(context)
                  ),
                ],
              ),
              SizedBox(height: 5,),
              widget.avabilityWidget,
            ],
          ),
        )


    ],
      bottomButtons:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.clearFilter,
          SizedBox(width: 10,),
          CustomElevatedButton(
            width: AppSize.s105,
            height: AppSize.s30,
            text: "Search",
            isSelectShow: widget.isShown,
            onPressed: () async {
              widget.onSearch();
              Navigator.pop(context);
            } ,
          ),
        ],
      ),
      title: 'Clinician Search Filter',
    );
  }
}













class ConstantContainerWithText extends StatefulWidget {
  final String text;

  const ConstantContainerWithText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _ConstantContainerWithTextState createState() =>
      _ConstantContainerWithTextState();
}

class _ConstantContainerWithTextState extends State<ConstantContainerWithText> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected ? Color(0xff4FB8EB) : Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 27,
        width: 31,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: _isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
