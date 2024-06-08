import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/services/api_sm/company_identity/add_doc_company_manager.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/pagination_widget.dart';

import 'widgets/add_holiday_popup_const.dart';

class DefineHolidays extends StatefulWidget {
  const DefineHolidays({super.key});

  @override
  State<DefineHolidays> createState() => _DefineHolidaysState();
}

class _DefineHolidaysState extends State<DefineHolidays> {
  TextEditingController holidayNameController = TextEditingController();
  late CompanyIdentityManager _companyManager;
  late int currentPage;
  late int itemsPerPage;
  late List<String> items;
  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 5;
    items = List.generate(20, (index) => 'Item ${index + 1}');
    _companyManager = CompanyIdentityManager();
    // companyAllApi(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomIconButtonConst(
              icon: Icons.add,
              text: "Add New Holiday", onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AddHolidayPopup(controller: holidayNameController, onPressed: () {  },);
                });
          }),
          SizedBox(height: 5,),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text(''),
                  Text(
                    'Sr No',
                    style: GoogleFonts.firaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
//SizedBox(width: MediaQuery.of(context).size.width/7.5,),
                  Text('Holiday Name    ',textAlign: TextAlign.start,
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'Date           ',
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text('Actions',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.firaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        )),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child:
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  // int serialNumber =
                  //     index + 1 + (currentPage - 1) * itemsPerPage;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff000000).withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "0",
                                    // formattedSerialNumber,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff686464),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  // Text(''),
                                  Text(
                                    "Christmas",textAlign:TextAlign.center,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff686464),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  Text(
                                    "25 Dec 2024",textAlign:TextAlign.center,
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff686464),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  //  Text(''),
                                  Row(
                                    children: [
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (BuildContext context){
                                          return AddHolidayPopup(controller: holidayNameController, onPressed: () {  },);
                                        });
                                      }, icon: Icon(Icons.edit_outlined)),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: ColorManager.red,)),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          PaginationControlsWidget(
            currentPage: currentPage,
            items: items,
            itemsPerPage: itemsPerPage,
            onPreviousPagePressed: () {
              /// Handle previous page button press
              setState(() {
                currentPage = currentPage > 1 ? currentPage - 1 : 1;
              });
            },
            onPageNumberPressed: (pageNumber) {
              /// Handle page number tap
              setState(() {
                currentPage = pageNumber;
              });
            },
            onNextPagePressed: () {
              /// Handle next page button press
              setState(() {
                currentPage = currentPage < (items.length / itemsPerPage).ceil()
                    ? currentPage + 1
                    : (items.length / itemsPerPage).ceil();
              });
            },
          ),

        ],
      ),
    );
  }
}
