import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/intake_insurance_home_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_lab_result/intake_lab_result_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_medications/intake_medications_home_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_notes/intake_notes_home_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/intake_patients_data_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_physician_info/intake_physician_home_screen.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../widgets/constant_widgets/page_view_menu_button_const.dart';
import 'new_documation/documation_screen.dart';

class SMIntakeScreen extends StatefulWidget {
  final VoidCallback onGoBackPressed;
  final int patientId;
  const SMIntakeScreen({super.key, required this.onGoBackPressed, required this.patientId});

  @override
  State<SMIntakeScreen> createState() => _SMIntakeScreenState();
}

class _SMIntakeScreenState extends State<SMIntakeScreen> {
  final PageController intakePageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  int patientId = 51;

  void intakeSelectButton(int index) {
    if (index == 0 || patientId != 0) {
      setState(() {
        _selectedIndex = index;
      });
      intakePageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
        color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorManager.black.withOpacity(0.5),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 30, right: 60),
        margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            InkWell(
                onTap: widget.onGoBackPressed,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: IconSize.I16,
                      color: ColorManager.mediumgrey,

                    ),
                    SizedBox(width: 5,),
                    Text(
                      'Go Back',
                     style:TextStyle(
                       fontSize: FontSize.s14,
                       fontWeight: FontWeight.w700,
                       color: ColorManager.mediumgrey,
                     ),
                    ),
                  ],
                )),
            PageViewMenuButtonConst(
              onTap: (int index) {
                intakeSelectButton(index);
              },
              index: 0,
              grpIndex: _selectedIndex,
              heading: "Demographics",
            ),
            // PageViewMenuButtonConst(
            //   onTap: (int index) {
            //     intakeSelectButton(index);
            //   },
            //   index: 1,
            //   grpIndex: _selectedIndex,
            //   heading: "Referral",
            //   enabled: patientId != 0,
            // ),
            PageViewMenuButtonConst(
              onTap: (int index) {
                intakeSelectButton(index);
              },
              index: 1,
              grpIndex: _selectedIndex,
              heading: "Documentation",
              enabled: patientId != 0,
            ),
            PageViewMenuButtonConst(
              onTap: (int index) {
                intakeSelectButton(index);
              },
              index: 2,
              grpIndex: _selectedIndex,
              heading: "Insurance",
              enabled: patientId != 0,
            ),
            PageViewMenuButtonConst(
              onTap: (int index) {
                //intakeSelectButton(index);
              },
              index: 9,//3,
              grpIndex: _selectedIndex,
              heading: "Physician Info",
              enabled: patientId != 0,
            ),
            PageViewMenuButtonConst(
              onTap: (int index) {
                intakeSelectButton(index);
              },
              index: 4,
              grpIndex: _selectedIndex,
              heading: "Orders",
              enabled: patientId != 0,
            ),
            PageViewMenuButtonConst(
              onTap: (int index) {
                intakeSelectButton(index);
              },
              index: 5,
              grpIndex: _selectedIndex,
              heading: "Initial Contact",
              enabled: patientId != 0,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: NonScrollablePageView(
          controller: intakePageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            SmIntakeDemographicsScreen(
              onPatientIdGenerated: (int id) {
                setState(() {
                  patientId = id;
                });
              },
            ),
            // SMIntakeReferralScreen(patientId: patientId),
            DocumationScreenTab(),
            IntakeMedicationScreen(patientId: patientId),
            IntakeLabResultScreen(patientId: patientId),
            SMIntakeInsuranceScreen(patientId: patientId),
            SmIntakeNotesScreen(patientId: patientId),
          ],
        ),
      ),
    ]);
  }
}


///
class NonScrollablePageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final List<Widget> children;
  const NonScrollablePageView({
    Key? key,
    required this.controller,
    required this.onPageChanged,
    required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) => true,
      child: PageView(
        controller: controller,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // Disables scrolling
        children: children,
      ),
    );
  }
}