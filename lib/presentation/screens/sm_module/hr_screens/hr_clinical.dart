import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/presentation/screens/sm_module/widgets/table_constant.dart';

import '../../../widgets/custom_icon_button_constant.dart';
import '../widgets/button_constant.dart';
import '../widgets/text_form_field_const.dart';

class HrClinicalScreen extends StatefulWidget {
   HrClinicalScreen({super.key});

  @override
  State<HrClinicalScreen> createState() => _HrClinicalScreenState();
}

class _HrClinicalScreenState extends State<HrClinicalScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController emailController = TextEditingController();

   late int currentPage;

   late int itemsPerPage;

   late List<String> items;

   @override
   void initState() {
     super.initState();
     currentPage = 1;
     itemsPerPage = 6;
     items = List.generate(20, (index) => 'Item ${index + 1}');
   }

  @override
  Widget build(BuildContext context) {
    List<String> currentPageItems = items.sublist(
      (currentPage - 1) * itemsPerPage,
      min(currentPage * itemsPerPage, items.length),
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 32,
              width: 103,
              padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
              decoration: BoxDecoration(
                color: Color(0xff50B5E5),
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: DropdownButtonFormField<String>(
                focusColor: Colors.transparent,
                icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                decoration: InputDecoration.collapsed(hintText: '',),
                items: <String>['Sort By','Available', 'Unavailable',]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                },
                value: 'Sort By',
                style: GoogleFonts.firaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff686464),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              width: 170,
              height: 32,
              child: CustomIconButtonConst(
                  text: 'Add Employee Type', icon: Icons.add,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          content: Container(
                            height: 273,
                            width: 309,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [IconButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, icon: Icon(Icons.close))],),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SMTextFConst(controller: nameController, keyboardType: TextInputType.text, text: 'Employee Type',),
                                    SizedBox(height: 15,),
                                    SMTextFConst(controller: addressController, keyboardType: TextInputType.streetAddress, text: 'Shorthand',),
                                    SizedBox(height: 15,),
                                    SMTextFConst(controller: emailController, keyboardType: TextInputType.emailAddress, text: 'Type of Employee',),
                                    SizedBox(height: 15,),
                                    Row(
                                      children: [
                                        Text('Color',
                                          style: GoogleFonts.firaSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff686464),
                                            decoration: TextDecoration.none,
                                          ),),
                                        SizedBox(width: 25,),
                            Container(
                              padding: EdgeInsets.all(3),
                              width: 61,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(width: 1, color: Colors.black26,
                                ),
                              ),
                              child: Container(
                                width: 57,
                                height: 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Color(0xffE8A87D),
                                ),
                              ),
                            )

                            ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,)
                              ],
                            ),
                          ),
                          actions: [
                            Center(
                              child: CustomElevatedButton(
                                  width: 105,
                                  height: 31,
                                  text: 'Add',
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             LoginScreen()));
                                  }),
                            )
                          ],
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
        SizedBox(height: 5,),
        TableHeadConstant(
            items: [
              TableHeadItem(text: 'Sr No', textAlign: TextAlign.start),
              TableHeadItem(text: 'EmployeeType', textAlign: TextAlign.start),
              TableHeadItem(text: 'Abbreviation', textAlign: TextAlign.start),
              TableHeadItem(text: 'Color', textAlign: TextAlign.start),
              TableHeadItem(text: 'Actions', textAlign: TextAlign.center),
            ]),
        SizedBox(height: 5,),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: currentPageItems.length,
              itemBuilder: (context, index) {
                int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                String formattedSerialNumber =
                serialNumber.toString().padLeft(2, '0');
                return Container(
                  margin: EdgeInsets.all(5,),
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
                    height: 56,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, right: 10),
                            height: 7,
                            width:7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xff008000)
                            ),
                          )
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              formattedSerialNumber,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.firaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff686464),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'License Vocational Nurse',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.firaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff686464),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'NC',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.firaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff686464),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Container(
                              width: 57,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xffE8A87D),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          content: Container(
                                            height: 283,
                                            width: 309,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [IconButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  }, icon: Icon(Icons.close))],),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Color',
                                                          style: GoogleFonts.firaSans(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w700,
                                                            color: Color(0xff686464),
                                                            decoration: TextDecoration.none,
                                                          ),),
                                                        SizedBox(width: 25,),
                                                        Container(
                                                          padding: EdgeInsets.all(3),
                                                          width: 61,
                                                          height: 22,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(2),
                                                            border: Border.all(width: 1, color: Colors.black26,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width: 57,
                                                            height: 16,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(2),
                                                              color: Color(0xffE4CCF3),
                                                            ),
                                                          ),
                                                        )
                        
                                                      ],
                                                    ),
                                                    SizedBox(height: 15,),
                                                    SMTextFConst(controller: nameController, keyboardType: TextInputType.text, text: 'Type',),
                                                    SizedBox(height: 15,),
                                                    SMTextFConst(controller: addressController, keyboardType: TextInputType.streetAddress, text: 'Shorthand',),
                                                    SizedBox(height: 15,),
                                                    SMTextFConst(controller: emailController, keyboardType: TextInputType.emailAddress, text: 'Type of Employee',),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            Center(
                                              child: CustomElevatedButton(
                                                  width: 105,
                                                  height: 31,
                                                  text: 'Save',
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) =>
                                                    //             LoginScreen()));
                                                  }),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Color(0xff898989),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Color(0xffF6928A),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
        ),
      ],
    );
  }
}