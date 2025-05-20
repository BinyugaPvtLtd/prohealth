import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/sm_intake_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_update_schedular/information_update.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_update_schedular/non_admit.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_update_schedular/sent_to_schedular.dart';
import 'package:provider/provider.dart';

import '../../../../app/resources/color.dart';
import '../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/value_manager.dart';
import '../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../widgets/app_clickable_widget.dart';

class IntakeMainScreen extends StatefulWidget {
  final int patientInfoData;
  final VoidCallback intakeFlowSelected;
  const IntakeMainScreen({super.key, required this.intakeFlowSelected, required this.patientInfoData});

  @override
  State<IntakeMainScreen> createState() => _IntakeMainScreenState();
}

class _IntakeMainScreenState extends State<IntakeMainScreen> {
  final PageController _tabPageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  /// State variable to track the current screen
  bool isShowingSMIntakeScreen = false;
  int? patientId;

  /// Method to switch to SMIntakeScreen
  void switchToSMIntakeScreen() {
    setState(() {
      isShowingSMIntakeScreen = true;
    });
  }

  void goBackToInitialScreen() {
    setState(() {
      isShowingSMIntakeScreen = false;
    });
  }

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabPageController.jumpToPage(
      index,
      // duration: Duration(milliseconds: 100),
      // curve: Curves.ease,
    );
    // _tabPageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.ease,
    // );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isShowingSMIntakeScreen
          ? SMIntakeScreen(onGoBackPressed: goBackToInitialScreen, patientId: patientId!,) // Render the SMIntakeScreen when switched
          : Column(
        children: [
          /// Tab bar
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SMTabbar(
                  onTap: (int index) {
                    _selectButton(0);
                  },
                  index: 0,
                  grpIndex: _selectedIndex,
                  heading: "Information Update",
                    badgeNumber: widget.patientInfoData
                ),
                SizedBox(width: 20),
                SMTabbar(
                  onTap: (int index) {
                    _selectButton(1);
                  },
                  index: 1,
                  grpIndex: _selectedIndex,
                  heading: "Send to Scheduler",
                    badgeNumber: 55
                ),
                SizedBox(width: 20),
                SMTabbar(
                    onTap: (int index) {
                      _selectButton(2);
                    },
                    index: 2,
                    grpIndex: _selectedIndex,
                    heading: "Non-Admit",
                   // badgeNumber: 55
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: NonScrollablePageView(
              controller: _tabPageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                ChangeNotifierProvider(
                  create: (_) => InformationUpdateProvider(onUpdateButtonPressed: switchToSMIntakeScreen,
                   onPatientIdReceived: (int receivedPatientId) {
                    patientId = receivedPatientId;
                    print("pid :::::::::::: $patientId");
                    }, ),
                  child: InformationUpdateScreen(
                      selectUploadButton: widget.intakeFlowSelected
                              //onUpdateButtonPressed: switchToSMIntakeScreen,
              // onPatientIdReceived: (int receivedPatientId) {
              //                // setState(() {
              //                   patientId = receivedPatientId;
              //                   print("pid :::::::::::: $patientId");
              //                // });
              //               },
                  ),
                ),
                SentToSchedularScreen(),
                NonAdmitPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


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



class SMTabbar extends StatelessWidget {
  const SMTabbar({
    super.key,
    required this.onTap,
    required this.index,
    required this.grpIndex,
    required this.heading,
    this.badgeNumber,
    this.width,
  });

  final OnManuButtonTapCallBack onTap;
  final int index;
  final int grpIndex;
  final String heading;
  final int? badgeNumber;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AppClickableWidget(
      onTap: () {
        onTap(index);
      },
      onHover: (bool val) {},
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                //color: Colors.red,
                width: width ?? 170,
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    heading,
                    style: TransparentBgTabbar.customTextStyle(grpIndex, index),
                  ),
                ),
              ),
              if (badgeNumber != null) // Only show badge if badgeNumber is not null
                Positioned(
                  right: -5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                    decoration: BoxDecoration(
                      color: ColorManager.blueprime, // Badge color
                      borderRadius: BorderRadius.circular(12), // Rounded badge
                    ),
                    child: Text(
                      badgeNumber!.toString(),
                      style: TextStyle(
                        fontSize: FontSize.s10, // Adjust font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Badge text color
                      ),
                    ),
                  ),
                ),
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(
                  text: heading,
                  style: TextStyle(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();

              final textWidth = textPainter.size.width;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                height: 2,
                width: textWidth + 80, // Adjust padding around text
                color: grpIndex == index
                    ? ColorManager.blueprime
                    : Colors.transparent,
              );
            },
          ),
        ],
      ),
    );
  }
}