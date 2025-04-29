import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/widgets/chart.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/widgets/sm_const_widgets.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/widgets/sm_dash_graph_data.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_dashboard/widgets/sm_dashboard_const.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../app/resources/color.dart';
import '../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../app/resources/common_resources/em_dashboard_theme.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../app/resources/theme_manager.dart';
import '../../../../app/resources/value_manager.dart';
import '../../../widgets/widgets/constant_textfield/const_textfield.dart';
import '../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../sm_Intake/widgets/intake_update_schedular/information_update.dart';
import '../widgets/sm_desktop_screen.dart';

class SMDashboardScreen extends StatefulWidget {
  final PageController pageController;
  final VoidCallback? onViewMoreTap;
  final VoidCallback? onAutoTap;
  final VoidCallback? onViewMoreClinicianTypeTap;
  const SMDashboardScreen({super.key, required this.pageController, this.onViewMoreTap, this.onViewMoreClinicianTypeTap, this.onAutoTap});

  @override
  State<SMDashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<SMDashboardScreen> {

  /// Bar Column chart data output ratio
  final List<SMChartData> smChartData = <SMChartData>[
    SMChartData('RN', 25, 30),
    SMChartData('COTA', 50, 25),
    SMChartData('HHA', 20, 80),
    SMChartData('MSW', 80, 50),
    SMChartData('PTA', 75, 75),
    SMChartData('OT', 25, 65),
    SMChartData('LVN', 40, 40),
    SMChartData('PT', 30, 40),
    SMChartData('ST', 60, 20),
  ];

  bool isSwitched = false;
  String selectedValue = "Daily";
  final ButtonSelectionSMController myController = Get.find<ButtonSelectionSMController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p30,),
          child: Column(
            children: [
              Container(
                  height: 840,
                  //width: 200,
                  //color: ColorManager.red,
                  child: Column(
                    children: [
                      ///row 1
                      Row(children: [
                        Expanded(
                            flex: 6,
                            child: Container()),
                        Expanded(
                            flex: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: Text("Scheduled Patients",
                                    style: TextStyle(fontSize: FontSize.s14,color: ColorManager.mediumgrey,fontWeight: FontWeight.w600),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: CustomDropdownTextField(
                                    width: 200,
                                    iconColor: ColorManager.bluebottom,
                                    icon: Icons.keyboard_arrow_down_outlined,
                                    isAstric:false,
                                    fontwight: FontWeight.w700,
                                    fontsize:  FontSize.s17,
                                    // Adjust headText based on depId
                                    initialValue: 'Sacremento Office',
                                    headText: "", // Default fallback if depId doesn't match any of the expected values
                                    items: ["Sacremento Office", "SanFrancisco", "Los Angles"],
                                    onChanged: (newValue) {
                                      // for (var a in snapshot.data!) {
                                      //   if (a.empType == newValue) {
                                      //     clinicialName = a.empType!;
                                      //     clinicalId = a.employeeTypesId!;
                                      //     print("Dept ID'''''' ${clinicalId}");
                                      //     print("';';';''''''''Dept ID ${clinicialName}");
                                      //     // Do something with docType
                                      //   }
                                      // }
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ],),
                      ///row 2
                      Row(children: [
                        AllVisitsUpdate(
                          onNavigate: () {
                            myController.selectButton(2);
                            widget.pageController.animateToPage(
                              2, // Scheduler page index
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                        ),

                        // AllVisitsUpdate(onNavigate: () {  },),
                        SizedBox(width: AppPadding.p20,),
                        ScheduledToBeScheduledPatients(),
                        SizedBox(width: AppPadding.p20,),
                        ScheduledPatientsList(),
                      ],),
                      SizedBox(height: AppPadding.p30,),
                      ///row 3
                      // Row(children: [
                      //   PatientsToBeScheduledList(onAutoTap: widget.onAutoTap,),
                      //   SizedBox(width: AppPadding.p20,),
                      //   AllAvailableClinician(),
                      // ],),
                      // SizedBox(height: AppPadding.p20,),
                      ///row 4
                      Row(children: [
                        Expanded(
                           flex: 6,
                            child: Column(
                              children: [
                                JointContainerConst(
                                  height: 180,
                                    childHeading: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Number of Visits for Clinicians',
                                            textAlign: TextAlign.start,
                                            style: MenuContainerTextStylling.customTextStyle(context),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Text("Monthly"),
                                              ),
                                              FlutterSwitch(
                                                width: 30.0,
                                                height: 15.0,
                                                toggleSize: 12.0, // smaller white toggler
                                                value: isSwitched,
                                                borderRadius: 20.0,
                                                padding: 2.0,
                                                activeColor: ColorManager.bluebottom,
                                                inactiveColor: ColorManager.bluebottom,
                                                toggleColor: ColorManager.white,
                                                onToggle: (value) {
                                                  setState(() {
                                                    isSwitched = value;
                                                    print(isSwitched);
                                                  });
                                                },
                                              ),
                                              // Container(
                                              //   child: Switch(
                                              //     focusColor: Colors.transparent,
                                              //     splashRadius: 5,
                                              //     hoverColor: Colors.transparent,
                                              //     value: isSwitched,
                                              //     onChanged: (value) {
                                              //       setState(() {
                                              //         isSwitched = value;
                                              //         print(isSwitched);
                                              //       });
                                              //     },
                                              //     activeTrackColor: ColorManager.bluebottom,
                                              //     inactiveTrackColor:ColorManager.bluebottom ,
                                              //     activeColor: ColorManager.white,
                                              //   ),
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10,right: 10),
                                                child: Text("Weekly"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    childBody: Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: SfCartesianChart(
                                        backgroundColor: ColorManager.white,
                                        primaryXAxis: CategoryAxis(
                                          labelStyle: TextStyle(
                                            color: ColorManager.mediumgrey,
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          labelStyle: TextStyle(
                                            color: ColorManager.mediumgrey,
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          minimum: 0,
                                          maximum: 100,
                                          interval: 25,
                                          // axisLabelFormatter: (AxisLabelRenderDetails details) {
                                          //   // Appends '%' symbol to the Y-axis labels
                                          //   return ChartAxisLabel('${details.text}%', details.textStyle);
                                          // },
                                        ),
                                        series: <CartesianSeries>[
                                          ColumnSeries<SMChartData, String>(
                                            color: ColorManager.blueprime,
                                            dataSource: smChartData,
                                            xValueMapper: (SMChartData data, _) => data.x,
                                            yValueMapper: (SMChartData data, _) => data.y,
                                           // borderRadius: BorderRadius.all(Radius.circular(8)),
                                            width: 0.1,
                                           // spacing: 0.5,
                                          ),
                                        ],
                                      ),
                                    ),),
                                SizedBox(height: AppPadding.p10,),
                                JointContainerConst(
                                    height: 190,
                                    childHeading: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Types of Visits',
                                                textAlign: TextAlign.start,
                                                style: MenuContainerTextStylling.customTextStyle(context),
                                              ),
                                            ],
                                          ),
                                    ),
                                       childBody: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Expanded(
                                            // flex:2,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Container(
                                                   height: 140,
                                                   width: 200,
                                                   child: Stack(
                                                     alignment: Alignment.center,  // Centers the text within the container
                                                     children: [
                                                       PieChart(
                                                         PieChartData(
                                                           sections: [
                                                             PieChartSectionData(
                                                               color: ColorManager.SMPurple,
                                                               value: 40,
                                                               title: '',
                                                               radius: 20,
                                                             ),
                                                             PieChartSectionData(
                                                               color: ColorManager.SMYellow,
                                                               value: 20,
                                                               title: '',
                                                               radius: 20,
                                                             ),
                                                             PieChartSectionData(
                                                               color: ColorManager.SMGreen,
                                                               value: 10,
                                                               title: '',
                                                               radius: 20,
                                                             ),
                                                             PieChartSectionData(
                                                               color: ColorManager.SMRed,
                                                               value: 15,
                                                               title: '',
                                                               radius: 20,
                                                             ),
                                                           ],
                                                           centerSpaceRadius: 60,
                                                           centerSpaceColor: Colors.white,
                                                           sectionsSpace: 3,
                                                           borderData: FlBorderData(show: false),
                                                           startDegreeOffset: -90,
                                                         ),
                                                       ),
                                                       // Centering the text
                                                       Positioned(
                                                         child: Text(
                                                           "Visits",
                                                           style: TextStyle(
                                                             fontSize: FontSize.s12,
                                                             fontWeight: FontWeight.w500,
                                                             color: ColorManager.mediumgrey,
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 ),

                                                 // Container(
                                                 //    height: 140,
                                                 //    width: 200,
                                                 //    child: PieChart(
                                                 //      PieChartData(
                                                 //        sections: [
                                                 //          PieChartSectionData(
                                                 //            color: ColorManager.SMPurple,
                                                 //            value: 40,
                                                 //            title: '',
                                                 //            //titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                                 //            radius: 20,
                                                 //          ),
                                                 //          PieChartSectionData(
                                                 //            color: ColorManager.SMYellow,
                                                 //            value: 20,
                                                 //            title: '',
                                                 //            //titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                                 //            radius: 20,
                                                 //          ),
                                                 //          PieChartSectionData(
                                                 //            color: ColorManager.SMGreen,
                                                 //            value: 10,
                                                 //            title: '',
                                                 //            //titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                                 //            radius: 20,
                                                 //          ),
                                                 //          PieChartSectionData(
                                                 //            color: ColorManager.SMRed,
                                                 //            value: 15,
                                                 //            title: '',
                                                 //            //titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                                                 //            radius: 20,
                                                 //          ),
                                                 //        ],
                                                 //        centerSpaceRadius: 60,
                                                 //        centerSpaceColor: Colors.white,
                                                 //        sectionsSpace: 3,
                                                 //        borderData:
                                                 //        FlBorderData(show: false),
                                                 //        startDegreeOffset: -90,
                                                 //      ),
                                                 //    ),
                                                 //  ),
                                               ],
                                             ),
                                           ),
                                           Expanded(child: Container()),
                                           Expanded(
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: [
                                                 TypeOfVisitsConst(ContainerColor: ColorManager.SMPurple, text: "Type Visit I"),
                                                 TypeOfVisitsConst(ContainerColor: ColorManager.SMRed, text: "Type Visit II"),
                                                 TypeOfVisitsConst(ContainerColor: ColorManager.SMGreen, text: "Type Visit III"),
                                                 TypeOfVisitsConst(ContainerColor: ColorManager.SMYellow, text: "Type Visit IV"),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                      )
                              ],
                            )),
                        SizedBox(width: AppPadding.p20,),
                        Expanded(
                            flex: 3,
                            child: JointContainerConst(
                              height: 410,
                              childHeading: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Highest Case Loads',
                                    textAlign: TextAlign.start,
                                    style: MenuContainerTextStylling.customTextStyle(context),
                                  ),
                                ],
                              ),
                              childBody: HighestCaseLoadListview(onViewMoreTap: widget.onViewMoreTap,onViewMoreClinicianTypeTap: widget.onViewMoreClinicianTypeTap,),)),
                        SizedBox(width: AppPadding.p20,),
                        Expanded(
                            flex: 3,
                            child: JointContainerConst(
                              height: 410,
                              childHeading: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Most Missed Visit',
                                    textAlign: TextAlign.start,
                                    style: MenuContainerTextStylling.customTextStyle(context),
                                  ),
                                ],
                              ),
                              childBody: MostMissedVisitsListview(),)),
                      ],),

                    ],
                  )),
            ],
          ),
      ),
    );
  }
}

//////////////////////////////////////////////container constant //////////////////////////////////////
class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String numberText;
  final String descriptionText;

  const CustomContainer({
    required this.imagePath,
    required this.numberText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSize.s95,
        // width: 280,
        decoration: BoxDecoration(
          color: ColorManager.blueprime.withOpacity(0.17),
          borderRadius: BorderRadius.circular(47.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 52,
              width: 41,
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  numberText,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ColorManager.granitegray,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  descriptionText,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: ColorManager.granitegray,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


////