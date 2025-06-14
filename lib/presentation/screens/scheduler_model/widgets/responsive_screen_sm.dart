import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prohealth/presentation/screens/em_module/em_desktop_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/widgets/sm_desktop_screen.dart';

import '../../../../app/resources/screen_route_name.dart';
import '../../../../app/resources/value_manager.dart';

class ResponsiveScreenSM extends StatelessWidget {
   ResponsiveScreenSM({super.key});

  final ButtonSelectionSMController myController =
  Get.put(ButtonSelectionSMController());

  @override
  Widget build(BuildContext context) {
    myController.selectButton(0);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return SMHomeScreen();
        } else {
          return Container(
            color: Colors.white,
            height: AppSize.s100,
            width: AppSize.s500,
            child: Center(
              child: Text('Tablet Screen Scheduler & Intake',style: TextStyle(fontSize: AppSize.s20),
              ),
            ),
          );
        }
      },
    );
  }
}

class SMHomeScreen extends StatelessWidget {
  static const String routeName = RouteStrings.smDesktop;
   SMHomeScreen({super.key});
  final ButtonSelectionSMController myController =
  Get.put(ButtonSelectionSMController());
  @override
  Widget build(BuildContext context) {
    myController.selectButton(0);
    return SMDesktopScreen();
  }
}

