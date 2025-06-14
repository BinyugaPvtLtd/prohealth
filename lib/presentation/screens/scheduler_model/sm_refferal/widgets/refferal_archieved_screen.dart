import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
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
import '../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalArchievedScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
   RefferalArchievedScreen({super.key, required this.onEyeButtonPressed});

  @override
  State<RefferalArchievedScreen> createState() => _RefferalArchievedScreenState();
}

class _RefferalArchievedScreenState extends State<RefferalArchievedScreen> {
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

  final TextEditingController _searchController = TextEditingController();

  final int itemsPerPage = 10;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // _searchController.addListener(_onSearchChanged);
  //   // fetchData(); // Initial load
  // }
  // //
  // SmIntakeProviderManager get providerContact =>
  //     Provider.of<SmIntakeProviderManager>(context, listen: false);
  // void _onSearchChanged() {
  //   providerContact.filterIdIntegration(
  //     context: context,
  //     marketerId: providerContact.marketerId,
  //     sourceId: providerContact.referralSourceId,
  //     pcpId: providerContact.pcpId,
  //   );
  // }


  // void fetchData() async {
  //   final provider = Provider.of<SmIntakeProviderManager>(context, listen: false);
  //
  //   try {
  //     final data = await getPatientReffrealsData(
  //       context: context,
  //       pageNo: 1,
  //       nbrOfRows: 9999,
  //       isIntake: 'false',
  //       isArchived: 'true',
  //       isScheduled: 'false',
  //       searchName: _searchController.text.isEmpty ? 'all' : _searchController.text,
  //       marketerId: provider.marketerId,
  //       referralSourceId: provider.referralSourceId,
  //       pcpId: provider.pcpId,
  //     );
  //     _streamController.add(data);
  //   } catch (e) {
  //     _streamController.addError("Error loading archived referrals");
  //   }
  // }
  //
  // @override
  // void dispose() {
  //   // _searchController.removeListener(_onSearchChanged);
  //   // _searchController.dispose();
  //   // _streamController.close();
  //   super.dispose();
  // }
  //


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<SmIntakeProviderManager>(context, listen: false);

