import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
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
    return Stack(
        children:[ Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75),
          child: Column(
            children: [
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
                    onPressed:(){},
                    icon: Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              Row(
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
                        return Column(
                          children: [
                            SizedBox(height: AppSize.s5),
                            Container(
                              height: AppSize.s90,
                              padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                              // margin: EdgeInsets.symmetric(horizontal: AppMargin.m2),
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border(left: BorderSide(
                                  color: Color(0xFFC30909),
                                  width: 5,
                                ),),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                        SizedBox(width: 12,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "John smith",
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
                                            Text(
                                              "Potential DC Date: 11/26/2024",
                                              textAlign: TextAlign.center,
                                              style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.mediumgrey,),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child:  SizedBox(
                                      width: 100,
                                      child:Text("Apollo Hospital, Washington DC",
                                        textAlign: TextAlign.start,
                                        style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.textBlack,),
                                      ) ,
                                    ),

                                  ),
                                SizedBox(width: 10,),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(top:30.0,left: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Demographics"),
                                              SizedBox(width: 20,),
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Documentation"),
                                              SizedBox(width: 20,),
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Insurance"),
                                              SizedBox(width: 20,),
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Physician Info"),
                                              SizedBox(width: 20,),
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Orders"),
                                              SizedBox(width: 20,),
                                              SMDashboardMenuButtons(
                                                  onTap: (int index) {
                                                    //_selectButton(index);
                                                  },
                                                  index: 0,
                                                  grpIndex: 0,
                                                  heading: "Initial Contact"),

                                            ],

                                          ),
                                        ),
                                        // SizedBox(width: 15,),
                                        // InkWell(
                                        //   child: SvgPicture.asset("images/sm/contact_sv.svg",
                                        //     height: 30,width: 20,
                                        //   ),
                                        //   onTap: provider._toggleChatbotVisibility,
                                        // )
                                        ///
                                        ///
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     Icon(Icons.cloud_upload_outlined,size: IconSize.I18,color: Color(0xFF2F6D8A), weight: 10,),
                                        //     SizedBox(height: 8,),
                                        //     Text("Update",
                                        //       style: TextStyle(
                                        //         fontSize: FontSize.s11,
                                        //         fontWeight: FontWeight.w600,
                                        //         color: Color(0xFF2F6D8A),
                                        //       ),)
                                        //   ],
                                        // ),
                                        // SizedBox(width: AppSize.s20,),
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     SizedBox(height: 3,),
                                        //     Image.asset("images/sm/move_to_s.png",height: 20,width: 20,),
                                        //     SizedBox(height: 8,),
                                        //     Text(" Move to\nScheduler",
                                        //       style: TextStyle(
                                        //         fontSize: FontSize.s11,
                                        //         fontWeight: FontWeight.w600,
                                        //         color: Color(0xFF2F6D8A),
                                        //       ),)
                                        //   ],
                                        // ),
                                        // SizedBox(width: AppSize.s20,),
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     Icon(Icons.block,size: IconSize.I18,color: Color(0xFF2F6D8A),weight: 10,),
                                        //     SizedBox(height: 8,),
                                        //     Text("Non-Admit",
                                        //       style: TextStyle(
                                        //         fontSize: FontSize.s11,
                                        //         fontWeight: FontWeight.w600,
                                        //          color: Color(0xFF2F6D8A),
                                        //       ),)
                                        //   ],
                                        // )

                                      ],
                                    ),
                                  ),
                                  // SizedBox(width: 20,),

                                  // Expanded(
                                  //   flex: 1,
                                  //   child:SizedBox()
                                  //   // InkWell(
                                  //   //   onTap: (){},
                                  //   //   child:Column(
                                  //   //     mainAxisAlignment: MainAxisAlignment.center,
                                  //   //     children: [
                                  //   //       Icon(Icons.cloud_upload_outlined,size: IconSize.I18,color: Color(0xFF2F6D8A), weight: 10,),
                                  //   //       SizedBox(height: 8,),
                                  //   //       Text("Update",
                                  //   //         style: TextStyle(
                                  //   //           fontSize: FontSize.s11,
                                  //   //           fontWeight: FontWeight.w600,
                                  //   //           color: Color(0xFF2F6D8A),
                                  //   //         ),)
                                  //   //     ],
                                  //   //   ),
                                  //   // ),
                                  // ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        InkWell(
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
                                        SizedBox(width: 50,),
                                        InkWell(
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
                                      ],
                                    ),
                                  ),
                                  //SizedBox(width: 20,),
                                  // Expanded(
                                  //   flex: 1,
                                  //   child: InkWell(
                                  //       onTap: (){},
                                  //       child:Column(
                                  //         mainAxisAlignment: MainAxisAlignment.center,
                                  //         children: [
                                  //           Image.asset("images/sm/left_bottom.png",height: 20,width: 20,),
                                  //           SizedBox(height: 8,),
                                  //           Text("Restore",
                                  //             style: TextStyle(
                                  //               fontSize: FontSize.s11,
                                  //               fontWeight: FontWeight.w600,
                                  //               color: Color(0xFF2F6D8A),
                                  //             ),)
                                  //         ],
                                  //       )
                                  //   ),
                                  // ),


                                ],),
                            ),
                            SizedBox(height: AppSize.s5),
                          ],
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

              ) )
        ]
    );
  }
}
