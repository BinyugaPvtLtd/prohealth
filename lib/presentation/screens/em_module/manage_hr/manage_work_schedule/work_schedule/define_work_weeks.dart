import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/work_schedule_manager.dart';
import 'package:prohealth/data/api_data/establishment_data/work_schedule/work_week_data.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/controller/controller.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/add_batch_popup_const.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/add_shift_popup.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/view_batch_popup_const.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';

import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';

class DefineWorkWeek extends StatefulWidget {
  const DefineWorkWeek({super.key});

  @override
  State<DefineWorkWeek> createState() => _DefineWorkWeekState();
}

class _DefineWorkWeekState extends State<DefineWorkWeek> {
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController shiftStartTimeController = TextEditingController();
  TextEditingController shiftEndTimeController = TextEditingController();
  TextEditingController shiftnameController = TextEditingController();
  final StreamController<List<WorkWeekScheduleData>> workWeekController =
      StreamController<List<WorkWeekScheduleData>>();
  final StreamController<List<WorkWeekShiftScheduleData>>
      workWeekShiftController =
      StreamController<List<WorkWeekShiftScheduleData>>();
  final StreamController<List<ShiftBachesData>>
  batchStreamController =
  StreamController<List<ShiftBachesData>>();
  @override
  void initState() {
    super.initState();
    workWeekScheduleGet(context).then((data) {
      workWeekController.add(data);
    }).catchError((error) {
      // Handle error
    });
  }


