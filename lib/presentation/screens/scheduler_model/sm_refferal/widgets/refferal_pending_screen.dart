import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import 'package:provider/provider.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_integration_provider.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../../app/services/api/managers/hr_module_manager/manage_emp/education_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/intake/all_intake_manager.dart';
import '../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalPendingScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  final VoidCallback onAutoSyncPressed;
  final VoidCallback onMergeDuplicatePressed;
  final VoidCallback onMoveToIntake;
   RefferalPendingScreen(
      {super.key,
      required this.onEyeButtonPressed,required this.onAutoSyncPressed,
      required this.onMergeDuplicatePressed, required this.onMoveToIntake});

  @override
  State<RefferalPendingScreen> createState() => _RefferalPendingScreenState();
}

class _RefferalPendingScreenState extends State<RefferalPendingScreen> {
  List<String> hardcodedItems = [
    'All',
    'Referral App',
    'E-Fax',
    'E-Referrals',
    'Manual',
  ];

  // final int itemsPerPage = 10;
  //
  // final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();


  final StreamController<List<PatientModel>> _streamController = StreamController();
   TextEditingController _searchController = TextEditingController();
  final int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    //fetchData(); // Fetch once when screen loads
  }

  void fetchData() {
    final providerContact = Provider.of<SmIntakeProviderManager>(context, listen: false);
    getPatientReffrealsData(
      context: context,
      pageNo: 1,
      nbrOfRows: 9999,
      isIntake: 'false',
      isArchived: 'false',
      isScheduled: 'false',
      searchName: _searchController.text.isEmpty ? 'all' : _searchController.text,
      marketerId: providerContact.marketerId,
      referralSourceId: providerContact.referralSourceId,
      pcpId: providerContact.pcpId,
    ).then((data) {
      _streamController.add(data);
    });
  }

  void _performSearch() {
    // final provider = Provider.of<SmIntakeProviderManager>(context, listen: false);
    // provider.setCurrentPage(1); // Reset pagination
   // fetchData(); // Trigger search
  }


  @override
  void dispose() {
    // _streamController.close();
    // _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<SmIntakeProviderManager>(context);
    //final currentPage = pageProvider.currentPage;
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    final providerReferrals = Provider.of<DiagnosisProvider>(context,listen: false);
 // TextEditingController _searchController = TextEditingController();
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 60, right: 60, top: 10,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomSearchFieldSM(
                        searchController: _searchController,
                        width: 440,
                        onPressed: _performSearch,
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
                  Container(
                    height: AppSize.s36,
                    child: CustomIconButton(
                      color: ColorManager.bluebottom,
                      icon: Icons.autorenew_sharp,
                      textWeight: FontWeight.w700,
                      textSize: FontSize.s12,
                      text: "Auto Sync",
                      onPressed: ()async{
                        providerContact.toogleAppBar();
                        widget.onAutoSyncPressed();
                      },
                    ),
                  )
                ],
              ),

              SizedBox(
                height: AppSize.s20,
              ),

              SizedBox(
                height: AppSize.s20,
              ),
              Flexible(
                child: StreamBuilder<List<PatientModel>>(
                  stream: _streamController.stream,
                  builder: (context,snapshot) {
                    getPatientReffrealsData(context: context,
                        pageNo: 1, nbrOfRows: 9999,
                       // pageNo: currentPage, nbrOfRows: itemsPerPage,
                        isIntake: 'false', isArchived: 'false', isScheduled: 'false', searchName: _searchController.text.isEmpty ?'all':_searchController.text,
                        marketerId: providerContact.marketerId,
                        referralSourceId: providerContact.referralSourceId, pcpId: providerContact.pcpId).then((data) {
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
                      print(">>>>>>Number of items ppp : ${snapshot.data!.length}");

                      final items = snapshot.data!;
                      final totalItems = items.length;
                      final totalPages = (totalItems / itemsPerPage).ceil();
                      final currentPage = pageProvider.currentPage;

                      // ✅ Slice the data
                      final paginatedItems = items
                          .skip((currentPage - 1) * itemsPerPage)
                          .take(itemsPerPage)
                          .toList();

                      return Column(
                        children: [
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                              child: ListView.builder(
                                itemCount: paginatedItems.length, // ✅ Correct count
                                itemBuilder: (BuildContext context, int index) {
                                  final item = paginatedItems[index]; // ✅ Use paginated item

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7,
                                    ),
                                    child: Container(
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
                                      Container(
                                        width: 6,
                                        decoration: BoxDecoration(
                                          border:  Border(
                                            left: BorderSide(
                                              color: item.thresould == 0
                                                  ? ColorManager.greenDark
                                                  : item.thresould == 1
                                                  ? const Color(0xFFFEBD4D)
                                                  : ColorManager.red,
                                             // color: snapshot.data![index].thresould == 0 ? ColorManager.greenDark : snapshot.data![index].thresould == 1 ?const Color(0xFFFEBD4D):ColorManager.red,
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
                                                  //snapshot.data![index].isPotential ?
                                                  item.isPotential ?
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
                                                      )) : Offstage()
                                                ]),
                                            Padding(
                                              padding: const EdgeInsets.only(left: AppPadding.p15,right: AppPadding.p15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  /// Include image to Referral Source
                                                  ClipOval(
                                                    child:
                                                    // (snapshot.data![index].ptImgUrl == null ||//     snapshot.data![index].ptImgUrl == '' ||//     snapshot.data![index].ptImgUrl == 'imgurl')
                                                    (item.ptImgUrl == null || item.ptImgUrl == '' || item.ptImgUrl == 'imgurl')
                                                        ? CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor: Colors.transparent,
                                                      child: Image.asset("images/profilepic.png"),
                                                    )
                                                        : Image.network(
                                                      item.ptImgUrl!,
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (context, child, loadingProgress) {
                                                        if (loadingProgress == null) return child;
                                                        return Center(
                                                          child: CircularProgressIndicator(
                                                            value: loadingProgress.expectedTotalBytes != null
                                                                ? loadingProgress.cumulativeBytesLoaded /
                                                                (loadingProgress.expectedTotalBytes ?? 1)
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                      errorBuilder: (context, error, stackTrace) => CircleAvatar(
                                                        radius: 21,
                                                        backgroundColor: Colors.transparent,
                                                        child: Image.asset("images/profilepic.png"),
                                                      ),
                                                    ),
                                                  ),
                                                  // ClipOval(
                                                  //   child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                                  //       snapshot.data![index].ptImgUrl == null
                                                  //       ? CircleAvatar(
                                                  //     radius: 22,
                                                  //     backgroundColor: Colors.transparent,
                                                  //     child: Image.asset("images/profilepic.png"),
                                                  //   )
                                                  //       : Image.network(
                                                  //     snapshot.data![index].ptImgUrl!,
                                                  //     loadingBuilder: (context, child, loadingProgress) {
                                                  //       if (loadingProgress == null) {
                                                  //         return child;
                                                  //       } else {
                                                  //         return Center(
                                                  //           child: CircularProgressIndicator(
                                                  //             value: loadingProgress.expectedTotalBytes != null
                                                  //                 ? loadingProgress.cumulativeBytesLoaded /
                                                  //                 (loadingProgress.expectedTotalBytes ?? 1)
                                                  //                 : null,
                                                  //           ),
                                                  //         );
                                                  //       }
                                                  //     },
                                                  //     errorBuilder: (context, error, stackTrace) {
                                                  //       return CircleAvatar(
                                                  //         radius: 21,
                                                  //         backgroundColor: Colors.transparent,
                                                  //         child: Image.asset("images/profilepic.png"),
                                                  //       );
                                                  //     },
                                                  //     fit: BoxFit.cover,
                                                  //     height: 40,
                                                  //     width: 40,
                                                  //   ),
                                                  // ),
                                                  ///
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
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "${item.ptFirstName} ${item.ptLastName}",
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
                                                          "Received Date :  ${item.ptRefferalDate}",
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s11,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s2,
                                                        ),
                                                        Text(
                                                          DateFormat.jm().format(snapshot.data![index].createdAt),
                                                          // item.intakeTime != null
                                                          //     ? DateFormat.jm().format(DateTime.parse(item.intakeTime!))
                                                          //     : '',
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s11,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  // SizedBox(width: AppSize.s30),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text("Ch #${item.ptChartNo.toString()}",
                                                        textAlign: TextAlign.left,
                                                        style: CustomTextStylesCommon.commonStyle(
                                                          fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.textBlack,
                                                        )),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
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
                                                          item.referralSource.sourceName,
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
                                                  //SizedBox(width: 20,),
                                                  /// PCP and primary diagnosis
                                                 // SizedBox(width: 25,),
                                                  Expanded(
                                                    flex: 3,
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
                                                         "${item.pcp.phyFirstName} ${item.pcp.phyLastName}",
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
                                                  // SizedBox(
                                                  //   width: 30,
                                                  // ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Primary Diagnosis:",
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s4,
                                                        ),
                                                        Text(item.patientDiagnoses.isEmpty ? "--":
                                                        item.patientDiagnoses[0].dgnName,
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
                                                  //SizedBox(width: 20,),
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

                                            /// company image
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 5),
                                                child: SizedBox(child: Center(child:  Image.network(
                                                  item.referralSource.referralSourceImgUrl,
                                                  width: 90,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Image.asset(
                                                      'images/logo_login.png', // fallback asset
                                                      width: 90,
                                                      fit: BoxFit.contain,
                                                    );
                                                  },
                                                ),
                                                // Image.network( snapshot.data![index].referralSource.referralSourceImgUrl
                                                // //  'images/logo_login.png',width: 90,fit: BoxFit.contain,
                                                // )
                                                )),
                                              ),
                                            ),
                                            // Expanded(
                                            //   flex: 3,
                                            //   child: Padding(
                                            //     padding: const EdgeInsets.only(right: 5),
                                            //     child: SizedBox(
                                            //       child: Center(
                                            //         child: CachedNetworkImage(
                                            //           imageUrl: snapshot.data![index].referralSource.referralSourceImgUrl,
                                            //           width: 90,
                                            //           fit: BoxFit.contain,
                                            //          // placeholder: (context, url) => const CircularProgressIndicator(),
                                            //           errorWidget: (context, url, error) => Image.asset(
                                            //             'images/logo_login.png',
                                            //             width: 90,
                                            //             fit: BoxFit.contain,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            /// Marketer
                                           // SizedBox(width: AppSize.s10),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Marketer: ",
                                                style: DocDefineTableData.customTextStyle(context),
                                              ),
                                            ),
                                            //SizedBox(width: AppSize.s15),
                                            ClipOval(
                                              child: item.ptImgUrl == 'imgurl' ||
                                                  item.ptImgUrl == null
                                                  ? CircleAvatar(
                                                radius: 23,
                                                backgroundColor: Colors.transparent,
                                                child: Image.asset("images/profilepic.png"),
                                              )
                                                  : Image.network(
                                                item.marketer.imgurl,
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
                                                    radius: 21,
                                                    backgroundColor: Colors.transparent,
                                                    child: Image.asset("images/profilepic.png"),
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                                height: 40,
                                                width: 40,
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
                                            //SizedBox(width: AppSize.s15),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(
                                                  "${item.marketer.firstName} ${item.marketer.lastName}",
                                                  textAlign: TextAlign.center,
                                                  style: DocDefineTableData
                                                      .customTextStyle(context),
                                                ),
                                              ),
                                            ),

                                                  // SizedBox(width: AppSize.s15),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        widget.onEyeButtonPressed();
                                                        providerReferrals.passPatientId(patientIdNo: item.ptId);
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
                                                  Expanded(
                                                    flex: 3,
                                                    child: Container(
                                                      height: 33,
                                                      width: 115,
                                                      child: ElevatedButton.icon(
                                                        icon: Image.asset(
                                                          "images/sm/sm_refferal/file.png",
                                                          height: 16,
                                                          width: 16,
                                                        ),
                                                        onPressed: () async{
                                                        var response = await addPatientIntakeDemographich(context: context, ptId: snapshot.data![index].ptId);
                                                        if(response.statusCode == 200 || response.statusCode == 201){
                                                          //onMoveToIntake();
                                                          showDialog(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return AddSuccessPopup(
                                                                message: 'Data Updated Successfully',
                                                              );
                                                            },
                                                          );
                                                        }else{
                                                          print('Api error');
                                                        }
                                                        },
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
                                                  ),
                                                  // SizedBox(width: AppSize.s3),
                                                  PopupMenuButton<String>(
                                                    tooltip: '',
                                                    splashRadius: 0,
                                                    color: Colors.white,
                                                    offset: Offset(25, 42),
                                                    itemBuilder: (BuildContext context) => [
                                                      // PopupMenuItem<String>(
                                                      //   value: 'Merge Duplicate',
                                                      //   padding: EdgeInsets.zero, // Remove padding
                                                      //   child: InkWell(
                                                      //     splashColor: Colors.transparent,
                                                      //     highlightColor: Colors.transparent,
                                                      //     hoverColor: Colors.transparent,
                                                      //     onTap: () {
                                                      //       Navigator.pop(context); // Important: manually close the popup
                                                      //       onMergeDuplicatePressed();
                                                      //     },
                                                      //     child: Container(
                                                      //       alignment: Alignment.centerLeft,
                                                      //       padding: EdgeInsets.only(left: 12, top: 5),
                                                      //       width: 100,
                                                      //       child: Text(
                                                      //         'Merge Duplicate',
                                                      //         style: CustomTextStylesCommon.commonStyle(
                                                      //           fontWeight: FontWeight.w700,
                                                      //           fontSize: FontSize.s12,
                                                      //           color: ColorManager.mediumgrey,
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      PopupMenuItem<String>(
                                                        value: 'Archived',
                                                        padding: EdgeInsets.zero,
                                                        child: InkWell(
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          hoverColor: Colors.transparent,
                                                          onTap: () async{
                                                            var response = await updateReferralPatient(context: context,
                                                                isUpdatePatiendData: false,
                                                                patientId:  item.ptId, isIntake: false, isArchived: true);
                                                            if(response.statusCode == 200 || response.statusCode == 201){
                                                             Navigator.pop(context);
                                                             showDialog(
                                                               context: context,
                                                               builder: (BuildContext context) {
                                                                 return AddSuccessPopup(
                                                                   message: 'Data Updated Successfully',
                                                                 );
                                                               },
                                                             );
                                                            }else{
                                                              print('Api error');
                                                            }
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
                                                  )
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
                          ),
                          const SizedBox(height: AppSize.s10),
                          PaginationControlsWidget(
                              currentPage: currentPage,
                              items: items, // Full list passed here
                              itemsPerPage: itemsPerPage,
                              onPreviousPagePressed: () {
                                if (currentPage > 1) {
                                  pageProvider.setCurrentPage(currentPage - 1);
                                }
                              },
                              onPageNumberPressed: (pageNumber) {
                                pageProvider.setCurrentPage(pageNumber);
                              },
                              onNextPagePressed: () {
                                if (currentPage < totalPages) {
                                  pageProvider.setCurrentPage(currentPage + 1);
                                }
                              },
                          ),
                        ],
                      );
                    }else{
                      return SizedBox();
                    }
                  }
                ),
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
