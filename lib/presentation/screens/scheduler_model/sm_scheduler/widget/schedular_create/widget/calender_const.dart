// import 'package:flutter/material.dart';
// import 'package:calendar_view/calendar_view.dart';
// import 'package:intl/intl.dart'; // Import the intl package
//
//
// class CalenderConstant extends StatefulWidget {
//   @override
//   _CalenderConstantState createState() => _CalenderConstantState();
// }
//
// class _CalenderConstantState extends State<CalenderConstant> {
//   String _selectedView = 'Week';
//
//   @override
//   Widget build(BuildContext context) {
//     return CalendarControllerProvider(
//       controller: EventController(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedView = 'Day';
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Blue background color
//                         foregroundColor: Colors.white, // White text color
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Day'),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedView = 'Week';
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Blue background color
//                         foregroundColor: Colors.white, // White text color
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Week'),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedView = 'Month';
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Blue background color
//                         foregroundColor: Colors.white, // White text color
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Month'),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.redAccent,
//                   child: _buildCalendarView(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildCalendarView() {
//     switch (_selectedView) {
//       case 'Week':
//         return WeekView(
//           minDay: DateTime(1990),
//           maxDay: DateTime(2050),
//           initialDay: DateTime.now(),
//           showLiveTimeLineInAllDays: true,
//           heightPerMinute: 1,
//           timeLineBuilder: (date) =>
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   DateFormat('hh:mm a').format(date),
//                   // 12-hour format with AM/PM
//                   style: const TextStyle(fontSize: 12),
//                 ),
//               ),
//           timeLineWidth: 80,
//           // Adjust this width as needed
//           liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
//             color: Colors.black,
//             height: 2,
//           ),
//           eventArranger: const SideEventArranger(),
//
//         );
//       case 'Month':
//         return MonthView(
//           minMonth: DateTime(1990),
//           maxMonth: DateTime(2050),
//           initialMonth: DateTime.now(),
//         );
//       case 'Day':
//       default:
//         return DayView(
//           minDay: DateTime(1990),
//           maxDay: DateTime(2050),
//           initialDay: DateTime.now(),
//           showLiveTimeLineInAllDays: true,
//           heightPerMinute: 1,
//           timeLineBuilder: (date) =>
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   DateFormat('hh:mm a').format(date),
//                   // 12-hour format with AM/PM
//                   style: const TextStyle(fontSize: 12),
//                 ),
//               ),
//           timeLineWidth: 80,
//           // Adjust this width as needed
//           liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
//             color: Colors.black,
//             height: 2,
//           ),
//           eventArranger: const SideEventArranger(),
//         );
//     }
//   }
// }














