import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/intake/all_intake_manager.dart';
import '../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';
import '../../../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../../widgets/app_clickable_widget.dart';
import '../../../../em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../textfield_dropdown_constant/chatbotContainer.dart';

class InformationUpdateProvider extends ChangeNotifier{
  final VoidCallback onUpdateButtonPressed;
  final void Function(int patientId) onPatientIdReceived;

  InformationUpdateProvider({required this.onUpdateButtonPressed, required this.onPatientIdReceived});


  void handlePatientId(int patientId) {
    /// Pass the patientId back to the parent widget
    onPatientIdReceived(patientId);
  }

  bool _isChatbotVisible = false;

  void _toggleChatbotVisibility() {
   // setState(() {
      _isChatbotVisible = !_isChatbotVisible;
      notifyListeners();
    //});
  }
  int currentPage = 1;
  final int itemsPerPage = 10;
  final int totalPages = 5;

}

class InformationUpdateScreen extends StatelessWidget {
  final VoidCallback selectUploadButton;
  InformationUpdateScreen({required this.selectUploadButton,super.key});

  final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>();
  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    final providerPatientId = Provider.of<DiagnosisProvider>(context,listen: false);
    TextEditingController _searchController = TextEditingController();
    int fetchedPatientId = 0; // Replace this with your actual patientId
    //handlePatientId(fetchedPatientId);
    return  Consumer<InformationUpdateProvider>(
      builder: (context, provider, child) {
        provider.handlePatientId(fetchedPatientId);
        return  Stack(
            children:[ Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75,),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  ///button
                  Row(
                    children: [
                      CustomSearchFieldSM(
                        searchController: _searchController,
                        onPressed: (){},
                      ),
                      SizedBox(width: 20,),
                      IconButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: providerContact.toggleFilter,
                          icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: AppSize.s18,width: AppSize.s16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s20,),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Text("Referral Received", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12),),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Potential DC Date", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Referral Source", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Demographics", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Documentation", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Insurance", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Physician Info", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Orders", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                      SizedBox(width: AppSize.s20,),
                      Text("Initial Contact", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                      SizedBox(width: AppSize.s10,),
                      Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                    ],
                  ),
                  SizedBox(height: AppSize.s30,),
                  Expanded(
                      child: StreamBuilder<List<PatientModel>>(
                        stream: _streamController.stream,
                        builder: (context,snapshot) {
                          getPatientReffrealsData(context: context, pageNo:1 , nbrOfRows: 20, isIntake: 'true', isArchived: 'false', isScheduled: 'false', searchName: _searchController.text.isEmpty ?'all':_searchController.text,
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
                                    AppStringSMModule.infoUpdateNoData,
                                    style: AllNoDataAvailable.customTextStyle(context),
                                  ),
                                ));
                          }
                          if(snapshot.hasData){
                            return ScrollConfiguration(
                              behavior: ScrollBehavior().copyWith(scrollbars: false),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  //int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                                  // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                                  // EmployeeDocumentModal employeedoc = paginatedData[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: IntakeContainer(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:  Border(
                                            left: BorderSide(
                                              color: snapshot.data![index].thresould == 0
                                                  ? ColorManager.greenDark
                                                  : snapshot.data![index].thresould == 1
                                                  ? const Color(0xFFFEBD4D)
                                                  : ColorManager.red,
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
                                                children:[
                                                  Container(
                                                      width: AppSize.s60,
                                                      height: AppSize.s15,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager.bluebottom.withOpacity(0.12),
                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(8)),),
                                                      child: Center(
                                                        child: Text(
                                                            'Chart #${snapshot.data![index].ptChartNo}',
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStylesCommon.commonStyle(
                                                                color:  Color(0xFF1696C8),
                                                                fontSize: FontSize.s11,
                                                                fontWeight: FontWeight.w700)),
                                                      )),

                                                ]
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: AppPadding.p20,right: AppPadding.p30),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                                    child:  ClipOval(
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
                                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w700,
                                                            color: ColorManager.mediumgrey,),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                          "Intake Date: ${snapshot.data![index].ptRefferalDate}",
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,),
                                                        ),
                                                        SizedBox(height: 3,),
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                "Potential DC Date :",
                                                                textAlign: TextAlign.center,
                                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: ColorManager.mediumgrey,),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                " 11/26/2024",
                                                                textAlign: TextAlign.center,
                                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                                  fontWeight: FontWeight.w400,
                                                                  color: ColorManager.mediumgrey,),
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
                                                      child: Text(snapshot.data![index].referralSource.sourceName,
                                                        textAlign: TextAlign.start,
                                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                          fontWeight: FontWeight.w400,
                                                          color: ColorManager.textBlack,),
                                                      ),
                                                    ),
                                                    // child: Row(
                                                    //   children: [
                                                    //     Icon(Icons.location_on_outlined,size: IconSize.I18,color: ColorManager.bluebottom,),
                                                    //     // Image.asset(
                                                    //     //     "images/sm/location.png",
                                                    //     //   height: 25,width: 26,fit: BoxFit.fill,
                                                    //     // ),
                                                    //     SizedBox(width: 10,),
                                                    //     Text(
                                                    //       " Apollo Hospital, Washington DC",
                                                    //       textAlign: TextAlign.start,
                                                    //       style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                    //         fontWeight: FontWeight.w400,
                                                    //         color: ColorManager.textBlack,),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ),
                                                  SizedBox(width: 20),
                                                  SizedBox(width: MediaQuery.of(context).size.width/35,),
                                                  Expanded(
                                                    flex: 5,
                                                    child: Wrap(
                                                      spacing: 5,
                                                      children: [
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Demographics"),
                                                        // SizedBox(width: 15,),
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Documentation"),
                                                        //  SizedBox(width: 15,),
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Insurance"),
                                                        // SizedBox(width: 15,),
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Physician Info"),
                                                        //  SizedBox(width: 15,),
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Orders"),
                                                        // SizedBox(width: 15,),
                                                        SMDashboardMenuButtons(
                                                            onTap: (int index) {
                                                              //_selectButton(index);
                                                            },
                                                            index: 0,
                                                            grpIndex: 0,
                                                            heading: "Initial Contact"),

                                                      ],

                                                      // children: [
                                                      //   Padding(
                                                      //     padding: const EdgeInsets.only(top:30.0),
                                                      //     child: Row(
                                                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      //       crossAxisAlignment: CrossAxisAlignment.center,
                                                      //       children: [
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Demographics"),
                                                      //        // SizedBox(width: 15,),
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Documentation"),
                                                      //       //  SizedBox(width: 15,),
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Insurance"),
                                                      //        // SizedBox(width: 15,),
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Physician Info"),
                                                      //       //  SizedBox(width: 15,),
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Orders"),
                                                      //        // SizedBox(width: 15,),
                                                      //         SMDashboardMenuButtons(
                                                      //             onTap: (int index) {
                                                      //               //_selectButton(index);
                                                      //             },
                                                      //             index: 0,
                                                      //             grpIndex: 0,
                                                      //             heading: "Initial Contact"),
                                                      //
                                                      //       ],
                                                      //
                                                      //     ),
                                                      //   ),
                                                      // ],
                                                    ),
                                                  ),
                                                  // SizedBox(width: 20,),

                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      onTap: (){
                                                        selectUploadButton();
                                                        providerPatientId.passPatientId(patientIdNo: snapshot.data![index].ptId);
                                                      },
                                                      child:Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Image.asset("images/sm/cloud_uploade.png",height: 20,width: 20,),
                                                          // Icon(Icons.cloud_upload_outlined,size: IconSize.I18,color: Color(0xFF2F6D8A), weight: 10,),
                                                          SizedBox(height: 8,),
                                                          Text("Update",
                                                            style: TextStyle(
                                                              fontSize: FontSize.s11,
                                                              fontWeight: FontWeight.w600,
                                                              color: Color(0xFF2F6D8A),
                                                            ),)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      onTap: () async {
                                                  var response = await postDiscipline(context: context, ptId: snapshot.data![index].ptId);
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

                                                  // ✅ Refresh data
                                                  Provider.of<SmIntakeProviderManager>(context, listen: false).filterIdIntegration(
                                                  context: context,
                                                  marketerId: providerContact.marketerId,
                                                  sourceId: providerContact.referralSourceId,
                                                  pcpId: providerContact.pcpId,
                                                  );
                                                  }else{
                                                  print('Api error');
                                                  }

                                                  },
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SizedBox(height: 3,),
                                                          Image.asset("images/sm/move_to_s.png",height: 20,width: 20,),
                                                          SizedBox(height: 6,),
                                                          Text(" Move to\nScheduler",
                                                            style: TextStyle(
                                                              fontSize: FontSize.s11,
                                                              fontWeight: FontWeight.w600,
                                                              color: Color(0xFF2F6D8A),
                                                            ),)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        onTap: (){},
                                                        child:Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.block_flipped,size: IconSize.I18,color: Color(0xFF2F6D8A),weight: 10,),
                                                            SizedBox(height: 8,),
                                                            Text("Non-Admit",
                                                              style: TextStyle(
                                                                fontSize: FontSize.s11,
                                                                fontWeight: FontWeight.w600,
                                                                color: Color(0xFF2F6D8A),
                                                              ),)
                                                          ],
                                                        )
                                                    ),
                                                  ),



                                                  ///conditional button don't delete
                                                  //   Container(
                                                  //     height:33,
                                                  //     width: 160,
                                                  //     child: ElevatedButton(
                                                  //      // icon: Image.asset("images/sm/calendar.png",height: 20,width: 20,),
                                                  //       onPressed: (){
                                                  //         showDialog(context: context, builder: (context) => ViewDetailsPopup());
                                                  //       },
                                                  //       style: ElevatedButton.styleFrom(
                                                  //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                  //         backgroundColor: ColorManager.white,
                                                  //         shape: RoundedRectangleBorder(
                                                  //           borderRadius: BorderRadius.circular(12),
                                                  //           side: BorderSide(color: ColorManager.bluebottom),
                                                  //         ),
                                                  //       ), child: Text(
                                                  //         "Update",
                                                  //         style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                                  //           fontWeight: FontWeight.w500,
                                                  //           color: ColorManager.bluebottom,)
                                                  //     ),
                                                  //     ),
                                                  //   ),
                                                  ///old blue button
                                                  // Expanded(
                                                  //   child: Container(
                                                  //     height:33,
                                                  //     width: 160,
                                                  //     child: ElevatedButton.icon(
                                                  //       icon: Padding(
                                                  //         padding: const EdgeInsets.only(right: 15.0),
                                                  //         child: Icon(Icons.edit_outlined,size: 20,),
                                                  //       ),
                                                  //       onPressed:onUpdateButtonPressed,
                                                  //       //     (){
                                                  //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => SMIntakeScreen()));
                                                  //       //   //showDialog(context: context, builder: (context) => ViewDetailsPopup());
                                                  //       // },
                                                  //
                                                  //       style: ElevatedButton.styleFrom(
                                                  //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                  //         backgroundColor: ColorManager.bluebottom,
                                                  //         shape: RoundedRectangleBorder(
                                                  //           borderRadius: BorderRadius.circular(12),
                                                  //           side: BorderSide(color: ColorManager.dashListviewData),
                                                  //         ),
                                                  //       ), label: Text(
                                                  //               "Update",
                                                  //               style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                                  //               fontWeight: FontWeight.w500,
                                                  //               color: ColorManager.white,)
                                                  //               ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // Container(
                                                  //   height:33,
                                                  //   width: 160,
                                                  //   child: ElevatedButton.icon(
                                                  //     icon: Image.asset("images/sm/move.png",height: 20,width: 20,),
                                                  //     onPressed: (){
                                                  //       showDialog(context: context, builder: (context) => ViewDetailsPopup());
                                                  //     },
                                                  //     style: ElevatedButton.styleFrom(
                                                  //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                                  //       backgroundColor: ColorManager.white,
                                                  //       shape: RoundedRectangleBorder(
                                                  //         borderRadius: BorderRadius.circular(12),
                                                  //         side: BorderSide(color: ColorManager.bluebottom),
                                                  //       ),
                                                  //     ), label: Text(
                                                  //       "Move to Schedular",
                                                  //       style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                                  //         fontWeight: FontWeight.w500,
                                                  //         color: ColorManager.bluebottom,)
                                                  //   ),
                                                  //   ),
                                                  // ),
                                                ],),
                                            ),
                                            SizedBox(height: AppSize.s5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }else{
                            return SizedBox();
                          }

                        }
                      )),
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
              if (provider._isChatbotVisible)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: provider._toggleChatbotVisibility, // Close popup on tapping outside
                    child: Container(
                        color: Colors.transparent
                    ),
                  ),
                ),
              AnimatedPositioned(duration:Duration(milliseconds: 300),
                  bottom: provider._isChatbotVisible ? 0 : -500, // Slide in from bottom-right
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 450,
                    width: 500,
                    child: ChatBotContainer(
                      onClose: provider._toggleChatbotVisibility,
                    ),

                  ) )
            ]
        );
      },

    );
  }
}


