import 'package:flutter/material.dart';
import 'package:prohealth/presentation/widgets/app_bar/app_bar_mobile.dart';
import 'package:prohealth/presentation/widgets/app_bar/app_bar_tab.dart';
import 'package:prohealth/presentation/widgets/app_bar/app_bar_web.dart';
import 'package:prohealth/presentation/widgets/app_bar/responsive_app_bar.dart';
import 'package:prohealth/presentation/widgets/app_bar/sm_app_bar.dart';

class ApplicationAppBar extends StatelessWidget {
  const ApplicationAppBar({super.key, required this.headingText});
  final String headingText;


  @override
  Widget build(BuildContext context) {
    return ResponsiveAppBar(
        mobile: const AppBarMobile(),
        web: AppBarWeb(
          headingText: headingText,
        ),
        tablet: const AppBarTab());
  }
}

/// Sm App Bar
class ApplicationSMAppBar extends StatelessWidget {
  const ApplicationSMAppBar({super.key, required this.headingText,required this.body,});
  final String headingText;
  final List<Widget> body;


  @override
  Widget build(BuildContext context) {
    return ResponsiveAppBar(
        mobile: const AppBarMobile(),
        web: SmAppBar(
          headingText: headingText, body: body,

        ),
        tablet: const AppBarTab());
  }
}
