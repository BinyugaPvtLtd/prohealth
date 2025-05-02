import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:provider/provider.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_integration_provider.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalArchievedScreen extends StatelessWidget {
  final VoidCallback onEyeButtonPressed;
   RefferalArchievedScreen({super.key, required this.onEyeButtonPressed});

  ///checkbox
  bool _isChecked = false;

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
    final providerReferrals = Provider.of<SmIntegrationProviderManager>(context,listen: false);
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10),
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
                    onPressed: (){},
                  ),
                  SizedBox(width: AppSize.s20,),
                  IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: providerContact.toggleFilter,
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: 18,width: 16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
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
              //       height: AppSize.s30,
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
              SizedBox(height: AppSize.s20,),
              Row(
                children: [
                  Text("Received Date",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12,fontWeight: FontWeight.w400)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s50,),
                  Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s50,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
                  SizedBox(width: AppSize.s15,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              StreamBuilder<List<PatientModel>>(
                stream: _streamController.stream,
                builder: (context,snapshot) {
                  getPatientReffrealsData(context: context, pageNo: 1, nbrOfRows: 10, isIntake: 'false', isArchived: 'true').then((data) {
                    _streamController.add(data);
                  }).catchError((error) {
                    // Handle error
                  });
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 76),
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
                            AppStringSMModule.archivedReferNoData,
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
                              padding: const EdgeInsets.symmetric(vertical: 7,),
                              child: Container(
                                height: 79,
                                // decoration:  BoxDecoration(
                                //   color: ColorManager.white,
                                //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                                //   border: Border(
                                //     bottom: BorderSide(
                                //       color: Colors.grey.shade200,
                                //       width: 3,
                                //     ),
                                //     left: BorderSide(
                                //       color: Colors.grey.shade200,
                                //       width: 3,
                                //     ),
                                //     right: BorderSide(
                                //       color: Colors.grey.shade200,
                                //       width: 3,
                                //     ),
                                //   ),
                                // ),
                                decoration: BoxDecoration(
                                  color: ColorManager.white,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ///condition wise
                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     crossAxisAlignment: CrossAxisAlignment.end,
                                    //     children:[
                                    //       Container(
                                    //           width: AppSize.s99,
                                    //           height: AppSize.s15,
                                    //           decoration: BoxDecoration(
                                    //             color:Color(0xFFFFE4E2),
                                    //             borderRadius: BorderRadius.only(
                                    //                 topRight:
                                    //                 Radius.circular(12)),),
                                    //           child: Center(
                                    //             child: Text(
                                    //                 'Potencial Duplicate',
                                    //                 textAlign: TextAlign.center,
                                    //                 style: CustomTextStylesCommon.commonStyle(
                                    //                     color: ColorManager.mediumgrey,
                                    //                     fontSize: FontSize.s11,
                                    //                     fontWeight: FontWeight.w400)),
                                    //           )),
                                    //     ]
                                    // ),
                                    Container(height: AppSize.s12,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                                    SizedBox(width: AppSize.s15),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                                        SizedBox(height: AppSize.s5,),
                                                        Text(
                                                          "Referral Date:  ${snapshot.data![index].ptRefferalDate}",
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStylesCommon.commonStyle(
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

                                                // SizedBox(width: AppSize.s35),
                                                Text(
                                                  "By Ross Geller",
                                                  style: CustomTextStylesCommon.commonStyle(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorManager.textBlack,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 35.0),
                                                  child: Text(
                                                    "Ch #1",
                                                    style: DocDefineTableData.customTextStyle(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
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
                                          ),
                                          SizedBox(width: AppSize.s40,),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
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
                                          ),
                                          SizedBox(width: AppSize.s15),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
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
                                          ),
                                          // SizedBox(width: AppSize.s15),
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
                                                    return Image.asset('images/logo_login.png',width: 88,);
                                                  },
                                                  width: 88,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex: 4,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Marketer: ",
                                                    style: DocDefineTableData.customTextStyle(context),
                                                  ),
                                                  // SizedBox(width: AppSize.s30),
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
                                                              radius: 24,
                                                              backgroundColor: Colors.transparent,
                                                              child: Image.asset("images/profilepic.png"),
                                                            );
                                                          },
                                                          fit: BoxFit.cover,
                                                          height: 45,
                                                          width: 41,
                                                        ),
                                                      ),
                                                      SizedBox(width: AppSize.s15),
                                                      Text(
                                                        "${snapshot.data![index].marketer.firstName} ${snapshot.data![index].marketer.lastName}",
                                                        textAlign: TextAlign.center,
                                                        style: DocDefineTableData.customTextStyle(context),
                                                      ),
                                                    ],
                                                  ),

                                                  // SizedBox(width: AppSize.s15),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        onEyeButtonPressed();
                                                        providerReferrals.passPatientId(patientIdNo: snapshot.data![index].ptId);
                                                      } catch (e) {
                                                        print("Error: $e");
                                                      }
                                                    },
                                                    child:Container(
                                                      width: AppSize.s20,
                                                      height: AppSize.s25,
                                                      child: SvgPicture.asset(
                                                        'images/sm/sm_refferal/eye.svg',
                                                        height: AppSize.s15,
                                                        width: AppSize.s22,
                                                        color: ColorManager.bluebottom,
                                                      ),
                                                    ),

                                                  ),
                                                  // SizedBox(width: AppSize.s15),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                          hoverColor:
                                                          Colors.transparent,
                                                          splashColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () {},
                                                          child: Icon(
                                                            Icons.phone,
                                                            color:
                                                            ColorManager.bluebottom,
                                                            size: IconSize.I18,
                                                          )),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        "Call",
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s10,
                                                          fontWeight: FontWeight.w700,
                                                          color:
                                                          ColorManager.bluebottom,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  // SizedBox(width: AppSize.s20),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset(
                                                        "images/sm/sm_refferal/Restore.png",
                                                        height: 16,
                                                        width: 18,
                                                        color: ColorManager.bluebottom,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Restore",
                                                        style: CustomTextStylesCommon
                                                            .commonStyle(
                                                          fontSize: FontSize.s10,
                                                          fontWeight: FontWeight.w700,
                                                          color:
                                                          ColorManager.bluebottom,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  //SizedBox(width: AppSize.s18),
                                                ],
                                              ))

                                          // Expanded(
                                          //   flex: 3,
                                          //   child: Row(
                                          //     children: [
                                          //       Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
                                          //       SizedBox(width: AppSize.s15,),
                                          //       Container(
                                          //         child:Text("132 My Street,Kingston, New York 12401",
                                          //           textAlign: TextAlign.start,
                                          //           style:DocDefineTableDataID.customTextStyle(context),
                                          //         ) ,
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          //
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Row(
                                          //     children: [
                                          //       Container(
                                          //         width: 25,
                                          //         height: 15,
                                          //         decoration: BoxDecoration(
                                          //             color: Color(0xFFE3F2F8),
                                          //             borderRadius: BorderRadius.circular(3)
                                          //         ),
                                          //         child: Center(
                                          //           child: Text("ST",style: TextStyle(
                                          //             fontWeight: FontWeight.w700,
                                          //             fontSize: 12,
                                          //             color: ColorManager.bluebottom,
                                          //             decoration: TextDecoration.none,
                                          //           ),),
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Row(
                                          //     children: [
                                          //       Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                          //       // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
                                          //       Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                          //
                                          //     ],
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Row(
                                          //     children: [
                                          //       SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
                                          //     ],
                                          //   ),
                                          // ),

                                          ///dont delete
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Row(
                                          //     children: [
                                          //       GestureDetector(
                                          //         onTap: () => _makeCall(phoneNumber),
                                          //         child: SvgPicture.asset(
                                          //           "images/sm/contact_s.svg",
                                          //           height: 30,
                                          //           width: 20,
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          //
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Column(
                                          //     mainAxisAlignment: MainAxisAlignment.center,
                                          //     crossAxisAlignment: CrossAxisAlignment.start,
                                          //     children: [
                                          //       Row(
                                          //         // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                          //         // crossAxisAlignment: CrossAxisAlignment.start,
                                          //         children: [
                                          //           Text("Auto assigned on 2024/12/08 |",style: DocDefineTableData.customTextStyle(context),),
                                          //           // Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),
                                          //         ],
                                          //       ),
                                          //       Row(
                                          //         // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                          //         // crossAxisAlignment: CrossAxisAlignment.start,
                                          //         children: [
                                          //           Text("10:00 AM ",style: DocDefineTableData.customTextStyle(context),),
                                          //
                                          //         ],
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Container(height: AppSize.s12,),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }else {
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
