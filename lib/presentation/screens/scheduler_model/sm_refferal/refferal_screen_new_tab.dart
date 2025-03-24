import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_archieved_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_move_to_intake_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_screen.dart';

import '../../../../app/resources/value_manager.dart';
import '../sm_Intake/intake_main_screen.dart';

class RefferalScreenNewTab extends StatefulWidget {
  const RefferalScreenNewTab({super.key});

  @override
  State<RefferalScreenNewTab> createState() => _RefferalScreenNewTabState();
}

class _RefferalScreenNewTabState extends State<RefferalScreenNewTab> {
  final PageController _tabPageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Tab bar
          Container(
            margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SMTabbar(
                    onTap: (int index) {
                      _selectButton(0);
                    },
                    index: 0,
                    grpIndex: _selectedIndex,
                    heading: "Pending",
                ),
                SizedBox(width: 20),
                SMTabbar(
                    onTap: (int index) {
                      _selectButton(1);
                    },
                    index: 1,
                    grpIndex: _selectedIndex,
                    heading: "Move to Intake",
                ),
                SizedBox(width: 20),
                SMTabbar(
                  onTap: (int index) {
                    _selectButton(2);
                  },
                  index: 2,
                  grpIndex: _selectedIndex,
                  heading: "Archieved",
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
                RefferalPendingScreen(),
                RefferalMoveToIntakeScreen(),
                RefferalArchievedScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
