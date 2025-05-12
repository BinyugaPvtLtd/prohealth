import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:prohealth/presentation/screens/referal_resource_module/referal_resource_desktop.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/sm_intake_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_calender/sm_calender.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/sm_dashboard_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/widgets/sub_widgets/highest_code_view_more.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_live_view/sm_live_view_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/refferal_screen_new_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/resources/color.dart';
import '../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../app/resources/value_manager.dart';
import '../../../widgets/app_bar/app_bar.dart';
import '../../../widgets/widgets/const_appbar/controller.dart';
import '../../hr_module/hr_home_screen/referesh_provider.dart';
import '../../hr_module/manage/widgets/bottom_row.dart';
import '../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../sm_Intake/intake_main_screen.dart';
import '../sm_scheduler/widget/schedular/schedular_new_screen.dart';
import '../sm_scheduler/widget/schedular/widget/tab_widget/auto_tab.dart';

class SMDesktopScreen extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onItem2Selected;

  SMDesktopScreen({this.onChanged,this.onItem2Selected,});

  @override
  State<SMDesktopScreen> createState() => _SMDesktopScreenState();
}

class _SMDesktopScreenState extends State<SMDesktopScreen> {
  final PageController _pageController = PageController();

  final SMController smController = Get.put(SMController());

  final HRController hrController = Get.put(HRController());

  String selectedOption = 'Select';

  bool showSelectOption = true;
  int pgeControllerId = 0;

  final ButtonSelectionSMController myController = Get.put(ButtonSelectionSMController());
  bool isShowingReferalEyePageview = false;
  bool isShowingMergeDuplicatePageview = false;
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

  void navigateToPage2() {
    if (_pageController.page != 2) {
      _pageController.animateToPage(
        2,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
  @override
  void initState() {
    super.initState();
    // _loadIndex();
  }
  bool _showHighestCaseViewMoreScreen = false;
  bool _showHighesClinicianTypeViewMoreScreen = false;
  bool _showAutoScreen = false;
  void onPageChanged(int index) {
    Provider.of<PageIndexProvider>(context, listen: false).setIndex(index);
  }
  void _goBack() {
    if (pgeControllerId > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        pgeControllerId--;
      });
    }
  }
  Future<bool> _onWillPop() async {
    if (pgeControllerId == 0) {
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      // return false; // Prevent the default back navigation
    }else if(pgeControllerId == 1){
      myController.selectButton(0);
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }else if(pgeControllerId == 2){
      myController.selectButton(1);
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }else if(pgeControllerId == 3){
      myController.selectButton(2);
      _pageController.animateToPage(2,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }else if(pgeControllerId == 4){
      myController.selectButton(3);
      _pageController.animateToPage(3,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }else if(pgeControllerId == 5){
      myController.selectButton(4);
      _pageController.animateToPage(4,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }
    else if(pgeControllerId == 6){
      myController.selectButton(5);
      _pageController.animateToPage(5,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);
      return false;
    }
    return true; // Allow the back navigation to exit the app
  }
  Future<void> _loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pgeControllerId = prefs.getInt('currentIndex') ?? 0;
      print('pageIndex ${pgeControllerId}');
      myController.selectButton(pgeControllerId);
      pageChanges(pgeControllerId);
      // Default to 0 if not found
      //  _pageController.jumpToPage(pgeControllerId); // Jump to the saved index
    });
  }
  void pageChanges(int pageIndex){
    _pageController.animateToPage(pgeControllerId,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease);
  }
  Future<void> _saveIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentIndex', index);
  }
  TextEditingController assigndatecontroller = TextEditingController();


