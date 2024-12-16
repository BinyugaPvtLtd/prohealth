import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/establishment_resources/em_dashboard_string_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/em_dashboard_const.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/widgets/const_linear_widget.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/widgets/contract_doc_const.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/widgets/contract_doc_popup.dart';
import 'package:prohealth/presentation/screens/em_module/dashboard/widgets/screens/widgets/data_file.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../../app/resources/common_resources/em_dashboard_theme.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../hr_module/dashboard/widgets/hr_dashboard_const.dart';

class ContractDocAuditingScreen extends StatefulWidget {
  const ContractDocAuditingScreen({super.key});

  @override
  State<ContractDocAuditingScreen> createState() => _ContractDocAuditingScreenState();
}

class _ContractDocAuditingScreenState extends State<ContractDocAuditingScreen> {
  int? _hoverIndex;
  final List<Map<String, dynamic>> _data = [
    {'label': '3-5 hrs\n', 'value': 25, 'color': ColorManager.blueprime.withOpacity(0.5)},
    {'label': 'Less than\n1 hrs\n', 'value': 20, 'color': ColorManager.EMFYellow},
    {'label': '1-3 hrs\n', 'value': 35, 'color': ColorManager.pieChartGreen},
    {'label': 'More\nthan\n5 hrs\n', 'value': 15, 'color': ColorManager.pieChartBlue},
  ];

  ///line graph
  final List<ChartDataLine> chartDataline = [
    ChartDataLine(2012, 30),
    ChartDataLine(2014, 25),
    ChartDataLine(2016, 50),
    ChartDataLine(2018, 30),
    ChartDataLine(2020, 20),
    ChartDataLine(2022, 34),
    ChartDataLine(2024, 40)
  ];
  final List<ChartDataLine> chartDatalineDotted = [
    ChartDataLine(2012, 40),
    ChartDataLine(2014, 55),
    ChartDataLine(2016, 30),
    ChartDataLine(2018, 40),
  ];
  List<ChartedDataLine> chartedDataline = [
    ChartedDataLine(11000, 1),
    ChartedDataLine(12500, 9),
    ChartedDataLine(15000, 3),
    ChartedDataLine(17500, 3),
    ChartedDataLine(20000, 5),
  ];

  // List<ChartedDataLine> chartedDataline = [
  //   ChartedDataLine(10000, 100000),
  //   ChartedDataLine(11000, 200000),
  //   ChartedDataLine(12000, 700000),
  //   ChartedDataLine(13000, 150000),
  //   ChartedDataLine(14000, 500000),
  //   ChartedDataLine(15000, 200000),
  // ];
  // List<ChartedDataLine> chartedDatalineNew = [
  //   ChartedDataLine(10000, 100000),
  //   ChartedDataLine(11000, 150000),
  //   ChartedDataLine(12000, 200000),
  //   ChartedDataLine(13000, 150000),
  //   ChartedDataLine(14000, 100000),
  //   ChartedDataLine(15000, 50000),
  // ];
  List<ChartedDataLine> chartedDatalineNew = [
    ChartedDataLine(11000, 1),
    ChartedDataLine(12500, 3),
    ChartedDataLine(15000, 4),
    ChartedDataLine(17500, 3),
    ChartedDataLine(20000, 2),
  ];

