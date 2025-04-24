import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prohealth/presentation/widgets/widgets/constant_textfield/const_textfield.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../textfield_dropdown_constant/chatbotContainer.dart';

class SentToSchedularScreen extends StatefulWidget {
  SentToSchedularScreen({super.key});

  @override
  State<SentToSchedularScreen> createState() => _SentToSchedularScreenState();
}

class _SentToSchedularScreenState extends State<SentToSchedularScreen> {
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
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          children: [
            ///button
            Row(
              children: [
                CustomSearchFieldSM(
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: _toggleFilter,
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
            Row(
              children: [
                Text(
                  "Referral Received",
                  style: TextStyle(
                      color: ColorManager.textBlack, fontSize: FontSize.s12),
                ),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Potential DC Date",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Referral Source",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Demographics",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Documentation",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Insurance",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Physician Info",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Orders",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
                SizedBox(
                  width: AppSize.s20,
                ),
                Text("Initial Contact",
                    style: TextStyle(
                        color: ColorManager.textBlack, fontSize: FontSize.s12)),
                SizedBox(
                  width: AppSize.s10,
                ),
                Image.asset(
                  "images/sm/sm_refferal/refferal_arrow.png",
                  height: IconSize.I14,
                  width: IconSize.I16,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s30,
            ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p20),
                        // margin: EdgeInsets.symmetric(horizontal: AppMargin.m2),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(12),
                          border: const Border(
                            left: BorderSide(
                              color: Color(0xFFC30909),
                              width: 5,
                            ),
                          ),
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
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
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
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "John Smith",
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
                                        "Intake Date: 09/15/2024",
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
                                          Text(
                                            "Potential DC Date :",
                                            textAlign: TextAlign.center,
                                            style: CustomTextStylesCommon
                                                .commonStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.mediumgrey,
                                            ),
                                          ),
                                          Text(
                                            " 11/26/2024",
                                            textAlign: TextAlign.center,
                                            style: CustomTextStylesCommon
                                                .commonStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.w400,
                                              color: ColorManager.mediumgrey,
                                            ),
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
                              child: SizedBox(
                                width: 100,
                                child: Text(
                                  "Apollo Hospital, Washington DC",
                                  textAlign: TextAlign.start,
                                  style: CustomTextStylesCommon.commonStyle(
                                    fontSize: FontSize.s12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.textBlack,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: ColorManager.bluebottom,
                                    size: IconSize.I20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "132 My Street,Kingston, New York 12401",
                                      textAlign: TextAlign.start,
                                      style: CustomTextStylesCommon.commonStyle(
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.mediumgrey,
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: SizedBox(
                                          width: AppSize.s45,
                                          height: AppSize.s50,
                                          child: Image.asset(
                                            'images/1.png', // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 22,
                                        bottom: 1,
                                        child: Container(
                                          width: 19,
                                          height: 19,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF527FB9),
                                              borderRadius:
                                              BorderRadius.circular(3)),
                                          child: Center(
                                            child: Text(
                                              "ST",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                                color: ColorManager.white,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: AppSize.s12),
                                  Text(
                                    'James',
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.textBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                     // color: Color(0xFFE2F2F8),
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
                                  // SizedBox(width: 20,),
                                  Text(
                                    "Scheduled",
                                    textAlign: TextAlign.start,
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.Violet,
                                    ),
                                  ),
                                  //  SizedBox(width: 40,),
                                  Text(
                                    "SOC Completed",
                                    textAlign: TextAlign.start,
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.greenDark,
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
                                  InkWell(
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
                                ],
                              ),
                            ),
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
            height: 450,
            width: 500,
            child: ChatBotContainer(
              onClose: _toggleChatbotVisibility,
            ),
          )),
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
          child: SingleChildScrollView(
            // Wrap the Column inside SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p10),
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
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                  onTap: toggleContainerM,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Marketer",
                          style: AllHRTableData.customTextStyle(context),
                        ),
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
                  onTap: toggleContainerO,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                  onTap: toggleContainerR,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                      ? Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search,
                                    size: 20, color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color of the bottom border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color when focused
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
                                ),
                              ],
                            ),
                          ],
                        )
                      : null,
                ),
                Divider(),
                InkWell(
                  onTap: toggleContainerA,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                  onTap: toggleContainerI,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                  onTap: toggleContainerIC,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                      ? Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Icon(Icons.search,
                                    size: 20, color: Colors.grey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color of the bottom border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .grey), // Set the color when focused
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
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
                                  style: DocDefineTableDataID.customTextStyle(
                                      context),
                                ),
                              ],
                            ),
                          ],
                        )
                      : null,
                ),

                Divider(),
                InkWell(
                  onTap: toggleContainerP,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
                      ? Column(children: [
                          TextField(
                            controller: assigndatecontroller,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Date Range',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .grey), // Set the color of the bottom border
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .grey), // Set the color when focused
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                            onChanged: (value) {
                              // Handle search logic here (e.g., filtering options)
                            },
                            onTap: () async {
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
                        ])
                      : null,
                ),
                Divider(),
                // Example filter fields
                InkWell(
                  onTap: toggleContainerM,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p10, right: AppPadding.p13),
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
