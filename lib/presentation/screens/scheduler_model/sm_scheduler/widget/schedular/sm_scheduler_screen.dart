import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/search_clinician_pop_up.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/search_patient_pop_up.dart';

import '../../../sm_Intake/widgets/intake_profile_bar.dart';
import '../schedular_create/appointment_screen.dart';

class SMSchedulerScreen extends StatefulWidget {
  const SMSchedulerScreen({super.key});

  @override
  State<SMSchedulerScreen> createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SMSchedulerScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create New Schedule',
                  style: GoogleFonts.firaSans(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSize.s14,
                    color: ColorManager.textPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SearchPatientPopUp();
                      },
                    );
                  },
                  child: Container(
                    height: 152.0,
                    width: 374.0,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xff50B5E5),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/personal_injury.png',
                          height: 75.0,
                          width: 80.0,
                        ),
                        SizedBox(height: AppSize.s20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Patient',
                              style: GoogleFonts.firaSans(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeightManager.bold,
                                fontSize: FontSize.s14,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSize.s20),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SearchClinicianPopUp();
                      },
                    );
                  },
                  child: Container(
                    height: 152.0,
                    width: 374.0,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xff50B5E5),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/group_schedular.png',
                          height: 96.0,
                          width: 96.0,
                        ),
                        //SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Select Clinician',
                              style: GoogleFonts.firaSans(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeightManager.bold,
                                fontSize: FontSize.s14,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:AppSize.s30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 162.0,
                  height: 37.0,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(AppString.cancel,
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.textPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSize.s20),
                SizedBox(
                  width: 162.0,
                  height: 37.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => IntakeProfileBar()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.blueprime,
                      shadowColor: ColorManager.black,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(AppString.create,
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeightManager.bold,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.s40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 227.0,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: AppSize.s37,
                        decoration: BoxDecoration(
                          color: ColorManager.blueprime,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Scheduled Patients',
                                    style: GoogleFonts.firaSans(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s14,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'This Month',
                                    style: GoogleFonts.firaSans(
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeightManager.bold,
                                      fontSize: FontSize.s14,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/1.png'),
                                ),
                                SizedBox(width: AppSize.s10),
                                Text(
                                  'Robert Langdon',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                Spacer(),
                                Text('John Scott',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/120,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Container(
                                    height: AppSize.s24,
                                    width: AppSize.s26,
                                    decoration: BoxDecoration(
                                      color: ColorManager.tangerine,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('PT',
                                        style: GoogleFonts.firaSans(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeightManager.medium,
                                          fontSize: MediaQuery.of(context).size.width * 0.008,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.s15),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/2.png'),
                                ),
                                SizedBox(width: AppSize.s10),
                                Text(
                                  'James Smith',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                Spacer(),
                                Text('Liberty Andrews',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w500,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/120,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Container(
                                    height: 24.0,
                                    width: 26.0,
                                    decoration: BoxDecoration(
                                      color: ColorManager.tangerine,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('PT',
                                        style: GoogleFonts.firaSans(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeightManager.medium,
                                          fontSize: MediaQuery.of(context).size.width * 0.008,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.s15),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/3.png'),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Mary Irish',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                Spacer(),
                                Text('John Scott',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/120,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Container(
                                    height: 24.0,
                                    width: 26.0,
                                    decoration: BoxDecoration(
                                      color: ColorManager.tangerine,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('PT',
                                        style: GoogleFonts.firaSans(
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeightManager.medium,
                                          fontSize: MediaQuery.of(context).size.width * 0.008,
                                          color: ColorManager.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: AppSize.s30),
                Container(
                  height: 227.0,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: ColorManager.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: AppSize.s37,
                        decoration: BoxDecoration(
                          color: ColorManager.blueprime,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                'Un-Scheduled Patients',
                                style: GoogleFonts.firaSans(
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: FontSize.s14,
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:  AppSize.s20),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/5.png'),
                                ),
                                SizedBox(width:  AppSize.s10),
                                Text(
                                  'James Smith',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height:  AppSize.s15),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/6.png'),
                                ),
                                SizedBox(width:  AppSize.s10),
                                Text(
                                  'Michael Jackson',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                      color: ColorManager.darkblue,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s15),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset('images/1.png'),
                                ),
                                SizedBox(width: AppSize.s10),
                                Text(
                                  'Ross Geller',
                                  style: GoogleFonts.firaSans(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: MediaQuery.of(context).size.width * 0.008,
                                    color: ColorManager.darkblue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
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