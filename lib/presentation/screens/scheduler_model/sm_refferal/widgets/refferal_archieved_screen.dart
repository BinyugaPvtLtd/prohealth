import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalArchievedScreen extends StatefulWidget {
  const RefferalArchievedScreen({super.key});

  @override
  State<RefferalArchievedScreen> createState() => _RefferalArchievedScreenState();
}

class _RefferalArchievedScreenState extends State<RefferalArchievedScreen> {
  bool _isFilterOpen = false; // Track filter panel state

  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen; // Toggle panel visibility
    });
  }
  List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
