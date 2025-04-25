import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/contactTab/calls_screen.dart' show ContactCallsScreen;
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/contactTab/documents_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/contactTab/e_fax_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/contactTab/logs_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_initial_contact/intake_initial_contact_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/intake_insurance_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_orders/intake_orders_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_patients_data/intake_patients_data_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_physician_info/intake_physician_home_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../app/resources/theme_manager.dart';
import '../../em_module/widgets/button_constant.dart';
import '../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../widgets/constant_widgets/page_view_menu_button_const.dart';
import '../widgets/constant_widgets/sm_dial_pad_const.dart';
import 'new_documation/documation_screen.dart';
import 'new_phsician_info/physician_info_tab.dart';

class SMIntakeScreen extends StatefulWidget {
  final VoidCallback onGoBackPressed;
  final int patientId;
  const SMIntakeScreen({super.key, required this.onGoBackPressed, required this.patientId});

  @override
  State<SMIntakeScreen> createState() => _SMIntakeScreenState();
}

class _SMIntakeScreenState extends State<SMIntakeScreen> with TickerProviderStateMixin{

  final PageController intakePageController = PageController(initialPage: 0);
  final PageController intakeContactPageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  int callerLogSelectIndex = 0;
  int patientId = 51;

  void intakeSelectButton(int index) {
    if (index == 0 || patientId != 0) {
      setState(() {
        _selectedIndex = index;
      });
      intakePageController.jumpToPage(
        index,
        // duration: const Duration(milliseconds: 500),
        // curve: Curves.ease,
      );
    }
  }
  void intakeContactSelectButton(int index) {
    if (index == 0 || patientId != 0) {
      setState(() {
        callerLogSelectIndex = index;
      });
      intakeContactPageController.jumpToPage(
        index,
        // duration: const Duration(milliseconds: 500),
        // curve: Curves.ease,
      );
    }
  }
  bool isSidebarOpen = false;
  bool isSidebarLeftOpen = false;
  late AnimationController _animationController;
   late Animation<Offset> _slideAnimation;