  ///checkbox
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer<SmIntakeProviderManager>(
        builder: (context, providerState, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              Column(
                children: [
                    ApplicationSMAppBar(headingText: "Scheduling Manager",
                      body:providerContact.isAppVarVisible ?[]:[
                     Expanded(
                       child: Obx(
                             () => Padding(
                           padding: const EdgeInsets.only(left:0),
                           child: CustomTitleButtonsm(
                             height: AppSize.s30,
                             width: AppSize.s100,
                             onPressed: () {
                               //companyAll(context);
                               myController.selectButton(0);
                               _pageController.jumpToPage(0,
                                 // duration: Duration(milliseconds: 500),
                                 // curve: Curves.ease
                               );
                               onPageChanged(0);
                               pgeControllerId = 0;
                               providerContact.toogleContactProviderclear();
                             },
                             text: 'Dashboard',
                             isSelected: myController.selectedIndex.value == 0,
                           ),
                         ),
                       ),
                     ),
                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),
                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(1);
                             _pageController.jumpToPage(1,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(1);
                             pgeControllerId = 1;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Referrals',
                           isSelected: myController.selectedIndex.value == 1,
                         ),
                       ),
                     ),
                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),
                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(2);
                             _pageController.jumpToPage(2,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(2);
                             pgeControllerId = 2;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Intake',
                           isSelected: myController.selectedIndex.value == 2||myController.selectedIndex.value == 7,
                         ),
                       ),
                     ),

                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),

                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(3);
                             _pageController.jumpToPage(3,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(3);
                             pgeControllerId = 3;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Scheduler',
                           isSelected: myController.selectedIndex.value == 3,
                         ),
                       ),
                     ),
                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),
                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(4);
                             _pageController.jumpToPage(4,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(4);
                             pgeControllerId = 4;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Calender',
                           isSelected: myController.selectedIndex.value == 4,
                         ),
                       ),
                     ),
                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),

                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(5);
                             _pageController.jumpToPage(5,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(5);
                             pgeControllerId = 5;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Live View',
                           isSelected: myController.selectedIndex.value == 5,
                         ),
                       ),
                     ),
                     // SizedBox(
                     //   width: AppSize.s80,
                     // ),
                     Expanded(
                       child: Obx(
                             () => CustomTitleButtonsm(
                           height: AppSize.s30,
                           width: AppSize.s140,
                           onPressed: () {

                             //companyByIdApi(context,);
                             // companyDetailsApi(context,5);
                             myController.selectButton(6);
                             _pageController.jumpToPage(6,
                               // duration: Duration(milliseconds: 500),
                               // curve: Curves.ease
                             );
                             onPageChanged(6);
                             pgeControllerId = 6;
                             providerContact.toogleContactProviderclear();
                           },
                           text: 'Requests',
                           isSelected: myController.selectedIndex.value == 6,
                         ),
                       ),
                     ),

                   ],),



                  ///2nd  buttons
                  // _showAutoScreen
                  //     ? SizedBox(height: 30,)
                  //     : Container(
                  // color: Colors.pink,
                  //   margin: const EdgeInsets.symmetric(vertical: AppPadding.p20, horizontal: AppPadding.p40),
                  //   child:
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Expanded(
                  //         child: Obx(
                  //               () => Padding(
                  //                 padding: const EdgeInsets.only(left:27),
                  //                 child: CustomTitleButton(
                  //                                           height: AppSize.s30,
                  //                                           width: AppSize.s100,
                  //                                           onPressed: () {
                  //                 //companyAll(context);
                  //                 myController.selectButton(0);
                  //                 _pageController.jumpToPage(0,
                  //                     // duration: Duration(milliseconds: 500),
                  //                     // curve: Curves.ease
                  //                 );
                  //                 onPageChanged(0);
                  //                 pgeControllerId = 0;
                  //                 providerContact.toogleContactProviderclear();
                  //                                           },
                  //                                           text: 'Dashboard',
                  //                                           isSelected: myController.selectedIndex.value == 0,
                  //                                         ),
                  //               ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(1);
                  //               _pageController.jumpToPage(1,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(1);
                  //               pgeControllerId = 1;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Referrals',
                  //             isSelected: myController.selectedIndex.value == 1,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(2);
                  //               _pageController.jumpToPage(2,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(2);
                  //               pgeControllerId = 2;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Intake',
                  //             isSelected: myController.selectedIndex.value == 2||myController.selectedIndex.value == 7,
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(3);
                  //               _pageController.jumpToPage(3,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(3);
                  //               pgeControllerId = 3;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Scheduler',
                  //             isSelected: myController.selectedIndex.value == 3,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(4);
                  //               _pageController.jumpToPage(4,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(4);
                  //               pgeControllerId = 4;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Calender',
                  //             isSelected: myController.selectedIndex.value == 4,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(5);
                  //               _pageController.jumpToPage(5,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(5);
                  //               pgeControllerId = 5;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Live View',
                  //             isSelected: myController.selectedIndex.value == 5,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: AppSize.s80,
                  //       ),
                  //       Expanded(
                  //         child: Obx(
                  //               () => CustomTitleButton(
                  //             height: AppSize.s30,
                  //             width: AppSize.s140,
                  //             onPressed: () {
                  //
                  //               //companyByIdApi(context,);
                  //               // companyDetailsApi(context,5);
                  //               myController.selectButton(6);
                  //               _pageController.jumpToPage(6,
                  //                   // duration: Duration(milliseconds: 500),
                  //                   // curve: Curves.ease
                  //               );
                  //               onPageChanged(6);
                  //               pgeControllerId = 6;
                  //               providerContact.toogleContactProviderclear();
                  //             },
                  //             text: 'Requests',
                  //             isSelected: myController.selectedIndex.value == 6,
                  //           ),
                  //         ),
                  //       ),
                  //       //Expanded(child: Container(),flex: 2,)
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    flex: 8,
                    child: _showHighestCaseViewMoreScreen
                    ? HigestCaseViewMoreScreen(
                      onGoBackHigestCase:  () {
                        setState(() {
                          _showHighestCaseViewMoreScreen = false; // Show PageView
                        });
                      },
                    )
                    : _showHighesClinicianTypeViewMoreScreen
                    ? HigestCaseClinicianTypeViewScreen(
                      onGoBackClinicianType: () {
                        setState(() {
                          _showHighesClinicianTypeViewMoreScreen = false; // Show PageView
                        });
                      },)
                    : _showAutoScreen
                    ? Auto_Assign(
                      onGoBackAuto: (){
                        setState(() {
                          _showAutoScreen = false;
                        });
                      },
                    )
                    : PageView(
                      controller: _pageController,
                      onPageChanged: (index){
                        myController.selectButton(index);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SMDashboardScreen(pageController: _pageController,
                          onViewMoreTap: () {
                            setState(() {
                              _showHighestCaseViewMoreScreen = true; // Show view-more screen
                            });
                          },
                        onViewMoreClinicianTypeTap: (){
                          setState(() {
                            _showHighesClinicianTypeViewMoreScreen = true; // Show view-more screen
                          });
                        },
                          onAutoTap: (){
                            setState(() {
                              _showAutoScreen = true; // Show view-more screen
                            });
                          },
                        ),
                        RefferalScreenNewTab(onPressedMoveTointake: () {
                          //companyByIdApi(context,);
                          // companyDetailsApi(context,5);
                          myController.selectButton(2);
                          _pageController.jumpToPage(2,
                            // duration: Duration(milliseconds: 500),
                            // curve: Curves.ease
                          );
                          onPageChanged(2);
                          pgeControllerId = 2;
                          providerContact.toogleContactProviderclear();
                        },),
                        IntakeMainScreen(intakeFlowSelected: () { setState(() {
                          myController.selectButton(7);
                          _pageController.jumpToPage(7,
                              // duration: Duration(milliseconds: 500),
                              // curve: Curves.ease
                          );
                          onPageChanged(7);
                          pgeControllerId = 7;
                        }); },),
                       // SMIntakeScreen(),
                        NewSchedulerScreen(),
                        SmCalenderScreen(),
                        SmLiveViewMapScreen(),
                        Container(color:Colors.white),
                        SMIntakeScreen(onGoBackPressed: () {
                          //Navigator.pop(context);
                        }, patientId: 0,)


                        // WhitelabellingScreen()
                      ],
                    ),
                  ),
                  BottomBarRow()
                ],
              ),
              if (providerState.isFilterOpen)
                GestureDetector(
                  onTap: providerState.toggleFilter,
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color:
                    Colors.black.withOpacity(0.0), // Invisible but catches taps
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                right: providerState.isFilterOpen ? -0 : -320, // Slide in/out effect
                top: 80,
                bottom: 0,
                child: Container(
                  width: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: SingleChildScrollView(
                    // Wrap the Column inside SingleChildScrollView
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: providerState.toggleFilter,
                                child: Row(
                                  children: [
                                    Icon(Icons.menu_open),
                                    SizedBox(width: AppSize.s10),
                                    Text(
                                      "Filters",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // TextButton(onPressed: (){}, child: Text("CLEAR ALL"))
                            ],
                          ),
                        ),
                        Divider(),
                        // Example filter fields
                        InkWell(
                          onTap: providerState.toggleContainerM,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Marketer",
                                  style: AllHRTableData.customTextStyle(context),
                                ),
                                Icon(
                                  providerState.MContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.MContainerVisible ? 0 : 0,
                          width: 300,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: providerState.MContainerVisible
                              ? Text(
                            'Container is Open',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                              : null,
                        ),
                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerO,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Received Date",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.OContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.OContainerVisible ? 0 : 0,
                          width: 300,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: providerState.OContainerVisible
                              ? Text(
                            'Container is Open',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                              : null,
                        ),
                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerR,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Referral Source",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.RContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.RContainerVisible ? 300 : 0,
                          width: 300,
                          // color: Colors.grey,
                          // alignment: Alignment.center,
                          child: providerState.RContainerVisible
                              ? Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  prefixIcon: Icon(Icons.search,
                                      size: 20, color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Set the color of the bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Set the color when focused
                                  ),
                                  //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                ),
                                onChanged: (value) {
                                  // Handle search logic here (e.g., filtering options)
                                },
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       _isChecked = !_isChecked;  // Toggle checkbox state
                              //     });
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //    //   shape: BoxShape.,
                              //       color:  Colors.transparent, // Checked or unchecked background color
                              //       border: Border.all(color: Colors.blue), // Border color of the circle
                              //     ),
                              //     padding: EdgeInsets.all(10),
                              //     child: _isChecked
                              //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                              //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                              //   ),
                              // ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Lorem Ipsum',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                            ],
                          )
                              : null,
                        ),
                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerA,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Agency",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.AContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.AContainerVisible ? 0 : 0,
                          width: 300,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: providerState.AContainerVisible
                              ? Text(
                            'Container is Open',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                              : null,
                        ),
                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerI,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Insurance",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.IContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.IContainerVisible ? 0 : 0,
                          width: 300,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: providerState.IContainerVisible
                              ? Text(
                            'Container is Open',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                              : null,
                        ),
                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerIC,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Insurance Category",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.ICContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.ICContainerVisible ? 310 : 0,
                          width: 300,
                          // color: Colors.blue,
                          // alignment: Alignment.center,
                          child: providerState.ICContainerVisible
                              ? Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  prefixIcon: Icon(Icons.search,
                                      size: 20, color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Set the color of the bottom border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey), // Set the color when focused
                                  ),
                                  //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                ),
                                onChanged: (value) {
                                  // Handle search logic here (e.g., filtering options)
                                },
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       _isChecked = !_isChecked;  // Toggle checkbox state
                              //     });
                              //   },
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //    //   shape: BoxShape.,
                              //       color:  Colors.transparent, // Checked or unchecked background color
                              //       border: Border.all(color: Colors.blue), // Border color of the circle
                              //     ),
                              //     padding: EdgeInsets.all(10),
                              //     child: _isChecked
                              //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                              //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                              //   ),
                              // ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Medicare',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Private Med Advantage',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Kaiser',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Medi-Cal',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Private Commercial',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'LOA',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'ProBono',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    splashRadius: 0,
                                    activeColor: ColorManager.blueprime,
                                    value: _isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Other',
                                    style: DocDefineTableDataID.customTextStyle(
                                        context),
                                  ),
                                ],
                              ),
                            ],
                          )
                              : null,
                        ),

                        Divider(),
                        InkWell(
                          onTap: providerState.toggleContainerP,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Potential Discharge Date",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.PContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 30),
                          height: providerState.PContainerVisible ? 100 : 0,
                          width: 300,
                          // color: Colors.blue,
                          // alignment: Alignment.center,
                          child: providerState.PContainerVisible
                              ? Column(children: [
                            TextField(
                              controller: assigndatecontroller,
                              style: TextStyle(fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Date Range',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color of the bottom border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color when focused
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                              ),
                              onChanged: (value) {
                                // Handle search logic here (e.g., filtering options)
                              },
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1901),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  assigndatecontroller.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                                }
                              },
                            ),
                          ])
                              : null,
                        ),
                        Divider(),
                        // Example filter fields
                        InkWell(
                          onTap: providerState.toggleContainerM,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Physician",
                                    style: AllHRTableData.customTextStyle(context)),
                                Icon(
                                  providerState.MContainerVisible
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: ColorManager.mediumgrey,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
        }
      ),
    );
  }
}


class SMController extends GetxController {
  var selectedItem = 'Admin'.obs;
  void changeSelectedItem(String newItem) {
    selectedItem.value = newItem;
  }
}

class ButtonSelectionSMController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void selectButton(int index) {
    selectedIndex.value = index;
  }
}
