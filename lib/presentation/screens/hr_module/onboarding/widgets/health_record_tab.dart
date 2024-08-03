import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/data/api_data/hr_module_data/onboarding_data/onboarding_ack_health_data.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/widgets/widgets/health_record_tab_constant.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/onboarding_manager/onboarding_ack_health_manager.dart';
import '../../manage/const_wrap_widget.dart';
import '../download_doc_const.dart';

class HealthRecordConstant extends StatefulWidget {
  const HealthRecordConstant({super.key});

  @override
  State<HealthRecordConstant> createState() => _HealthRecordConstantState();
}

class _HealthRecordConstantState extends State<HealthRecordConstant> {
  final StreamController<List<OnboardingAckHealthData>> _controller = StreamController<List<OnboardingAckHealthData>>();
  List<bool> _checked = [];
  //List<bool> _checked = List.generate(snapshot.data!.length, (index) => false);


  @override
  void initState() {
    super.initState();
    getAckHealthRecord(context, 1, 10, 5).then((data) {
      _controller.add(data);
      _checked = List.generate(data.length, (_) => false);
    }).catchError((error) {
      // Handle error
    });
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return StreamBuilder<List<OnboardingAckHealthData>>(
      stream: _controller.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorManager.blueprime,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              AppString.dataNotFound,
              style: CustomTextStylesCommon.commonStyle(
                fontWeight: FontWeightManager.medium,
                fontSize: FontSize.s12,
                color: ColorManager.mediumgrey,
              ),
            ),
          );
        }
        ////
        return Padding(
          padding: const EdgeInsets.only(left: 160,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


          //////////////////////////check bottom////////////////////////////////////////////////////
            ////////////////////lllllll//////



              Wrap(
                children: [
                  ...List.generate(snapshot.data!.length, (index) {
                    final data = snapshot.data![index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: Container(
                            width: mediaQuery.width / 3,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _checked[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _checked[index] = value!;
                                    });
                                  },
                                ),
                                SizedBox(width: mediaQuery.width / 140),
                                GestureDetector(
                                  onTap: () => downloadFile(data.DocumentUrl),
                                  child: Container(
                                    width: mediaQuery.width / 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Color(0xffC6C6C6)),
                                    ),
                                    child: HealthRecordConstantWithContainer(
                                      data.DocumentName,
                                      data.ReminderThreshold,
                                      Icons.description_outlined,
                                      Color(0xff50B5E5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),




              /////////////////////////////////////////////////////
              ///////////////////////////////////sss
              // SingleChildScrollView(
              //   child:

                // Container(

                //   child: WrapWidget(
                //     childern: [
                //       ...List.generate(snapshot.data!.length, (index) {
                //         final data = snapshot.data![index];
                //         return Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //               child: Container(
                //                 /////
                //                // color: Colors.cyanAccent,
                //                 width: mediaQuery.width / 3,
                //                 child: Row(
                //                   children: [
                //                     Checkbox(
                //                       value: _checked[index],
                //                       onChanged: (bool? value) {
                //                         setState(() {
                //                           _checked[index] = value!;
                //                         });
                //                       },
                //                     ),
                //                     SizedBox(width: mediaQuery.width / 140),
                //                     GestureDetector(
                //                       onTap: () => downloadFile(data.DocumentUrl),
                //                       child: Container(
                //                         width: mediaQuery.width / 8,
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(8.0),
                //                           border: Border.all(color: Color(0xffC6C6C6)),
                //                         ),
                //                         child: HealthRecordConstantWithContainer(
                //                           data.DocumentName,
                //                           data.ReminderThreshold,
                //                           Icons.description_outlined,
                //                           Color(0xff50B5E5),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ],
                //         );
                //       }),
                //     ],
                //   ),
                // ),
              //),
              const SizedBox(height: 10,),
              Padding(
                padding:const EdgeInsets.only( right: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// Reject
                    ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: AppSize.s181,
                              width: AppSize.s500,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorManager.bluebottom,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'Reject',
                                            style: GoogleFonts.firaSans(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeightManager.semiBold,
                                              color: ColorManager.white,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close, color: ColorManager.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: AppSize.s20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p20,
                                      horizontal: AppPadding.p20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Do you really want to reject this?",
                                          style: GoogleFonts.firaSans(
                                            fontSize: 14,
                                            fontWeight: FontWeightManager.regular,
                                            color: ColorManager.mediumgrey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: AppPadding.p20, right: AppPadding.p20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: Color(0xff1696C8),
                                              side: BorderSide(color: Color(0xff1696C8)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.firaSans(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width / 75),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff1696C8),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              'Yes',
                                              style: GoogleFonts.firaSans(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                        },
                      ),
                      //_handleRejectSelected(snapshot.data!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xff1696C8),
                        side: BorderSide(color: Color(0xff1696C8)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Reject',
                        style: GoogleFonts.firaSans(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(width: mediaQuery.width / 75),
                    /// Approve
                    ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: AppSize.s181,
                              width: AppSize.s500,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ColorManager.bluebottom,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'Approve',
                                            style: GoogleFonts.firaSans(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeightManager.semiBold,
                                              color: ColorManager.white,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close, color: ColorManager.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: AppSize.s20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p20,
                                      horizontal: AppPadding.p20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Do you really want to approve this?",
                                          style: GoogleFonts.firaSans(
                                            fontSize: 14,
                                            fontWeight: FontWeightManager.regular,
                                            color: ColorManager.mediumgrey,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: AppPadding.p20, right: AppPadding.p20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: Color(0xff1696C8),
                                              side: BorderSide(color: Color(0xff1696C8)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.firaSans(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width / 75),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () async{
                                              // await batchApproveOnboardAckHealthPatch(context, snapshot.data![index]);
                                              // getAckHealthRecord(context, 1, 10, 5).then((data) {
                                              //   _controller.add(data);
                                              // }).catchError((error) {});
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff1696C8),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              'Yes',
                                              style: GoogleFonts.firaSans(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                        },
                      ),
                      //_handleApproveSelected(snapshot.data!),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1696C8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Approve',
                        style: GoogleFonts.firaSans(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}




///without backend
// Padding(
//   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/50),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Color(0xff1696C8),
//           side: BorderSide(color: Color(0xff1696C8)),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           'Reject',
//           style: GoogleFonts.firaSans(
//               fontSize: 10.0,
//               fontWeight: FontWeight.w700
//           ),
//         ),
//       ),
//       SizedBox(width: MediaQuery.of(context).size.width/90),
//       ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xff1696C8),
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         child: Text(
//           'Approve',
//           style: GoogleFonts.firaSans(
//               fontSize: 10.0,
//               fontWeight: FontWeight.w700
//           ),
//         ),
//       ),
//     ],
//   ),
// )



///////////////////////
////////////////
////////////pppggggggggggggggggggggggg
// Container(
//   height: 500,
//   color: Colors.orangeAccent,
//   child: GridView.builder(
//    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2, // Number of columns
//       crossAxisSpacing: 10.0,
//       mainAxisSpacing: 10.0,
//      childAspectRatio: (mediaQuery.width / 8) / (mediaQuery.width / 4),
//     ),
//     itemCount: snapshot.data!.length,
//     itemBuilder: (context, index) {
//       final data = snapshot.data![index];
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0),
//             border: Border.all(color: Color(0xffC6C6C6)),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Checkbox(
//                     value: _checked[index],
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _checked[index] = value!;
//                       });
//                     },
//                   ),
//                   SizedBox(width: mediaQuery.width / 140),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () => downloadFile(data.DocumentUrl),
//                 child: Container(
//                   width: mediaQuery.width / 8,
//                   child: HealthRecordConstantWithContainer(
//                     data.DocumentName,
//                     data.ReminderThreshold,
//                     Icons.description_outlined,
//                     Color(0xff50B5E5),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// ),





////////////////////////////////////
///////////////////////////////////
/////////pppppplllllllllllllllllllll
//
// Container(
//   height: 500,
//   color: Colors.orange,
//   child: ListView.builder(
//     itemCount: snapshot.data!.length,
//     itemBuilder: (context, index) {
//       final data = snapshot.data![index];
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//         child: Container(
//           width: mediaQuery.width / 3,
//           child: Row(
//             children: [
//               Checkbox(
//                 value: _checked[index],
//                 onChanged: (bool? value) {
//                   setState(() {
//                     _checked[index] = value!;
//                   });
//                 },
//               ),
//               SizedBox(width: mediaQuery.width / 140),
//               GestureDetector(
//                 onTap: () => downloadFile(data.DocumentUrl),
//                 child: Container(
//                   width: mediaQuery.width / 8,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     border: Border.all(color: Color(0xffC6C6C6)),
//                   ),
//                   child: HealthRecordConstantWithContainer(
//                     data.DocumentName,
//                     data.ReminderThreshold,
//                     Icons.description_outlined,
//                     Color(0xff50B5E5),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   ),
// ),