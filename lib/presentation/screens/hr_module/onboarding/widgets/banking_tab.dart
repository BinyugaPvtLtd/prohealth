import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/acknowledgement.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/health_record_tab.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/widgets/banking_tab_constant.dart';

import '../../../../../../app/resources/value_manager.dart';
import '../../manage/widgets/child_tabbar_screen/qualifications_child/employment_child_tabbar.dart';

///prachi
class Banking extends StatelessWidget {
  const Banking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              BankingTabContainerConstant(),
              SizedBox(
                height: AppSize.s8,
              )
            ],
          );
        });
  }
}


class HealthRecord extends StatelessWidget {
  const HealthRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              HealthRecordConstant(),
              SizedBox(
                height: AppSize.s8,
              )
            ],
          );
        });
  }
}

class Acknowledgement extends StatelessWidget {
  const Acknowledgement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              AcknowledgementTab(),
              SizedBox(
                height: AppSize.s8,
              )
            ],
          );
        });
  }
}