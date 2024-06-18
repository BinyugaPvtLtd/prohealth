import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/company_identity_zone/widgets/zone_widgets_constants.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../data/api_data/establishment_data/ci_manage_button/manage_zone_data.dart';
import '../../../../manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';

class CiZoneZipcode extends StatefulWidget {
  const CiZoneZipcode({super.key});

  @override
  State<CiZoneZipcode> createState() => _CiZoneZipcodeState();
}

class _CiZoneZipcodeState extends State<CiZoneZipcode> {
  late int currentPage;
  late int itemsPerPage;
  late List<String> items;
  TextEditingController countynameController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController mapController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  final StreamController<List<ManageZone>> _controller = StreamController<List<ManageZone>>();

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 6;
    items = List.generate(60, (index) => 'Item ${index + 1}');
    // orgDocumentGet(context).then((data) {
    //   _controller.add(data);
    // }).catchError((error) {
    //   // Handle error
    // });
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
                  'City Name',
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
//SizedBox(width: MediaQuery.of(context).size.width/7.5,),
                Text('Zip Code',textAlign: TextAlign.start,
                    style: GoogleFonts.firaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    )),

                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text('Map',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      )),
                ),
                Text(
                  'Landmark',
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Actions',
                  style: GoogleFonts.firaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    decoration: TextDecoration.none,
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
          // StreamBuilder<List<ManageZone>>(
          //   stream: _controller.stream,
          //   builder: (context, snapshot) {
          //     print('1111111');
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(
          //           color: ColorManager.blueprime,
          //         ),
          //       );
          //     }
          //     if (snapshot.data!.isEmpty) {
          //       return Center(
          //         child: Text(
          //           AppString.dataNotFound,
          //           style: CustomTextStylesCommon.commonStyle(
          //             fontWeight: FontWeightManager.medium,
          //             fontSize: FontSize.s12,
          //             color: ColorManager.mediumgrey,
          //           ),
          //         ),
          //       );
          //     }
          //     if (snapshot.hasData) {
          //       return
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: currentPageItems.length,
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
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Los Gatos',
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
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "94022",
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Map',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Statue of Liberty',
                                    style: GoogleFonts.firaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.mediumgrey,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context){
                                          return CIZoneAddPopup(
                                            onSavePressed: (){},
                                            title1: 'Zone Number',
                                            countynameController: countynameController,
                                            title2: 'Zip Codes',
                                            zipcodeController: zipcodeController,
                                            title3: 'Cities',
                                            mapController: mapController,
                                            landmarkController: landmarkController, title4: '',
                                          );
                                        });
                                      }, icon: Icon(Icons.edit_outlined,size:18,color: ColorManager.blueprime,)),
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context) => DeletePopup(onCancel: (){
                                          Navigator.pop(context);
                                        }, onDelete: (){}));
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
              }),
          //;
//   }
//   return Offstage();
// },
// ),
        ),
      ],
    );
  }
}