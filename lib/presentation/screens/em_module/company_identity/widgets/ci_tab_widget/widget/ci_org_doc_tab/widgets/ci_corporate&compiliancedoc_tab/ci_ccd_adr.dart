import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../../../../app/resources/color.dart';
import '../../../../../../../../../../app/resources/const_string.dart';
import '../../../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../../../../app/services/api/managers/establishment_manager/org_doc_ccd.dart';
import '../../../../../../../../../../data/api_data/establishment_data/company_identity/ci_org_document.dart';
import '../../../../../../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../../../../../manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import '../../../../../ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';

class CICcdADR extends StatefulWidget {
  final int subDocID;
  final int docID;
   CICcdADR({super.key, required this.subDocID, required this.docID});

  @override
  State<CICcdADR> createState() => _CICcdADRState();
}

class _CICcdADRState extends State<CICcdADR> {
  late int currentPage;
  late int itemsPerPage;
  late List<String> items;
  TextEditingController docNameController = TextEditingController();
  TextEditingController docIdController = TextEditingController();
  final StreamController<List<CiOrgDocumentCC>> _controller = StreamController<List<CiOrgDocumentCC>>();

  String? selectedValue;
  late List<Color> hrcontainerColors;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 3;
    items = List.generate(20, (index) => 'Item ${index + 1}');
    hrcontainerColors = List.generate(20, (index) => Color(0xffE8A87D));
    // orgDocumentGet(context);
    _loadColors();
    orgSubDocumentGet(context, 11, widget.docID, widget.subDocID, 1, 6).then((data) {
      _controller.add(data);
    }).catchError((error) {
      // Handle error
    });
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
    return Column(
      children: [
        Container(
          height: AppSize.s30,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: ColorManager.fmediumgrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  AppString.srNo,
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  AppString.name,
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  AppString.expiry,
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  AppString.reminderthershold,
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  AppString.actions,
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppSize.s10),
        Expanded(
          child: StreamBuilder<List<CiOrgDocumentCC>>(
            stream: _controller.stream,
            builder: (context, snapshot) {
              print('1111111');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.blueprime,
                  ),
                );
              }
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    AppString.dataNotFound,
                    style: CustomTextStylesCommon.commonStyle(
                      fontWeight: FontWeightManager.medium,
                      fontSize: FontSize.s12,
                      color: ColorManager.mediumgrey,
                    ),
                  ),
                );
              }
              if (snapshot.hasData) {
                int totalItems = snapshot.data!.length;
                // int totalPages = (totalItems / itemsPerPage).ceil();
                List<CiOrgDocumentCC> currentPageItems = snapshot.data!.sublist(
                  (currentPage - 1) * itemsPerPage,
                  (currentPage * itemsPerPage) > totalItems
                      ? totalItems
                      : (currentPage * itemsPerPage),
                );
                return ListView.builder(
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
                            color: ColorManager.white,
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
                                  style: GoogleFonts.firaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff686464),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Center(
                                child: Text(
                                  currentPageItems[index].name.toString(),
                                  style: GoogleFonts.firaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff686464),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  currentPageItems[index].expiry.toString(),
                                  style: GoogleFonts.firaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff686464),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  currentPageItems[index]
                                      .reminderThreshold
                                      .toString(),
                                  style: GoogleFonts.firaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff686464),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.history,size:18,color: ColorManager.bluebottom,)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.print_outlined,size:18,color: ColorManager.bluebottom,)),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.file_download_outlined,size:18,color: ColorManager.bluebottom,)),
                                  IconButton(onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return CCScreenEditPopup(
                                        id: snapshot.data![index].docId,
                                        idDocController: docIdController,
                                        nameDocController: docNameController,
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
                                          initialValue: 'Licenses',
                                          items: [
                                            DropdownMenuItem(value: 'Licenses', child: Text('Licenses')),
                                            DropdownMenuItem(value: 'HCO Number      254612', child: Text('HCO Number  254612')),
                                            DropdownMenuItem(value: 'Medicare ID      MPID123', child: Text('Medicare ID  MPID123')),
                                            DropdownMenuItem(value: 'NPI Number     1234567890', child: Text('NPI Number 1234567890')),
                                          ],),);
                                    });
                                  }, icon: Icon(Icons.edit_outlined,size:18,color: ColorManager.bluebottom,)),
                                  IconButton(
                                      onPressed: (){
                                        showDialog(context: context,
                                            builder: (context) => DeletePopup(
                                                onCancel: (){
                                                  Navigator.pop(context);
                                                }, onDelete: (){
                                              // setState(() async{
                                              //   await deleteDocument(
                                              //       context,
                                              //       snapshot.data![index].docId!);
                                              //   orgSubDocumentGet(context, 11,
                                              //       widget.docID,
                                              //       widget.subDocID, 1, 6).then((data) {
                                              //     _controller.add(data);
                                              //   }).catchError((error) {
                                              //     // Handle error
                                              //   });
                                              // });
                                            }));
                                      }, icon: Icon(Icons.delete_outline,size:18,color: ColorManager.red,)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return Offstage();
            },
          ),
        ),
        // PaginationControlsWidget(
        //   currentPage: currentPage,
        //   items: items,
        //   itemsPerPage: itemsPerPage,
        //   onPreviousPagePressed: () {
        //     setState(() {
        //       currentPage = currentPage > 1 ? currentPage - 1 : 1;
        //     });
        //   },
        //   onPageNumberPressed: (pageNumber) {
        //     setState(() {
        //       currentPage = pageNumber;
        //     });
        //   },
        //   onNextPagePressed: () {
        //     setState(() {
        //       int totalPages = (items.length / itemsPerPage).ceil();
        //       currentPage = currentPage < totalPages ? currentPage + 1 : totalPages;
        //     });
        //   },
        // ),
      ],
    );
  }
}