import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/intake_insurance_primary/intake_insurance_primary_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/intake_insurance_secondary/intake_insurance_secondary_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/save_page/insurance_save_page.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/patient_insurance_data.dart';
import '../../../widgets/constant_widgets/schedular_success_popup.dart';

class IntakeInsuranceScreen extends StatefulWidget {
  final int patientId;
  final VoidCallback onSkip;
  const IntakeInsuranceScreen({super.key, required this.patientId, required this.onSkip,});

  @override
  State<IntakeInsuranceScreen> createState() => _IntakeInsuranceScreenState();
}

class _IntakeInsuranceScreenState extends State<IntakeInsuranceScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  final PageController smIntakePageController = PageController();
  bool isSidebarLeftOpen = false;
  late AnimationController _animationLeftController;
  late Animation<Offset> _slideLeftAnimation;
  @override
  void initState() {
    super.initState();
    // fetchAIdemoData();
    _animationLeftController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _slideLeftAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Off-screen to the right
      end: Offset(0.0, 0.0), // On-screen
    ).animate(CurvedAnimation(parent: _animationLeftController, curve: Curves.easeInOut));
  }

  bool isShowingInsuranceSavePage = false;
  void switchToInsuranceSavePage() {
    setState(() {
      isShowingInsuranceSavePage = true;
    });
  }

  void goBackToInsuranceTabView() {
    setState(() {
      isShowingInsuranceSavePage = false;
    });
  }

  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });

    smIntakePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
  Object? data;
  void toggleLeftSidebar() {
    setState(() {
      isSidebarLeftOpen = !isSidebarLeftOpen;
      if (isSidebarLeftOpen ) {
        _animationLeftController.forward();
      } else {
        _animationLeftController.reverse();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Row(
      children: [
        isSidebarLeftOpen == true ?   Flexible(
          flex: 0,
          child: AnimatedBuilder(
            animation: _slideLeftAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: _slideLeftAnimation,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      //height: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.all(1),
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
                                  const SizedBox(height: 100,),
                                  // Align(
                                  //   alignment: Alignment.topCenter,
                                  //   child: Text('Records for Others Duplicates',style: CustomTextStylesCommon.commonStyle(
                                  //       color:const Color(0xFF51B5E6),
                                  //       fontWeight: FontWeight.w700,fontSize: 12)),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(left: 2.0),
                                  //         child: CustomDropdownsmi(
                                  //
                                  //             width:150,
                                  //             isAstric:false,
                                  //             hintText: "Erica T",
                                  //             iconColor: ColorManager.mediumgrey,
                                  //             initialValue: selectedValue,
                                  //             headText: "", // Default fallback if depId doesn't match any of the expected values
                                  //             items: items,
                                  //
                                  //             onChanged: (newValue) {
                                  //               // for (var a in snapshot.data!) {
                                  //               //   if (a.empType == newValue) {
                                  //               //     clinicialName = a.empType!;
                                  //               //     clinicalId = a.employeeTypesId!;
                                  //               //     print("Dept ID'''''' ${clinicalId}");
                                  //               //     print("';';';''''''''Dept ID ${clinicialName}");
                                  //               //     // Do something with docType
                                  //               //   }
                                  //               // }
                                  //             },
                                  //           ),
                                  //       ),
                                  //
                                  //
                                  //       ///
                                  //       // Container(
                                  //       //   width:150,
                                  //       //   height: 32,
                                  //       //   child: DropdownButtonFormField<String>(
                                  //       //     value: selectedValue,
                                  //       //     decoration: InputDecoration(
                                  //       //       border: UnderlineInputBorder(), // Only underline
                                  //       //       enabledBorder: UnderlineInputBorder(
                                  //       //         borderSide: BorderSide(color: Colors.grey),
                                  //       //       ),
                                  //       //       focusedBorder: UnderlineInputBorder(
                                  //       //         borderSide: BorderSide(color: Color(0xFF686464)),
                                  //       //       ),
                                  //       //     ),
                                  //       //     style: TextStyle(fontSize: 10),
                                  //       //     icon: Icon(Icons.arrow_drop_down), // Down arrow icon
                                  //       //     items: items.map((String value) {
                                  //       //       return DropdownMenuItem<String>(
                                  //       //         value: value,
                                  //       //         child: Text(value),
                                  //       //       );
                                  //       //     }).toList(),
                                  //       //     onChanged: (String? newValue) {
                                  //       //       setState(() {
                                  //       //         selectedValue = newValue;
                                  //       //       });
                                  //       //     },
                                  //       //   ),
                                  //       // ),
                                  //       Text('You',style: CustomTextStylesCommon.commonStyle(
                                  //           color:Color(0xFF7F7F7F),
                                  //           fontWeight: FontWeight.w400,fontSize: 14),)
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     spacing: 15,
                                  //     children: [
                                  //       Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         spacing: 15,
                                  //         children: [
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(left: 10),
                                  //             child: Text('First Name*',style: CustomTextStylesCommon.commonStyle(
                                  //                 color:Color(0xFF575757),
                                  //                 fontWeight: FontWeight.w700,fontSize: 12)),
                                  //           ),
                                  //           Container(
                                  //             width: 130,
                                  //             height: 50,
                                  //             padding: const EdgeInsets.all(8),
                                  //           // padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                                  //             decoration: BoxDecoration(
                                  //               color: Color(0xFFEEEEEE),
                                  //               borderRadius: BorderRadius.circular(2),
                                  //             ),
                                  //             child: Text('Erica',style: CustomTextStylesCommon.commonStyle(
                                  //                 color:Color(0xFF7F7F7F),
                                  //                 fontWeight: FontWeight.w400,fontSize: 12)),
                                  //           )
                                  //         ],
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.start,
                                  //         spacing: 15,
                                  //         children: [
                                  //           Padding(
                                  //             padding: const EdgeInsets.only(left: 10),
                                  //             child: Text('Last Name*',style: CustomTextStylesCommon.commonStyle(
                                  //                 color:Color(0xFF575757),
                                  //                 fontWeight: FontWeight.w700,fontSize: 12)),
                                  //           ),
                                  //           Container(
                                  //             width:130,
                                  //             height: 50,
                                  //             padding: const EdgeInsets.all(8),
                                  //             decoration: BoxDecoration(
                                  //               color: Color(0xFFEEEEEE),
                                  //               borderRadius: BorderRadius.circular(2),
                                  //             ),
                                  //             child: Text('Erica2',style: CustomTextStylesCommon.commonStyle(
                                  //                 color:Color(0xFF7F7F7F),
                                  //                 fontWeight: FontWeight.w400,fontSize: 12)),
                                  //           )
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 10),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     spacing: 10,
                                  //     children: [
                                  //       CustomButtonTransparent(
                                  //         width: AppSize.s120,
                                  //         height: 28,
                                  //         borderRadius: 14,
                                  //         style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                  //           fontWeight: FontWeight.w700,
                                  //           color: ColorManager.blueprime,),
                                  //         text: "Accept Theirs",
                                  //         onPressed: () {},
                                  //       ),
                                  //       CustomElevatedButton(
                                  //         width: AppSize.s120,
                                  //         height: 28,
                                  //         borderRadius: 14,
                                  //         text: "Keep Yours",
                                  //         style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                  //           fontWeight: FontWeight.w700,
                                  //           color: ColorManager.white,),
                                  //         onPressed: (){},
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Divider(color: Color(0xFFD9D9D9),thickness: 1,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5,bottom: 10,left: 20),
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
                                              text: 'Abc.pdf . ',
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
                                      padding: const EdgeInsets.all(20),
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
                                  ),
                                  SizedBox(height: 100,),
                                ],
                              ),
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
        )
            : Offstage(),
        Flexible(
          child: Column(
                children: [
                  SizedBox(height: AppSize.s25,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: AppSize.s30,
                          width: AppSize.s315,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.blueprime,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Shift & Batch Button
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () => selectButton(0),
                                child: Container(
                                  height: AppSize.s30,
                                  width: AppSize.s160,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    color: selectedIndex == 0
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Primary',
                                      style: BlueBgTabbar.customTextStyle(
                                          0, selectedIndex),
                                    ),
                                  ),
                                ),
                              ),
                              // Define Holiday Button
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () => selectButton(1),
                                child: Container(
                                  height: AppSize.s30,
                                  width: AppSize.s155,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                    color: selectedIndex == 1
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Secondary',
                                      style: BlueBgTabbar.customTextStyle(
                                          1, selectedIndex),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        //horizontal: MediaQuery.of(context).size.width / 45,
                          vertical: 5),
                      child:isShowingInsuranceSavePage
                          ? InsuranceSavePage(
                        patientId: widget.patientId,
                        onBack: goBackToInsuranceTabView,
                      )
                          : PageView(
                          controller: smIntakePageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            IntakePrimaryScreen(patientId: widget.patientId,
                              onSave: switchToInsuranceSavePage
                               , onEditScreen: switchToInsuranceSavePage,
                              isIButtonPressed: providerContact.isRightSliderOpen == true ?
                                  (){
                                  // toggleLeftSidebar();
                                  // //providerContact.toogleContactProvider();
                                  // providerContact.toogleLeftSidebarProvider();
                                  // providerContact.toogleRightSliderProvider();
                                }
                                :(){
                                  toggleLeftSidebar();
                                  providerContact.toogleContactProvider();
                                  providerContact.toogleLeftSidebarProvider();
                                }, onSkip: () {   selectButton(1); },

                            ),
                            IntakeSecondaryScreen(patientId: widget.patientId, onSave: () {switchToInsuranceSavePage();  },
                              isIButtonPressed: providerContact.isRightSliderOpen == true ?
                                  (){
                                // toggleLeftSidebar();
                                // //providerContact.toogleContactProvider();
                                // providerContact.toogleLeftSidebarProvider();
                                // providerContact.toogleRightSliderProvider();
                              }
                                  :(){
                                toggleLeftSidebar();
                                providerContact.toogleContactProvider();
                                providerContact.toogleLeftSidebarProvider();
                              }, onSkip: () { widget.onSkip(); },),
                            // InsuranceSavePage(onBack: () {  }, patientId: 1,),
                            //
                          ]),
                    ),
                  ),
                ],
              ),
        ),
      ],
    );
  }
}
