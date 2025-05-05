import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../textfield_dropdown_constant/chatbotContainer.dart';
import 'information_update.dart';

class NonAdmitPage extends StatefulWidget {
  const NonAdmitPage({super.key});

  @override
  State<NonAdmitPage> createState() => _NonAdmitPageState();
}

class _NonAdmitPageState extends State<NonAdmitPage> {
  bool _isFilterOpen = false; // Track filter panel state


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

  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Stack(
        children:[
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
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior().copyWith(scrollbars: false),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 10,
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
                                    color: Color(0xFFC30909),
                                    width: 6,
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    // bottomRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children:[
                                            Container(
                                                width: AppSize.s60,
                                                height: AppSize.s16,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.bluebottom.withOpacity(0.12),
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8)),),
                                                child: Center(
                                                  child: Text(
                                                      'Chart #2',
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStylesCommon.commonStyle(
                                                          color: ColorManager.bluebottom,
                                                          fontSize: FontSize.s11,
                                                          fontWeight: FontWeight.w400)),
                                                )),
                                          ]
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: AppPadding.p20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: Image.asset(
                                                    'images/hr_dashboard/man.png', // Replace with your image path
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "John Smith",
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w700,
                                                      color: ColorManager.mediumgrey,),
                                                  ),
                                                  SizedBox(height: 5,),
                                                  Text(
                                                    "Intake Date: 09/15/2024",
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
                                              flex: 3,
                                              child:  Center(
                                              child: Text("Apollo Hospital, Washington DC",
                                                textAlign: TextAlign.start,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.textBlack,),
                                              ),
                                      ),

                                            ),
                                            SizedBox(width: 10,),
                                            SizedBox(width: MediaQuery.of(context).size.width/25,),
                                            Expanded(
                                              flex: 7,
                                              child:  Wrap(
                                                spacing: 15,

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
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //   crossAxisAlignment: CrossAxisAlignment.center,
                                              //   children: [
                                              //
                                              //     Padding(
                                              //       padding: const EdgeInsets.only(top:5.0,left: 15),
                                              //       child: Row(
                                              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //         crossAxisAlignment: CrossAxisAlignment.center,
                                              //         children: [
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Demographics"),
                                              //           SizedBox(width: 20,),
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Documentation"),
                                              //           SizedBox(width: 20,),
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Insurance"),
                                              //           SizedBox(width: 20,),
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Physician Info"),
                                              //           SizedBox(width: 20,),
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Orders"),
                                              //           SizedBox(width: 20,),
                                              //           SMDashboardMenuButtons(
                                              //               onTap: (int index) {
                                              //                 //_selectButton(index);
                                              //               },
                                              //               index: 0,
                                              //               grpIndex: 0,
                                              //               heading: "Initial Contact"),
                                              //
                                              //         ],
                                              //
                                              //       ),
                                              //     ),
                                              //     // SizedBox(width: 15,),
                                              //     // InkWell(
                                              //     //   child: SvgPicture.asset("images/sm/contact_sv.svg",
                                              //     //     height: 30,width: 20,
                                              //     //   ),
                                              //     //   onTap: provider._toggleChatbotVisibility,
                                              //     // )
                                              //     ///
                                              //     ///
                                              //     // Column(
                                              //     //   mainAxisAlignment: MainAxisAlignment.center,
                                              //     //   children: [
                                              //     //     Icon(Icons.cloud_upload_outlined,size: IconSize.I18,color: Color(0xFF2F6D8A), weight: 10,),
                                              //     //     SizedBox(height: 8,),
                                              //     //     Text("Update",
                                              //     //       style: TextStyle(
                                              //     //         fontSize: FontSize.s11,
                                              //     //         fontWeight: FontWeight.w600,
                                              //     //         color: Color(0xFF2F6D8A),
                                              //     //       ),)
                                              //     //   ],
                                              //     // ),
                                              //     // SizedBox(width: AppSize.s20,),
                                              //     // Column(
                                              //     //   mainAxisAlignment: MainAxisAlignment.center,
                                              //     //   children: [
                                              //     //     SizedBox(height: 3,),
                                              //     //     Image.asset("images/sm/move_to_s.png",height: 20,width: 20,),
                                              //     //     SizedBox(height: 8,),
                                              //     //     Text(" Move to\nScheduler",
                                              //     //       style: TextStyle(
                                              //     //         fontSize: FontSize.s11,
                                              //     //         fontWeight: FontWeight.w600,
                                              //     //         color: Color(0xFF2F6D8A),
                                              //     //       ),)
                                              //     //   ],
                                              //     // ),
                                              //     // SizedBox(width: AppSize.s20,),
                                              //     // Column(
                                              //     //   mainAxisAlignment: MainAxisAlignment.center,
                                              //     //   children: [
                                              //     //     Icon(Icons.block,size: IconSize.I18,color: Color(0xFF2F6D8A),weight: 10,),
                                              //     //     SizedBox(height: 8,),
                                              //     //     Text("Non-Admit",
                                              //     //       style: TextStyle(
                                              //     //         fontSize: FontSize.s11,
                                              //     //         fontWeight: FontWeight.w600,
                                              //     //          color: Color(0xFF2F6D8A),
                                              //     //       ),)
                                              //     //   ],
                                              //     // )
                                              //
                                              //   ],
                                              // ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                 onTap: _toggleChatbotVisibility,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                   // SizedBox(height: 3,),
                                                    Image.asset("images/sm/contact_icon.png",height:25),
                                                    SizedBox(height: 6,),
                                                    Text("Contact",
                                                      style: TextStyle(
                                                        fontSize: FontSize.s11,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xFF2F6D8A),
                                                      ),)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
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
                                                      Image.asset("images/sm/left_bottom.png",height: 20,width: 20,),
                                                      SizedBox(height: 8,),
                                                      Text("Restore",
                                                        style: TextStyle(
                                                          fontSize: FontSize.s11,
                                                          fontWeight: FontWeight.w600,
                                                          color: Color(0xFF2F6D8A),
                                                        ),)
                                                    ],
                                                  )
                                              ),
                                            ),
                                          ],),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.s5),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
          if (_isChatbotVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleChatbotVisibility, // Close popup on tapping outside
                child: Container(
                    color: Colors.transparent
                ),
              ),
            ),
          AnimatedPositioned(duration:Duration(milliseconds: 300),
              bottom: _isChatbotVisible ? 0 : -500, // Slide in from bottom-right
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 450,
                width: 500,


                child: ChatBotContainer(
                  onClose: _toggleChatbotVisibility,
                ),

              ) ),

        ]
    );
  }
}
