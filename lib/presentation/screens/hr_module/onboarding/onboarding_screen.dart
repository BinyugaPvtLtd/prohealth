import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/controller/controller.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/onboarding_tab_bar_const.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/banking_tab.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/genaral_tab.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/health_record_tab.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/qualification_tab.dart';
import 'package:prohealth/presentation/widgets/profile_bar/profile_bar.dart';

///prachi
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 99),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// green blue container
        ProfileBar(),
        SizedBox(
          height: MediaQuery.of(context).size.width / 88,
        ),
        OnboardingTabBar(OnboardingController(tabs: [
          Tab(text: 'General'),
          Tab(text: 'Qualification'),
          Tab(text: 'Banking'),
          Tab(text: 'Health Record'),
        ], tabViews: [
          OnboardingGeneral(),
          OnboardingQualification(),
          Banking(),
          HealthRecordTab()
        ]))
      ]),
    );
  }
}
