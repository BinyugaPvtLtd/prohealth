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
import '../../../../app/constants/app_config.dart';
import '../../../../app/resources/color.dart';
import '../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../app/resources/value_manager.dart';
import '../../../../app/services/api/managers/establishment_manager/all_from_hr_manager.dart';
import '../../../../app/services/api/managers/sm_module_manager/refferals_manager/master_patient_manager.dart';
import '../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../data/api_data/establishment_data/all_from_hr/all_from_hr_data.dart';
import '../../../../data/api_data/sm_data/sm_model_data/referral_service_data.dart';
import '../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../widgets/app_bar/app_bar.dart';
import '../../../widgets/widgets/const_appbar/controller.dart';
import '../../hr_module/hr_home_screen/referesh_provider.dart';
import '../../hr_module/manage/widgets/bottom_row.dart';
import '../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../sm_Intake/intake_main_screen.dart';
import '../sm_scheduler/widget/schedular/schedular_new_screen.dart';
import '../sm_scheduler/widget/schedular/widget/tab_widget/auto_tab.dart';
import '../sm_scheduler/widget/schedular_create/widget/calender_const.dart';

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
    loadInitialData();

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

  List<PatientRefferalSourcesData> patientRefferalSourcesData = [];
  List<PatientPhysicianMasterData> patientPhysicianMasterData = [];
  List<PatientMarketerData> hRAllData = [];
  List<bool> _isCheckedList = [];
  List<bool> _isCheckedListMaster = [];
  List<bool> _physicianList = [];
  List<PatientModel> _parientModel = [];
  int _totalPatients = 0;
  
  Future<void> loadInitialData() async {
    hRAllData = await getMarketerWithDeptId( context: context, deptId: AppConfig.salesId);
    patientRefferalSourcesData = await getPatientreferralsMaster(context: context,);
    patientPhysicianMasterData = await getPatientPhysicianMaster(context: context);
    _parientModel =  await getPatientReffrealsData(context: context, pageNo:1 , nbrOfRows: 20, isIntake: 'true', isArchived: 'false', isScheduled: 'false', searchName: 'all',
        marketerId: "all",
        referralSourceId: "all", pcpId:"all");
    _isCheckedList = List<bool>.filled(patientRefferalSourcesData.length, false);
    _isCheckedListMaster = List<bool>.filled(hRAllData.length, false);
    _physicianList = List<bool>.filled(patientPhysicianMasterData.length, false);
    _totalPatients = _parientModel.length;
  }
  ///checkbox
  bool _isChecked = false;
  bool isShowingCalenderPageview = false;
  void switchToCalenderPageviweScreen() {
    setState(() {
      isShowingCalenderPageview  = true;
    });
  }

  void goBackToInitialFromCalenderScreen() {
    setState(() {
      isShowingCalenderPageview  = false;
    });
  }

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
                             () => CustomTitleButtonsm(
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
                             () => Padding(
                               padding: const EdgeInsets.only(right: 20),
                               child: CustomTitleButtonsm(
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
                     ),


                   ],),

                  Expanded(
                    flex: 8,
                    child:  isShowingCalenderPageview ?
                    CalenderConstant(onBack: goBackToInitialFromCalenderScreen,) :
                    _showHighestCaseViewMoreScreen
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
                        }); }, patientInfoData: _totalPatients,),
                       // SMIntakeScreen(),
                        NewSchedulerScreen(),
                        SmCalenderScreen(onCalenderSearchPressed: switchToCalenderPageviweScreen,),
                        SmLiveViewMapScreen(),
                        Container(color:Colors.white),
                        SMIntakeScreen(onGoBackPressed: () {
                          //Navigator.pop(context);
                        },)


                        // WhitelabellingScreen()
                      ],
                    ),
                  ),
                  BottomBarRow()
                ],
              ),
              if (providerState.isFilterOpen)
                GestureDetector(
                  onTap: (){
                    _isCheckedList = List<bool>.filled(patientRefferalSourcesData.length, false);
                    _isCheckedListMaster = List<bool>.filled(hRAllData.length, false);
                    _physicianList = List<bool>.filled(patientPhysicianMasterData.length, false);
                    // providerState.filterIdIntegration(marketerId: 'all',
                    //     sourceId: 'all', pcpId: 'all');
                    providerState.toggleFilter();
                  },
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
                                          fontSize: 16, fontWeight: FontWeight.bold, color: ColorManager.mediumgrey,),
                                    ),

                                  ],
                                ),
                              ),
                             TextButton(onPressed: (){
                               _isCheckedList = List<bool>.filled(patientRefferalSourcesData.length, false);
                               _isCheckedListMaster = List<bool>.filled(hRAllData.length, false);
                               _physicianList = List<bool>.filled(patientPhysicianMasterData.length, false);
                               providerState.filterIdIntegration(marketerId: 'all',
                                   sourceId: 'all', pcpId: 'all', context: context);
                               //providerState.toggleFilter();
                             }, child: Text("CLEAR ALL"))
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
                                  style: Filterhead.customTextStyle(context),
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

                        StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState){
                              return  AnimatedContainer(
                                duration: Duration(milliseconds: 30),
                                //height: providerState.MContainerVisible ? 300 : 0,
                                width: 300,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: providerState.MContainerVisible
                                    ? ScrollConfiguration(
                                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                        ...List.generate(hRAllData.length, (index){
                                          return Row(
                                            children: [
                                              Checkbox(
                                                splashRadius: 0,
                                                activeColor: ColorManager.blueprime,
                                                value: _isCheckedListMaster[index],
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      if (value == true) {
                                                        // Uncheck all other checkboxes
                                                        for (int i = 0; i < _isCheckedListMaster.length; i++) {
                                                          _isCheckedListMaster[i] = false;
                                                        }
                                                        _isCheckedListMaster[index] = true;

                                                        // Call API only when a checkbox is checked
                                                        providerState.filterIdIntegration(
                                                          context: context,
                                                          marketerId: hRAllData[index].employeeTypesId.toString(),
                                                          marketerId: hRAllData[index].employeeTypeId.toString(),
                                                          sourceId: 'all',
                                                          pcpId: 'all',
                                                        );
                                                      }
                                                      // If value is false (unchecking), do nothing
                                                    });
                                                  }
                                                // onChanged: (bool? value) {
                                                //   setState(() {
                                                //     _isCheckedListMaster[index] = value!;
                                                //     providerState.filterIdIntegration(marketerId: patientPhysicianMasterData[index].phy_id.toString(),
                                                //         sourceId: 'all', pcpId: 'all');
                                                //   });
                                                // },
                                              ),
                                              Text(
                                                "${ hRAllData[index].firstName} ${hRAllData[index].lastName}",
                                                style: DocDefineTableDataID.customTextStyle(
                                                    context),
                                              ),
                                            ],
                                          );
                                        })

                                                                          ],
                                                                        ),
                                      ),
                                    )
                                    : null,
                              );}
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
                                    style: Filterhead.customTextStyle(context)),
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
                                    style: Filterhead.customTextStyle(context)),
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
                        ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState){
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 30),
                              height: providerState.RContainerVisible ? 300 : 0,
                              width: 300,
                              // color: Colors.grey,
                              // alignment: Alignment.center,
                              child: providerState.RContainerVisible
                                  ? SingleChildScrollView(
                                    child: Column(
                                                                  children: [
                                    TextField(
                                      style: DocumentTypeDataStyle.customTextStyle(context),
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
                                                                  ...List.generate(patientRefferalSourcesData.length, (index){
                                    return Row(
                                      children: [
                                        Checkbox(
                                          splashRadius: 0,
                                          activeColor: ColorManager.blueprime,
                                          value: _isCheckedList[index],
                                          onChanged: (bool? value) {
                                            setState(() {
                                              if (value == true) {
                                                // Uncheck all other checkboxes
                                                for (int i = 0; i < _isCheckedList.length; i++) {
                                                  _isCheckedList[i] = false;
                                                }
                                                _isCheckedList[index] = true;

                                                // Call API only when a checkbox is checked
                                                providerState.filterIdIntegration(
                                                    marketerId: 'all',
                                                    sourceId: patientRefferalSourcesData[index].ref_source_id.toString(),
                                                    pcpId: 'all', context: context);
                                              }
                                              // If value is false (unchecking), do nothing
                                            });
                                            // setState(() {
                                            //   _isCheckedList[index] = value!;
                                            //   providerState.filterIdIntegration(marketerId: 'all',
                                            //       sourceId: patientRefferalSourcesData[index].ref_source_id.toString(), pcpId: 'all');
                                            // });
                                          },
                                        ),
                                        Text(
                                          patientRefferalSourcesData[index].source_name,
                                          style: DocDefineTableDataID.customTextStyle(
                                              context),
                                        ),
                                      ],
                                    );
                                                                  })
                                                                  ],
                                                                ),
                                  )
                                  : null,
                            );}
                          ),
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
                                    style: Filterhead.customTextStyle(context)),
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
                                    style: Filterhead.customTextStyle(context)),
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
                                    style: Filterhead.customTextStyle(context)),
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
                                style: DocumentTypeDataStyle.customTextStyle(context),
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
                            ],
                          )
                              : null,
                        ),

                        Divider(),
                        InkWell(
                          onTap: (){},
                          // onTap: providerState.toggleContainerP,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Potential Discharge Date",
                                    style: Filterhead.customTextStyle(context)),
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
                        // AnimatedContainer(
                        //   duration: Duration(milliseconds: 30),
                        //   height: providerState.PContainerVisible ? 100 : 0,
                        //   width: 300,
                        //   // color: Colors.blue,
                        //   // alignment: Alignment.center,
                        //   child: providerState.PContainerVisible
                        //       ? Column(children: [
                        //     TextField(
                        //       controller: assigndatecontroller,
                        //       style: TextStyle(fontSize: 14),
                        //       decoration: InputDecoration(
                        //         hintText: 'Date Range',
                        //         prefixIcon: Padding(
                        //           padding: const EdgeInsets.only(bottom: 10),
                        //           child: Icon(
                        //             Icons.calendar_month_outlined,
                        //             size: 18,
                        //             color: Colors.grey,
                        //           ),
                        //         ),
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Colors
                        //                   .grey), // Set the color of the bottom border
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //               color: Colors
                        //                   .grey), // Set the color when focused
                        //         ),
                        //         contentPadding: EdgeInsets.symmetric(
                        //             vertical: 10, horizontal: 10),
                        //       ),
                        //       onChanged: (value) {
                        //         // Handle search logic here (e.g., filtering options)
                        //       },
                        //       onTap: () async {
                        //         DateTime? pickedDate = await showDatePicker(
                        //           context: context,
                        //           initialDate: DateTime.now(),
                        //           firstDate: DateTime(1901),
                        //           lastDate: DateTime(2101),
                        //         );
                        //         if (pickedDate != null) {
                        //           assigndatecontroller.text =
                        //           "${pickedDate.toLocal()}".split(' ')[0];
                        //         }
                        //       },
                        //     ),
                        //   ])
                        //       : null,
                        // ),
                        Divider(),
                        // Example filter fields
                        InkWell(
                          onTap: providerState.toggleContainerP,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p10, right: AppPadding.p13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Physician",
                                    style: Filterhead.customTextStyle(context)),
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
                        StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState){
                              return  AnimatedContainer(
                                duration: Duration(milliseconds: 30),
                              //  height: providerState.MContainerVisible ? 300 : 0,
                                width: 300,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: providerState.PContainerVisible
                                    ? ScrollConfiguration(
                                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                      child: SingleChildScrollView(
                                        child: Column(
                                                                          children: [
                                        ...List.generate(patientPhysicianMasterData.length, (index){
                                          return Row(
                                            children: [
                                              Checkbox(
                                                  splashRadius: 0,
                                                  activeColor: ColorManager.blueprime,
                                                  value: _physicianList[index],
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      if (value == true) {
                                                        // Uncheck all other checkboxes
                                                        for (int i = 0; i < _physicianList.length; i++) {
                                                          _physicianList[i] = false;
                                                        }
                                                        _physicianList[index] = true;

                                                        // Call API only when a checkbox is checked
                                                        providerState.filterIdIntegration(
                                                          context: context,
                                                          marketerId: 'all',
                                                          sourceId: 'all',
                                                          pcpId: patientPhysicianMasterData[index].phy_id.toString(),
                                                        );
                                                      }
                                                      // If value is false (unchecking), do nothing
                                                    });
                                                  }

                                                  ///

                                                  // onChanged: (bool? value) {
                                                  //   setState(() {
                                                  //     if (value == true) {
                                                  //       // Uncheck all other checkboxes
                                                  //       for (int i = 0; i < _physicianList.length; i++) {
                                                  //         _physicianList[i] = false;
                                                  //       }
                                                  //       _physicianList[index] = true;
                                                  //
                                                  //       // Call API only when a checkbox is checked
                                                  //       providerState.filterIdIntegration(
                                                  //         context: context,
                                                  //         marketerId: 'all',
                                                  //         sourceId: 'all',
                                                  //         pcpId: patientPhysicianMasterData[index].phy_id.toString(),
                                                  //       );
                                                  //     }
                                                  //     // If value is false (unchecking), do nothing
                                                  //   });
                                                  // }
                                                ///
                                                // onChanged: (bool? value) {
                                                //   setState(() {
                                                //     _isCheckedListMaster[index] = value!;
                                                //     providerState.filterIdIntegration(marketerId: patientPhysicianMasterData[index].phy_id.toString(),
                                                //         sourceId: 'all', pcpId: 'all');
                                                //   });
                                                // },
                                              ),
                                              Text(
                                                "${ patientPhysicianMasterData[index].phy_first_name} ${ patientPhysicianMasterData[index].phy_last_name}",
                                                style: DocDefineTableDataID.customTextStyle(
                                                    context),
                                              ),
                                            ],
                                          );
                                        })

                                                                          ],
                                                                        ),
                                      ),
                                    )
                                    : null,
                              );}
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
