import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/common_resources/common_theme_const.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/onboarding_manager/qualification_bar_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/qualification_const_bar/qualificatin_emloyment_tab.dart';
import 'package:prohealth/presentation/screens/hr_module/onboarding/qualification_const_bar/widgets/qualification_tab_constant.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../data/api_data/hr_module_data/onboarding_data/onboarding_qualification_data.dart';
import '../../manage/const_wrap_widget.dart';
import '../../manage/widgets/const_card_details.dart';

class QualificationLicense extends StatefulWidget {
  final int employeeId;
  const QualificationLicense({Key? key, required this.employeeId}) : super(key: key);

  @override
  State<QualificationLicense> createState() => _QualificationLicenseState();
}

class _QualificationLicenseState extends State<QualificationLicense> {
  final StreamController<List<OnboardingQualificationLicenseData>>
      licenseStreamController =
      StreamController<List<OnboardingQualificationLicenseData>>.broadcast();

  @override
  void initState() {
    super.initState();
    getOnboardingQualificationLicense(context, widget.employeeId,'no').then((data) {
      licenseStreamController.add(data);
    }).catchError((error) {});
  }

  @override
  void dispose() {
    licenseStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return StreamBuilder<List<OnboardingQualificationLicenseData>>(
        stream: licenseStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: CircularProgressIndicator(
                  color: ColorManager.blueprime,
                ),
              ),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 150),
                  child: Text(
                    AppStringHRNoData.noOnboardLicData,
                    style: AllNoDataAvailable.customTextStyle(context),
                  ),
                ));
          }
          if (snapshot.hasData) {
            return WrapWidget(
                childern: List.generate(snapshot.data!.length, (index) {
              return CardDetails(childWidget: DetailsFormate(
                row1Child1: [
                  Text('Licensure/Certification :',
                      style: ThemeManagerDark.customTextStyle(context)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Issuing Organization :',
                      style: ThemeManagerDark.customTextStyle(context)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Country :',
                      style: ThemeManagerDark.customTextStyle(context)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Number/ID :',
                      style: ThemeManagerDark.customTextStyle(context)),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Text('Emergency Contact :',
                  //     style: ThemeManagerDark.customTextStyle(context)),
                ],
                row1Child2: [

                  Text(
                    snapshot.data![index].licensure,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].org,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].country,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].licenseNumber,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                ],
                row2Child1: [
                  Text('Issue Date :',
                      style: ThemeManagerDark.customTextStyle(context)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('End Date :',
                      style: ThemeManagerDark.customTextStyle(context)),
                ],
                row2Child2: [
                  Text(
                    snapshot.data![index].issueDate,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].expDate,
                    style: ThemeManagerDarkFont.customTextStyle(context),
                  ),
                ],
                button:   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QualificationActionButtons(
                      approve: snapshot.data![index].approve,
                      onRejectPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20.0),
                                ),
                                height: 181.0,
                                width: 500.0,
                                child: Stack(
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
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                                'Reject',
                                                style:
                                                PopupBlueBarText.customTextStyle(context)
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close,
                                                color:
                                                ColorManager.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0),
                                        child: Text(
                                            "Do you really want to,reject this?",
                                            textAlign: TextAlign.center,
                                            style: PopupTextConst.customTextStyle(context)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: AppPadding.p24,
                                          right: AppPadding.p10),
                                      child: Align(
                                        alignment:
                                        Alignment.bottomRight,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                              style: ElevatedButton
                                                  .styleFrom(
                                                elevation: 5,
                                                backgroundColor:
                                                Colors.white,
                                                foregroundColor:
                                                Color(0xff1696C8),
                                                side: BorderSide(
                                                    color: Color(
                                                        0xff1696C8)),
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                  'Cancel',
                                                  style:TransparentButtonTextConst.customTextStyle(context)
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width /
                                                    75),
                                            ElevatedButton(
                                              onPressed: () async {
                                                await rejectOnboardQualifyLicensePatch(
                                                    context,
                                                    snapshot
                                                        .data![index]
                                                        .licenseId);
                                                getOnboardingQualificationLicense(
                                                    context, widget.employeeId,'no')
                                                    .then((data) {
                                                  licenseStreamController
                                                      .add(data);
                                                }).catchError(
                                                        (error) {});
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                              style: ElevatedButton
                                                  .styleFrom(
                                                backgroundColor:
                                                Color(0xff1696C8),
                                                foregroundColor:
                                                Colors.white,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                'Yes',
                                                style: BlueButtonTextConst.customTextStyle(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },

                      onApprovePressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20.0),
                                ),
                                height: 181.0,
                                width: 500.0,
                                child: Stack(
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
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 20.0),
                                            child: Text(
                                                'Approve',
                                                style:
                                                PopupBlueBarText.customTextStyle(context)
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.close,
                                                color:
                                                ColorManager.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0),
                                        child: Text(
                                            "Do you really want to,approve this?",
                                            textAlign: TextAlign.center,
                                            style: PopupTextConst.customTextStyle(context)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: AppPadding.p24,
                                          right: AppPadding.p10),
                                      child: Align(
                                        alignment:
                                        Alignment.bottomRight,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                              style: ElevatedButton
                                                  .styleFrom(
                                                elevation: 5,
                                                backgroundColor:
                                                Colors.white,
                                                foregroundColor:
                                                Color(0xff1696C8),
                                                side: BorderSide(
                                                    color: Color(
                                                        0xff1696C8)),
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                  'Cancel',
                                                  style:TransparentButtonTextConst.customTextStyle(context)
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(
                                                    context)
                                                    .size
                                                    .width /
                                                    75),
                                            ElevatedButton(
                                              onPressed: () async {
                                                await approveOnboardQualifyLicensePatch(
                                                    context,
                                                    snapshot
                                                        .data![index]
                                                        .licenseId);
                                                getOnboardingQualificationLicense(
                                                    context, widget.employeeId,'no')
                                                    .then((data) {
                                                  licenseStreamController
                                                      .add(data);
                                                }).catchError(
                                                        (error) {});
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                              style: ElevatedButton
                                                  .styleFrom(
                                                backgroundColor:
                                                Color(0xff1696C8),
                                                foregroundColor:
                                                Colors.white,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                'Yes',
                                                style:BlueButtonTextConst.customTextStyle(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      // onApprovePressed: ()async{
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Dialog(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12.0),
                      //         ),
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(20.0),
                      //           ),
                      //           height: 200.0,
                      //           width: 300.0,
                      //           child: Stack(
                      //             children: <Widget>[
                      //               Container(
                      //                 width: double.infinity,
                      //                 height: 50,
                      //                 alignment: Alignment.bottomCenter,
                      //                 decoration: BoxDecoration(
                      //                   color: Color(0xff1696C8),
                      //                   borderRadius: BorderRadius.only(
                      //                     topLeft: Radius.circular(12),
                      //                     topRight: Radius.circular(12),
                      //                   ),
                      //                 ),
                      //                 child: Align(
                      //                   alignment: Alignment.topRight,
                      //                   child: IconButton(
                      //                     onPressed: () {
                      //                       Navigator.of(context).pop();
                      //                     },
                      //                     icon: Icon(Icons.close, color: Colors.white),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Align(
                      //                 alignment: Alignment.center,
                      //                 child: Text(
                      //                   "Do you really want to,\napprove this?",
                      //                   textAlign: TextAlign.center,
                      //                   style: GoogleFonts.firaSans(
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeightManager.regular,
                      //                     color: ColorManager.mediumgrey,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: const EdgeInsets.all(10),
                      //                 child: Align(
                      //                   alignment: Alignment.bottomCenter,
                      //                   child: Row(
                      //                     mainAxisAlignment: MainAxisAlignment.center,
                      //                     children: [
                      //                       ElevatedButton(
                      //                         onPressed: () {
                      //                           Navigator.of(context).pop();
                      //                         },
                      //                         style: ElevatedButton.styleFrom(
                      //                           backgroundColor: Colors.white,
                      //                           foregroundColor: Color(0xff1696C8),
                      //                           side: BorderSide(color: Color(0xff1696C8)),
                      //                           shape: RoundedRectangleBorder(
                      //                             borderRadius: BorderRadius.circular(8),
                      //                           ),
                      //                         ),
                      //                         child: Text(
                      //                           'Cancel',
                      //                           style: GoogleFonts.firaSans(
                      //                             fontSize: 10.0,
                      //                             fontWeight: FontWeight.w700,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       SizedBox(width: MediaQuery.of(context).size.width / 75),
                      //                       ElevatedButton(
                      //                         onPressed: () async {
                      //                           await approveOnboardQualifyLicensePatch(context, snapshot.data![index].licenseId);
                      //                           getOnboardingQualificationLicense(context, 2).then((data){
                      //                             licenseStreamController.add(data);
                      //                           }).catchError((error){});
                      //                           Navigator.of(context).pop();
                      //                         },
                      //                         style: ElevatedButton.styleFrom(
                      //                           backgroundColor: Color(0xff1696C8),
                      //                           foregroundColor: Colors.white,
                      //                           shape: RoundedRectangleBorder(
                      //                             borderRadius: BorderRadius.circular(8),
                      //                           ),
                      //                         ),
                      //                         child: Text(
                      //                           'Yes',
                      //                           style: GoogleFonts.firaSans(
                      //                             fontSize: 10.0,
                      //                             fontWeight: FontWeight.w700,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   );
                      // },
                    ),
                  ],
                ),
                title: 'License #${index + 1}',));
            }));
          } else {
            return const SizedBox();
          }
        });
  }
}