      provider.setCurrentScreen(RefferalFilterScreenType.archive);
    provider.filterIdIntegration(
      context: context,
      marketerId: 'all',
      sourceId: 'all',
      pcpId: 'all',
    );
  });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  // final int itemsPerPage = 10;
  @override
  Widget build(BuildContext context) {
    final archievedProvider = Provider.of<SmIntakeProviderManager>(context);
    final currentPage = archievedProvider.currentPageaa;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchFieldSM(
                    searchController: archievedProvider.searchController,
                    width: 440,
                    onPressed: () {
                      archievedProvider.filterIdIntegration(
                        context: context,
                        marketerId: archievedProvider.marketerId,
                        sourceId: archievedProvider.referralSourceId,
                        pcpId: archievedProvider.pcpId,
                      );
                    },
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

              SizedBox(height: AppSize.s20,),

              SizedBox(height: AppSize.s20,),
              Flexible(
                child: StreamBuilder<List<PatientModel>>(
                   stream:  Provider.of<SmIntakeProviderManager>(context).patientReferralsStream,
                 // stream: _streamController.stream,
                  builder: (context,snapshot) {
                    getPatientReffrealsData(context: context, pageNo: 1, nbrOfRows: 9999,
                        isIntake: 'false', isArchived: 'true', isScheduled: 'false', isNotAdmit: 'true',
                        searchName: _searchController.text.isEmpty ?'all':_searchController.text,
                        marketerId: providerContact.marketerId,
                        referralSourceId: providerContact.referralSourceId, pcpId: providerContact.pcpId).then((data) {
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
                      print(">>>>>>Number of items aaaaa: ${snapshot.data!.length}");
                      final items = snapshot.data!;
                      final totalItems = items.length;
                      final totalPages = (totalItems / itemsPerPage).ceil();
                      //final currentPage = archievedProvider.currentPageaa;

                      // ✅ Slice the data
                      final paginatedItems = items
                          .skip((currentPage - 1) * itemsPerPage)
                          .take(itemsPerPage)
                          .toList();

                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: paginatedItems.length + 1, // Add one for pagination widget
                                                           //   itemCount: paginatedItems.length, // ✅ Correct count
                                itemBuilder: (BuildContext context, int index) {
                                  if (index < paginatedItems.length) {
                                    final archieved = paginatedItems[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 7,),
                                      child: Container(
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
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
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
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: AppPadding.p15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  ClipOval(
                                                    child: archieved.ptImgUrl ==
                                                        'imgurl' ||
                                                        archieved.ptImgUrl ==
                                                            null
                                                        ? CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      child: Image.asset(
                                                          "images/profilepic.png"),
                                                    )
                                                        : Image.network(
                                                      archieved.ptImgUrl!,
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        } else {
                                                          return Center(
                                                            child: CircularProgressIndicator(
                                                              value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                                  null
                                                                  ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                                  (loadingProgress
                                                                      .expectedTotalBytes ??
                                                                      1)
                                                                  : null,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 21,
                                                          backgroundColor: Colors
                                                              .transparent,
                                                          child: Image.asset(
                                                              "images/profilepic.png"),
                                                        );
                                                      },
                                                      fit: BoxFit.cover,
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                                  SizedBox(width: AppSize.s15),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          "${archieved
                                                              .ptFirstName} ${archieved
                                                              .ptLastName}",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w700,
                                                            color: ColorManager.mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s5,),
                                                        Text(
                                                          "Referral Date:  ${archieved
                                                              .ptRefferalDate}",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s11,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color:
                                                            ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s2,
                                                        ),
                                                        Text(
                                                          DateFormat.jm()
                                                              .format(snapshot
                                                              .data![index]
                                                              .createdAt),
                                                          // archieved.intakeTime != null
                                                          //     ? DateFormat.jm().format(DateTime.parse(archieved.intakeTime!))
                                                          //     : '',
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s11,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color:
                                                            ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                              
                                                  // SizedBox(width: AppSize.s35),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      "By Ross Geller",
                                                      style: CustomTextStylesCommon
                                                          .commonStyle(
                                                        fontSize: FontSize.s12,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        color: ColorManager
                                                            .textBlack,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(right: 35.0),
                                                      child: Text(
                                                        "Ch #1",
                                                        style: DocDefineTableData
                                                            .customTextStyle(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Referral Source: ",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: ColorManager
                                                                .textBlack,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s4,
                                                        ),
                                                        Text(
                                                          archieved
                                                              .referralSource
                                                              .sourceName,
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w700,
                                                            color: ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //SizedBox(width: AppSize.s40,),
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
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s4,
                                                        ),
                                                        Text(
                                                          "${archieved.pcp
                                                              .phyFirstName} ${archieved
                                                              .pcp
                                                              .phyLastName}",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w700,
                                                            color: ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //SizedBox(width: AppSize.s15),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Primary Diagnosis: ",
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w400,
                                                            color: ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: AppSize.s4,
                                                        ),
                                                        Text(archieved
                                                            .patientDiagnoses
                                                            .isEmpty ? "--" :
                                                        archieved
                                                            .patientDiagnoses[0]
                                                            .dgnName,
                                                          textAlign: TextAlign
                                                              .center,
                                                          style: CustomTextStylesCommon
                                                              .commonStyle(
                                                            fontSize: FontSize
                                                                .s12,
                                                            fontWeight: FontWeight
                                                                .w700,
                                                            color: ColorManager
                                                                .mediumgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // SizedBox(width: AppSize.s15),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(right: 5),
                                                      child: SizedBox(
                                                          child: Center(
                                                            child: Image
                                                                .network(
                                                              archieved
                                                                  .referralSource
                                                                  .referralSourceImgUrl,
                                                              width: 90,
                                                              fit: BoxFit
                                                                  .contain,
                                                              errorBuilder: (
                                                                  context,
                                                                  error,
                                                                  stackTrace) {
                                                                return Image
                                                                    .asset(
                                                                  'images/logo_login.png',
                                                                  // fallback asset
                                                                  width: 90,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                );
                                                              },
                                                            ),
                                                            // Image.network( snapshot.data![index].referralSource.referralSourceImgUrl
                                                            // //  'images/logo_login.png',width: 90,fit: BoxFit.contain,
                                                            // )
                                                          )),
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   width: 10,
                                                  // ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      "Marketer: ",
                                                      style: DocDefineTableData
                                                          .customTextStyle(
                                                          context),
                                                    ),
                                                  ),
                                                  // SizedBox(width: AppSize.s30),
                                                  ClipOval(
                                                    child: archieved.ptImgUrl ==
                                                        'imgurl' ||
                                                        archieved.ptImgUrl ==
                                                            null
                                                        ? CircleAvatar(
                                                      radius: 23,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      child: Image.asset(
                                                          "images/profilepic.png"),
                                                    )
                                                        : Image.network(
                                                      archieved.marketer.imgurl,
                                                      loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        } else {
                                                          return Center(
                                                            child: CircularProgressIndicator(
                                                              value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                                  null
                                                                  ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                                  (loadingProgress
                                                                      .expectedTotalBytes ??
                                                                      1)
                                                                  : null,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return CircleAvatar(
                                                          radius: 21,
                                                          backgroundColor: Colors
                                                              .transparent,
                                                          child: Image.asset(
                                                              "images/profilepic.png"),
                                                        );
                                                      },
                                                      fit: BoxFit.cover,
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                                  // SizedBox(width: AppSize.s15),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "${archieved.marketer.firstName}"
                                                          " ${archieved.marketer.lastName}",
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: DocDefineTableData
                                                          .customTextStyle(
                                                          context),
                                                    ),
                                                  ),
                              
                                                  // SizedBox(width: AppSize.s15),
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        widget
                                                            .onEyeButtonPressed();
                                                        providerReferrals
                                                            .passPatientId(
                                                            patientIdNo: archieved
                                                                .ptId);
                                                      } catch (e) {
                                                        print("Error: $e");
                                                      }
                                                    },
                                                    child: Container(
                                                      width: AppSize.s20,
                                                      height: AppSize.s25,
                                                      child: SvgPicture.asset(
                                                        'images/sm/sm_refferal/eye.svg',
                                                        height: AppSize.s15,
                                                        width: AppSize.s22,
                                                        color: ColorManager
                                                            .bluebottom,
                                                      ),
                                                    ),
                              
                                                  ),
                                                  SizedBox(width: AppSize.s15),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      InkWell(
                                                          hoverColor: Colors.transparent,
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          onTap: () {},
                                                          child: Icon(
                                                            Icons.phone,
                                                            color: ColorManager.bluebottom,
                                                            size: IconSize.I18,
                                                          )),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        "Call",
                                                        style: CustomTextStylesCommon.commonStyle(
                                                          fontSize: FontSize.s10,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.bluebottom,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(width: AppSize.s20),
                                                  InkWell(
                                                    onTap: () async {
                                                      var response = await updateReferralPatient(
                                                          context: context,
                                                          patientId: archieved.ptId,
                                                          isIntake: false,
                                                          isArchived: false,
                                                          isUpdatePatiendData: false);
                                                      if (response.statusCode == 200 || response.statusCode == 201) {
                                                        showDialog(context: context,
                                                          builder: (BuildContext context) {
                                                            return AddSuccessPopup(
                                                              message: 'Data Updated Successfully',
                                                            );
                                                          },
                                                        );
                                                        Provider.of<SmIntakeProviderManager>(context, listen: false).filterIdIntegration(
                                                          context: context,
                                                          marketerId: providerContact.marketerId,
                                                          sourceId: providerContact.referralSourceId,
                                                          pcpId: providerContact.pcpId,
                                                        );
                                                      } else {
                                                        print('Api error');
                                                      }
                                                    },
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Image.asset(
                                                          "images/sm/sm_refferal/Restore.png",
                                                          height: 16,
                                                          width: 18,
                                                          color: ColorManager.bluebottom,
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text(
                                                          "Restore",
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s10,
                                                            fontWeight: FontWeight.w700,
                                                            color: ColorManager.bluebottom,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                              
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
                                  } else {
                                    // 👇 This is the last item: the pagination widget
                              
                                    final isLastPage = currentPage == totalPages;
                                    final remainingSlots = itemsPerPage - paginatedItems.length;
                                    const estimatedItemHeight = 80; // adjust to match your item
                                    final extraPaddingHeight = isLastPage
                                        ? (remainingSlots * estimatedItemHeight).toDouble()
                                        : 0.0;
                                    return Column(
                                      children: [
                                        if (extraPaddingHeight > 0)
                                          SizedBox(height: extraPaddingHeight),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: PaginationControlsWidget(
                              
                              
                                            currentPage: currentPage,
                                            items: items,
                                            itemsPerPage: itemsPerPage,
                                            onPreviousPagePressed: () {
                                              if (currentPage > 1) {
                                                archievedProvider.aaCurrentPage(currentPage - 1);
                                              }
                                            },
                                            onPageNumberPressed: (pageNumber) {
                                              archievedProvider.aaCurrentPage(pageNumber);
                                            },
                                            onNextPagePressed: () {
                                              if (currentPage < totalPages) {
                                                archievedProvider.aaCurrentPage(currentPage + 1);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                            ),
                            // const SizedBox(height: AppSize.s10),
                            // PaginationControlsWidget(
                            //   currentPage: currentPage,
                            //   items: items,
                            //   itemsPerPage: itemsPerPage,
                            //   onPreviousPagePressed: () {
                            //     if (currentPage > 1) {
                            //       archievedProvider.aaCurrentPage(currentPage - 1);
                            //     }
                            //   },
                            //   onPageNumberPressed: (pageNumber) {
                            //     archievedProvider.aaCurrentPage(pageNumber);
                            //   },
                            //   onNextPagePressed: () {
                            //     if (currentPage < totalPages) {
                            //       archievedProvider.aaCurrentPage(currentPage + 1);
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      );
                    }else {
                      return const SizedBox();
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