///
// import 'package:flutter/material.dart';
// import 'package:calendar_view/calendar_view.dart';
// import 'package:intl/intl.dart';
//
// class CalenderConstant extends StatefulWidget {
//   @override
//   _CalenderConstantState createState() => _CalenderConstantState();
// }
//
// class _CalenderConstantState extends State<CalenderConstant> {
//   String _selectedView = 'Week';
//   EventController eventController = EventController();
//
//   @override
//   Widget build(BuildContext context) {
//     return CalendarControllerProvider(
//       controller: eventController,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => setState(() => _selectedView = 'Day'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Day'),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => setState(() => _selectedView = 'Week'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Week'),
//                     ),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () => setState(() => _selectedView = 'Month'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       ),
//                       child: Text('Month'),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   color: Colors.redAccent,
//                   child: _buildCalendarView(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCalendarView() {
//     switch (_selectedView) {
//       case 'Week':
//         return WeekView(
//           controller: eventController,
//           minDay: DateTime(1990),
//           maxDay: DateTime(2050),
//           initialDay: DateTime.now(),
//           showLiveTimeLineInAllDays: true,
//           heightPerMinute: 1,
//           timeLineBuilder: _timeLineBuilder,
//           timeLineWidth: 80,
//           liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
//             color: Colors.black,
//             height: 2,
//           ),
//           eventArranger: const SideEventArranger(),
//           onDateLongPress: _onDateLongPress,
//         );
//       case 'Month':
//         return MonthView(
//           controller: eventController,
//           minMonth: DateTime(1990),
//           maxMonth: DateTime(2050),
//           initialMonth: DateTime.now(),
//           onCellTap: (events, date) => _onDateLongPress(date),
//         );
//       case 'Day':
//       default:
//         return DayView(
//           controller: eventController,
//           minDay: DateTime(1990),
//           maxDay: DateTime(2050),
//           initialDay: DateTime.now(),
//           showLiveTimeLineInAllDays: true,
//           heightPerMinute: 1,
//           timeLineBuilder: _timeLineBuilder,
//           timeLineWidth: 80,
//           liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
//             color: Colors.black,
//             height: 2,
//           ),
//           eventArranger: const SideEventArranger(),
//           onDateLongPress: _onDateLongPress,
//         );
//     }
//   }
//
//   Widget _timeLineBuilder(DateTime date) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       alignment: Alignment.centerRight,
//       child: Text(
//         DateFormat('hh:mm a').format(date),
//         style: const TextStyle(fontSize: 12),
//       ),
//     );
//   }
//
//   void _onDateLongPress(DateTime date) {
//     String eventTitle = '';
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Create Event'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Date: ${DateFormat('yyyy-MM-dd HH:mm').format(date)}'),
//             TextField(
//               decoration: InputDecoration(labelText: 'Event Title'),
//               onChanged: (value) {
//                 eventTitle = value;
//               },
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             child: Text('Cancel'),
//             onPressed: () => Navigator.pop(context),
//           ),
//           TextButton(
//             child: Text('Create'),
//             onPressed: () {
//               _createEvent(date, eventTitle);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _createEvent(DateTime date, String title) {
//     if (title.isNotEmpty) {
//       final event = CalendarEventData(
//         date: date,
//         title: title,
//         description: 'Event description',
//         startTime: date,
//         endTime: date.add(Duration(hours: 1)),
//         color: Colors.blue,
//       );
//       setState(() {
//         eventController.add(event);
//       });
//       print('Event created: ${event.title} at ${event.date}');
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/provider/navigation_provider.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/ci_visit_manager.dart';
import 'package:prohealth/data/api_data/establishment_data/company_identity/ci_visit_data.dart';
import 'package:prohealth/data/api_data/sm_data/scheduler_create_data/create_data.dart';
import 'package:prohealth/data/api_data/sm_data/scheduler_create_data/schedular_data.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_calender/widget/patient_details.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular_create/widget/edit_calender_schedule_popup.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app/resources/value_manager.dart';
import 'assign_visit_pop_up.dart';

class CalenderConstant extends StatefulWidget {
  final SchedularData? schedularData;
  final VoidCallback onBack;
  CalenderConstant({ this.schedularData, required this.onBack});
  @override
  _CalenderConstantState createState() => _CalenderConstantState();
}

class _CalenderConstantState extends State<CalenderConstant> {
  String _selectedView = 'Week';
  final EventController eventController = EventController();

  @override
  void initState() {
    super.initState();
  }
  List<CalendarEventData> allEvents = [];
  Map<CalendarEventData, int> eventSchedulerMap = {}; // Map to store the event and schedulerId
  TextEditingController ctlrdetails = TextEditingController();
  TextEditingController ctlrassignedate = TextEditingController();
  TextEditingController ctlrstarttime = TextEditingController();
  TextEditingController ctlrendtime = TextEditingController();

  /// Edit time
  TextEditingController editCtlrdetails = TextEditingController();
  TextEditingController editCtlrassignedate = TextEditingController();
  TextEditingController editCctlrstarttime = TextEditingController();
  TextEditingController editCctlrendtime = TextEditingController();
  TextEditingController editCctlrendClinitianName = TextEditingController();
  TextEditingController editCctlrendPatientName = TextEditingController();
  //TextEditingController  = TextEditingController();

  String? selectedValue;
  String? docAddVisitType;

  /// Edit schedule
  String? editSelectedValue;
  String? editDocAddVisitType;
  final PageController _pageController = PageController();

