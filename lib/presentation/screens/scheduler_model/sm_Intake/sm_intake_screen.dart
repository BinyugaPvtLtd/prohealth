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
import '../../../../../../app/resources/value_manager.dart';
import '../../../../app/resources/font_manager.dart';
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 90), // Shift left by 10
        child: FloatingActionButton(
          onPressed: toggleSidebar,
          backgroundColor: ColorManager.bluebottom,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call,size: 22,),
                SizedBox(height: 3,),
                Text(
                  "Contact",
                  style: CustomTextStylesCommon.commonStyle(
                    fontSize: FontSize.s10,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [

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
                  padding: const EdgeInsets.symmetric(horizontal: 50),
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
                        onTap: (int index) {
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
                        onTap: (int index) {
                          intakeSelectButton(index);
                        },
                        index: 1,
                        grpIndex: _selectedIndex,
                        heading: "Documentation",
                        //enabled: patientId != 0,
                      ),
                      PageViewMenuButtonConst(
                        onTap: (int index) {
                          intakeSelectButton(index);
                        },
                        index: 2,
                        grpIndex: _selectedIndex,
                        heading: "Insurance",
                       // enabled: patientId != 0,
                      ),
                      PageViewMenuButtonConst(
                        onTap: (int index) {
                          intakeSelectButton(index);
                        },
                        index: 3,//3,
                        grpIndex: _selectedIndex,
                        heading: "Physician Info",
                       // enabled: patientId != 0,
                      ),
                      PageViewMenuButtonConst(
                        onTap: (int index) {
                          intakeSelectButton(index);
                        },
                        index: 4,
                        grpIndex: _selectedIndex,
                        heading: "Orders",
                       // enabled: patientId != 0,
                      ),
                      PageViewMenuButtonConst(
                        onTap: (int index) {
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
                    }, iButtonClickd: toggleLeftSidebar,
                  ),
                  // SMIntakeReferralScreen(patientId: patientId),
                  DocumationScreenTab(),
                  IntakeInsuranceScreen(patientId: patientId),
                  PhysicianInfoTab(),
                  SMIntakeOrdersScreen(patientId: patientId),
                  SmIntakeInitialContactScreen(patientId: patientId),
                ],
              ),
            ),
          ]),
          isSidebarLeftOpen==true ?  GestureDetector(
            onTap: (){
              toggleLeftSidebar();
            },
            child: Container(
              color: Colors.transparent, // Make this transparent so it's invisible
            ),
          ): Offstage(),
          AnimatedBuilder(
            animation: _slideLeftAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _slideLeftAnimation,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
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
                                      spacing: 10,
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
                                      spacing: 10,
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
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                padding: const EdgeInsets.symmetric(vertical: 15),
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
                                    child: Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                        ''',style: CustomTextStylesCommon.commonStyle(
                                        color:Color(0xFF686464),
                                        fontWeight: FontWeight.w400,fontSize: 12),),
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
              );
            },
          ),
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _slideAnimation,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
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
                              onPressed: (){},
                            ),

                          ],
                        ),
                      ),
                      Material(
                        color: ColorManager.white,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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