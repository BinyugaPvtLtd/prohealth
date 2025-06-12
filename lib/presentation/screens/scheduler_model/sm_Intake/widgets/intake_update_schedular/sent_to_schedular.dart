import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_update_schedular/information_update.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../textfield_dropdown_constant/chatbotContainer.dart';

class SentToSchedularScreen extends StatefulWidget {
  SentToSchedularScreen({super.key});

  @override
  State<SentToSchedularScreen> createState() => _SentToSchedularScreenState();
}

class _SentToSchedularScreenState extends State<SentToSchedularScreen> {

  bool _isChatbotVisible = false;

  void _toggleChatbotVisibility() {
    setState(() {
      _isChatbotVisible = !_isChatbotVisible;
      //notifyListeners();
    });
  }

  int currentPage = 1;

  final int itemsPerPage = 10;

  final int totalPages = 5;

  final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();
  TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            ///button
            Row(
              children: [
                CustomSearchFieldSM(
                  searchController: _searchController,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
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
            SizedBox(
              height: AppSize.s20,
            ),
            // Wrap(
            //   children: [
            //     Text(
            //       "Referral Received",
            //       style: TextStyle(
            //           color: ColorManager.textBlack, fontSize: FontSize.s12),
            //     ),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Potential DC Date",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Referral Source",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Demographics",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Documentation",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Insurance",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Physician Info",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Orders",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //     SizedBox(
            //       width: AppSize.s20,
            //     ),
            //     Text("Initial Contact",
            //         style: TextStyle(
            //             color: ColorManager.textBlack, fontSize: FontSize.s12)),
            //     SizedBox(
            //       width: AppSize.s10,
            //     ),
            //     Image.asset(
            //       "images/sm/sm_refferal/refferal_arrow.png",
            //       height: IconSize.I14,
            //       width: IconSize.I16,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: AppSize.s30,
            ),
            Expanded(
                child:  StreamBuilder<List<PatientModel>>(
                    stream:  _streamController.stream,
                    builder: (context ,snapshot) {
                      getPatientReffrealsData(context: context,
                          pageNo: 1,
                          nbrOfRows: 20,
                          isIntake: 'true',
                          isArchived: 'false',
                          isScheduled: 'true',
                          isNotAdmit: 'true',
                          searchName: _searchController.text.isEmpty
                              ? 'all'
                              : _searchController.text,
                          marketerId: providerContact.marketerId,
                          referralSourceId: providerContact.referralSourceId,
                          pcpId: providerContact.pcpId).then((data) {
                        _streamController.add(data);
                      }).catchError((error) {
                        // Handle error
                      });
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                              padding: const EdgeInsets.symmetric(vertical: 76),
                              child: Text(
                                AppStringSMModule.pendingNoData,
                                style: AllNoDataAvailable.customTextStyle(
                                    context),
                              ),
                            ));
                      }
                      if (snapshot.hasData) {
                        return  ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:  snapshot.data!.length,
                itemBuilder: (context, index) {
                  //int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                  // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                  // EmployeeDocumentModal employeedoc = paginatedData[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: IntakeContainer(
                      child: Container(
                       // padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                        decoration: BoxDecoration(
                          border:  Border(
                            left: BorderSide(
                              color: Color(0xFFC30909),
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
                            SizedBox(height: AppSize.s16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: ClipOval(
                                      child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                          snapshot.data![index].ptImgUrl == null
                                          ? CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset("images/profilepic.png"),
                                      )
                                          : Image.network(
                                        snapshot.data![index].ptImgUrl!,
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
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${snapshot.data![index].ptFirstName} ${snapshot.data![index].ptLastName}",
                                          textAlign: TextAlign.center,
                                          style:
                                              CustomTextStylesCommon.commonStyle(
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.mediumgrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Intake Date: ${snapshot.data![index].ptRefferalDate}",
                                          textAlign: TextAlign.center,
                                          style:
                                              CustomTextStylesCommon.commonStyle(
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Potential DC Date :",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(
                                                  fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.mediumgrey,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                " 11/26/2024",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon
                                                    .commonStyle(
                                                  fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child:  Center(
                                      child:Text(snapshot.data![index].referralSource.sourceName,
                                        textAlign: TextAlign.start,
                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.textBlack,),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: ColorManager.bluebottom,
                                          size: IconSize.I20,
                                        ),
                                       SizedBox(width: 10,),
                                        Flexible(
                                          child: Text(
                                            snapshot.data![index].marketer.address,
                                            //"132 My Street,Kingston, New York 12401",
                                           // overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: CustomTextStylesCommon.commonStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.mediumgrey,
                                            ),
                                          ),
                                        ),
                                       // SizedBox(width: AppSize.s35),

                                      ],
                                    ),
                                  ),
                                       Padding(
                                         padding: const EdgeInsets.only(right: 5),
                                         child: Stack(
                                           children: [
                                             Container(
                                               width: AppSize.s60, // Larger than image
                                               height: AppSize.s60, // Slightly larger height
                                               alignment: Alignment.center,
                                               decoration: BoxDecoration(
                                                 // color: Colors.grey[200], // Optional background color
                                                 borderRadius: BorderRadius.circular(60),
                                               ),
                                               child:  ClipOval(
                                                 child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                                     snapshot.data![index].ptImgUrl == null
                                                     ? CircleAvatar(
                                                   radius: 23,
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
                                             ),

                                             Positioned(
                                               left: 40,
                                               bottom: 5,
                                               child: Row(
                                                 children: snapshot.data![index].disciplines.map((discipline) {
                                                   return Container(
                                                     margin: EdgeInsets.only(right: 4),
                                                     width: 19,
                                                     height: 19,
                                                     decoration: BoxDecoration(
                                                       color: HexColor.fromHex(discipline.color),       //   hexToColor(discipline.color ?? '#CCCCCC'),
                                                       borderRadius: BorderRadius.circular(3),
                                                     ),
                                                     child: Center(
                                                       child: Text(
                                                         discipline.abbreviation ?? '',
                                                         style: TextStyle(
                                                           fontWeight: FontWeight.w400,
                                                           fontSize: 10,
                                                           color: ColorManager.white,
                                                           decoration: TextDecoration.none,
                                                         ),
                                                       ),
                                                     ),
                                                   );
                                                 }).toList(),
                                               ),
                                             ),


                                             // Positioned(
                                             //   left: 40, // Adjusted to fit new container size
                                             //   bottom: 5,
                                             //   child: Container(
                                             //     width: 19,
                                             //     height: 19,
                                             //     decoration: BoxDecoration(
                                             //       color: Color(0xFF527FB9),
                                             //       borderRadius: BorderRadius.circular(3),
                                             //     ),
                                             //     child: Center(
                                             //       child: Text(
                                             //         "ST",
                                             //         style: TextStyle(
                                             //           fontWeight: FontWeight.w400,
                                             //           fontSize: 10,
                                             //           color: ColorManager.white,
                                             //           decoration: TextDecoration.none,
                                             //         ),
                                             //       ),
                                             //     ),
                                             //   ),
                                             // ),
                                           ],
                                         ),
                                       ),

                                       Expanded(
                                         flex: 1,
                                         child: Text(
                                           "${snapshot.data![index].marketer.firstName} ${snapshot.data![index].marketer.lastName}",
                                           style: CustomTextStylesCommon.commonStyle(
                                             fontSize: FontSize.s12,
                                             fontWeight: FontWeight.w400,
                                             color: ColorManager.textBlack,
                                           ),
                                         ),
                                       ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Container(
                                         // color: Color(0xFFE2F2F8),4
                                          margin: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFE2F2F8),
                                              borderRadius:
                                              BorderRadius.circular(5)),

                                          width: 22,
                                          height: 20,
                                          child: Center(
                                            child: Text(
                                              "A",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: FontSize.s12,
                                                color: Color(0xFF1696C8),
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Scheduled",
                                          textAlign: TextAlign.start,
                                          style: CustomTextStylesCommon.commonStyle(
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.Violet,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "SOC Completed",
                                          textAlign: TextAlign.start,
                                          style: CustomTextStylesCommon.commonStyle(
                                            fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.greenDark,
                                          ),
                                        ),
                                      ),
                                      // ///dont delete these r conditional text
                                      // // Text(
                                      // //   "SMissed on 13/05/2022",
                                      // //   textAlign: TextAlign.start,
                                      // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                      // //     fontWeight: FontWeight.w500,
                                      // //     color: ColorManager.tangerine,),
                                      // // ),
                                      // // Text(
                                      // //   "Rescheduled on 15/08/2022",
                                      // //   textAlign: TextAlign.start,
                                      // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                      // //     fontWeight: FontWeight.w500,
                                      // //     color: ColorManager.mediumgrey,),
                                      // // ),
                                      // // Text(
                                      // //   "SOC Pending",
                                      // //   textAlign: TextAlign.start,
                                      // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                      // //     fontWeight: FontWeight.w500,
                                      // //     color: ColorManager.EMbrightred,),
                                      // // ),
                                      //

                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: _toggleChatbotVisibility,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 3,),
                                          Image.asset(
                                              "images/sm/contact_icon.png",
                                              height: 25),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Contact",
                                            style: TextStyle(
                                              fontSize: FontSize.s11,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF2F6D8A),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                            SizedBox(height: AppSize.s5),
                          ],
                        ),
                      ),
                            SizedBox(height: AppSize.s5),
                   ] ),
                  )));
                },
              ),
            );
  }
  else{
  return const SizedBox();
  }
}
)
            ),

            ///pagination code dont delete
            // PaginationControlsWidget(
            //   currentPage: currentPage,
            //   items: [],//snapshot.data!,
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
            // ),
          ],
        ),
      ),
      if (_isChatbotVisible)
        Positioned.fill(
          child: GestureDetector(
            onTap: _toggleChatbotVisibility, // Close popup on tapping outside
            child: Container(color: Colors.transparent),
          ),
        ),
      AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          bottom: _isChatbotVisible ? 0 : -500, // Slide in from bottom-right
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 460,
            width: 501,
            child: ChatBotContainer(
              onClose: _toggleChatbotVisibility,
            ),
          )),
    ]);
  }
}