  int selectedIndex = 0;
  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
  //
  // void goBack() {
  //   if (selectedIndex > 0) {
  //     setState(() {
  //       selectedIndex--;
  //     });
  //     _pageController.animateToPage(
  //       selectedIndex,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.ease,
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CalendarControllerProvider(
          controller: eventController,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: widget.onBack,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: IconSize.I16,
                                  color: ColorManager.mediumgrey,
                                ),
                              ),
                              Text(
                                "Back",
                                style: CustomTextStylesCommon.commonStyle(
                                  color: ColorManager.mediumgrey,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        // TextButton.icon(
                        //   onPressed: widget.onBack,
                        //   label: Text(
                        //     'Back',
                        //     style: CustomTextStylesCommon.commonStyle(
                        //         fontSize: FontSize.s14,
                        //         fontWeight: FontWeight.w500,
                        //         color: ColorManager.textBlack),
                        //   ),
                        //   icon: Icon(Icons.keyboard_arrow_left_rounded, color: ColorManager.textBlack),
                        // ),
                        Row(
                          children: [
                          ElevatedButton(
                            onPressed: () => setState(() => _selectedView = 'Day'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6)),
                              backgroundColor: _selectedView == 'Day' ? ColorManager.red : ColorManager.white,
                              foregroundColor: _selectedView == 'Day' ? ColorManager.white : ColorManager.mediumgrey,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            child: Text('Day'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () => setState(() => _selectedView = 'Week'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6)),
                              backgroundColor: _selectedView == 'Week' ? ColorManager.red : ColorManager.white,
                              foregroundColor: _selectedView == 'Week' ? ColorManager.white : ColorManager.mediumgrey,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            child: Text('Week'),
                          ),
                        ],)

                        // const SizedBox(width: 10),
                        // ElevatedButton(
                        //   onPressed: () => setState(() => _selectedView = 'Month'),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: _selectedView == 'Month' ? ColorManager.blueprime : ColorManager.white,
                        //     foregroundColor: _selectedView == 'Month' ? ColorManager.white : ColorManager.mediumgrey,
                        //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        //   ),
                        //   child: Text('Month'),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 50,
                        children:[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('images/bg.jpg',),
                              ),
                              Text('John',style: CustomTextStylesCommon.commonStyle(
                                  color:Color(0xFF686464),
                                  fontWeight: FontWeight.w600,fontSize: 12),),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Color(0xFF527FB9)),
                                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Center(
                                  child: Text('ST',style: CustomTextStylesCommon.commonStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w400,fontSize: 9)),
                                ),
                              ),
                              Icon(Icons.circle,size: 9,color: Color(0xFFF6928A),)
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('images/bg.jpg',),
                              ),
                              Text('Thomas',style: CustomTextStylesCommon.commonStyle(
                                  color:Color(0xFF686464),
                                  fontWeight: FontWeight.w600,fontSize: 12)),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Color(0xFFFEBD4D)),
                                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                                child: Center(
                                  child: Text('OT',style: CustomTextStylesCommon.commonStyle(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w400,fontSize: 9)),
                                ),
                              ),
                              Icon(Icons.circle,size: 9,color: Colors.black,)
                            ],
                          )

                      ]
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      child: _buildCalendarView(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        PatientDetailsCalender(onBack: widget.onBack,),
      ],
    );
  }

  Widget _buildCalendarView() {
    try {
      switch (_selectedView) {
        case 'Week':
          return
            WeekView(
            controller: eventController,
            eventTileBuilder: (date, events, boundary, start, end) {
              return ListView(
                children: events.map((event) {
                  return InkWell(
                    onTap: (){
                      int? schedulerId = eventSchedulerMap[event];
                      selectButton(1);
                      //Provider.of<RouteProvider>(context,listen:false).navigateToPage(context, PatientDetailsCalender());
                      // if(schedulerId != null){
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return FutureBuilder<CreatePrefillDataScheduler>(future: getPreFillCalenderData(context: context,schedulerCreateId: schedulerId),
                      //         builder: (BuildContext context,snapshot) {
                      //           if(snapshot.connectionState == ConnectionState.waiting){
                      //             return Center(child: CircularProgressIndicator(color: ColorManager.blueprime,),);
                      //           }
                      //           var patientId = snapshot.data!.patientId;
                      //           var details = snapshot.data!.details;
                      //           editCtlrdetails = TextEditingController(text: snapshot.data!.details);
                      //
                      //           //var patientName = "${snapshot.data!.patientFirstName} ${snapshot.data!.patientLastName}";
                      //
                      //           var assignedate = snapshot.data!.assignDate;
                      //           editCtlrassignedate = TextEditingController(text: snapshot.data!.assignDate);
                      //
                      //           var startTime = snapshot.data!.startTime;
                      //           editCctlrstarttime = TextEditingController(text: snapshot.data!.startTime);
                      //
                      //           var endTime = snapshot.data!.endTime;
                      //           editCctlrendtime = TextEditingController(text: snapshot.data!.endTime);
                      //           return EditCalenderSchedulePopup(onPressed: () async{
                      //             var response = await updateScheduleCalender(
                      //               context: context, schedulerCreateId: schedulerId,
                      //               patientId: 1, clinicianId: 134,
                      //               visitType: docAddVisitType!,
                      //               assignDate: assignedate == editCtlrassignedate.text ? assignedate.toString() : editCtlrassignedate.text,
                      //               startTime: startTime == editCctlrstarttime.text ? startTime.toString() :editCctlrstarttime.text ,
                      //               endTime: endTime == editCctlrendtime.text ? endTime.toString() : editCctlrendtime.text,
                      //               details: details == editCtlrdetails.text ? details.toString() : editCtlrdetails.text,);
                      //
                      //             fetchAndSetEvents(context, 134);
                      //             if(response.statusCode == 200 || response.statusCode == 201){
                      //               ctlrassignedate.clear();
                      //               ctlrstarttime.clear();
                      //               ctlrendtime.clear();
                      //               ctlrdetails.clear();
                      //               Navigator.pop(context);
                      //               showDialog(
                      //                 context: context,
                      //                 builder: (BuildContext context) {
                      //                   return Dialog(
                      //                     shape: RoundedRectangleBorder(
                      //                       borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      //                     ),
                      //                     child: Container(
                      //                       height: 270,
                      //                       width: 300,
                      //                       padding: EdgeInsets.all(20.0),
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.circular(15.0), // Rounded corners
                      //                         color: Colors.white, // Background color
                      //                       ),
                      //                       child: Column(
                      //                         mainAxisSize: MainAxisSize.min,
                      //                         children: <Widget>[
                      //                           Icon(
                      //                             Icons.check_circle_outline,
                      //                             color: Color(0xFF50B5E5),
                      //                             size: 80.0,
                      //                           ),
                      //                           SizedBox(height: 20.0),
                      //                           Text(
                      //                             "Successfully Edit !",
                      //                             style: GoogleFonts.firaSans(
                      //                                 fontSize: 16.0,
                      //                                 color: Colors.black,
                      //                                 fontWeight: FontWeight.w700),
                      //                             textAlign: TextAlign.center,
                      //                           ),
                      //                           SizedBox(height: 30.0),
                      //                           Row(
                      //                             mainAxisAlignment: MainAxisAlignment.center,
                      //                             children: <Widget>[
                      //                               CustomButton(
                      //                                   height: 30,
                      //                                   width: 130,
                      //                                   text: 'Continue',
                      //                                   onPressed: () {
                      //                                     Navigator.pop(context);
                      //                                   })
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   );
                      //                 },
                      //               );
                      //             }
                      //           },
                      //             ctlrdetails: editCtlrdetails, ctlrassignedate: editCtlrassignedate,
                      //             ctlrstarttime: editCctlrstarttime, ctlrendtime: editCctlrendtime,
                      //             child: FutureBuilder<List<VisitListData>>(
                      //               future: getVisitList(context),
                      //               builder: (context, snapshot) {
                      //                 if (snapshot.connectionState == ConnectionState.waiting) {
                      //                   return Container(
                      //                     width: 354,
                      //                     height: 30,
                      //                     decoration: BoxDecoration(
                      //                       color: ColorManager.white,
                      //                       borderRadius: BorderRadius.circular(10),
                      //                     ),
                      //                   );
                      //                 }
                      //                 if (snapshot.hasData && snapshot.data!.isEmpty) {
                      //                   return Center(
                      //                     child: Text(
                      //                       AppString.dataNotFound,
                      //                       style: CustomTextStylesCommon.commonStyle(
                      //                         fontWeight: FontWeightManager.medium,
                      //                         fontSize: FontSize.s14,
                      //                         color: ColorManager.mediumgrey,
                      //                       ),
                      //                     ),
                      //                   );
                      //                 }
                      //                 if (snapshot.hasData) {
                      //                   List<DropdownMenuItem<String>> dropDownZoneList = [];
                      //                   for (var i in snapshot.data!) {
                      //                     dropDownZoneList.add(
                      //                       DropdownMenuItem<String>(
                      //                         child: Text(i.visitType),
                      //                         value: i.visitType,
                      //                       ),
                      //                     );
                      //                   }
                      //                   return CICCDropdown(
                      //                     initialValue: dropDownZoneList.isNotEmpty
                      //                         ? dropDownZoneList[0].value
                      //                         : null,
                      //                     onChange: (val) {
                      //                       for (var a in snapshot.data!) {
                      //                         if (a.visitType == val) {
                      //                           docAddVisitType = a.visitType;
                      //                         }
                      //                       }
                      //                     },
                      //                     items: dropDownZoneList,
                      //                   );
                      //                 }
                      //                 return const SizedBox();
                      //               },
                      //             ),
                      //           );
                      //         },
                      //
                      //       );
                      //     },
                      //   );
                      // }
                      // else{
                      //   print("ScheduleId error");
                      // }

                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          top: BorderSide(color: ColorManager.green, width: 2.0),
                          right: BorderSide(color: ColorManager.green, width: 2.0),
                          bottom: BorderSide(color: ColorManager.green, width: 2.0),
                          left: BorderSide(color: ColorManager.green, width: 2.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.title, style: CustomTextStylesCommon.commonStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorManager.mediumgrey,
                          )),
                          Text(event.description!,style: CustomTextStylesCommon.commonStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorManager.mediumgrey,
                          )),
                          Text('Start: ${DateFormat('hh:mm a').format(event.startTime!)}', style: CustomTextStylesCommon.commonStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: FontSize.s10,
                            color: ColorManager.mediumgrey,
                          )),
                          Text('End: ${DateFormat('hh:mm a').format(event.endTime!)}', style: CustomTextStylesCommon.commonStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: FontSize.s10,
                            color: ColorManager.mediumgrey,
                          )),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            fullDayEventBuilder: (events, date) {
              return ListView(
                children: events.map((event) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text(event.description!, style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
            minDay: DateTime(1990),
            maxDay: DateTime(2050),
            initialDay: DateTime.now(),
            showLiveTimeLineInAllDays: true,
            heightPerMinute: 1,
            timeLineBuilder: _timeLineBuilder,
            timeLineWidth: 80,
            liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
              color: Colors.black,
              height: 2,
            ),
            eventArranger: const SideEventArranger(),
            //onDateTap: _onDateLongPress,
          );
        // case 'Month':
        //   return MonthView(
        //     controller: eventController,
        //     minMonth: DateTime(1990),
        //     maxMonth: DateTime(2050),
        //     onCellTap: (events, date) => _onDateLongPress(date),
        //   );
        case 'Day':
          return DayView(
            controller: eventController,
            minDay: DateTime(1990),
            maxDay: DateTime(2050),
            initialDay: DateTime.now(),
            showLiveTimeLineInAllDays: true,
            heightPerMinute: 1,
            timeLineBuilder: _timeLineBuilder,
            timeLineWidth: 80,
            liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
              color: Colors.black,
              height: 2,
            ),
            eventArranger: const SideEventArranger(),
            //onDateLongPress: _onDateLongPress,
          );
        default:
          return DayView(
            controller: eventController,
            minDay: DateTime(1990),
            maxDay: DateTime(2050),
            initialDay: DateTime.now(),
            showLiveTimeLineInAllDays: true,
            heightPerMinute: 1,
            timeLineBuilder: _timeLineBuilder,
            timeLineWidth: 80,
            liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
              color: Colors.black,
              height: 2,
            ),
            eventArranger: const SideEventArranger(),
            //onDateLongPress: _onDateLongPress,
          );
      }
    } catch (e) {
      print('Error occurred: $e');
      return Center(
        child: Text(
          'Something went wrong',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }

  Widget _timeLineBuilder(DateTime date) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.centerRight,
      child: Text(
        DateFormat('hh:mm a').format(date),
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  void _onDateLongPress(DateTime date) {
    showDialog(
      context: context,
      builder: (context) {
        return AssignVisitPopUp(
          clinicialName: editCctlrendClinitianName,
          patientNameController: TextEditingController(text:"${widget.schedularData!.calender[0].patientFirstName} ${widget.schedularData!.calender[0].patientLastName}"),
          assignDate: ctlrassignedate,
         startTime: ctlrstarttime,
        endTime: ctlrendtime,
        details: ctlrdetails,
        dropdown: FutureBuilder<List<VisitListData>>(
          future: getVisitList(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                width: 354,
                height: 30,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  AppString.dataNotFound,
                  style: CustomTextStylesCommon.commonStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                    color: ColorManager.mediumgrey,
                  ),
                ),
              );
            }
            if (snapshot.hasData) {
              List<DropdownMenuItem<String>> dropDownZoneList = [];
              for (var i in snapshot.data!) {
                dropDownZoneList.add(
                  DropdownMenuItem<String>(
                    child: Text(i.visitType),
                    value: i.visitType,
                  ),
                );
              }
              docAddVisitType = snapshot.data![0].visitType;
              return CICCDropdown(
                initialValue: dropDownZoneList.isNotEmpty
                    ? dropDownZoneList[0].value
                    : null,
                onChange: (val) {
                  for (var a in snapshot.data!) {
                    if (a.visitType == val) {
                      docAddVisitType = a.visitType;
                    }
                  }
                },
                items: dropDownZoneList,
              );
            }
            return const SizedBox();
          },
        ),
        onPressed: (){});
      },
    );
  }
}