///
typedef void OnManuButtonTapCallBack(int index);
class SMDashboardMenuButtons extends StatelessWidget {
  const SMDashboardMenuButtons({
    super.key,
    required this.onTap,
    required this.index,
    required this.grpIndex,
    required this.heading,
  });

  final OnManuButtonTapCallBack onTap;
  final int index;
  final int grpIndex;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return AppClickableWidget(
      onTap: () {
        onTap(index);
      },
      onHover: (bool val) {},
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: FontSize.s10,
              fontWeight: FontWeight.w400,
              color: ColorManager.mediumgrey,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final textPainter = TextPainter(
                text: TextSpan(
                  text: heading,
                  style: TextStyle(
                    fontSize: FontSize.s10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textDirection: TextDirection.ltr,
              )..layout();

              final textWidth = textPainter.size.width;
              print("textwidth :::::::: $heading $textWidth");
              return Container(
                margin: const EdgeInsets.only(top: 10),
                height: 6,
                width: 70,  //textWidth + 10,
                decoration: BoxDecoration(
                    color: ColorManager.greenDark,
                    borderRadius: BorderRadius.circular(12)
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



class IntakeContainer extends StatelessWidget {
  final Widget child;
  const IntakeContainer({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child:child,
    );
  }
}



//
// class IconinColoum extends StatelessWidget {
//
//   final String text;
//    IconinColoum({super.key, required this.text,});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(Icon,size: IconSize.I18,),
//         SizedBox(height: 8,),
//         Text(text,
//           style: TextStyle(
//             fontSize: FontSize.s10,
//             fontWeight: FontWeight.w400,
//           ),)
//       ],
//     );
//   }
// }






///stf
// class InformationUpdateScreen extends StatefulWidget {
//   final VoidCallback onUpdateButtonPressed;
//   final void Function(int patientId) onPatientIdReceived;
//
//   InformationUpdateScreen({super.key, required this.onUpdateButtonPressed, required this.onPatientIdReceived});
//
//   @override
//   State<InformationUpdateScreen> createState() => _InformationUpdateScreenState();
// }
//
// class _InformationUpdateScreenState extends State<InformationUpdateScreen> {
//   void handlePatientId(int patientId) {
//     /// Pass the patientId back to the parent widget
//     widget.onPatientIdReceived(patientId);
//   }
//
//   bool _isChatbotVisible = false;
//
//   void _toggleChatbotVisibility() {
//     setState(() {
//       _isChatbotVisible = !_isChatbotVisible;
//     });
//   }
//   int currentPage = 1;
//   final int itemsPerPage = 10;
//   final int totalPages = 5;
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _searchController = TextEditingController();
//     int fetchedPatientId = 0; // Replace this with your actual patientId
//     handlePatientId(fetchedPatientId);
//     return  Stack(
//         children:[ Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 55.0),
//         child: Column(
//           children: [
//             ///button
//             Row(
//               //crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 320,
//                   height: 35,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius: BorderRadius.circular(8.0),
//                     border: Border.all(color: ColorManager.mediumgrey.withOpacity(0.1),width: 1)
//                     // boxShadow: [
//                     //   BoxShadow(
//                     //     color: Colors.black26,
//                     //     blurRadius: 5.0,
//                     //   ),
//                     // ],
//                   ),
//                   child: TextField(
//                     controller: _searchController,
//                     textInputAction: TextInputAction.search,
//                     //onSubmitted: (value) => _performSearch(),
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       hintStyle: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,color: ColorManager.mediumgrey,fontWeight: FontWeight.w400),
//                       prefixIcon: Icon(Icons.search),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.only(left: 15.0, right: 15,bottom: 5),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10,),
//                   child: Container(
//                     height: 33,
//                     child: CustomIconButton(
//                       color: ColorManager.bluebottom,
//                         icon: Icons.add,
//                         text: "Add Patient",
//                         onPressed: () async {
//                         try {
//                           widget.onUpdateButtonPressed();
//                         }
//                         catch (e){
//                           print("Error: $e");
//                         }
//                         },
//                         ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//                 child: ScrollConfiguration(
//                   behavior: ScrollBehavior().copyWith(scrollbars: false),
//                   child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: 15,
//                   itemBuilder: (context, index) {
//                                 //int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
//                                 // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
//                                 // EmployeeDocumentModal employeedoc = paginatedData[index];
//                                 return Column(
//                   children: [
//                     SizedBox(height: AppSize.s5),
//                     Container(
//                       height: AppSize.s88,
//                       padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
//                      // margin: EdgeInsets.symmetric(horizontal: AppMargin.m2),
//                       decoration: BoxDecoration(
//                         color: ColorManager.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: ColorManager.black.withOpacity(0.2),
//                             spreadRadius: 0,
//                             blurRadius: 2,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                         Expanded(
//                           flex: 2,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(vertical: 5.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(50),
//                                   child: SizedBox(
//                                     width: 50,
//                                     height: 50,
//                                     child: Image.asset(
//                                       'images/hr_dashboard/man.png', // Replace with your image path
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10,),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "John smith",
//                                     textAlign: TextAlign.center,
//                                     style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                       fontWeight: FontWeight.w700,
//                                       color: ColorManager.mediumgrey,),
//                                   ),
//                                   Text(
//                                    "Intake Date: 09/15/2024",
//                                     textAlign: TextAlign.center,
//                                     style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                       fontWeight: FontWeight.w400,
//                                       color: ColorManager.mediumgrey,),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 2,
//                           child: Row(
//                             children: [
//                               Icon(Icons.location_on_outlined,size: IconSize.I18,color: ColorManager.bluebottom,),
//                               // Image.asset(
//                               //     "images/sm/location.png",
//                               //   height: 25,width: 26,fit: BoxFit.fill,
//                               // ),
//                               SizedBox(width: 10,),
//                               Text(
//                                 "Tufts International Center, 20 Sawyer Ave,\nMedford MA 02155 ",
//                                 textAlign: TextAlign.start,
//                                 style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                   fontWeight: FontWeight.w400,
//                                   color: ColorManager.textBlack,),
//                               ),
//                             ],
//                           ),
//                         ),
//                       SizedBox(width: 10,),
//                         Expanded(
//                           flex: 5,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Refferal :",
//                                     textAlign: TextAlign.start,
//                                     style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                                       fontWeight: FontWeight.w400,
//                                       color: ColorManager.textBlack,),
//                                   ),
//                                   // SizedBox(width: 25,),
//                                   Text(
//                                     "Prohealth App",
//                                     textAlign: TextAlign.start,
//                                     style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                                       fontWeight: FontWeight.w400,
//                                       color: ColorManager.textBlack,),
//                                   ),
//                                 ],
//                               ),
//                              // SizedBox(width: 10,),
//                               Padding(
//                                 padding: const EdgeInsets.only(top:30.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Patients Data"),
//                                     SizedBox(width: 5,),
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Physical Info"),
//                                     SizedBox(width: 5,),
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Medication"),
//                                     SizedBox(width: 5,),
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Lab Results"),
//                                     SizedBox(width: 5,),
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Insurance"),
//                                     SizedBox(width: 5,),
//                                     SMDashboardMenuButtons(
//                                         onTap: (int index) {
//                                           //_selectButton(index);
//                                         },
//                                         index: 0,
//                                         grpIndex: 0,
//                                         heading: "Notes"),
//
//                                   ],
//
//                                 ),
//                               ),
//                              // SizedBox(width: 15,),
//                               InkWell(
//                                 child: SvgPicture.asset("images/sm/contact_sv.svg",
//                                   height: 30,width: 20,
//                                 ),
//                                 onTap: _toggleChatbotVisibility,
//                               )
//
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 20,),
//                         ///conditional button don't delete
//                         //   Container(
//                         //     height:33,
//                         //     width: 160,
//                         //     child: ElevatedButton(
//                         //      // icon: Image.asset("images/sm/calendar.png",height: 20,width: 20,),
//                         //       onPressed: (){
//                         //         showDialog(context: context, builder: (context) => ViewDetailsPopup());
//                         //       },
//                         //       style: ElevatedButton.styleFrom(
//                         //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         //         backgroundColor: ColorManager.white,
//                         //         shape: RoundedRectangleBorder(
//                         //           borderRadius: BorderRadius.circular(12),
//                         //           side: BorderSide(color: ColorManager.bluebottom),
//                         //         ),
//                         //       ), child: Text(
//                         //         "Update",
//                         //         style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                         //           fontWeight: FontWeight.w500,
//                         //           color: ColorManager.bluebottom,)
//                         //     ),
//                         //     ),
//                         //   ),
//                         ///old blue button
//                         // Expanded(
//                         //   child: Container(
//                         //     height:33,
//                         //     width: 160,
//                         //     child: ElevatedButton.icon(
//                         //       icon: Padding(
//                         //         padding: const EdgeInsets.only(right: 15.0),
//                         //         child: Icon(Icons.edit_outlined,size: 20,),
//                         //       ),
//                         //       onPressed:onUpdateButtonPressed,
//                         //       //     (){
//                         //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => SMIntakeScreen()));
//                         //       //   //showDialog(context: context, builder: (context) => ViewDetailsPopup());
//                         //       // },
//                         //
//                         //       style: ElevatedButton.styleFrom(
//                         //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         //         backgroundColor: ColorManager.bluebottom,
//                         //         shape: RoundedRectangleBorder(
//                         //           borderRadius: BorderRadius.circular(12),
//                         //           side: BorderSide(color: ColorManager.dashListviewData),
//                         //         ),
//                         //       ), label: Text(
//                         //               "Update",
//                         //               style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                         //               fontWeight: FontWeight.w500,
//                         //               color: ColorManager.white,)
//                         //               ),
//                         //     ),
//                         //   ),
//                         // ),
//                         Container(
//                           height:33,
//                           width: 160,
//                           child: ElevatedButton.icon(
//                             icon: Image.asset("images/sm/move.png",height: 20,width: 20,),
//                             onPressed: (){
//                               showDialog(context: context, builder: (context) => ViewDetailsPopup());
//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                               backgroundColor: ColorManager.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 side: BorderSide(color: ColorManager.bluebottom),
//                               ),
//                             ), label: Text(
//                                     "Move to Schedular",
//                                     style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorManager.bluebottom,)
//                                     ),
//                           ),
//                         ),
//                       ],),
//                     ),
//                     SizedBox(height: AppSize.s5),
//                   ],
//                                 );
//                               },
//                               ),
//                 )),
//             ///pagination code dont delete
//             // PaginationControlsWidget(
//             //   currentPage: currentPage,
//             //   items: [],//snapshot.data!,
//             //   itemsPerPage: itemsPerPage,
//             //   onPreviousPagePressed: () {
//             //     if (currentPage > 1) {
//             //       currentPage--;
//             //     }
//             //   },
//             //   onPageNumberPressed: (pageNumber) {
//             //     currentPage = pageNumber;
//             //   },
//             //   onNextPagePressed: () {
//             //     if (currentPage < totalPages) {
//             //       currentPage++;
//             //     }
//             //   },
//             // ),
//           ],
//         ),
//       ),
//           if (_isChatbotVisible)
//             Positioned.fill(
//               child: GestureDetector(
//                 onTap: _toggleChatbotVisibility, // Close popup on tapping outside
//                 child: Container(
//                     color: Colors.transparent
//                 ),
//               ),
//             ),
//           AnimatedPositioned(duration:Duration(milliseconds: 300),
//               bottom: _isChatbotVisible ? 0 : -500, // Slide in from bottom-right
//               right: 0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF7F8FA),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 height: 450,
//                 width: 500,
//
//
//                 child: ChatBotContainer(
//                   onClose: _toggleChatbotVisibility,
//                 ),
//
//               ) )
//     ]
//     );
//   }
// }