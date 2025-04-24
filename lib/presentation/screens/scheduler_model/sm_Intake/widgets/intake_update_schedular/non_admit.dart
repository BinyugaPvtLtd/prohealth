import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
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
  bool _isFilterOpen = false; // Track filter panel state
  bool _isChecked = false;
  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen; // Toggle panel visibility
    });
  }

  bool _MContainerVisible = false;
  bool _OContainerVisible = false;
  bool _RContainerVisible = false;
  bool _AContainerVisible = false;
  bool _IContainerVisible = false;
  bool _ICContainerVisible = false;
  bool _PContainerVisible = false;

  TextEditingController assigndatecontroller = TextEditingController();

  void toggleContainerM() {
    setState(() {
      _MContainerVisible = !_MContainerVisible;
    });
  }
  void toggleContainerO() {
    setState(() {
      _OContainerVisible = !_OContainerVisible;
    });
  }
  void toggleContainerR() {
    setState(() {
      _RContainerVisible = !_RContainerVisible;
    });
  }
  void toggleContainerA() {
    setState(() {
      _AContainerVisible = !_AContainerVisible;
    });
  }
  void toggleContainerI() {
    setState(() {
      _IContainerVisible = !_IContainerVisible;
    });
  }
  void toggleContainerIC() {
    setState(() {
      _ICContainerVisible = !_ICContainerVisible;
    });
  }
  void toggleContainerP() {
    setState(() {
      _PContainerVisible = !_PContainerVisible;
    });
  }

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
        children:[
          Padding(
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
                      onPressed: _toggleFilter,
                      icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: AppSize.s18,width: AppSize.s16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
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
                              padding: EdgeInsets.only(left: AppPadding.p20),
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
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children:[
                                        Container(
                                            width: AppSize.s105,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
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
                                            SizedBox(width: 20,),
                                            Column(
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
                                                    Text(
                                                      "Potential DC Date :",
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                        fontWeight: FontWeight.w600,
                                                        color: ColorManager.mediumgrey,),
                                                    ),
                                                    Text(
                                                      " 11/26/2024",
                                                      textAlign: TextAlign.center,
                                                      style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                        fontWeight: FontWeight.w400,
                                                        color: ColorManager.mediumgrey,),
                                                    ),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child:  Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: SizedBox(
                                            width: 100,
                                            child:Text("Apollo Hospital, Washington DC",
                                              textAlign: TextAlign.start,
                                              style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.textBlack,),
                                            ) ,
                                          ),
                                        ),

                                      ),
                                    SizedBox(width: 10,),
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.only(top:5.0,left: 15),
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
                                ],
                              ),
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

              ) ),

          if (_isFilterOpen)
            GestureDetector(
              onTap: _toggleFilter,
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: Colors.black.withOpacity(0.0), // Invisible but catches taps
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            right: _isFilterOpen ? -0 : -320, // Slide in/out effect
            top: 0,
            bottom: 0,
            child: Container(
              width: 250,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: SingleChildScrollView(// Wrap the Column inside SingleChildScrollView
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: _toggleFilter,
                            child: Row(
                              children: [
                                Icon(Icons.menu_open),
                                SizedBox(width: AppSize.s10),
                                Text(
                                  "Filters",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // TextButton(onPressed: (){}, child: Text("CLEAR ALL"))
                        ],
                      ),
                    ),
                    Divider(),
                    // Example filter fields
                    InkWell(
                      onTap:  toggleContainerM,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Marketer",
                              style: AllHRTableData.customTextStyle(context),),
                            Icon(
                              _MContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _MContainerVisible ? 0 : 0,
                      width: 300,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: _MContainerVisible
                          ? Text(
                        'Container is Open',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                          : null,
                    ),
                    Divider(),
                    InkWell(
                      onTap:  toggleContainerO,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order Received Date",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _OContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _OContainerVisible ? 0 : 0,
                      width: 300,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: _OContainerVisible
                          ? Text(
                        'Container is Open',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                          : null,
                    ),
                    Divider(),
                    InkWell(
                      onTap:  toggleContainerR,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Referral Source",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _RContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _RContainerVisible ? 300 : 0,
                      width: 300,
                      // color: Colors.grey,
                      // alignment: Alignment.center,
                      child: _RContainerVisible
                          ?Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                              ),
                              //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                            ),
                            onChanged: (value) {
                              // Handle search logic here (e.g., filtering options)
                            },
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _isChecked = !_isChecked;  // Toggle checkbox state
                          //     });
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //    //   shape: BoxShape.,
                          //       color:  Colors.transparent, // Checked or unchecked background color
                          //       border: Border.all(color: Colors.blue), // Border color of the circle
                          //     ),
                          //     padding: EdgeInsets.all(10),
                          //     child: _isChecked
                          //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                          //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                          //   ),
                          // ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Lorem Ipsum',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),


                        ],
                      )
                          : null,
                    ),
                    Divider(),
                    InkWell(
                      onTap:  toggleContainerA,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Agency",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _AContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _AContainerVisible ? 0 : 0,
                      width: 300,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: _AContainerVisible
                          ? Text(
                        'Container is Open',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                          : null,
                    ),
                    Divider(),
                    InkWell(
                      onTap:  toggleContainerI,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Insurance",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _IContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _IContainerVisible ? 0 : 0,
                      width: 300,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: _IContainerVisible
                          ? Text(
                        'Container is Open',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                          : null,
                    ),
                    Divider(),
                    InkWell(
                      onTap:  toggleContainerIC,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Insurance Category",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _ICContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _ICContainerVisible ? 310 : 0,
                      width: 300,
                      // color: Colors.blue,
                      // alignment: Alignment.center,
                      child: _ICContainerVisible
                          ?Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                              ),
                              //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                            ),
                            onChanged: (value) {
                              // Handle search logic here (e.g., filtering options)
                            },
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _isChecked = !_isChecked;  // Toggle checkbox state
                          //     });
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //    //   shape: BoxShape.,
                          //       color:  Colors.transparent, // Checked or unchecked background color
                          //       border: Border.all(color: Colors.blue), // Border color of the circle
                          //     ),
                          //     padding: EdgeInsets.all(10),
                          //     child: _isChecked
                          //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                          //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                          //   ),
                          // ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Medicare',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Private Med Advantage',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Kaiser',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Medi-Cal',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Private Commercial',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'LOA',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'ProBono',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                              Text(
                                'Other',
                                style: DocDefineTableDataID.customTextStyle(context),
                              ),
                            ],
                          ),


                        ],
                      )
                          : null,
                    ),

                    Divider(),
                    InkWell(
                      onTap:  toggleContainerP,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Potential Discharge Date",
                                style: AllHRTableData.customTextStyle(context)),

                            Icon(
                              _PContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      height: _PContainerVisible ? 100 : 0,
                      width: 300,
                      // color: Colors.blue,
                      // alignment: Alignment.center,
                      child: _PContainerVisible
                          ? Column(
                          children: [
                            TextField(
                              controller: assigndatecontroller,style: TextStyle(
                                fontSize: 14
                            ),

                              decoration: InputDecoration(
                                hintText: 'Date Range',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Icon(Icons.calendar_month_outlined,size: 18,color: Colors.grey,),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                              onChanged: (value) {
                                // Handle search logic here (e.g., filtering options)
                              },

                              onTap: ()async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1901),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  assigndatecontroller.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];

                                }
                              },
                            ),
                          ]
                      )
                          : null,
                    ),
                    Divider(),
                    // Example filter fields
                    InkWell(
                      onTap:  toggleContainerM,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10, right: AppPadding.p13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Physician",
                                style: AllHRTableData.customTextStyle(context)),
                            Icon(
                              _MContainerVisible
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: ColorManager.mediumgrey,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}