  // Future<void> reloadBatch(String shiftName, String weekName) async{
  //   List<ShiftBachesData> shiftBachesData = await  shiftBatchesGet(context,shiftName,weekName);
  // }
 bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: StreamBuilder<List<WorkWeekScheduleData>>(
          stream: workWeekController.stream,
          builder: (controller, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.blueprime,
                ),
              );
            }
            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
               ErrorMessageString.noWorkWeek,
                style: DefineWorkWeekStyle.customTextStyle(context)));
            }
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: mediaQuery.width / 1,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: List.generate(snapshot.data!.length, (index) {
                          var data = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              height: mediaQuery.height / 3.1,
                              width: mediaQuery.width / 3.7,
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                     BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.grey,
                                        spreadRadius: 1)
                                  ]),
                              child: Row(
                                children: [
                                  Container(
                                    height: mediaQuery.height / 1,
                                    width: mediaQuery.width / 50,
                                    decoration: BoxDecoration(
                                        color: ColorManager.blueprime,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10))),
                                    child: Center(
                                      child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Text(
                                          data.weekDays,
                                          style: GoogleFonts.firaSans(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.white,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: mediaQuery.height / 22.5,
                                        width: mediaQuery.width / 4,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF4F4F4),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left:AppPadding.p8),
                                                child: Text(
                                                  AppStringEM.officeStartTime,
                                                  style: DefineWorkWeekStyle.customTextStyle(context)
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right:AppPadding.p60),
                                                child: Text(
                                                    AppStringEM.officeEndTime,
                                                  style: DefineWorkWeekStyle.customTextStyle(context)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: mediaQuery.height / 3.7,
                                        width: mediaQuery.width / 4.1,
                                        // width: double.infinity,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            )),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height:
                                                        mediaQuery.height / 20,
                                                    width:
                                                        mediaQuery.width / 15,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text(data.officeStartTime,
                                                              style: DefineWorkWeekStyle.customTextStyle(context)),
                                                          const Icon(
                                                            Icons
                                                                .timer_outlined,
                                                            size: AppSize.s20,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height:
                                                        mediaQuery.height / 20,
                                                    width:
                                                        mediaQuery.width / 15,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                              data.officeEndTime,
                                                              style: DefineWorkWeekStyle.customTextStyle(context)),
                                                          const Icon(
                                                              Icons.timer_outlined,
                                                              size: AppSize.s20)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Container(
                                                        height:
                                                            mediaQuery.height /
                                                                23,
                                                        width:
                                                            mediaQuery.width /
                                                                50,
                                                        decoration: BoxDecoration(
                                                            color: ColorManager
                                                                .blueprime,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return DeletePopup(
                                                                        title: DeletePopupString.deleteworkWeek,
                                                                        onCancel:
                                                                            () {
                                                                          Navigator.pop(context);
                                                                            },
                                                                        onDelete:
                                                                            () async{
                                                                              setState(() {
                                                                                _isLoading = true;
                                                                              });
                                                                              try {
                                                                                await deleteWorkWeekSchedule(context, snapshot.data![index].weekScheduleId);
                                                                                setState(() async {
                                                                                  await workWeekScheduleGet(context).then((data) {
                                                                                    workWeekController.add(data);
                                                                                  }).catchError((error) {
                                                                                    // Handle error
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                });
                                                                              } finally {
                                                                                setState(() {
                                                                                  _isLoading = false;
                                                                                });
                                                                              }
                                                                            });
                                                                  });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color:
                                                                  ColorManager
                                                                      .white,
                                                              size: mediaQuery
                                                                      .width /
                                                                  70,
                                                            ))),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: ColorManager.dividerColor,
                                              thickness: 1,
                                            ),
                                            Container(
                                              height: mediaQuery.height / 9,
                                              child: ScrollConfiguration(
                                                behavior:
                                                    ScrollConfiguration.of(
                                                            context)
                                                        .copyWith(
                                                            scrollbars: false),
                                                child: FutureBuilder<
                                                        List<
                                                            WorkWeekShiftScheduleData>>(
                                                    future:
                                                        workWeekShiftScheduleGet(
                                                            context,
                                                            //snapshot.data![index].companyId,
                                                            data.weekDays),
                                                    builder: (context,
                                                        snapshotShift) {
                                                      if (snapshotShift
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            strokeWidth: 2,
                                                            color: ColorManager
                                                                .blueprime,
                                                          ),
                                                        );
                                                      }
                                                      if (snapshotShift
                                                          .data!.isEmpty) {
                                                        return Center(
                                                            child: Text(
                                                        "No available shift!",
                                                          style: DefineWorkWeekStyle.customTextStyle(context)
                                                        ));
                                                      }
                                                      if (snapshotShift
                                                          .hasData) {
                                                        return ListView.builder(
                                                            itemCount:
                                                                snapshotShift
                                                                    .data!
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            3),
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xFFF5F5F5),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                5),
                                                                        child:
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                              child: Row(
                                                                                mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                              Text(
                                                                                snapshotShift.data![index].shiftName,
                                                                                style: GoogleFonts.firaSans(
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w700,
                                                                                  color: ColorManager.mediumgrey,
                                                                                  decoration: TextDecoration.none,
                                                                                ),
                                                                              ),
                                                                              FutureBuilder<List<ShiftBachesData>>(
                                                                                  future: shiftBatchesGet(context,snapshotShift.data![index].shiftName,snapshotShift.data![index].weekDays),
                                                                                  builder: (context,snapshot) {
                                                                                    if(snapshot.connectionState == ConnectionState.waiting){
                                                                                      return SizedBox();
                                                                                    }
                                                                                    if(snapshot.data!.isEmpty){
                                                                                      return SizedBox();
                                                                                    }
                                                                                    if(snapshot.hasData){
                                                                                      return  Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                        children: [
                                                                                          ...List.generate(min(snapshot.data!.length, 1),(index){
                                                                                            return Container(
                                                                                              height: mediaQuery.height / 30,
                                                                                              width: mediaQuery.width / 15,
                                                                                              decoration: BoxDecoration(color: ColorManager.white,
                                                                                                  border: Border.all(color: Color(0xFFEEEEEE), width: 1),
                                                                                                  borderRadius: BorderRadius.circular(20)),
                                                                                              child: Center(
                                                                                                  child: Text(
                                                                                                    snapshot.data![index].officeStartTime,
                                                                                                    style: GoogleFonts.firaSans(
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      color: ColorManager.mediumgrey,
                                                                                                      decoration: TextDecoration.none,
                                                                                                    ),
                                                                                                  )),
                                                                                            );
                                                                                          }),
                                                                                          SizedBox(width:10),
                                                                                          snapshot.data!.length <= 1 ? SizedBox(width: 60,):
                                                                                          InkWell(
                                                                                            onTap: () {
                                                                                              showDialog(
                                                                                                  context: context,
                                                                                                  builder: (BuildContext context) {
                                                                                                    return ViewBatchesPopup(shiftName: snapshotShift.data![index].shiftName,
                                                                                                      weekName: snapshotShift.data![index].weekDays,
                                                                                                      //companyId: snapshot.data![index].companyId,
                                                                                                    );
                                                                                                  });
                                                                                            },
                                                                                            child: Text(
                                                                                              'View more',
                                                                                              style: GoogleFonts.firaSans(
                                                                                                fontSize: 12,
                                                                                                fontWeight:FontWeight.w300,
                                                                                                color: ColorManager.faintgrey,
                                                                                                decoration: TextDecoration.none,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    }else{
                                                                                      return SizedBox();
                                                                                    }
                                                                                        }
                                                                                    ),
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                      height: mediaQuery.height / 26,
                                                                                      width: mediaQuery.width / 55,
                                                                                      decoration: BoxDecoration(border: Border.all(
                                                                                          color: ColorManager.faintOrange),
                                                                                          borderRadius: BorderRadius.circular(5), color: ColorManager.white),
                                                                                      child: InkWell(
                                                                                        onTap: () {
                                                                                          showDialog(
                                                                                              context: context,
                                                                                              builder: (BuildContext context) {
                                                                                                return AddBatchPopup(
                                                                                                  controller1: startTimeController,
                                                                                                  controller2: endTimeController,
                                                                                                  onPressed: () async{
                                                                                                    await addShiftBatch(context, snapshotShift.data![index].shiftName,
                                                                                                        snapshotShift
                                                                                                            .data![index].weekDays, startTimeController.text, endTimeController.text);
                                                                                                    setState((){
                                                                                                      shiftBatchesGet(context,snapshotShift.data![index].shiftName,snapshotShift.data![index].weekDays);
                                                                                                    });
                                                                                                    startTimeController.clear();
                                                                                                    endTimeController.clear();
                                                                                                    //Navigator.pop(context);
                                                                                                  }, title: 'Add Batch',
                                                                                                );
                                                                                              });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.add,
                                                                                          color: ColorManager.faintOrange,
                                                                                          size: mediaQuery.width / 80,
                                                                                        ),
                                                                                      )),
                                                                                  SizedBox(width:5),
                                                                                  Container(
                                                                                      height: mediaQuery.height / 26,
                                                                                      width: mediaQuery.width / 55,
                                                                                      decoration: BoxDecoration(border: Border.all(
                                                                                          color: ColorManager.faintOrange),
                                                                                          borderRadius: BorderRadius.circular(5), color: ColorManager.white),
                                                                                      child: InkWell(
                                                                                        onTap: () {
                                                                                          showDialog(
                                                                                              context:
                                                                                              context,
                                                                                              builder:
                                                                                                  (BuildContext
                                                                                              context) {
                                                                                                return StatefulBuilder(
                                                                                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                                    return DeletePopup(
                                                                                                        title: DeletePopupString.deleteworkShift,
                                                                                                        onCancel: () {Navigator.pop(context);
                                                                                                        },
                                                                                                        onDelete: () async{
                                                                                                          setState(() {
                                                                                                            _isLoading = true;
                                                                                                          });
                                                                                                          try {
                                                                                                            await deleteWorkWeekSiftSchedule(context: context, workWeekShiftId: snapshotShift.data![index].weekShiftScheduleId!);
                                                                                                            setState(() {
                                                                                                               workWeekShiftScheduleGet(context, data.weekDays);
                                                                                                              Navigator.pop(context);
                                                                                                            });
                                                                                                          } finally {
                                                                                                            setState(() {
                                                                                                              _isLoading = false;
                                                                                                            });
                                                                                                          }
                                                                                                        });
                                                                                                  },
                                                                                                );
                                                                                              });
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.delete_outline,
                                                                                          color: ColorManager.faintOrange,
                                                                                          size: mediaQuery.width / 80,
                                                                                        ),
                                                                                      ))
                                                                                ],
                                                                              )]),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      }
                                                      return Offstage();
                                                    }),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                              child: Align(alignment: Alignment.bottomRight,
                                                  child: CustomeTransparentAddShift(
                                                    text: 'Add Shift',
                                                    onPressed: () {
                                                      showDialog(context: context, builder: (BuildContext context){
                                                        return  AddShiftPopup(
                                                          controller1: shiftStartTimeController,
                                                          controller2: shiftEndTimeController,
                                                          onPressed: () async{
                                                            await addWorkWeekShiftPost(context,
                                                                data.weekDays,
                                                                shiftnameController.text,
                                                                shiftStartTimeController.text,
                                                                shiftEndTimeController.text,
                                                                );
                                                            workWeekShiftScheduleGet(context, data.weekDays);
                                                            workWeekScheduleGet(context).then((data) {
                                                              workWeekController.add(data);
                                                            }).catchError((error) {
                                                              // Handle error
                                                            });
                                                          },
                                                          shiftNameController:
                                                          shiftnameController,
                                                        );
                                                      });

                                                    },
                                                    icon: Icons.add,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Offstage();
          }),
    );
  }
}
