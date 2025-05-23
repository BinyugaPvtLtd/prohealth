import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalMoveToIntakeScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  final VoidCallback onMergeDuplicatePressed;
  RefferalMoveToIntakeScreen({super.key, required this.onEyeButtonPressed, required this.onMergeDuplicatePressed});

  @override
  State<RefferalMoveToIntakeScreen> createState() => _RefferalMoveToIntakeScreenState();
}

class _RefferalMoveToIntakeScreenState extends State<RefferalMoveToIntakeScreen> {
  bool _isChecked = false;

  List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];

  // final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();
  final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();

  final TextEditingController _searchController = TextEditingController();

  final int itemsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _fetchData(); // Initial load
  }

  void _onSearchChanged() {
    _fetchData();
  }

  void _fetchData() async {
    final provider = Provider.of<SmIntakeProviderManager>(context, listen: false);

    try {
      final data = await getPatientReffrealsData(
        context: context,
        pageNo: 1,
        nbrOfRows: 9999,
        isIntake: 'true',
        isArchived: 'false',
        isScheduled: 'false',
        searchName: _searchController.text.isEmpty ? 'all' : _searchController.text,
        marketerId: provider.marketerId,
        referralSourceId: provider.referralSourceId,
        pcpId: provider.pcpId,
      );
      _streamController.add(data);
    } catch (e) {
      _streamController.addError("Failed to load data");
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final intakeProvider = Provider.of<SmIntakeProviderManager>(context);
    // final currentPage = intakeProvider.currentPagemm;
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    final providerReferrals = Provider.of<DiagnosisProvider>(context,listen: false);
   // TextEditingController _searchController = TextEditingController();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60,right: 60, top: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchFieldSM(
                    searchController: _searchController,
                    width: 440,
                    onPressed: _onSearchChanged,
                  ),
                  SizedBox(width: AppSize.s20,),
                  IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed:providerContact.toggleFilter,
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: 18,width: 16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              // Row(
              //   children: [
              //     Text("Received Date",
              //         style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
              //     SizedBox(width: AppSize.s15,),
              //     Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
              //     SizedBox(width: AppSize.s50,),
              //     Text("Hospitals",
              //         style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
              //     SizedBox(width: AppSize.s15,),
              //     Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
              //     SizedBox(width: AppSize.s50,),
              //     Text("PCP",
              //         style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
              //     SizedBox(width: AppSize.s15,),
              //     Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
              //   ],
              // ),
              SizedBox(height: AppSize.s20,),
              Flexible(
                child: StreamBuilder<List<PatientModel>>(
                    stream: _streamController.stream,
                    builder: (context,snapshot) {
                      // getPatientReffrealsData(context: context, pageNo:1 , nbrOfRows: 9999, isIntake: 'true', isArchived: 'false', isScheduled: 'false', searchName: _searchController.text.isEmpty ?'all':_searchController.text,
                      //     marketerId: providerContact.marketerId,
                      //     referralSourceId: providerContact.referralSourceId, pcpId: providerContact.pcpId).then((data) {
                      //   _streamController.add(data);
                      // }).catchError((error) {
                      //   // Handle error
                      // });
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
                                AppStringSMModule.moveIntakeReferNoData,
                                style: AllNoDataAvailable.customTextStyle(context),
                              ),
                            ));
                      }
                      if(snapshot.hasData){
                        print(">>>>>>Number of items mmmmmm : ${snapshot.data!.length}");
                        final items = snapshot.data!;
                        final totalItems = items.length;
                        final totalPages = (totalItems / itemsPerPage).ceil();
                        final currentPage = intakeProvider.currentPagemm;

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
                                    final movetointake = paginatedItems[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 7,),
                                      child: Container(
                                        height: 79,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),topLeft: Radius.circular(12),topRight: Radius.circular(12)),
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
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // Row(
                                            //     mainAxisAlignment: MainAxisAlignment.end,
                                            //     crossAxisAlignment: CrossAxisAlignment.end,
                                            //     children:[
                                            //       Container(
                                            //           width: AppSize.s105,
                                            //           height: AppSize.s16,
                                            //           decoration: BoxDecoration(
                                            //             color:Color(0xFFFFE4E2),
                                            //             borderRadius: BorderRadius.only(
                                            //                 topRight:
                                            //                 Radius.circular(12)),),
                                            //           child: Center(
                                            //             child: Text(
                                            //                 'Potential Duplicate',
                                            //                 textAlign: TextAlign.center,
                                            //                 style: CustomTextStylesCommon.commonStyle(
                                            //                     color: ColorManager.mediumgrey,
                                            //                     fontSize: FontSize.s11,
                                            //                     fontWeight: FontWeight.w400)),
                                            //           )),
                                            //     ]
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: AppPadding.p20,
                                                  right: AppPadding.p25),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  ///Image
                                                  ClipOval(
                                                    child: movetointake.ptImgUrl == 'imgurl' ||
                                                        movetointake.ptImgUrl == null
                                                        ? CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor: Colors.transparent,
                                                      child: Image.asset("images/profilepic.png"),
                                                    )
                                                        : Image.network(
                                                      movetointake.ptImgUrl!,
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
                                                  SizedBox(width: AppSize.s15),
                                                  ///Name
                                                  Expanded(
                                                    flex: 4,
                                                    child:  Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "${movetointake.ptFirstName} ${movetointake.ptLastName}",
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
                                                          "Referral Date :  ${movetointake.ptRefferalDate}",
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
                                                    ),),
                                                  ///ch
                                                  Expanded(
                                                    flex: 2,
                                                    child:  Text(
                                                    "Ch #${movetointake.ptChartNo.toString()}",
                                                    style: DocDefineTableData.customTextStyle(context),
                                                  ),),
                                                  ///Referral source
                                                  Expanded(
                                                    flex: 3,
                                                    child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Referral Source: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.textBlack,),
                                                      ),
                                                      SizedBox(height: AppSize.s4,),
                                                      Text(
                                                        movetointake.referralSource.sourceName,
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,),
                                                      ),
                                                    ],
                                                  ),),
                                                  ///PCP
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "PCP: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.mediumgrey,),
                                                      ),
                                                      SizedBox(height: AppSize.s4,),
                                                      Text(
                                                        "${movetointake.pcp.phyFirstName} ${movetointake.pcp.phyLastName}",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,),
                                                      ),
                                                    ],
                                                  ),),
                                                  ///Primary diagnosis
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Primary Diagnosis: ",
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.mediumgrey,),
                                                      ),
                                                      SizedBox(height: AppSize.s4,),
                                                      Text( movetointake.patientDiagnoses.isEmpty ? "--" :
                                                      movetointake.patientDiagnoses[0].dgnName,
                                                        textAlign: TextAlign.center,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.mediumgrey,),
                                                      ),
                                                    ],
                                                  ),),

                                                  ///company Img
                                                  Expanded(
                                                    flex: 3,
                                                    child: Center(
                                                      child: Image.network(
                                                        movetointake.referralSource.referralSourceImgUrl,
                                                        width: 90,
                                                        fit: BoxFit.contain, // or BoxFit.cover if you like
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
                                                          return SizedBox(
                                                            child: Center(
                                                              child: Image.asset(
                                                                'images/logo_login.png',
                                                                width: 90,
                                                                fit: BoxFit.contain,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  ///marketer
                                                  Expanded(
                                                    flex: 2,
                                                      child: Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),)),
                                                  // SizedBox(width: 10),
                                                  ///Img
                                        ClipOval(
                                          child: movetointake.ptImgUrl == 'imgurl' ||
                                              movetointake.ptImgUrl == null
                                              ? CircleAvatar(
                                            radius: 23,
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset("images/profilepic.png"),
                                          )
                                              : Image.network(
                                            movetointake.marketer.imgurl,
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
                                                  ///Name
                                                  Expanded(
                                                    flex: 2,
                                                    child:  Text(
                                                    "${movetointake.marketer.firstName} ${movetointake.marketer.lastName}",
                                                    textAlign: TextAlign.center,
                                                    style: DocDefineTableData.customTextStyle(context),
                                                  ),),
                                                  ///4 Icons
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        try {
                                                          widget.onEyeButtonPressed();
                                                          providerReferrals.passPatientId(patientIdNo: movetointake.ptId);
                                                        }
                                                        catch (e){
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
                                                    //  SizedBox(width: AppSize.s10),
                                                    IconButton(
                                                        hoverColor: Colors.transparent,
                                                        splashColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onPressed: (){},
                                                        icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                                    // SizedBox(width: AppSize.s2),
                                                    // PopupMenuButton<String>(
                                                    //   tooltip: '',
                                                    //   splashRadius: 0,
                                                    //   color: Colors.white,
                                                    //   offset: Offset(25, 42),
                                                    //   itemBuilder: (BuildContext context) => [
                                                    //     PopupMenuItem<String>(
                                                    //       value: 'Merge Duplicate',
                                                    //       padding: EdgeInsets.zero, // Remove padding
                                                    //       child: InkWell(
                                                    //         splashColor: Colors.transparent,
                                                    //         highlightColor: Colors.transparent,
                                                    //         hoverColor: Colors.transparent,
                                                    //         onTap: () {
                                                    //           Navigator.pop(context); // Important: manually close the popup
                                                    //           onMergeDuplicatePressed();
                                                    //         },
                                                    //         child: Container(
                                                    //           alignment: Alignment.centerLeft,
                                                    //           padding: EdgeInsets.only(left: 12, top: 5),
                                                    //           width: 100,
                                                    //           child: Text(
                                                    //             'Merge Duplicate',
                                                    //             style: CustomTextStylesCommon.commonStyle(
                                                    //               fontWeight: FontWeight.w700,
                                                    //               fontSize: FontSize.s12,
                                                    //               color: ColorManager.mediumgrey,
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //     PopupMenuItem<String>(
                                                    //       value: 'Archived',
                                                    //       padding: EdgeInsets.zero,
                                                    //       child: InkWell(
                                                    //         splashColor: Colors.transparent,
                                                    //         highlightColor: Colors.transparent,
                                                    //         hoverColor: Colors.transparent,
                                                    //         onTap: () {
                                                    //           Navigator.pop(context);
                                                    //           print('Option 2 Selected');
                                                    //         },
                                                    //         child: Container(
                                                    //           alignment: Alignment.centerLeft,
                                                    //           padding: EdgeInsets.only(left: 12, top: 5),
                                                    //           width: 100,
                                                    //           child: Text(
                                                    //             'Archived',
                                                    //             style: CustomTextStylesCommon.commonStyle(
                                                    //               fontWeight: FontWeight.w700,
                                                    //               fontSize: FontSize.s12,
                                                    //               color: ColorManager.mediumgrey,
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    //   child: Icon(Icons.more_vert, color: ColorManager.mediumgrey),
                                                    // ),
                                                  ],),
                                                ],
                                              )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ); },

                                ),
                              ),
                            ),
                            const SizedBox(height: AppSize.s10),
                            // Pagination Controls
                            PaginationControlsWidget(
                              currentPage: currentPage,
                              items: items,
                              itemsPerPage: itemsPerPage,
                              onPreviousPagePressed: () {
                                if (currentPage > 1) {
                                  intakeProvider.mmCurrentPage(currentPage - 1);
                                }
                              },
                              onPageNumberPressed: (pageNumber) {
                                intakeProvider.mmCurrentPage(pageNumber);
                              },
                              onNextPagePressed: () {
                                if (currentPage < totalPages) {
                                  intakeProvider.mmCurrentPage(currentPage + 1);
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
              // Expanded(
              //   child: ScrollConfiguration(
              //     behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              //     child: ListView.builder(
              //       itemCount: 5,
              //       itemBuilder: (BuildContext context, int index) {
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
              //           child: Container(
              //             height: 75,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(12),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.grey.withOpacity(0.6),
              //                   spreadRadius: 0,
              //                   blurRadius: 4,
              //                   offset: const Offset(0, 2),
              //                 ),
              //               ],
              //             ),
              //             child: Column(
              //               children: [
              //                 Row(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     crossAxisAlignment: CrossAxisAlignment.end,
              //                     children:[
              //                       Container(
              //                           width: AppSize.s99,
              //                           height: AppSize.s20,
              //                           decoration: BoxDecoration(
              //                             color:Color(0xFFFFE4E2),
              //                             borderRadius: BorderRadius.only(
              //                                 topRight:
              //                                 Radius.circular(12)),),
              //                           child: Center(
              //                             child: Text(
              //                                 'Potencial Duplicate',
              //                                 textAlign: TextAlign.center,
              //                                 style: CustomTextStylesCommon.commonStyle(
              //                                     color: ColorManager.mediumgrey,
              //                                     fontSize: FontSize.s11,
              //                                     fontWeight: FontWeight.w400)),
              //                           )),
              //                     ]
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Expanded(
              //                       flex: 2,
              //                       child: Padding(
              //                         padding: const EdgeInsets.only(left: 30.0),
              //                         child: Row(
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.circular(60),
              //                               child: SizedBox(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s50,
              //                                 child: Image.asset(
              //                                   'images/1.png', // Replace with your image path
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: AppSize.s12),
              //                             Column(
              //                               crossAxisAlignment: CrossAxisAlignment.start,
              //                               mainAxisAlignment: MainAxisAlignment.center,
              //                               children: [
              //                                 Text(
              //                                   "John smith",
              //                                   textAlign: TextAlign.center,
              //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                                     fontWeight: FontWeight.w700,
              //                                     color: ColorManager.mediumgrey,),
              //                                 ),
              //                                 SizedBox(height: AppSize.s4,),
              //                                 Text(
              //                                   "Refferal Date: 09/15/2024",
              //                                   textAlign: TextAlign.center,
              //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                                     fontWeight: FontWeight.w400,
              //                                     color: ColorManager.mediumgrey,),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
              //                     ),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "Refferal Source: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Sunshine Hospital",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(width: 15,),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "PCP: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Sam Johnson",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(
              //                       flex: 1,
              //                       child:  Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Text(
              //                             "Primary Diagnosis: ",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
              //                               fontWeight: FontWeight.w400,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                           SizedBox(height: AppSize.s4,),
              //                           Text(
              //                             "Migraine",
              //                             textAlign: TextAlign.center,
              //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                               fontWeight: FontWeight.w700,
              //                               color: ColorManager.mediumgrey,),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     SizedBox(width: 15,),
              //                     Expanded(
              //                       flex: 1,
              //                       child: Row(
              //                         children: [
              //                       Image.asset("images/logo.png",width: 100,),
              //                         ],
              //                       ),
              //                     ),
              //
              //                     Expanded(
              //                         flex: 3,
              //                         child: Row(
              //                           children: [
              //                             Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
              //                             SizedBox(width: AppSize.s15),
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.circular(60),
              //                               child: SizedBox(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s50,
              //                                 child: Image.asset(
              //                                   'images/1.png', // Replace with your image path
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: AppSize.s7),
              //                             Text(
              //                               "Sophia Scott",
              //                               textAlign: TextAlign.center,
              //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
              //                                 fontWeight: FontWeight.w700,
              //                                 color: ColorManager.mediumgrey,),
              //                             ),
              //                             SizedBox(width: AppSize.s7),
              //                             InkWell(
              //                               onTap: () async {
              //                                 try {
              //                                   widget.onEyeButtonPressed();
              //                                 }
              //                                 catch (e){
              //                                   print("Error: $e");
              //                                 }
              //                               },
              //                               child: Container(
              //                                 width: AppSize.s45,
              //                                 height: AppSize.s45,
              //                                 child: Image.asset(
              //                                   'images/eye.png',
              //                                   height: AppSize.s15,
              //                                   width: AppSize.s22,
              //                                   color: ColorManager.bluebottom,
              //                                 ),
              //                               ),
              //                             ), SizedBox(width: AppSize.s7),
              //                             IconButton(
              //                                 hoverColor: Colors.transparent,
              //                                 splashColor: Colors.transparent,
              //                                 highlightColor: Colors.transparent,
              //                                 onPressed: (){},
              //                                 icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
              //                             SizedBox(width: AppSize.s7),
              //                             IconButton(
              //                                 hoverColor: Colors.transparent,
              //                                 splashColor: Colors.transparent,
              //                                 highlightColor: Colors.transparent,
              //                                 onPressed: (){}, icon: Icon(Icons.more_vert,color: ColorManager.mediumgrey,))
              //                           ],
              //                         ))
              //
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ); },
              //
              //     ),
              //   ),
              // ),
            ],
          ),
        ),

      ],
    );
  }
}



















































