import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/services/api_sm/company_identity/add_doc_company_manager.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';

import 'widgets/contract_add_dialog.dart';

class CiInsuranceContract extends StatefulWidget {
  const CiInsuranceContract({super.key});

  @override
  State<CiInsuranceContract> createState() => _CiInsuranceContractState();
}

class _CiInsuranceContractState extends State<CiInsuranceContract> {
  TextEditingController contractNameController = TextEditingController();
  TextEditingController contractIdController = TextEditingController();
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
    //_companyManager = CompanyIdentityManager();
    // companyAllApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: 354,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color(0xff686464).withOpacity(0.5),
                      width: 1), // Black border
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: DropdownButtonFormField<String>(
                  focusColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Color(0xff686464),
                  ),
                  decoration: InputDecoration.collapsed(hintText: ''),
                  items: <String>[
                    'Sample Vendor',
                    'Option 1',
                    'Option 2',
                    'Option 3',
                    'Option 4'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                  value: 'Sample Vendor',
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff686464),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              CustomIconButtonConst(
                  icon: Icons.add,
                  text: "Add Doctype",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ContractAddDialog(
                            contractNmaeController: contractNameController,
                            onSubmitPressed: () {},
                            contractIdController: contractIdController,

                          );
                        });
                  }),
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: ColorManager.blueprime,
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "ID: 248d1eb1-9020-4d8d-8168-43a3ef90a261",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.firaSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff686464),
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          Text(
                                            "NanDoc",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.firaSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff686464),
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  //  Text(''),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.history,
                                            color: ColorManager.blueprime,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.print_outlined,
                                            color: ColorManager.blueprime,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.file_download_outlined,
                                            color: ColorManager.blueprime,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            // showDialog(context: context, builder: (BuildContext context){
                                            //   return ContractAddDialog(contractNmaeController: contractNameController, onPressed: () {  }, contractIdController: contractIdController,);
                                            // });
                                          },
                                          icon: Icon(
                                            Icons.edit_outlined,
                                            color: ColorManager.blueprime,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete_outline,
                                            color: ColorManager.red,
                                          )),
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
          Container(
            height: 30,
            // color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.39),
                    border: Border.all(
                      color: ColorManager.grey,
                      width: 0.79,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: 1.5),
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        currentPage = currentPage > 1 ? currentPage - 1 : 1;
                      });
                    },
                    color: ColorManager.black,
                    iconSize: 20,
                  ),
                ),
                SizedBox(width: 3),
                for (var i = 1; i <= (items.length / itemsPerPage).ceil(); i++)
                  if (i == 1 ||
                      i == currentPage ||
                      i == (items.length / itemsPerPage).ceil())
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentPage = i;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: currentPage == i
                                ? ColorManager.blueprime
                                : ColorManager.grey,
                            width: currentPage == i ? 2.0 : 1.0,
                          ),
                          color: currentPage == i
                              ? ColorManager.blueprime
                              : Colors.transparent,
                          // border: Border.all(
                          //   color: currentPage == i
                          //       ? Colors.blue
                          //       : Colors.transparent,
                          // ),
                        ),
                        child: Text(
                          '$i',
                          style: TextStyle(
                            color:
                                currentPage == i ? Colors.white : Colors.grey,
                            fontWeight: FontWeightManager.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  else if (i == currentPage - 1 || i == currentPage + 1)
                    Text(
                      '..',
                      style: TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeightManager.bold,
                        fontSize: 12,
                      ),
                    ),
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.79,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: 2),
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        currentPage =
                            currentPage < (items.length / itemsPerPage).ceil()
                                ? currentPage + 1
                                : (items.length / itemsPerPage).ceil();
                      });
                    },
                    color: ColorManager.black,
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
