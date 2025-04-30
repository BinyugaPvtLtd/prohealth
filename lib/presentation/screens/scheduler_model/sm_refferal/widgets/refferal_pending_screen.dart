import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:provider/provider.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/manage_emp/education_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalPendingScreen extends StatelessWidget {
  final VoidCallback onEyeButtonPressed;
  final VoidCallback onMergeDuplicatePressed;
   RefferalPendingScreen(
      {super.key,
      required this.onEyeButtonPressed,
      required this.onMergeDuplicatePressed});

  List<String> hardcodedItems = [
    'All',
    'Referral App',
    'E-Fax',
    'E-Referrals',
    'Manual',
  ];

  final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();

  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 30),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchFieldSM(
                    width: 440,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: AppSize.s20,
                  ),
                  IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: providerContact.toggleFilter,
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",
                          height: AppSize.s18,
                          width: AppSize
                              .s16) //Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                      ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: AppSize.s30,
              //       child: CustomIconButton(
              //         color: ColorManager.bluebottom,
              //         icon: Icons.add,
              //         textWeight: FontWeight.w600,
              //         textSize: FontSize.s11,
              //         text: "Add Refferal",
              //         onPressed: ()async{},
              //       ),
              //     ),
              //     SizedBox(width: AppSize.s10,),
              //     SmDropdownConst(
              //       height: AppSize.s30,
              //       width:AppSize.s150,
              //       isAstric:false,
              //       // Adjust headText based on depId
              //       initialValue: 'Office',
              //       headText: "", // Default fallback if depId doesn't match any of the expected values
              //       items: ['Office 1','Office 2','Office 3'],
              //       onChanged: (newValue) {
              //         // for (var a in snapshot.data!) {
              //         //   if (a.empType == newValue) {
              //         //     clinicialName = a.empType!;
              //         //     clinicalId = a.employeeTypesId!;
              //         //     print("Dept ID'''''' ${clinicalId}");
              //         //     print("';';';''''''''Dept ID ${clinicialName}");
              //         //     // Do something with docType
              //         //   }
              //         // }
              //       },
              //     ),
              //     SizedBox(width: AppSize.s10,),
              //     SmDropdownConst(
              //      height: AppSize.s30,
              //       width:AppSize.s150,
              //       isAstric:false,
              //       // Adjust headText based on depId
              //       initialValue: 'All',
              //       headText: "", // Default fallback if depId doesn't match any of the expected values
              //       items: ['All','Referral App','E-Fax','E-Referrals','Manual',],
              //       onChanged: (newValue) {
              //         // for (var a in snapshot.data!) {
              //         //   if (a.empType == newValue) {
              //         //     clinicialName = a.empType!;
              //         //     clinicalId = a.employeeTypesId!;
              //         //     print("Dept ID'''''' ${clinicalId}");
              //         //     print("';';';''''''''Dept ID ${clinicialName}");
              //         //     // Do something with docType
              //         //   }
              //         // }
              //       },
              //     ),
              //
              //   ],
              // ),
              //   ],
              // ),
              SizedBox(
                height: AppSize.s20,
              ),
              Row(
                children: [
                  Text("Received Date",
                      style: TextStyle(
                          color: ColorManager.textBlack,
                          fontSize: FontSize.s12,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: AppSize.s15,
                  ),
                  Image.asset(
                    "images/sm/sm_refferal/refferal_arrow.png",
                    height: IconSize.I14,
                    width: IconSize.I16,
                  ),
                  SizedBox(
                    width: AppSize.s50,
                  ),
                  Text("Hospitals",
                      style: TextStyle(
                          color: ColorManager.textBlack,
                          fontSize: FontSize.s12,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: AppSize.s15,
                  ),
                  Image.asset(
                    "images/sm/sm_refferal/refferal_arrow.png",
                    height: IconSize.I14,
                    width: IconSize.I16,
                  ),
                  SizedBox(
                    width: AppSize.s50,
                  ),
                  Text("PCP",
                      style: TextStyle(
                          color: ColorManager.textBlack,
                          fontSize: FontSize.s12,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: AppSize.s15,
                  ),
                  Image.asset(
                    "images/sm/sm_refferal/refferal_arrow.png",
                    height: IconSize.I14,
                    width: IconSize.I16,
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s20,
              ),
              StreamBuilder<List<PatientModel>>(
                stream: _streamController.stream,
                builder: (context,snapshot) {
                  getPatientReffrealsData(context: context, pageNo: 1, nbrOfRows: 10, isIntake: 'false', isArchived: 'false').then((data) {
                    _streamController.add(data);
                  }).catchError((error) {
                    // Handle error
                  });
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.blueprime,
                        ),
                      ),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return Center(
                        child: Padding(
                          padding:const EdgeInsets.symmetric(vertical: 76),
                          child: Text(
                            AppStringSMModule.pendingReferNoData,
                            style: AllNoDataAvailable.customTextStyle(context),
                          ),
                        ));
                  }
                  if(snapshot.hasData){
                    return Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7,
                              ),
                              child: Container(
                                height: 79,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 3,
                                    ),
                                    left: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child:
                                Container(height: 75,width: 6,
                                  decoration: BoxDecoration(
                                    border:  Border(
                                      left: BorderSide(
                                        color: ColorManager.greenDark,
                                        width: 6,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        // bottomRight: Radius.circular(12),
                                        // topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                                width: AppSize.s105,
                                                height: AppSize.s16,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFE4E2),
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(8)),
                                                ),
                                                child: Center(
                                                  child: Text('Potential Duplicate',
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStylesCommon
                                                          .commonStyle(
                                                          color: ColorManager
                                                              .mediumgrey,
                                                          fontSize: FontSize.s11,
                                                          fontWeight:
                                                          FontWeight.w400)),
                                                )),
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p25),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      ClipOval(
                                                        child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                                            snapshot.data![index].ptImgUrl == null
                                                            ? CircleAvatar(
                                                          radius: 30,
                                                          backgroundColor: Colors.transparent,
                                                          child: Image.asset("images/profilepic.png"),
                                                        )
                                                            : Image.network(
                                                          snapshot.data![index].ptImgUrl,
                                                          loadingBuilder: (context, child, loadingProgress) {
                                                            if (loadingProgress == null) {
                                                              return child;
                                                            } else {
                                                              return Center(
                                                                child: CircularProgressIndicator(
                                                                  value: loadingProgress.expectedTotalBytes != null
                                                                      ? loadingProgress.cumulativeBytesLoaded /
                                                                      (loadingProgress.expectedTotalBytes ?? 1)
                                                                      : null,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor: Colors.transparent,
                                                              child: Image.asset("images/profilepic.png"),
                                                            );
                                                          },
                                                          fit: BoxFit.cover,
                                                          height: 43,
                                                          width: 43,
                                                        ),
                                                      ),
                                                      // ClipRRect(
                                                      //   borderRadius:
                                                      //   BorderRadius.circular(60),
                                                      //   child: SizedBox(
                                                      //     width: AppSize.s47,
                                                      //     height: AppSize.s47,
                                                      //     child: Image.asset(
                                                      //       'images/1.png', // Replace with your image path
                                                      //       fit: BoxFit.cover,
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      SizedBox(width: AppSize.s15),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            "${snapshot.data![index].ptFirstName} ${snapshot.data![index].ptLastName}",
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStylesCommon
                                                                .commonStyle(
                                                              fontSize: FontSize.s12,
                                                              fontWeight: FontWeight.w700,
                                                              color:
                                                              ColorManager.mediumgrey,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppSize.s5,
                                                          ),
                                                          Text(
                                                            "Received Date :  ${snapshot.data![index].ptRefferalDate}",
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStylesCommon
                                                                .commonStyle(
                                                              fontSize: FontSize.s11,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              ColorManager.mediumgrey,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: AppSize.s2,
                                                          ),
                                                          Text(
                                                            snapshot.data![index].ptTime,
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStylesCommon
                                                                .commonStyle(
                                                              fontSize: FontSize.s11,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              ColorManager.mediumgrey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  // SizedBox(width: AppSize.s30),
                                                  Text("Ch #1",
                                                      style: CustomTextStylesCommon
                                                          .commonStyle(
                                                        fontSize: FontSize.s12,
                                                        fontWeight: FontWeight.w700,
                                                        color: ColorManager.textBlack,
                                                      )),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Referral Source: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.textBlack,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSize.s4,
                                                      ),
                                                      Text(
                                                        snapshot.data![index].referralSource.sourceName,
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 25,),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "PCP: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.mediumgrey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSize.s4,
                                                      ),
                                                      Text(
                                                       "${snapshot.data![index].pcp.phyFirstName} ${snapshot.data![index].pcp.phyLastName}",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Primary Diagnosis: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.mediumgrey,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: AppSize.s4,
                                                      ),
                                                      Text(
                                                        snapshot.data![index].primaryDiagnosis.dgnName,
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            // Expanded(
                                            //   flex: 1,
                                            //   child:  Column(
                                            //     crossAxisAlignment: CrossAxisAlignment.start,
                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       Text(
                                            //         "Primary Diagnosis: ",
                                            //         textAlign: TextAlign.center,
                                            //         style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            //           fontWeight: FontWeight.w400,
                                            //           color: ColorManager.mediumgrey,),
                                            //       ),
                                            //       SizedBox(height: AppSize.s4,),
                                            //       Text(
                                            //         "Migraine",
                                            //         textAlign: TextAlign.center,
                                            //         style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            //           fontWeight: FontWeight.w700,
                                            //           color: ColorManager.mediumgrey,),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                children: [
                                                  Image.network(
                                                    snapshot.data![index].referralSource.referralSourceImgUrl,
                                                    loadingBuilder: (context, child, loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return child;
                                                      } else {
                                                        return Center(
                                                          child: CircularProgressIndicator(
                                                            value: loadingProgress.expectedTotalBytes != null
                                                                ? loadingProgress.cumulativeBytesLoaded /
                                                                (loadingProgress.expectedTotalBytes ?? 1)
                                                                : null,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Image.asset('images/logo_login.png',width: 110,);
                                                    },
                                                    width: 110,
                                                  ),
                                                  // Image.network(
                                                  //   snapshot.data![index].referralSource.referralSourceImgUrl,
                                                  //   width: 110,
                                                  // ),
                                                  // Text("Manual",style: DocDefineTableData.customTextStyle(context),),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                                flex: 4,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(width: AppSize.s10),
                                                    Text(
                                                      "Marketer: ",
                                                      style: DocDefineTableData.customTextStyle(context),
                                                    ),
                                                    //SizedBox(width: AppSize.s25),
                                                    Row(
                                                      children: [
                                                        ClipOval(
                                                          child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                                              snapshot.data![index].ptImgUrl == null
                                                              ? CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor: Colors.transparent,
                                                            child: Image.asset("images/profilepic.png"),
                                                          )
                                                              : Image.network(
                                                            snapshot.data![index].marketer.imgurl,
                                                            loadingBuilder: (context, child, loadingProgress) {
                                                              if (loadingProgress == null) {
                                                                return child;
                                                              } else {
                                                                return Center(
                                                                  child: CircularProgressIndicator(
                                                                    value: loadingProgress.expectedTotalBytes != null
                                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                                        (loadingProgress.expectedTotalBytes ?? 1)
                                                                        : null,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return CircleAvatar(
                                                                radius: 25,
                                                                backgroundColor: Colors.transparent,
                                                                child: Image.asset("images/profilepic.png"),
                                                              );
                                                            },
                                                            fit: BoxFit.cover,
                                                            height: 45,
                                                            width: 41,
                                                          ),
                                                        ),
                                                        // ClipRRect(
                                                        //   borderRadius:
                                                        //   BorderRadius.circular(60),
                                                        //   child: SizedBox(
                                                        //     width: AppSize.s41,
                                                        //     height: AppSize.s45,
                                                        //     child: Image.asset(
                                                        //       'images/1.png', // Replace with your image path
                                                        //       fit: BoxFit.cover,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        SizedBox(width: AppSize.s15),
                                                        Text(
                                                          "${snapshot.data![index].marketer.firstName} ${snapshot.data![index].marketer.lastName}",
                                                          textAlign: TextAlign.center,
                                                          style: DocDefineTableData
                                                              .customTextStyle(context),
                                                        ),
                                                      ],
                                                    ),

                                                    // SizedBox(width: AppSize.s15),
                                                    InkWell(
                                                      onTap: () async {
                                                        try {
                                                          onEyeButtonPressed();
                                                        } catch (e) {
                                                          print("Error: $e");
                                                        }
                                                      },
                                                      child: Container(
                                                        width: AppSize.s20,
                                                        height: AppSize.s25,
                                                        child: SvgPicture.asset(
                                                          'images/sm/sm_refferal/eye.svg', // make sure your file is in assets and listed in pubspec.yaml
                                                          height: AppSize.s15,
                                                          width: AppSize.s22,
                                                        ),
                                                      ),
                                                    ),
                                                    // SizedBox(width: AppSize.s4),
                                                    IconButton(
                                                        hoverColor: Colors.transparent,
                                                        splashColor: Colors.transparent,
                                                        highlightColor:
                                                        Colors.transparent,
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.phone,
                                                          color: ColorManager.bluebottom,
                                                          size: IconSize.I18,
                                                        )),
                                                    // SizedBox(width: AppSize.s7),
                                                    Container(
                                                      height: 33,
                                                      width: 115,
                                                      child: ElevatedButton.icon(
                                                        icon: Image.asset(
                                                          "images/sm/sm_refferal/file.png",
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        onPressed: () {},
                                                        style: ElevatedButton.styleFrom(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 2,
                                                              vertical: 10),
                                                          backgroundColor:
                                                          ColorManager.white,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(12),
                                                            side: BorderSide(
                                                                color: ColorManager
                                                                    .bluebottom),
                                                          ),
                                                        ),
                                                        label: Text("Move to Intake",
                                                            style: CustomTextStylesCommon
                                                                .commonStyle(
                                                              fontSize: FontSize.s12,
                                                              fontWeight: FontWeight.w600,
                                                              color:
                                                              ColorManager.bluebottom,
                                                            )),
                                                      ),
                                                    ),
                                                    // SizedBox(width: AppSize.s3),
                                                    PopupMenuButton<String>(
                                                      tooltip: '',
                                                      splashRadius: 0,
                                                      color: Colors.white,
                                                      offset: Offset(25, 42),
                                                      itemBuilder: (BuildContext context) => [
                                                        PopupMenuItem<String>(
                                                          value: 'Merge Duplicate',
                                                          padding: EdgeInsets.zero, // Remove padding
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            onTap: () {
                                                              Navigator.pop(context); // Important: manually close the popup
                                                              onMergeDuplicatePressed();
                                                            },
                                                            child: Container(
                                                              alignment: Alignment.centerLeft,
                                                              padding: EdgeInsets.only(left: 12, top: 5),
                                                              width: 100,
                                                              child: Text(
                                                                'Merge Duplicate',
                                                                style: CustomTextStylesCommon.commonStyle(
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: FontSize.s12,
                                                                  color: ColorManager.mediumgrey,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        PopupMenuItem<String>(
                                                          value: 'Archived',
                                                          padding: EdgeInsets.zero,
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            onTap: () {
                                                              Navigator.pop(context);
                                                              print('Option 2 Selected');
                                                            },
                                                            child: Container(
                                                              alignment: Alignment.centerLeft,
                                                              padding: EdgeInsets.only(left: 12, top: 5),
                                                              width: 100,
                                                              child: Text(
                                                                'Archived',
                                                                style: CustomTextStylesCommon.commonStyle(
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: FontSize.s12,
                                                                  color: ColorManager.mediumgrey,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      child: Icon(Icons.more_vert, color: ColorManager.mediumgrey),
                                                    ),
                                                    // SizedBox(width: AppSize.s9),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: AppSize.s9,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }else{
                    return SizedBox();
                  }
                }
              ),
            ],
          ),
        ),

      ],
    );
  }
}

///
// SizedBox(height: 30,),
// Expanded(
// child: ScrollConfiguration(
// behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
// child: ListView.builder(
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// String phoneNumber = "7743968124";//"9657058623";
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
// child: SchedularContainerConst(
// child:
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// flex: 2,
// child: Padding(
// padding: const EdgeInsets.only(left: 25.0),
// child: Row(
// children: [
// Stack(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(60),
// child: SizedBox(
// width: AppSize.s45,
// height: AppSize.s50,
// child: Image.asset(
// 'images/1.png', // Replace with your image path
// fit: BoxFit.cover,
// ),
// ),
// ),
// Positioned(
// left:22,
// bottom :0,
// child: Container(
// width: 19,
// height: 15,
// decoration: BoxDecoration(
// color: Color(0xFF527FB9),
// borderRadius: BorderRadius.circular(3)
// ),
// child: Center(
// child: Text("ST",style: TextStyle(
// fontWeight: FontWeight.w400,
// fontSize: 8,
// color: ColorManager.white,
// decoration: TextDecoration.none,
// ),),
// ),
// ),)
// ],
// ),
// SizedBox(width: AppSize.s7),
// Text(
// 'John Smith',
// style: DocDefineTableData.customTextStyle(context),
// ),
// ],
// ),
// ),
// ),
//
// Expanded(
// flex: 3,
// child: Row(
// children: [
// Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
// SizedBox(width: AppSize.s15,),
// Container(
// child:Text("132 My Street,Kingston, New York 12401",
// textAlign: TextAlign.start,
// style:DocDefineTableDataID.customTextStyle(context),
// ) ,
// )
// ],
// ),
// ),
//
// Expanded(
// flex: 1,
// child: Row(
// children: [
// Container(
// width: 25,
// height: 15,
// decoration: BoxDecoration(
// color: Color(0xFFE3F2F8),
// borderRadius: BorderRadius.circular(3)
// ),
// child: Center(
// child: Text("ST",style: TextStyle(
// fontWeight: FontWeight.w700,
// fontSize: 12,
// color: ColorManager.bluebottom,
// decoration: TextDecoration.none,
// ),),
// ),
// )
// ],
// ),
// ),
//
//
// Expanded(
// flex: 2,
// child: Row(
// children: [
// Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
// // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
// Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
// ],
// ),
// ),
// Expanded(
// flex: 1,
// child: Row(
// children: [
// SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
// ],
// ),
// ),
//
// ///dont delete
// // Expanded(
// //   flex: 1,
// //   child: Row(
// //     children: [
// //       GestureDetector(
// //         onTap: () => _makeCall(phoneNumber),
// //         child: SvgPicture.asset(
// //           "images/sm/contact_s.svg",
// //           height: 30,
// //           width: 20,
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
//
// Expanded(
// flex: 2,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
// // crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Auto assigned on 2024/12/08 |",style: DocDefineTableData.customTextStyle(context),),
// // Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),
// ],
// ),
// Row(
// // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
// // crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("10:00 AM ",style: DocDefineTableData.customTextStyle(context),),
//
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ); },
//
// ),
// ),
// ),
//
// PaginationControlsWidget(
//   currentPage: currentPage,
//   items: snapshot.data,
//   itemsPerPage: itemsPerPage,
//   onPreviousPagePressed: () {
//     if (currentPage > 1) {
//       currentPage--;
//     }
//   },
//   onPageNumberPressed: (pageNumber) {
//     currentPage = pageNumber;
//   },
//   onNextPagePressed: () {
//     if (currentPage < totalPages) {
//       currentPage++;
//     }
//   },
// )