/// old
// class RefferalMoveToIntakeScreen extends StatelessWidget {
//   final VoidCallback onEyeButtonPressed;
//   final VoidCallback onMergeDuplicatePressed;
//    RefferalMoveToIntakeScreen({super.key, required this.onEyeButtonPressed, required this.onMergeDuplicatePressed});
//
//   bool _isChecked = false;
//
//   List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];
//
//   final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();
//
//   @override
//   Widget build(BuildContext context) {
//     final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
//     final providerReferrals = Provider.of<SmIntegrationProviderManager>(context,listen: false);
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 60,right: 60, top: 10,bottom: 10),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomSearchFieldSM(
//                     width: 440,
//                     onPressed: (){},
//                   ),
//                   SizedBox(width: AppSize.s20,),
//                   IconButton(
//                       hoverColor: Colors.transparent,
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.transparent,
//                       onPressed:providerContact.toggleFilter,
//                       icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: 18,width: 16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
//                   ),
//                 ],
//               ),
//               SizedBox(height: AppSize.s20,),
//               Row(
//                 children: [
//                   Text("Received Date",
//                       style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
//                   SizedBox(width: AppSize.s15,),
//                   Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
//                   SizedBox(width: AppSize.s50,),
//                   Text("Hospitals",
//                       style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
//                   SizedBox(width: AppSize.s15,),
//                   Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
//                   SizedBox(width: AppSize.s50,),
//                   Text("PCP",
//                       style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12, fontWeight: FontWeight.w400)),
//                   SizedBox(width: AppSize.s15,),
//                   Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
//                 ],
//               ),
//               SizedBox(height: AppSize.s20,),
//               StreamBuilder<List<PatientModel>>(
//                 stream: _streamController.stream,
//                 builder: (context,snapshot) {
//                   getPatientReffrealsData(context: context, pageNo: 1, nbrOfRows: 10, isIntake: 'true', isArchived: 'false').then((data) {
//                     _streamController.add(data);
//                   }).catchError((error) {
//                     // Handle error
//                   });
//                   if(snapshot.connectionState == ConnectionState.waiting){
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 76),
//                       child: Center(
//                         child: CircularProgressIndicator(
//                           color: ColorManager.blueprime,
//                         ),
//                       ),
//                     );
//                   }
//                   if (snapshot.data!.isEmpty) {
//                     return Center(
//                         child: Padding(
//                           padding:const EdgeInsets.symmetric(vertical: 76),
//                           child: Text(
//                             AppStringSMModule.moveIntakeReferNoData,
//                             style: AllNoDataAvailable.customTextStyle(context),
//                           ),
//                         ));
//                   }
//                   if(snapshot.hasData){
//                     return Expanded(
//                       child: ScrollConfiguration(
//                         behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//                         child: ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 7,),
//                               child: Container(
//                                 height: 79,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12),topLeft: Radius.circular(12),topRight: Radius.circular(12)),
//                                   border: Border(
//                                     bottom: BorderSide(
//                                       color: Colors.grey.shade300,
//                                       width: 3,
//                                     ),
//                                     left: BorderSide(
//                                       color: Colors.grey.shade300,
//                                       width: 1,
//                                     ),
//                                     right: BorderSide(
//                                       color: Colors.grey.shade300,
//                                       width: 1,
//                                     ),
//                                   ),
//                                 ),
//                                 child:
//                                 Column(
//                                   children: [
//                                     Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         crossAxisAlignment: CrossAxisAlignment.end,
//                                         children:[
//                                           Container(
//                                               width: AppSize.s105,
//                                               height: AppSize.s16,
//                                               decoration: BoxDecoration(
//                                                 color:Color(0xFFFFE4E2),
//                                                 borderRadius: BorderRadius.only(
//                                                     topRight:
//                                                     Radius.circular(12)),),
//                                               child: Center(
//                                                 child: Text(
//                                                     'Potential Duplicate',
//                                                     textAlign: TextAlign.center,
//                                                     style: CustomTextStylesCommon.commonStyle(
//                                                         color: ColorManager.mediumgrey,
//                                                         fontSize: FontSize.s11,
//                                                         fontWeight: FontWeight.w400)),
//                                               )),
//                                         ]
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p25),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             flex: 4,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     ClipOval(
//                                                       child: snapshot.data![index].ptImgUrl == 'imgurl' ||
//                                                           snapshot.data![index].ptImgUrl == null
//                                                           ? CircleAvatar(
//                                                         radius: 30,
//                                                         backgroundColor: Colors.transparent,
//                                                         child: Image.asset("images/profilepic.png"),
//                                                       )
//                                                           : Image.network(
//                                                         snapshot.data![index].ptImgUrl,
//                                                         loadingBuilder: (context, child, loadingProgress) {
//                                                           if (loadingProgress == null) {
//                                                             return child;
//                                                           } else {
//                                                             return Center(
//                                                               child: CircularProgressIndicator(
//                                                                 value: loadingProgress.expectedTotalBytes != null
//                                                                     ? loadingProgress.cumulativeBytesLoaded /
//                                                                     (loadingProgress.expectedTotalBytes ?? 1)
//                                                                     : null,
//                                                               ),
//                                                             );
//                                                           }
//                                                         },
//                                                         errorBuilder: (context, error, stackTrace) {
//                                                           return CircleAvatar(
//                                                             radius: 25,
//                                                             backgroundColor: Colors.transparent,
//                                                             child: Image.asset("images/profilepic.png"),
//                                                           );
//                                                         },
//                                                         fit: BoxFit.cover,
//                                                         height: 43,
//                                                         width: 43,
//                                                       ),
//                                                     ),
//                                                     SizedBox(width: AppSize.s15),
//                                                     Column(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       mainAxisAlignment: MainAxisAlignment.center,
//                                                       children: [
//                                                         Text(
//                                                     "${snapshot.data![index].ptFirstName} ${snapshot.data![index].ptLastName}",
//                                                           textAlign: TextAlign.center,
//                                                           style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                             fontWeight: FontWeight.w700,
//                                                             color: ColorManager.mediumgrey,),
//                                                         ),
//                                                         SizedBox(height: AppSize.s5,),
//                                                         Text(
//                                                           "Referral Date : ${snapshot.data![index].ptRefferalDate}",
//                                                           textAlign: TextAlign.center,
//                                                           style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                             fontWeight: FontWeight.w400,
//                                                             color: ColorManager.mediumgrey,),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                                 //SizedBox(width: AppSize.s40),
//                                                 Text(
//                                                   "Ch #1",
//                                                   style: DocDefineTableData.customTextStyle(context),
//                                                 ),
//                                                 Padding(
//                                                   padding: const EdgeInsets.only(right: 70.0),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                     children: [
//                                                       Text(
//                                                         "Referral Source: ",
//                                                         textAlign: TextAlign.center,
//                                                         style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                           fontWeight: FontWeight.w400,
//                                                           color: ColorManager.textBlack,),
//                                                       ),
//                                                       SizedBox(height: AppSize.s4,),
//                                                       Text(
//                                                         snapshot.data![index].referralSource.sourceName,
//                                                         textAlign: TextAlign.center,
//                                                         style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                           fontWeight: FontWeight.w700,
//                                                           color: ColorManager.mediumgrey,),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 1,
//                                             child:  Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   "PCP: ",
//                                                   textAlign: TextAlign.center,
//                                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: ColorManager.mediumgrey,),
//                                                 ),
//                                                 SizedBox(height: AppSize.s4,),
//                                                 Text(
//                                                   "${snapshot.data![index].pcp.phyFirstName} ${snapshot.data![index].pcp.phyLastName}",
//                                                   textAlign: TextAlign.center,
//                                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                     fontWeight: FontWeight.w700,
//                                                     color: ColorManager.mediumgrey,),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 1,
//                                             child:  Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   "Primary Diagnosis: ",
//                                                   textAlign: TextAlign.center,
//                                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: ColorManager.mediumgrey,),
//                                                 ),
//                                                 SizedBox(height: AppSize.s4,),
//                                                 Text(
//                                                   snapshot.data![index].primaryDiagnosis.dgnName,
//                                                   textAlign: TextAlign.center,
//                                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                                     fontWeight: FontWeight.w700,
//                                                     color: ColorManager.mediumgrey,),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(width: 20,),
//                                           Expanded(
//                                             flex: 1,
//                                             child: Row(
//                                               children: [
//                                                 Image.network(
//                                                   snapshot.data![index].referralSource.referralSourceImgUrl,
//                                                   loadingBuilder: (context, child, loadingProgress) {
//                                                     if (loadingProgress == null) {
//                                                       return child;
//                                                     } else {
//                                                       return Center(
//                                                         child: CircularProgressIndicator(
//                                                           value: loadingProgress.expectedTotalBytes != null
//                                                               ? loadingProgress.cumulativeBytesLoaded /
//                                                               (loadingProgress.expectedTotalBytes ?? 1)
//                                                               : null,
//                                                         ),
//                                                       );
//                                                     }
//                                                   },
//                                                   errorBuilder: (context, error, stackTrace) {
//                                                     return Image.asset('images/logo_login.png',width: 110,);
//                                                   },
//                                                   width: 110,
//                                                 ),
//                                                 // Text("Manual",style: DocDefineTableData.customTextStyle(context),),
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                               flex: 3,
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   SizedBox(width: AppSize.s10),
//                                                   Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
//                                                   // SizedBox(width: AppSize.s28),
//                                                   Row(
//                                                     children: [
//                                                       ClipOval(
//                                                         child: snapshot.data![index].ptImgUrl == 'imgurl' ||
//                                                             snapshot.data![index].ptImgUrl == null
//                                                             ? CircleAvatar(
//                                                           radius: 30,
//                                                           backgroundColor: Colors.transparent,
//                                                           child: Image.asset("images/profilepic.png"),
//                                                         )
//                                                             : Image.network(
//                                                           snapshot.data![index].marketer.imgurl,
//                                                           loadingBuilder: (context, child, loadingProgress) {
//                                                             if (loadingProgress == null) {
//                                                               return child;
//                                                             } else {
//                                                               return Center(
//                                                                 child: CircularProgressIndicator(
//                                                                   value: loadingProgress.expectedTotalBytes != null
//                                                                       ? loadingProgress.cumulativeBytesLoaded /
//                                                                       (loadingProgress.expectedTotalBytes ?? 1)
//                                                                       : null,
//                                                                 ),
//                                                               );
//                                                             }
//                                                           },
//                                                           errorBuilder: (context, error, stackTrace) {
//                                                             return CircleAvatar(
//                                                               radius: 25,
//                                                               backgroundColor: Colors.transparent,
//                                                               child: Image.asset("images/profilepic.png"),
//                                                             );
//                                                           },
//                                                           fit: BoxFit.cover,
//                                                           height: 45,
//                                                           width: 41,
//                                                         ),
//                                                       ),
//                                                       SizedBox(width: AppSize.s15),
//                                                       Text(
//                                                         "${snapshot.data![index].marketer.firstName} ${snapshot.data![index].marketer.lastName}",
//                                                         textAlign: TextAlign.center,
//                                                         style: DocDefineTableData.customTextStyle(context),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   // SizedBox(width: AppSize.s20),
//                                                   InkWell(
//                                                     onTap: () async {
//                                                       try {
//                                                         onEyeButtonPressed();
//                                                         providerReferrals.passPatientId(patientIdNo: snapshot.data![index].ptId);
//                                                       }
//                                                       catch (e){
//                                                         print("Error: $e");
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       width: AppSize.s20,
//                                                       height: AppSize.s25,
//                                                       child: SvgPicture.asset(
//                                                         'images/sm/sm_refferal/eye.svg', // make sure your file is in assets and listed in pubspec.yaml
//                                                         height: AppSize.s15,
//                                                         width: AppSize.s22,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   //  SizedBox(width: AppSize.s10),
//                                                   IconButton(
//                                                       hoverColor: Colors.transparent,
//                                                       splashColor: Colors.transparent,
//                                                       highlightColor: Colors.transparent,
//                                                       onPressed: (){},
//                                                       icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
//                                                   // SizedBox(width: AppSize.s2),
//                                                   PopupMenuButton<String>(
//                                                     tooltip: '',
//                                                     splashRadius: 0,
//                                                     color: Colors.white,
//                                                     offset: Offset(25, 42),
//                                                     itemBuilder: (BuildContext context) => [
//                                                       PopupMenuItem<String>(
//                                                         value: 'Merge Duplicate',
//                                                         padding: EdgeInsets.zero, // Remove padding
//                                                         child: InkWell(
//                                                           splashColor: Colors.transparent,
//                                                           highlightColor: Colors.transparent,
//                                                           hoverColor: Colors.transparent,
//                                                           onTap: () {
//                                                             Navigator.pop(context); // Important: manually close the popup
//                                                             onMergeDuplicatePressed();
//                                                           },
//                                                           child: Container(
//                                                             alignment: Alignment.centerLeft,
//                                                             padding: EdgeInsets.only(left: 12, top: 5),
//                                                             width: 100,
//                                                             child: Text(
//                                                               'Merge Duplicate',
//                                                               style: CustomTextStylesCommon.commonStyle(
//                                                                 fontWeight: FontWeight.w700,
//                                                                 fontSize: FontSize.s12,
//                                                                 color: ColorManager.mediumgrey,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       PopupMenuItem<String>(
//                                                         value: 'Archived',
//                                                         padding: EdgeInsets.zero,
//                                                         child: InkWell(
//                                                           splashColor: Colors.transparent,
//                                                           highlightColor: Colors.transparent,
//                                                           hoverColor: Colors.transparent,
//                                                           onTap: () {
//                                                             Navigator.pop(context);
//                                                             print('Option 2 Selected');
//                                                           },
//                                                           child: Container(
//                                                             alignment: Alignment.centerLeft,
//                                                             padding: EdgeInsets.only(left: 12, top: 5),
//                                                             width: 100,
//                                                             child: Text(
//                                                               'Archived',
//                                                               style: CustomTextStylesCommon.commonStyle(
//                                                                 fontWeight: FontWeight.w700,
//                                                                 fontSize: FontSize.s12,
//                                                                 color: ColorManager.mediumgrey,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                     child: Icon(Icons.more_vert, color: ColorManager.mediumgrey),
//                                                   ),
//                                                   // SizedBox(width: AppSize.s10),
//                                                 ],
//                                               ))
//                                         ],
//                                       ),
//                                     ),
//                                     Container(height: AppSize.s8,),
//                                   ],
//                                 ),
//                               ),
//                             ); },
//
//                         ),
//                       ),
//                     );
//                   }else{
//                     return SizedBox();
//                   }
//
//                 }
//               ),
//               // Expanded(
//               //   child: ScrollConfiguration(
//               //     behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//               //     child: ListView.builder(
//               //       itemCount: 5,
//               //       itemBuilder: (BuildContext context, int index) {
//               //         return Padding(
//               //           padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
//               //           child: Container(
//               //             height: 75,
//               //             decoration: BoxDecoration(
//               //               color: Colors.white,
//               //               borderRadius: BorderRadius.circular(12),
//               //               boxShadow: [
//               //                 BoxShadow(
//               //                   color: Colors.grey.withOpacity(0.6),
//               //                   spreadRadius: 0,
//               //                   blurRadius: 4,
//               //                   offset: const Offset(0, 2),
//               //                 ),
//               //               ],
//               //             ),
//               //             child: Column(
//               //               children: [
//               //                 Row(
//               //                     mainAxisAlignment: MainAxisAlignment.end,
//               //                     crossAxisAlignment: CrossAxisAlignment.end,
//               //                     children:[
//               //                       Container(
//               //                           width: AppSize.s99,
//               //                           height: AppSize.s20,
//               //                           decoration: BoxDecoration(
//               //                             color:Color(0xFFFFE4E2),
//               //                             borderRadius: BorderRadius.only(
//               //                                 topRight:
//               //                                 Radius.circular(12)),),
//               //                           child: Center(
//               //                             child: Text(
//               //                                 'Potencial Duplicate',
//               //                                 textAlign: TextAlign.center,
//               //                                 style: CustomTextStylesCommon.commonStyle(
//               //                                     color: ColorManager.mediumgrey,
//               //                                     fontSize: FontSize.s11,
//               //                                     fontWeight: FontWeight.w400)),
//               //                           )),
//               //                     ]
//               //                 ),
//               //                 Row(
//               //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //                   children: [
//               //                     Expanded(
//               //                       flex: 2,
//               //                       child: Padding(
//               //                         padding: const EdgeInsets.only(left: 30.0),
//               //                         child: Row(
//               //                           children: [
//               //                             ClipRRect(
//               //                               borderRadius: BorderRadius.circular(60),
//               //                               child: SizedBox(
//               //                                 width: AppSize.s45,
//               //                                 height: AppSize.s50,
//               //                                 child: Image.asset(
//               //                                   'images/1.png', // Replace with your image path
//               //                                   fit: BoxFit.cover,
//               //                                 ),
//               //                               ),
//               //                             ),
//               //                             SizedBox(width: AppSize.s12),
//               //                             Column(
//               //                               crossAxisAlignment: CrossAxisAlignment.start,
//               //                               mainAxisAlignment: MainAxisAlignment.center,
//               //                               children: [
//               //                                 Text(
//               //                                   "John smith",
//               //                                   textAlign: TextAlign.center,
//               //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//               //                                     fontWeight: FontWeight.w700,
//               //                                     color: ColorManager.mediumgrey,),
//               //                                 ),
//               //                                 SizedBox(height: AppSize.s4,),
//               //                                 Text(
//               //                                   "Refferal Date: 09/15/2024",
//               //                                   textAlign: TextAlign.center,
//               //                                   style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
//               //                                     fontWeight: FontWeight.w400,
//               //                                     color: ColorManager.mediumgrey,),
//               //                                 ),
//               //                               ],
//               //                             ),
//               //                           ],
//               //                         ),
//               //                       ),
//               //                     ),
//               //                     Expanded(
//               //                       child: Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
//               //                     ),
//               //                     Expanded(
//               //                       flex: 1,
//               //                       child:  Column(
//               //                         crossAxisAlignment: CrossAxisAlignment.start,
//               //                         mainAxisAlignment: MainAxisAlignment.center,
//               //                         children: [
//               //                           Text(
//               //                             "Refferal Source: ",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
//               //                               fontWeight: FontWeight.w400,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                           SizedBox(height: AppSize.s4,),
//               //                           Text(
//               //                             "Sunshine Hospital",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//               //                               fontWeight: FontWeight.w700,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                         ],
//               //                       ),
//               //                     ),
//               //                     SizedBox(width: 15,),
//               //                     Expanded(
//               //                       flex: 1,
//               //                       child:  Column(
//               //                         crossAxisAlignment: CrossAxisAlignment.start,
//               //                         mainAxisAlignment: MainAxisAlignment.center,
//               //                         children: [
//               //                           Text(
//               //                             "PCP: ",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
//               //                               fontWeight: FontWeight.w400,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                           SizedBox(height: AppSize.s4,),
//               //                           Text(
//               //                             "Sam Johnson",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//               //                               fontWeight: FontWeight.w700,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                         ],
//               //                       ),
//               //                     ),
//               //                     Expanded(
//               //                       flex: 1,
//               //                       child:  Column(
//               //                         crossAxisAlignment: CrossAxisAlignment.start,
//               //                         mainAxisAlignment: MainAxisAlignment.center,
//               //                         children: [
//               //                           Text(
//               //                             "Primary Diagnosis: ",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
//               //                               fontWeight: FontWeight.w400,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                           SizedBox(height: AppSize.s4,),
//               //                           Text(
//               //                             "Migraine",
//               //                             textAlign: TextAlign.center,
//               //                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//               //                               fontWeight: FontWeight.w700,
//               //                               color: ColorManager.mediumgrey,),
//               //                           ),
//               //                         ],
//               //                       ),
//               //                     ),
//               //                     SizedBox(width: 15,),
//               //                     Expanded(
//               //                       flex: 1,
//               //                       child: Row(
//               //                         children: [
//               //                       Image.asset("images/logo.png",width: 100,),
//               //                         ],
//               //                       ),
//               //                     ),
//               //
//               //                     Expanded(
//               //                         flex: 3,
//               //                         child: Row(
//               //                           children: [
//               //                             Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
//               //                             SizedBox(width: AppSize.s15),
//               //                             ClipRRect(
//               //                               borderRadius: BorderRadius.circular(60),
//               //                               child: SizedBox(
//               //                                 width: AppSize.s45,
//               //                                 height: AppSize.s50,
//               //                                 child: Image.asset(
//               //                                   'images/1.png', // Replace with your image path
//               //                                   fit: BoxFit.cover,
//               //                                 ),
//               //                               ),
//               //                             ),
//               //                             SizedBox(width: AppSize.s7),
//               //                             Text(
//               //                               "Sophia Scott",
//               //                               textAlign: TextAlign.center,
//               //                               style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//               //                                 fontWeight: FontWeight.w700,
//               //                                 color: ColorManager.mediumgrey,),
//               //                             ),
//               //                             SizedBox(width: AppSize.s7),
//               //                             InkWell(
//               //                               onTap: () async {
//               //                                 try {
//               //                                   widget.onEyeButtonPressed();
//               //                                 }
//               //                                 catch (e){
//               //                                   print("Error: $e");
//               //                                 }
//               //                               },
//               //                               child: Container(
//               //                                 width: AppSize.s45,
//               //                                 height: AppSize.s45,
//               //                                 child: Image.asset(
//               //                                   'images/eye.png',
//               //                                   height: AppSize.s15,
//               //                                   width: AppSize.s22,
//               //                                   color: ColorManager.bluebottom,
//               //                                 ),
//               //                               ),
//               //                             ), SizedBox(width: AppSize.s7),
//               //                             IconButton(
//               //                                 hoverColor: Colors.transparent,
//               //                                 splashColor: Colors.transparent,
//               //                                 highlightColor: Colors.transparent,
//               //                                 onPressed: (){},
//               //                                 icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
//               //                             SizedBox(width: AppSize.s7),
//               //                             IconButton(
//               //                                 hoverColor: Colors.transparent,
//               //                                 splashColor: Colors.transparent,
//               //                                 highlightColor: Colors.transparent,
//               //                                 onPressed: (){}, icon: Icon(Icons.more_vert,color: ColorManager.mediumgrey,))
//               //                           ],
//               //                         ))
//               //
//               //                   ],
//               //                 ),
//               //               ],
//               //             ),
//               //           ),
//               //         ); },
//               //
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
// }