//
//
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 55.0),
// child: Column(
// children: [
// ///button
// Row(
// //crossAxisAlignment: CrossAxisAlignment.end,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// width: 320,
// height: 35,
// decoration: BoxDecoration(
// color: Colors.grey[100],
// borderRadius: BorderRadius.circular(8.0),
// border: Border.all(color: ColorManager.mediumgrey.withOpacity(0.1),width: 1)
// // boxShadow: [
// //   BoxShadow(
// //     color: Colors.black26,
// //     blurRadius: 5.0,
// //   ),
// // ],
// ),
// child: TextField(
// controller: _searchController,
// textInputAction: TextInputAction.search,
// //onSubmitted: (value) => _performSearch(),
// decoration: InputDecoration(
// hintText: "Search",
// hintStyle: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,color: ColorManager.mediumgrey,fontWeight: FontWeight.w400),
// prefixIcon: Icon(Icons.search),
// border: InputBorder.none,
// contentPadding: EdgeInsets.only(left: 15.0, right: 15,bottom: 5),
// ),
// ),
// ),
// Row(
// children: [
// CustomDropdownTextField(
// width: 140,
// isAstric:false,
// // Adjust headText based on depId
// initialValue: 'Employee Type',
// headText: "", // Default fallback if depId doesn't match any of the expected values
// items: ['Employee 1','Employee 2','Employee 3'],
// onChanged: (newValue) {
// // for (var a in snapshot.data!) {
// //   if (a.empType == newValue) {
// //     clinicialName = a.empType!;
// //     clinicalId = a.employeeTypesId!;
// //     print("Dept ID'''''' ${clinicalId}");
// //     print("';';';''''''''Dept ID ${clinicialName}");
// //     // Do something with docType
// //   }
// // }
// },
// ),
// SizedBox(width: 20,),
// CustomDropdownTextField(
// width:140,
// isAstric:false,
// // Adjust headText based on depId
// initialValue: 'Clinician Type',
// headText: "", // Default fallback if depId doesn't match any of the expected values
// items: ['Clinical 1','Clinical 2','Clinical 3'],
// onChanged: (newValue) {
// // for (var a in snapshot.data!) {
// //   if (a.empType == newValue) {
// //     clinicialName = a.empType!;
// //     clinicalId = a.employeeTypesId!;
// //     print("Dept ID'''''' ${clinicalId}");
// //     print("';';';''''''''Dept ID ${clinicialName}");
// //     // Do something with docType
// //   }
// // }
// },
// ),
// ],
// ),
// ],
// ).paddingOnly(bottom: 10),
// Expanded(
// child: ScrollConfiguration(
// behavior: ScrollBehavior().copyWith(scrollbars: false),
// child: ListView.builder(
// scrollDirection: Axis.vertical,
// itemCount: 15,
// itemBuilder: (context, index) {
// //int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
// // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
// // EmployeeDocumentModal employeedoc = paginatedData[index];
// return Column(
// children: [
// SizedBox(height: AppSize.s5),
// Container(
// height: AppSize.s88,
// padding: EdgeInsets.symmetric(horizontal: AppPadding.p40),
// margin: EdgeInsets.symmetric(horizontal: AppMargin.m2),
// decoration: BoxDecoration(
// color: ColorManager.white,
// borderRadius: BorderRadius.circular(12),
// boxShadow: [
// BoxShadow(
// color: ColorManager.black.withOpacity(0.2),
// spreadRadius: 0,
// blurRadius: 2,
// offset: Offset(0, 2),
// ),
// ]
// ),
// child: Row(
// children: [
// Expanded(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 5.0),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SizedBox(
// width: 50,
// height: 50,
// child: Image.asset(
// 'images/hr_dashboard/man.png', // Replace with your image path
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// SizedBox(width: 10,),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "John smith",
// textAlign: TextAlign.center,
// style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
// fontWeight: FontWeight.w700,
// color: ColorManager.mediumgrey,),
// ),
// Text(
// "Intake Date: 09/15/2024",
// textAlign: TextAlign.center,
// style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
// fontWeight: FontWeight.w600,
// color: ColorManager.mediumgrey,),
// ),
// ],
// ),
// ],
// ),
// ),
// SizedBox(width: 20,),
// Expanded(
// flex: 2,
// child: Row(
// children: [
// Icon(Icons.location_on_outlined,size: IconSize.I18,color: ColorManager.bluebottom,),
// // Image.asset(
// //   "images/sm/location.png",
// //   height: 25,width: 26,fit: BoxFit.fill,
// // ),
// SizedBox(width: 25,),
// Text(
// "Tufts International Center, 20 Sawyer Ave,\nMedford MA 02155 ",
// textAlign: TextAlign.start,
// style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
// fontWeight: FontWeight.w400,
// color: ColorManager.textBlack,),
// ),
// ],
// ),
// ),
// Expanded(
// child: Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// color: Color(0xFFFEBD4D),
// width: 19,
// height: 19,
// child: Center(
// child: Text("OT",style: TextStyle(
// // fontWeight: FontWeight.w600,
// //     fontSize: FontSize.s13,
// color: ColorManager.white,
// decoration: TextDecoration.none,
// ),),
// ),
// ),
// )
// ],
// ),
// ),
// Expanded(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.symmetric(vertical: 5.0),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(50),
// child: SizedBox(
// width: 50,
// height: 50,
// child: Image.asset(
// 'images/hr_dashboard/man.png', // Replace with your image path
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// SizedBox(width: 10,),
// Text(
// "Kia",
// textAlign: TextAlign.center,
// style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
// fontWeight: FontWeight.w400,
// color: ColorManager.textBlack,),
// ),
// ],
// ),
// ),
//
// Expanded(
// child: Row(
// children: [
// Text(
// "Scheduled",
// textAlign: TextAlign.start,
// style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
// fontWeight: FontWeight.w500,
// color: ColorManager.Violet,),
// ),
// SizedBox(width: 25,),
// Text(
// "SOC Completed",
// textAlign: TextAlign.start,
// style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
// fontWeight: FontWeight.w500,
// color: ColorManager.greenDark,),
// ),
// // ///dont delete these r conditional text
// // // Text(
// // //   "SMissed on 13/05/2022",
// // //   textAlign: TextAlign.start,
// // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
// // //     fontWeight: FontWeight.w500,
// // //     color: ColorManager.tangerine,),
// // // ),
// // // Text(
// // //   "Rescheduled on 15/08/2022",
// // //   textAlign: TextAlign.start,
// // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
// // //     fontWeight: FontWeight.w500,
// // //     color: ColorManager.mediumgrey,),
// // // ),
// // // Text(
// // //   "SOC Pending",
// // //   textAlign: TextAlign.start,
// // //   style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
// // //     fontWeight: FontWeight.w500,
// // //     color: ColorManager.EMbrightred,),
// // // ),
// //
// ],
// ),
// ),
//
//
// Padding(
// padding: const EdgeInsets.only(right: 40.0),
// child: SvgPicture.asset("images/sm/contact_s.svg",height: 30,width: 20,fit: BoxFit.fill,),
// ),
// ],),
// ),
// SizedBox(height: AppSize.s5),
// ],
// );
// },
// ),
// )),
// ///pagination code dont delete
// // PaginationControlsWidget(
// //   currentPage: currentPage,
// //   items: [], //snapshot.data!,
// //   itemsPerPage: itemsPerPage,
// //   onPreviousPagePressed: () {
// //     if (currentPage > 1) {
// //       currentPage--;
// //     }
// //   },
// //   onPageNumberPressed: (pageNumber) {
// //     currentPage = pageNumber;
// //   },
// //   onNextPagePressed: () {
// //     if (currentPage < totalPages) {
// //       currentPage++;
// //     }
// //   },
// // ),
// ],
// ),
// );
