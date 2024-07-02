import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/zone_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/company_identity_zone/widgets/zone_widgets_constants.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../data/api_data/establishment_data/zone/zone_model_data.dart';
import '../../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import '../../../manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';

class CIZoneZone extends StatefulWidget {
  final int companyID;
  final String officeId;
  const CIZoneZone({super.key, required this.companyID, required this.officeId});

  @override
  State<CIZoneZone> createState() => _CIZoneZoneState();
}

class _CIZoneZoneState extends State<CIZoneZone> {
  late int currentPage;
  late int itemsPerPage;
  late List<String> items;
  TextEditingController countynameController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController mapController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  final StreamController<List<AllZipCodeGet>> _zoneController = StreamController<List<AllZipCodeGet>>();

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 6;
    items = List.generate(60, (index) => 'Item ${index + 1}');
    getZipcodeSetup(context, widget.officeId, widget.companyID, 1, 15).then((data){
      _zoneController.add(data);
    }).catchError((error){

    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> currentPageItems = items.sublist(
      (currentPage - 1) * itemsPerPage,
      min(currentPage * itemsPerPage, items.length),
    );
    return  Column(
      children: [
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
                      'Zone Number',
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
                    child: Text('Zip Codes',
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
                    child: Text('County',
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
                    child: Text('Cities',
                        textAlign: TextAlign.start,
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
                    child: Text(
                      'Actions',
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
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
          child:
          StreamBuilder<List<AllZipCodeGet>>(
            stream: _zoneController.stream,
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
                return
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                int serialNumber =
                    index + 1 + (currentPage - 1) * itemsPerPage;
                String formattedSerialNumber =
                serialNumber.toString().padLeft(2, '0');
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
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.data![index].zoneId.toString(),
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                // Text(''),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.data![index].zipcode.toString(),
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.data![index].countyName.toString(),
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    snapshot.data![index].city.toString(),
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context){
                                          return CIZoneAddPopup(
                                              onSavePressed: ()async{},
                                            title: 'Edit Zone',
                                            title1: 'Zone Number',
                                            countynameController: countynameController,
                                            title2: 'Zip Codes',
                                            zipcodeController: landmarkController, );
                                          //   CIZoneEditPopup(
                                          //   onSavePressed: (){},
                                          //   title: 'Edit Zone',
                                          //   title1: 'Zone Number',
                                          //   countynameController: countynameController,
                                          //   // title2: 'Zip Codes',
                                          //   // landmarkController: landmarkController,
                                          // );
                                        });
                                      }, icon: Icon(Icons.edit_outlined,size:18,color: ColorManager.blueprime,)),
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context) => DeletePopup(onCancel: (){
                                          Navigator.pop(context);
                                        }, onDelete: ()async{
                                          await deleteZipCodeSetup(context, snapshot.data![index].zipcodeSetupId!);
                                          getZipcodeSetup(context, widget.officeId, widget.companyID, 1, 15).then((data){
                                            _zoneController.add(data);
                                          }).catchError((error){
                                          });
                                          Navigator.pop(context);
                                        }));
                                      }, icon: Icon(Icons.delete_outline,size:18,color: ColorManager.faintOrange,)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                );
              })
          ;
  }
  return Offstage();
},
),
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
    );
  }
}