  late AnimationController _animationLeftController;
  late Animation<Offset> _slideLeftAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300), vsync: this,
    );
    _animationLeftController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Off-screen to the right
      end: Offset(0.0, 0.0), // On-screen
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _slideLeftAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Off-screen to the right
      end: Offset(0.0, 0.0), // On-screen
    ).animate(CurvedAnimation(parent: _animationLeftController, curve: Curves.easeInOut));
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
      if (isSidebarOpen ) {
        isSidebarLeftOpen = false;
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void toggleLeftSidebar() {
    setState(() {
      isSidebarLeftOpen = !isSidebarLeftOpen;
      if (isSidebarLeftOpen ) {
        isSidebarOpen = false;
        _animationLeftController.forward();
      } else {
        _animationLeftController.reverse();
      }
    });
  }
  bool isCallactive = false;
  void toggleCall(){
    setState(() {
      isCallactive = !isCallactive;
    });
  }
  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Scaffold(
      backgroundColor: ColorManager.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _selectedIndex == 5 ? Offstage() : isSidebarOpen==true ? Offstage() : isSidebarLeftOpen == true ? Offstage():Padding(
        padding: const EdgeInsets.only(right: 90), // Shift left by 10
        child: FloatingActionButton(
          onPressed: (){
            toggleSidebar();
            providerContact.toogleContactProvider();
          },
          backgroundColor: ColorManager.bluebottom,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call,size: 18,),
                SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Text(
                    "Contact",
                    style: CustomTextStylesCommon.commonStyle(
                      fontSize: FontSize.s9,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          isSidebarLeftOpen==true ? Flexible(
            flex: 0,
            child: AnimatedBuilder(
              animation: _slideLeftAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _slideLeftAnimation,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      //height: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height,
                              minWidth: MediaQuery.of(context).size.height
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text('Records for Others Duplicates',style: CustomTextStylesCommon.commonStyle(
                                        color:Color(0xFF51B5E6),
                                        fontWeight: FontWeight.w700,fontSize: 12)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 15,
                                          children: [
                                            Text('First Name*',style: CustomTextStylesCommon.commonStyle(
                                                color:Color(0xFF575757),
                                                fontWeight: FontWeight.w700,fontSize: 12)),
                                            Text('Erica',style: CustomTextStylesCommon.commonStyle(
                                                color:Color(0xFF7F7F7F),
                                                fontWeight: FontWeight.w400,fontSize: 12))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 15,
                                          children: [
                                            Text('Last Name*',style: CustomTextStylesCommon.commonStyle(
                                                color:Color(0xFF575757),
                                                fontWeight: FontWeight.w700,fontSize: 12)),
                                            Text('Erica2',style: CustomTextStylesCommon.commonStyle(
                                                color:Color(0xFF7F7F7F),
                                                fontWeight: FontWeight.w400,fontSize: 12))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      spacing: 10,
                                      children: [
                                        CustomButtonTransparent(
                                          width: AppSize.s120,
                                          height: 23,
                                          //borderRadius: 12,
                                          text: "Accept Theirs",
                                          onPressed: () {

                                          },
                                        ),
                                        CustomElevatedButton(
                                          width: AppSize.s120,
                                          height: 23,
                                          borderRadius: 12,
                                          text: "Keep Yours",
                                          style: TextStyle(fontSize: 10),
                                          onPressed: (){},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Divider(color: Color(0xFFD9D9D9),thickness: 1,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Referred from ',
                                          style: CustomTextStylesCommon.commonStyle(
                                              color:Color(0xFF686464),
                                              fontWeight: FontWeight.w700,fontSize: 12),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Abc.pdf. ',
                                              style: CustomTextStylesCommon.commonStyle(
                                                  color:Color(0xFF51B5E6),
                                                  fontWeight: FontWeight.w700,fontSize: 12),
                                            ),
                                            TextSpan(
                                              text: '(Page No.24)',
                                              style: CustomTextStylesCommon.commonStyle(
                                                  color:Color(0xFF51B5E6),
                                                  fontWeight: FontWeight.w700,fontSize: 12),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                                      child: Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.all(10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n',
                                            style: CustomTextStylesCommon.commonStyle(
                                              color:Color(0xFF686464),
                                              fontWeight: FontWeight.w400,fontSize: 12,),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n',
                                                style: TextStyle(
                                                  color:Color(0xFF686464),
                                                  fontWeight: FontWeight.w400,fontSize: 12,
                                                  backgroundColor: Colors.yellow,),
                                              ),
                                              TextSpan(
                                                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                style: CustomTextStylesCommon.commonStyle(
                                                    color:Color(0xFF686464),
                                                    fontWeight: FontWeight.w400,fontSize: 12),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                );
              },
            ),
          ) : Offstage(),
          Flexible(
            child: Stack(
              children: [
                isSidebarLeftOpen==true ?  Positioned.fill(
                  child: GestureDetector(
                    onTap: (){
                      toggleLeftSidebar();
                    },
                    child: Container(
                      color: Colors.transparent, // Make this transparent so it's invisible
                    ),
                  ),
                ): isSidebarOpen==true ? Positioned.fill(
                  child: GestureDetector(
                    onTap: (){
                      toggleSidebar();
                      providerContact.toogleContactProvider();
                    },
                    child: Container(
                      color: Colors.transparent, // Make this transparent so it's invisible
                    ),
                  ),
                ):Offstage(),
                Column(
                    children: [
                      Material(
                        color: ColorManager.white,
                        elevation:2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: ColorManager.black.withOpacity(0.5),
                            //     offset: Offset(0, 4),
                            //     blurRadius: 4,
                            //     spreadRadius: 0,
                            //   ),
                            // ],
                          ),
                          padding: EdgeInsets.only(left: 30, right: 60),
                          //margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50,top: 10,right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                // InkWell(
                                //     onTap: widget.onGoBackPressed,
                                //     child: Row(
                                //       children: [
                                //         Icon(
                                //           Icons.arrow_back,
                                //           size: IconSize.I16,
                                //           color: ColorManager.mediumgrey,
                                //
                                //         ),
                                //         SizedBox(width: 5,),
                                //         Text(
                                //           'Go Back',
                                //          style:TextStyle(
                                //            fontSize: FontSize.s14,
                                //            fontWeight: FontWeight.w700,
                                //            color: ColorManager.mediumgrey,
                                //          ),
                                //         ),
                                //       ],
                                //     )),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 0,
                                  grpIndex: _selectedIndex,
                                  heading: "Demographics",
                                ),
                                // PageViewMenuButtonConst(
                                //   onTap: (int index) {
                                //     intakeSelectButton(index);
                                //   },
                                //   index: 1,
                                //   grpIndex: _selectedIndex,
                                //   heading: "Referral",
                                //   enabled: patientId != 0,
                                // ),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 1,
                                  grpIndex: _selectedIndex,
                                  heading: "Documentation",
                                  //enabled: patientId != 0,
                                ),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 2,
                                  grpIndex: _selectedIndex,
                                  heading: "Insurance",
                                  // enabled: patientId != 0,
                                ),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 3,//3,
                                  grpIndex: _selectedIndex,
                                  heading: "Physician Info",
                                  // enabled: patientId != 0,
                                ),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 4,
                                  grpIndex: _selectedIndex,
                                  heading: "Orders",
                                  // enabled: patientId != 0,
                                ),
                                PageViewMenuButtonConst(
                                  onTap: isSidebarOpen==true ?(int index){
                                    intakeSelectButton(index);
                                    toggleSidebar();
                                    providerContact.toogleContactProvider();
                                  } :(int index) {
                                    intakeSelectButton(index);
                                  },
                                  index: 5,
                                  grpIndex: _selectedIndex,
                                  heading: "Initial Contact",
                                  // enabled: patientId != 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: NonScrollablePageView(
                          controller: intakePageController,
                          onPageChanged: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          children: [
                            SmIntakeDemographicsScreen(
                              onPatientIdGenerated: (int id) {
                                setState(() {
                                  patientId = id;
                                });
                              }, iButtonClickd: (){
                                toggleLeftSidebar();
                                providerContact.toogleContactProvider();},
                            ),
                            // SMIntakeReferralScreen(patientId: patientId),
                            DocumationScreenTab(),
                            IntakeInsuranceScreen(patientId: patientId),
                            PhysicianInfoTab(),
                            SMIntakeOrdersScreen(patientId: patientId),
                            SmIntakeInitialContactScreen(patientId: patientId, onOpenContact: () {
                              toggleSidebar();
                              providerContact.toogleContactProvider();
                            },),
                          ],
                        ),
                      ),
                    ]),

              ],
            ),
          ),
          isSidebarOpen == true ? Flexible(
            flex: 0,
            child: AnimatedBuilder(
              animation: _slideAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _slideAnimation,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.39,
                      //height: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isCallactive ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                                  child: Container(
                                    height:59,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],

                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15,),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.wifi_calling_3_outlined,size: 19,color: Color(0xFF686464),),
                                          Text('Albert Flores',style: CustomTextStylesCommon.commonStyle(
                                            color: Color(0xFF686464),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),),
                                          Container(
                                            width: 80,
                                            height: 18,
                                            decoration: BoxDecoration(border: Border.all(color: Colors.red),borderRadius: BorderRadius.circular(5),color: ColorManager.faintGrey),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.circle,color: Colors.red,size:8 ,),
                                                Text('02:22:50',style:CustomTextStylesCommon.commonStyle(
                                                  color:Color(0xFF686464),
                                                  fontWeight: FontWeight.w400,fontSize: FontSize.s10,
                                                ) ,)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 13),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              spacing: 10,
                                              children: [
                                                InkWell(
                                                  highlightColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  splashColor: Colors.transparent,
                                                  onTap:toggleCall,
                                                  child: Container(
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.red),
                                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                    child: Center(
                                                      child: Icon(Icons.call,size: 15,color: Colors.white,),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Color(0xFFF4F5F8)),
                                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                                  child: Center(
                                                    child: Icon(Icons.mic_off_outlined,size: 15,),
                                                  ),
                                                )

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ) :
                                Container(
                                  height: 350,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '+44 5989451652',
                                        style: CustomTextStylesCommon.commonStyle(
                                          color: Color(0xFF686464),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Column(
                                        spacing: 15,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing:20,
                                            children: [
                                              SmDialPadConst(dialNumber: '1', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '2', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '3', onTaped: () {}),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing:20,
                                            children: [
                                              SmDialPadConst(dialNumber: '4', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '5', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '6', onTaped: () {}),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing:20,
                                            children: [
                                              SmDialPadConst(dialNumber: '7', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '8', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '9', onTaped: () {}),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            spacing:20,
                                            children: [
                                              SmDialPadConst(dialNumber: '*', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '0', onTaped: () {}),
                                              SmDialPadConst(dialNumber: '#', onTaped: () {}),
                                            ],
                                          ),
                                        ],
                                      ),
                                      CustomElevatedButton(
                                        width: AppSize.s220,
                                        height: AppSize.s31,
                                        text: "Call",
                                        color: Color(0xFF008000),
                                        onPressed: toggleCall,
                                      ),

                                    ],
                                  ),
                                ),
                                Material(
                                  color: ColorManager.white,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        PageViewMenuButtonConst(
                                          onTap: (int index) {
                                            intakeContactSelectButton(index);
                                          },
                                          index: 0,
                                          grpIndex: callerLogSelectIndex,
                                          heading: "Calls",
                                        ),
                                        PageViewMenuButtonConst(
                                          onTap: (int index) {
                                            intakeContactSelectButton(index);
                                          },
                                          index: 1,
                                          grpIndex: callerLogSelectIndex,
                                          heading: "Logs",
                                        ),
                                        PageViewMenuButtonConst(
                                          onTap: (int index) {
                                            intakeContactSelectButton(index);
                                          },
                                          index: 2,
                                          grpIndex: callerLogSelectIndex,
                                          heading: "E-Fax",
                                        ),
                                        PageViewMenuButtonConst(
                                          onTap: (int index) {
                                            intakeContactSelectButton(index);
                                          },
                                          index: 3,
                                          grpIndex: callerLogSelectIndex,
                                          heading: "Documents",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.6,
                                  child: NonScrollablePageView(
                                    controller: intakeContactPageController,
                                    onPageChanged: (index) {
                                      setState(() {
                                        callerLogSelectIndex = index;
                                      });
                                    },
                                    children: [
                                      ContactCallsScreen(),
                                      ContactLogsScreen(),
                                      ContactEFaxScreen(),
                                      ContactDocumentScreen(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                );
              },
            ),
          ) : Offstage(),
        ],
      ),
    );
  }
}


///
class NonScrollablePageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final List<Widget> children;
  const NonScrollablePageView({
    Key? key,
    required this.controller,
    required this.onPageChanged,
    required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) => true,
      child: PageView(
        controller: controller,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // Disables scrolling
        children: children,
      ),
    );
  }
}