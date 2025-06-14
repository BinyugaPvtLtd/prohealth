import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/pending_page.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/scheduled_page.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/soc_page.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/tab_widget/schedular_pending_patient_details.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../widgets/app_clickable_widget.dart';
import '../../../../em_module/company_identity/company_identity_screen.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';

class NewSchedulerScreen extends StatefulWidget {
  const NewSchedulerScreen({super.key});

  @override
  State<NewSchedulerScreen> createState() => _NewSchedulerScreenState();
}

class _NewSchedulerScreenState extends State<NewSchedulerScreen> {


  final PageController _tabPageController = PageController();
  int _selectedIndex = 0;

  void _selectButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _tabPageController.jumpToPage(
      index,
      // duration: Duration(milliseconds: 100),
      // curve: Curves.ease,
    );
  }
  bool _showAutoScreen = false;
  bool isShowingPatientsDetailsPageview = false;
  bool isShowingMergeDuplicatePageview = false;
  void switchToPatientsDetailsPageviweScreen() {
    setState(() {
      isShowingPatientsDetailsPageview = true;
    });
  }

  void goBackToInitialScreen() {
    setState(() {
      isShowingPatientsDetailsPageview = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final providerState = Provider.of<SmIntakeProviderManager>(context, listen: false);
    final providerReferrals = Provider.of<DiagnosisProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: isShowingPatientsDetailsPageview ?
      SchedularPendingPatientDetails(onMergeBackPressed: (){
       // providerState.toogleAppBar();
        goBackToInitialScreen();
      },)
       : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMTabbar(onTap: (int index){
                _selectButton(0);
              }, index: 0, grpIndex: _selectedIndex, heading: "Pending", ),
              SizedBox(width: 10),
              SMTabbar(onTap: (int index){
                _selectButton(1);
              }, index: 1, grpIndex: _selectedIndex, heading: "To Be Scheduled"),
              SizedBox(width: 10),
              SMTabbar(onTap: (int index){
                _selectButton(2);
              }, index: 2, grpIndex: _selectedIndex, heading: "Scheduled"),
              // SMTabbar(onTap: (int index){
              //   _selectButton(3);
              // }, index: 3, grpIndex: _selectedIndex, heading: "ROC",),
              // SMTabbar(onTap: (int index){
              //   _selectButton(4);
              // }, index: 4, grpIndex: _selectedIndex, heading: "Overdue",badgeNumber: 55),
              // SMTabbar(onTap: (int index){
              //   _selectButton(5);
              // }, index: 5, grpIndex: _selectedIndex, heading: "Completed"),
              // SMTabbar(onTap: (int index){
              //   _selectButton(6);
              // }, index: 6, grpIndex: _selectedIndex, heading: "History"),

            ],
          ),
          Expanded(
            flex: 1,
            // child: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 70),
              child: NonScrollablePageView(
                controller: _tabPageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: [
                  // Page 1
                  PendingPageView(
                    onAutoTap: (){
                     // providerState.toogleAppBar();
                      switchToPatientsDetailsPageviweScreen();
                    },
                  ),
                  SocPageView(
                    onAutoTap: (){
                     // providerState.toogleAppBar();
                      switchToPatientsDetailsPageviweScreen();
                    },
                  ),
                  ScheduledPageView(),
                ],
              ),
            // ),
          )
        ],
      ),
    );
  }
}







typedef void OnManuButtonTapCallBack(int index);



class SMTabbar extends StatelessWidget {
  const SMTabbar({
    super.key,
    required this.onTap,
    required this.index,
    required this.grpIndex,
    required this.heading,
  });

  final OnManuButtonTapCallBack onTap;
  final int index;
  final int grpIndex;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return AppClickableWidget(
      onTap: () {
        onTap(index);
      },
      onHover: (bool val) {},
      child: Column(
        children: [
          Container(
            width: 130, // Fixed width for the heading container
            height: 40, // Fixed height for the heading container
            child: Align(
              alignment: Alignment.center, // Align text to the left
              child: Text(
                heading,
                style: TextStyle(
                  fontSize: FontSize.s14,
                  fontWeight: grpIndex == index
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: grpIndex == index
                      ? ColorManager.blueprime
                      : ColorManager.mediumgrey,
                ),
              ),
            ),
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
               // margin: const EdgeInsets.symmetric(vertical: 5),
                height: 2,
                width: textWidth + 60, // Adjust padding around text
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






///batch number
// class SMTabbar extends StatelessWidget {
//   const SMTabbar({
//     super.key,
//     required this.onTap,
//     required this.index,
//     required this.grpIndex,
//     required this.heading,
//     this.badgeNumber, // Optional badge number parameter
//   });
//
//   final OnManuButtonTapCallBack onTap;
//   final int index;
//   final int grpIndex;
//   final String heading;
//   final int? badgeNumber; // Badge number is optional
//
//   @override
//   Widget build(BuildContext context) {
//     return AppClickableWidget(
//       onTap: () {
//         onTap(index);
//       },
//       onHover: (bool val) {},
//       child: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none, // Allows badge to overflow
//             children: [
//               Container(
//                 width: 100, // Fixed width for the heading container
//                 height: 40, // Fixed height for the heading container
//                 child: Align(
//                   alignment: Alignment.center, // Align text to the left
//                   child: Text(
//                     heading,
//                     style: TextStyle(
//                       fontSize: FontSize.s14,
//                       fontWeight: grpIndex == index
//                           ? FontWeight.w700
//                           : FontWeight.w500,
//                       color: grpIndex == index
//                           ? ColorManager.blueprime
//                           : ColorManager.mediumgrey,
//                     ),
//                   ),
//                 ),
//               ),
//               if (badgeNumber != null) // Only show badge if badgeNumber is not null
//                 Positioned(
//                  // top: -5, // Adjust position of the badge
//                   right: -5, // Adjust position of the badge
//                   child: Container(
//                     padding: EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: ColorManager.blueprime, // Badge color
//                       borderRadius: BorderRadius.circular(7), // Rounded badge
//                     ),
//                     child: Text(
//                       badgeNumber!.toString(),
//                       style: TextStyle(
//                         fontSize: FontSize.s10, // Adjust font size
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // Badge text color
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               final textPainter = TextPainter(
//                 text: TextSpan(
//                   text: heading,
//                   style: TextStyle(
//                     fontSize: FontSize.s14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 textDirection: TextDirection.ltr,
//               )..layout();
//
//               final textWidth = textPainter.size.width;
//
//               return Container(
//                 margin: const EdgeInsets.symmetric(vertical: 5),
//                 height: 2,
//                 width: textWidth + 100, // Adjust padding around text
//                 color: grpIndex == index
//                     ? ColorManager.blueprime
//                     : Colors.transparent,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }








