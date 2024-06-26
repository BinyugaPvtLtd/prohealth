import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/pagination_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../app/resources/color.dart';
import '../../../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../../../app/resources/value_manager.dart';
import '../../../../../ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';

class CiCcdCapReports extends StatefulWidget {
  const CiCcdCapReports({super.key});

  @override
  State<CiCcdCapReports> createState() => _CiCcdCapReportsState();
}

class _CiCcdCapReportsState extends State<CiCcdCapReports> {
  late int currentPage;
  late int itemsPerPage;
  late List<String> items;
  String? selectedValue;
  TextEditingController docNamecontroller = TextEditingController();
  TextEditingController docIdController = TextEditingController();

  late List<Color> hrcontainerColors;
  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 6;
    items = List.generate(20, (index) => 'Item ${index + 1}');
    hrcontainerColors = List.generate(20, (index) => Color(0xffE8A87D));
    _loadColors();
  }
  void _loadColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < hrcontainerColors.length; i++) {
        int? colorValue = prefs.getInt('containerColor$i');
        if (colorValue != null) {
          hrcontainerColors[i] = Color(colorValue);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    List<String> currentPageItems = items.sublist(
      (currentPage - 1) * itemsPerPage,
      min(currentPage * itemsPerPage, items.length),
    );
    return Column(
      children: [
        Container(
          height: AppSize.s30,
          margin: EdgeInsets.symmetric(horizontal: AppMargin.m35),
          decoration: BoxDecoration(
            color: ColorManager.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: Text(
                    AppString.srNo,
                    style: RegisterTableHead.customTextStyle(context),
                  )),
              Center(
                  child: Text(
                    AppString.name,
                    style: RegisterTableHead.customTextStyle(context),
                  )),
              Center(
                  child: Text(
                    AppString.expiry,
                    style: RegisterTableHead.customTextStyle(context),
                  )),
              // Expanded(
              //     child: SizedBox(width: AppSize.s16,
              //     )),
              Center(
                  child: Text(
                    AppString.reminderthershold,
                    style: RegisterTableHead.customTextStyle(context),
                  )),
              // Center(child:
              // Text(AppString.eligibleClinician,style: RegisterTableHead.customTextStyle(context),),),
              Center(
                  child: Text(
                    AppString.actions,
                    style: RegisterTableHead.customTextStyle(context),
                  )),
            ],
          ),
        ),
        SizedBox(height: AppSize.s10,),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: currentPageItems.length,
            itemBuilder: (context, index) {
              int serialNumber =
                  index + 1 + (currentPage - 1) * itemsPerPage;
              String formattedSerialNumber =
              serialNumber.toString().padLeft(2, '0');
              return Column(
                children: [
                  SizedBox(height: AppSize.s5),
                  Container(
                    padding: EdgeInsets.only(bottom: AppPadding.p5),
                    margin: EdgeInsets.symmetric(horizontal: AppMargin.m50),
                    decoration: BoxDecoration(
                      color:ColorManager.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    height: AppSize.s56,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                            child: Text(
                              formattedSerialNumber,
                              style: ThemeManagerDark.customTextStyle(context),
                              textAlign: TextAlign.start,
                            )),
                        Center(
                            child: Text(
                              AppString.name,
                              style: ThemeManagerDark.customTextStyle(context),
                            )),
                        Center(
                            child: Text(
                              AppString.expiry,
                              style: ThemeManagerDark.customTextStyle(context),
                            )),
                        Center(
                            child: Text(
                              AppString.reminderthershold,
                              style: ThemeManagerDark.customTextStyle(context),
                            )),
                        Center(
                          child: Row(
                            children: [
                              IconButton(onPressed: (){
                                showDialog(context: context, builder: (context){
                                  return CCScreenEditPopup(
                                    idDocController: docIdController,
                                    nameDocController: docNamecontroller,
                                    onSavePressed: (){},
                                    child:  CICCDropdown(
                                      initialValue: 'Corporate & Compliance Documents',
                                      items: [
                                        DropdownMenuItem(value: 'Corporate & Compliance Documents', child: Text('Corporate & Compliance Documents')),
                                        DropdownMenuItem(value: 'HCO Number      254612', child: Text('HCO Number  254612')),
                                        DropdownMenuItem(value: 'Medicare ID      MPID123', child: Text('Medicare ID  MPID123')),
                                        DropdownMenuItem(value: 'NPI Number     1234567890', child: Text('NPI Number 1234567890')),
                                      ],),
                                    child1:   CICCDropdown(
                                      initialValue: 'CAP Reports',
                                      items: [
                                        DropdownMenuItem(value: 'CAP Reports', child: Text('Licenses')),
                                        DropdownMenuItem(value: 'HCO Number      254612', child: Text('HCO Number  254612')),
                                        DropdownMenuItem(value: 'Medicare ID      MPID123', child: Text('Medicare ID  MPID123')),
                                        DropdownMenuItem(value: 'NPI Number     1234567890', child: Text('NPI Number 1234567890')),
                                      ],),);
                                });
                              }, icon: Icon(Icons.edit_outlined,color: ColorManager.bluebottom,)),
                              SizedBox(width: 3,),
                              Icon(Icons.delete_outline_outlined, size:20,color: Color(0xffF6928A),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
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
    );
  }
}