  String selectedValue = "Daily";
  final List<String> items = ["Daily", "Weekly", "Monthly"];
  @override
  Widget build(BuildContext context) {
    double total = _data.fold(0, (sum, item) => sum + item['value'] as double);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: Column(
          children: [
            ///first row
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: ContractDocConst()),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: LinearCardWidget(headingText: EmDashboardStringManager.activeContract, totalCount: '12', totalValue: 12,imagePath: "images/em_dashboard/contract.png"),)),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (context) => ContractDocAuditPopup());
                        },
                        child: LinearCardWidget(headingText: EmDashboardStringManager.randomaudits, totalCount: '20', totalValue: 20,imagePath: "images/em_dashboard/login.png")),)),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: LinearCardWidget(headingText: EmDashboardStringManager.nonCompliant, totalCount: '02', totalValue: 2,imagePath: "images/em_dashboard/TNO.png",),)),
              ],),
            SizedBox(height: AppSize.s15,),
            ///2nd row
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => FullScreenPopup(),
                        );
                      },
                      child: EMDashboardAllBlueSideContainer(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: ColorManager.blueBorder,
                                    child: Icon(Icons.file_copy_outlined,color: ColorManager.white,),
                                  ),
                                  SizedBox(width: AppSize.s20,),
                                  Text(EmDashboardStringManager.contractexpiresoon,style: EmDashText.customTextStyle(context),),
                                ],
                              ),
                              Text("Next 30 Days",style: CustomTextStylesCommon.commonStyle(
                                  fontSize: FontSize.s12,
                                  color: ColorManager.EMbrightred,
                                  fontWeight: FontWeight.w600),),
                            ]
                        ),
                      ),),
                    )),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (context) => ContractDocPenaltyPopup());
                        },
                        child: LinearCardWidget(headingText: EmDashboardStringManager.AuditPenaltyAmt, totalCount: '\$1000', totalValue: 80,imagePath: "images/em_dashboard/penalty.png")),)),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: LinearCardWidget(headingText: EmDashboardStringManager.complianceIncidentRR, totalCount: '04', totalValue: 30,imagePath: "images/em_dashboard/OCSR.png"),)),
                SizedBox(width: AppSize.s15,),
                Expanded(
                    flex: 2,
                    child: EMDashboardContainerBBorderConst(child: GestureDetector(
                        onTap: (){
                          showDialog(context: context, builder: (context) => ContractDocAuditPopup());
                        },
                        child: LinearCardWidget(headingText: EmDashboardStringManager.govmtAuditPass, totalCount: '20', totalValue: 20,imagePath: "images/em_dashboard/login.png")),)),
              ],),
            SizedBox(height: AppSize.s15,),
            ///3rd row
            Row(children: [
              Expanded(
                  flex: 3,
                  child: EMDashboardContainerConst(child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(EmDashboardStringManager.avgtimecompleteInternalAudit,
                        style: EmDashContainerHeadTextStyle.customTextStyle(context)),
                        MouseRegion(
                          onHover: (event) {
                            // Hover logic handled by pieTouchData
                          },
                          onExit: (_) {
                            setState(() {
                              _hoverIndex = null; // Reset hover index when the pointer leaves
                            });
                          },
                          child: SizedBox(
                            height: AppSize.s200,
                            child: PieChart(
                              PieChartData(
                                sections: _data.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  var item = entry.value;

                                  bool isHovered = _hoverIndex == index;

                                  return PieChartSectionData(
                                    color: item['color'],
                                    value: item['value'].toDouble(),
                                    // Always show the label; append percentage when hovered
                                    title: isHovered
                                        ? '${item['label']} (${(item['value'] / total * 100).toStringAsFixed(1)}%)'
                                        : item['label'],
                                    radius: isHovered ? 60 : 50,
                                    titleStyle: TextStyle(
                                      fontSize: isHovered ? 12 : 10, // Slightly larger when hovered
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.mediumgrey,
                                    ),
                                  );
                                }).toList(),
                                pieTouchData: PieTouchData(
                                  touchCallback: (event, pieTouchResponse) {
                                    setState(() {
                                      _hoverIndex = pieTouchResponse?.touchedSection?.touchedSectionIndex;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        // MouseRegion(
                        //   onHover: (event) {
                        //     // Hover logic will need to be computed based on the position of the mouse.
                        //     // For now, this will simulate hover functionality.
                        //   },
                        //   onExit: (_) {
                        //     setState(() {
                        //       _hoverIndex =
                        //       null; // Reset hover index when the pointer leaves.
                        //     });
                        //   },
                        //   child: SizedBox(
                        //     height: 200,
                        //     child: PieChart(
                        //       PieChartData(
                        //         sections: _data.asMap().entries.map((entry) {
                        //           int index = entry.key;
                        //           var item = entry.value;
                        //
                        //           bool isHovered = _hoverIndex == index;
                        //
                        //           return PieChartSectionData(
                        //             color: item['color'],
                        //             value: item['value'].toDouble(),
                        //             title: isHovered
                        //                 ? '${item['label']} (${(item['value'] / total * 100).toStringAsFixed(1)}%)'
                        //                 : '',
                        //             radius: isHovered ? 60 : 50,
                        //             titleStyle: TextStyle(
                        //               fontSize: isHovered ? 10 : 0,
                        //               fontWeight: FontWeight.w600,
                        //               color: ColorManager.mediumgrey,
                        //             ),
                        //           );
                        //         }).toList(),
                        //         pieTouchData: PieTouchData(
                        //           touchCallback: (event, pieTouchResponse) {
                        //             if (pieTouchResponse?.touchedSection != null) {
                        //               setState(() {
                        //                 _hoverIndex = pieTouchResponse!
                        //                     .touchedSection!.touchedSectionIndex;
                        //               });
                        //             }
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Text("14:30:00 pm",
                          style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s18,
                              color: ColorManager.blueprime,
                              fontWeight: FontWeight.w700),),
                      ],
                    ),
                  )),
              SizedBox(width: AppSize.s15,),
              Expanded(
                  flex: 5,
                  child: EMDashboardContainerConst(child: AuditPrepTimeOffice())),
              SizedBox(width: AppSize.s15,),
              Expanded(
                  flex: 4,
                  child: EMDashboardContainerConst(child: AvgComRatingOffice())),
            ],),
            SizedBox(height: AppSize.s15,),
            ///4th row
            Row(children: [
              Expanded(
                  flex: 3,
                  child: EMDashboardContainerConst(child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                       EmDashboardStringManager.complianceAuditFreqLocation,
                        style: EmDashContainerHeadTextStyle.customTextStyle(context)
                      ),
                      Container(
                        height: AppSize.s240,
                        padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                        child: SfCartesianChart(
                          primaryXAxis: NumericAxis(
                            title: AxisTitle(text: ""), // Optional title for the X-axis
                            majorGridLines: MajorGridLines(width: 0),
                            minimum: 10000, // Start of the X-axis range
                            maximum: 20000, // End of the X-axis range
                            interval: 2500, // Interval between the X-axis labels
                            axisLabelFormatter: (AxisLabelRenderDetails details) {
                              return ChartAxisLabel(
                                details.value.toInt().toString(),
                                TextStyle(fontSize: FontSize.s12),
                              );
                            },
                          ),
                          primaryYAxis: CategoryAxis(
                            title: AxisTitle(text: ""), // Optional title for the Y-axis
                            majorGridLines: MajorGridLines(width: 0.5),
                            labelPlacement: LabelPlacement.onTicks, // Align labels on ticks
                            axisLabelFormatter: (AxisLabelRenderDetails details) {
                              // Map Y-axis values to custom labels
                              List<String> officeLocations = [
                                'Office Location 1',
                                'Office Location 2',
                                'Office Location 3',
                                'Office Location 4',
                                'Office Location 5',
                                'Office Location 6',
                                'Office Location 7',
                                'Office Location 8',
                                'Office Location 9',
                                'Office Location 10',
                              ];
                              int index = details.value.toInt() - 1;
                              String label = (index >= 0 && index < officeLocations.length)
                                  ? officeLocations[index]
                                  : '';
                              return ChartAxisLabel(
                                label,
                                TextStyle(fontSize: FontSize.s12),
                              );
                            },
                          ),
                          series: <SplineSeries<ChartedDataLine, int>>[
                            // First line
                            SplineSeries<ChartedDataLine, int>(
                              dataSource: chartedDataline, // Replace with your data
                              xValueMapper: (ChartedDataLine data, _) => data.x,
                              yValueMapper: (ChartedDataLine data, _) => data.y,
                              color: ColorManager.bluebottom,
                              width: 2,
                            ),
                            // Second line
                            SplineSeries<ChartedDataLine, int>(
                              dataSource: chartedDatalineNew, // Replace with your data
                              xValueMapper: (ChartedDataLine data, _) => data.x,
                              yValueMapper: (ChartedDataLine data, _) => data.y,
                              color: ColorManager.red,
                              width: 2,
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   height: AppSize.s240,
                      //   padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                      //   child: SfCartesianChart(
                      //     primaryXAxis: NumericAxis(
                      //       title: AxisTitle(text: ""), // Optional title for the X-axis
                      //       majorGridLines: MajorGridLines(width: 0),
                      //       minimum: 10000, // Start of the X-axis range
                      //       maximum: 20000, // End of the X-axis range
                      //       interval: 2500, // Interval between the X-axis labels
                      //       axisLabelFormatter: (AxisLabelRenderDetails details) {
                      //         // Format X-axis labels as integers
                      //         return ChartAxisLabel(
                      //           details.value.toInt().toString(),
                      //           TextStyle(fontSize: FontSize.s12),
                      //         );
                      //       },
                      //     ),
                      //     primaryYAxis: NumericAxis(
                      //       title: AxisTitle(text: ""), // Optional title for the Y-axis
                      //       majorGridLines: MajorGridLines(width: 0.5),
                      //       minimum: 1, // Start of the Y-axis range
                      //       maximum: 10, // End of the Y-axis range
                      //       interval: 1, // Interval between the Y-axis labels
                      //       axisLabelFormatter: (AxisLabelRenderDetails details) {
                      //         // Format Y-axis labels as integers
                      //         return ChartAxisLabel(
                      //           details.value.toInt().toString(),
                      //           TextStyle(fontSize: FontSize.s12),
                      //         );
                      //       },
                      //     ),
                      //     series: <SplineSeries<ChartedDataLine, int>>[
                      //       // First line
                      //       SplineSeries<ChartedDataLine, int>(
                      //         dataSource: chartedDataline, // Replace with your data
                      //         xValueMapper: (ChartedDataLine data, _) => data.x,
                      //         yValueMapper: (ChartedDataLine data, _) => data.y,
                      //         color: ColorManager.bluebottom,
                      //         width: 2,
                      //       ),
                      //       // Second line
                      //       SplineSeries<ChartedDataLine, int>(
                      //         dataSource: chartedDatalineNew, // Replace with your data
                      //         xValueMapper: (ChartedDataLine data, _) => data.x,
                      //         yValueMapper: (ChartedDataLine data, _) => data.y,
                      //         color: ColorManager.red,
                      //         width: 2,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ///
                      // Container(
                      //   height: AppSize.s240,
                      //   padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                      //   child: SfCartesianChart(
                      //     primaryXAxis: NumericAxis(
                      //       title: AxisTitle(text: ""),
                      //       majorGridLines: MajorGridLines(width: 0),
                      //     ),
                      //     primaryYAxis: NumericAxis(
                      //       axisLabelFormatter: (AxisLabelRenderDetails details) {
                      //         return ChartAxisLabel(
                      //           '${details.value.toInt()}',
                      //           TextStyle(fontSize: FontSize.s12),
                      //         );
                      //       },
                      //       majorGridLines: MajorGridLines(width: 0.5),
                      //     ),
                      //     series: <SplineSeries<ChartedDataLine, int>>[
                      //       // Single solid line
                      //       SplineSeries<ChartedDataLine, int>(
                      //         dataSource: chartedDataline, // Replace with your data
                      //         xValueMapper: (ChartedDataLine data, _) => data.x,
                      //         yValueMapper: (ChartedDataLine data, _) => data.y,
                      //         color: ColorManager.bluebottom,
                      //         width: 2,
                      //       ),
                      //       SplineSeries<ChartedDataLine, int>(
                      //         dataSource: chartedDatalineNew, // Replace with your data
                      //         xValueMapper: (ChartedDataLine data, _) => data.x,
                      //         yValueMapper: (ChartedDataLine data, _) => data.y,
                      //         color: ColorManager.red,
                      //         width: 2,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),)),
              SizedBox(width: AppSize.s15,),
              Expanded(
                  flex: 3,
                  child: EMDashboardContainerConst(
                      child: AuditDates())),
              SizedBox(width: AppSize.s15,),
              Expanded(
                  flex: 2,
                  child: EMDashboardContainerConst(
                      child: Column(
                        children: [
                        Text(
                        EmDashboardStringManager.perOfficeComplianceScore,
                        textAlign: TextAlign.center,
                        style: EmDashContainerHeadTextStyle.customTextStyle(context)),
                          Container(
                            height: AppSize.s200,
                            width: AppSize.s181,
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return RadialGradient(
                                      colors: [
                                        Color(0xff59A9F4),
                                        Color(0xff34628E),
                                      ],
                                      center: Alignment.center,
                                      radius: 0.5,
                                    ).createShader(rect);
                                  },
                                  blendMode: BlendMode.srcATop,
                                  child: PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          color: Colors.transparent,
                                          value: 20,
                                          title: '',
                                          radius: 60,
                                        ),
                                        PieChartSectionData(
                                          color: Colors.grey,
                                          value: 90,
                                          title: '',
                                          radius: 60,
                                        ),
                                      ],
                                      centerSpaceRadius: 30,
                                      centerSpaceColor: Colors.white,
                                      sectionsSpace: 0,
                                      borderData: FlBorderData(show: false),
                                      startDegreeOffset: 0,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: AppSize.s60,
                                  width: AppSize.s60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "92%",
                            textAlign: TextAlign.center,
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s24,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.bluebottom,
                            ),)
                        ],
                      ))),
            ],),
            SizedBox(height: AppSize.s15,),
            ///5th row
            Row(children: [
              Expanded(
                  flex: 4,
                  child: EMDashboardContainerConst(
                    height: AppSize.s500,
                    child: OfficeExpiringComDoc(),)),
              SizedBox(width: AppSize.s15,),
              Expanded(
                flex: 3,
                child: Column(children: [
                  EMDashboardContainerConst(
                      height: AppSize.s240,
                      child: UpcomingCpmDeadlines()),
                  SizedBox(height: AppPadding.p20,),
                  EMDashboardContainerConst(
                    height: AppSize.s240,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          EmDashboardStringManager.comDocUpdtFreq,
                          style: EmDashContainerHeadTextStyle.customTextStyle(context)
                        ),
                        Container(
                          height: AppSize.s190,
                          padding: EdgeInsets.symmetric(horizontal: AppPadding.p100),
                          child: SfCartesianChart(
                            primaryXAxis: NumericAxis(
                              title: AxisTitle(text: ""),
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              axisLabelFormatter: (AxisLabelRenderDetails details) {
                                return ChartAxisLabel(
                                  '${details.value.toInt()}',
                                  TextStyle(fontSize: FontSize.s12),
                                );
                              },
                              majorGridLines: MajorGridLines(width: 0.5),
                            ),
                            series: <SplineSeries<ChartedDataLine, int>>[
                              // Single solid line
                              SplineSeries<ChartedDataLine, int>(
                                dataSource: chartedDataline, // Replace with your data
                                xValueMapper: (ChartedDataLine data, _) => data.x,
                                yValueMapper: (ChartedDataLine data, _) => data.y,
                                color: ColorManager.EMCyan,
                                width: 2,
                              ),
                              SplineSeries<ChartedDataLine, int>(
                                dataSource: chartedDatalineNew, // Replace with your data
                                xValueMapper: (ChartedDataLine data, _) => data.x,
                                yValueMapper: (ChartedDataLine data, _) => data.y,
                                color: ColorManager.EMDCyan,
                                width: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],),
              )
            ],),
            SizedBox(height: AppSize.s15,),
            ///6th row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p50),
              child: Row(children: [
                Expanded(flex: 3,child: EMDashboardContainerConst(child: AverageTimeAuditFindings(),)),
                SizedBox(width: AppPadding.p20,),
                Expanded(flex: 5,child: EMDashboardContainerConst(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Container(
                          width: AppSize.s125,
                          height: AppSize.s20,
                          padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFC9C9C9), width: 0.86),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.transparent, // Ensure opacity 0 effect
                          ),
                          child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return DropdownButtonHideUnderline(
                                  child: DropdownButton<
                                      String>(
                                    value: selectedValue,
                                    icon: const Icon(Icons
                                        .arrow_drop_down),
                                    iconSize: IconSize.I16,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: FontSize.s10),
                                    items: items.map((
                                        String value) {
                                      return DropdownMenuItem<
                                          String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedValue =
                                        newValue!;
                                      });
                                    },
                                  ),
                                );
                              }
                          ),
                        )
                      ],),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p8,right: AppPadding.p30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(EmDashboardStringManager.conPriceIncPer,
                            style: EmDashContainerHeadTextStyle.customTextStyle(context)),
                          Row(children: [
                            TextCircleConst(text: 'Latest', circleColor: ColorManager.EMDCyan,textColor: ColorManager.blackForLoginTexts,),
                            SizedBox(width:AppSize.s5),
                            TextCircleConst(text: 'Previous', circleColor: ColorManager.EMCyan, textColor: ColorManager.blackForLoginTexts,),
                          ],),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.s10,),
                    Container(
                  height: AppSize.s210,
                  child: SfCartesianChart(
                      primaryYAxis: NumericAxis(
                        axisLabelFormatter: (AxisLabelRenderDetails details) {
                          // Format the y-axis label to append '%'
                          return ChartAxisLabel('${details.value.toInt()}%', TextStyle(fontSize: FontSize.s12));
                        },
                      ),
                      series: <CartesianSeries>[
                        // Renders spline chart
                        SplineSeries<ChartDataLine, int>(
                            dataSource: chartDataline,
                            xValueMapper: (ChartDataLine data, _) => data.x,
                            yValueMapper: (ChartDataLine data, _) => data.y,
                          color: ColorManager.EMCyan,
                          width: 2,),
                        SplineSeries<ChartDataLine, int>(
                          dataSource: chartDatalineDotted, // Replace with your dotted line data
                          xValueMapper: (ChartDataLine data, _) => data.x,
                          yValueMapper: (ChartDataLine data, _) => data.y,
                          color: ColorManager.EMDCyan,
                          width: 2,
                          dashArray: [5, 5], // Creates a dashed effect
                        )
                      ]),
                ),],
                ),)),
              ],),
            ),
            SizedBox(height: AppSize.s15,),
          ],
        ),
      ),
    );
  }
}
