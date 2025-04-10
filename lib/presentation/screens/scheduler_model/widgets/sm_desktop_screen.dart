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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Column(
            children: [
              const ApplicationSMAppBar(headingText: "Scheduling Manager"),
              ///2nd  buttons
              _showAutoScreen
                  ? SizedBox(height: 30,)
                  : Container(
               // color: Colors.pink,
                margin: const EdgeInsets.symmetric(vertical: AppPadding.p20, horizontal: AppPadding.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: CustomTitleButton(
                                                        height: AppSize.s30,
                                                        width: AppSize.s100,
                                                        onPressed: () {
                              //companyAll(context);
                              myController.selectButton(0);
                              _pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                              onPageChanged(0);
                              pgeControllerId = 0;
                                                        },
                                                        text: 'Dashboard',
                                                        isSelected: myController.selectedIndex.value == 0,
                                                      ),
                            ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s80,
                    ),
                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(1);
                            _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(1);
                            pgeControllerId = 1;
                          },
                          text: 'Referrals',
                          isSelected: myController.selectedIndex.value == 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s80,
                    ),
                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(2);
                            _pageController.animateToPage(2,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(2);
                            pgeControllerId = 2;
                          },
                          text: 'Intake',
                          isSelected: myController.selectedIndex.value == 2||myController.selectedIndex.value == 7,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: AppSize.s80,
                    ),

                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(3);
                            _pageController.animateToPage(3,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(3);
                            pgeControllerId = 3;
                          },
                          text: 'Scheduler',
                          isSelected: myController.selectedIndex.value == 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s80,
                    ),
                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(4);
                            _pageController.animateToPage(4,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(4);
                            pgeControllerId = 4;
                          },
                          text: 'Calender',
                          isSelected: myController.selectedIndex.value == 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s80,
                    ),

                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(5);
                            _pageController.animateToPage(5,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(5);
                            pgeControllerId = 5;
                          },
                          text: 'Live View',
                          isSelected: myController.selectedIndex.value == 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppSize.s80,
                    ),
                    Expanded(
                      child: Obx(
                            () => CustomTitleButton(
                          height: AppSize.s30,
                          width: AppSize.s140,
                          onPressed: () {

                            //companyByIdApi(context,);
                            // companyDetailsApi(context,5);
                            myController.selectButton(6);
                            _pageController.animateToPage(6,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                            onPageChanged(6);
                            pgeControllerId = 6;
                          },
                          text: 'Requests',
                          isSelected: myController.selectedIndex.value == 6,
                        ),
                      ),
                    ),
                    //Expanded(child: Container(),flex: 2,)
                  ],
                ),
              ),
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
                    RefferalScreenNewTab(),
                    IntakeMainScreen(intakeFlowSelected: () { setState(() {
                      myController.selectButton(7);
                      _pageController.animateToPage(7,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                      onPageChanged(7);
                      pgeControllerId = 7;
                    }); },),
                   // SMIntakeScreen(),
                    NewSchedulerScreen(),
                    SmCalenderScreen(),
                    SmLiveViewMapScreen(),
                    Container(color:Colors.white),
                    SMIntakeScreen(onGoBackPressed: () {
                      // Navigator.pop(context);
                    }, patientId: 0,)


                    // WhitelabellingScreen()
                  ],
                ),
              ),
              BottomBarRow()
            ],
          ),
        ]),
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
