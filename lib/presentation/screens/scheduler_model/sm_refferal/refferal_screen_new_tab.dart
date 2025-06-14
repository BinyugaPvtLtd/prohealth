import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_archieved_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_move_to_intake_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/curate_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_auto_sync_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_merge_duplicate_screen.dart';
import 'package:provider/provider.dart';
import '../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../app/resources/value_manager.dart';
import '../sm_Intake/intake_main_screen.dart';

class RefferalScreenNewTab extends StatefulWidget {
  final VoidCallback onPressedMoveTointake;
  const RefferalScreenNewTab({super.key, required this.onPressedMoveTointake});

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
    _tabPageController.jumpToPage(
      index,
    //  duration: const Duration(milliseconds: 500),
  //    curve: Curves.ease,
    );
  }
  bool isShowingReferalEyePageview = false;
  bool isShowingMergeDuplicatePageview = false;
  bool isShowingAutoSyncPageview = false;
  bool isShowingCuratePageview = false;
  void switchToEyePageviweScreen() {
    setState(() {
      isShowingReferalEyePageview = true;
    });
  }

  void goBackToInitialScreen() {
    setState(() {
      isShowingReferalEyePageview = false;
    });
  }

  void switchToMergeDuplicateScreen() {
    setState(() {
      isShowingMergeDuplicatePageview = true;
    });
  }

  void goBackToInitialRPendingScreen() {
    setState(() {
      isShowingMergeDuplicatePageview = false;
    });
  }

  void switchToAutoSyncPageviweScreen() {
    setState(() {
      isShowingAutoSyncPageview = true;
    });
  }

  void goBackToInitialScreenFromAuto() {
    setState(() {
      isShowingAutoSyncPageview = false;
    });
  }

  void switchToCuratePageviweScreen() {
    setState(() {
      isShowingCuratePageview = true;
    });
  }

  void goBackToInitialScreenFromCurate() {
    setState(() {
      isShowingCuratePageview = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final providerState = Provider.of<SmIntakeProviderManager>(context, listen: false);
    final providerReferrals = Provider.of<DiagnosisProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body:isShowingCuratePageview
          ? CurateScreen(
        onCurateBackPressed: goBackToInitialScreenFromCurate,
      ) : isShowingReferalEyePageview ?
      ReferalPendingEyePageview(onGoBackPressed: (){
        providerState.toogleAppBar();
        goBackToInitialScreen();
        providerReferrals.passPatientIdClear();
        providerState.toogleEyeScreenProvider();
        },) :
      isShowingMergeDuplicatePageview ?
          RPMergeDuplicateScreen(onMergeBackPressed: (){
            goBackToInitialRPendingScreen();
            providerReferrals.passPatientIdClear();
          })
          : isShowingAutoSyncPageview ?
          RPAutoSyncScreen(
            onAutoBackPressed: (){
              providerState.toogleAppBar();
              goBackToInitialScreenFromAuto();
              providerReferrals.passPatientIdClear();
              providerState.toogleAutoSyncScreenProvider();
            },
            onCuratePressed: () {
              switchToCuratePageviweScreen();
            },
          )
     : Column(
        children: [
          /// Tab bar
          Container(
            margin: EdgeInsets.only(bottom: AppPadding.p8,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SMTabbar(
                    width: 100,
                    onTap: (int index) {
                      _selectButton(0);
                    },
                    index: 0,
                    grpIndex: _selectedIndex,
                    heading: "Pending",
                ),
               // SizedBox(width: 20),
                SMTabbar(
                  width: 100,
                    onTap: (int index) {
                      _selectButton(1);
                    },
                    index: 1,
                    grpIndex: _selectedIndex,
                    heading: "Moved to Intake",
                ),
               // SizedBox(width: 20),
                SMTabbar(
                  width: 100,
                  onTap: (int index) {
                    _selectButton(2);
                  },
                  index: 2,
                  grpIndex: _selectedIndex,
                  heading: "Archived",
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
                RefferalPendingScreen(onEyeButtonPressed: (){
                  providerState.toogleAppBar();
                  switchToEyePageviweScreen();
                  providerState.toogleEyeScreenProvider();
                },
                  onMergeDuplicatePressed: switchToMergeDuplicateScreen,
                  onMoveToIntake: widget.onPressedMoveTointake,
                  onAutoSyncPressed: (){
                                  switchToAutoSyncPageviweScreen();
                                },),
                RefferalMoveToIntakeScreen(onEyeButtonPressed: (){
                  providerState.toogleAppBar();
                  switchToEyePageviweScreen();
                  providerState.toogleEyeScreenProvider();
                },onMergeDuplicatePressed: switchToMergeDuplicateScreen,),
                RefferalArchievedScreen(onEyeButtonPressed:(){
                  providerState.toogleAppBar();
                  switchToEyePageviweScreen();
                },)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
