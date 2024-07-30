import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/services/api_sm/company_identity/add_doc_company_manager.dart';

import '../../../../../em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';

class PayRatesHeadTabbar extends StatefulWidget {
  const PayRatesHeadTabbar({super.key});

  @override
  State<PayRatesHeadTabbar> createState() => _PayRatesHeadTabbarState();
}

class _PayRatesHeadTabbarState extends State<PayRatesHeadTabbar> {
  TextEditingController vendorName = TextEditingController();

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

  String selectedValue = 'Per visit';
  @override
  Widget build(BuildContext context) {
    String? _expiryType;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 25,
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xff44435E)),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: GoogleFonts.firaSans(
                          color: Color(0xff43425D),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: <String>['Per visit', 'Per hour', 'Per day']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
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
                    Expanded(
                      child: Center(
                        child: Text(
                          AppString.znNo,
                          style: GoogleFonts.firaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    //SizedBox(width: MediaQuery.of(context).size.width/7.5,),
                    Expanded(
                      child: Center(
                        child: Text('Type of Visit',
                            style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('Rate',
                            style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('Action',
                            style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    int serialNumber =
                        index + 1 + (currentPage - 1) * itemsPerPage;
                    String formattedSerialNumber =
                        serialNumber.toString().padLeft(2, '0');
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              height: 40,
                              child: Stack(children: [
                                Container(
                                  width: 5, //10
                                  color: ColorManager.blueprime,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            formattedSerialNumber,
                                            style: GoogleFonts.firaSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff686464),
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Text(''),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "Lab Drop off",
                                            style: GoogleFonts.firaSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff686464),
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            "0.00",
                                            style: GoogleFonts.firaSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff686464),
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                              height: 25,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFFF6928A)),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(
                                                                  0xFFF6928A)),
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color:
                                                            ColorManager.white),
                                                  ))),
                                        ),
                                      ) //  Text(''),
                                    ],
                                  ),
                                ),
                              ])),
                        ),
                      ],
                    );
                  }),
            ),
            // RadioListTile<String>(
            //   title: Text('Per zone',
            //     style: GoogleFonts.firaSans(
            //       fontSize: FontSize.s10,
            //       fontWeight: FontWeightManager.medium,
            //       color: ColorManager.mediumgrey,
            //       decoration: TextDecoration.none,
            //     ),),
            //   value: 'Per zone',
            //   groupValue: _expiryType,
            //   onChanged: (value) {
            //     setState(() {
            //       _expiryType = value;
            //     });
            //   },
            // ),
            // Row(
            //   children: [
            //     RadioListTile<String>(
            //       title: Text('Per zone',
            //         style: GoogleFonts.firaSans(
            //           fontSize: FontSize.s10,
            //           fontWeight: FontWeightManager.medium,
            //           color: ColorManager.mediumgrey,
            //           decoration: TextDecoration.none,
            //         ),),
            //       value: 'Per zone',
            //       groupValue: _expiryType,
            //       onChanged: (value) {
            //         setState(() {
            //           _expiryType = value;
            //         });
            //       },
            //     ),
            //     RadioListTile<String>(
            //       title: Text('Per milege',
            //         style: GoogleFonts.firaSans(
            //           fontSize: FontSize.s10,
            //           fontWeight: FontWeightManager.medium,
            //           color: ColorManager.mediumgrey,
            //           decoration: TextDecoration.none,
            //         ),),
            //       value: 'type2',
            //       groupValue: _expiryType,
            //       onChanged: (value) {
            //         setState(() {
            //           _expiryType = value;
            //         });
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
