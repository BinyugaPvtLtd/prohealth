import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/manage_emp/equipment_manager.dart';
import 'package:prohealth/app/services/api_sm/company_identity/add_doc_company_manager.dart';
import 'package:prohealth/data/api_data/hr_module_data/manage/equipment_data.dart';
import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/hr_resources/string_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../../em_module/widgets/button_constant.dart';
import '../../../../../em_module/widgets/text_form_field_const.dart';

class InventoryHeadTabbar extends StatefulWidget {
  const InventoryHeadTabbar({super.key});

  @override
  State<InventoryHeadTabbar> createState() => _InventoryHeadTabbarState();
}

class _InventoryHeadTabbarState extends State<InventoryHeadTabbar> {
  TextEditingController vendorName = TextEditingController();
  final StreamController<List<EquipmentData>> equipementDataStreamController = StreamController<List<EquipmentData>>();

  late CompanyIdentityManager _companyManager;

  late int currentPage;

  late int itemsPerPage;

  late List<String> items;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    itemsPerPage = 20;
    items = List.generate(60, (index) => 'Item ${index + 1}');
    _companyManager = CompanyIdentityManager();
    // companyAllApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: equipementDataStreamController.stream,
      builder: (context,snapshot) {
        getEquipement(context).then((data) {
          equipementDataStreamController.add(data);
        }).catchError((error) {
          // Handle error
        });
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: CircularProgressIndicator(color: ColorManager.blueprime,),
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
                    color: ColorManager.mediumgrey),
              ));
        }
        if(snapshot.hasData){
          return Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height/3,
              child: Column(
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
                                AppString.srNo,
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
                              child: Text(AppStringHr.inventoryid,
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
                              child: Text(AppStringHr.docName,
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
                              child: Text('Device Description',
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
                              child: Text('Assign Date   ',
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
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var equipmentData = snapshot.data![index];
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
                                          color: Color(0xff000000)
                                              .withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    child: Padding(
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
                                                "${equipmentData.inventoryId}",
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
                                              child: Text(
                                                equipmentData.name,
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
                                              child: Text(
                                                equipmentData.givenId,
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
                                              child: Text(
                                                equipmentData.assignedDate.toString(),
                                                style: GoogleFonts.firaSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff686464),
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //  Text(''),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          );
                        }),

                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      }
    );
  }
}


class EquipmentAddPopup extends StatefulWidget {
  const EquipmentAddPopup({super.key});

  @override
  State<EquipmentAddPopup> createState() => _EquipmentAddPopupState();
}
TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController calenderController = TextEditingController();
class _EquipmentAddPopupState extends State<EquipmentAddPopup> {
  bool isLoading = false;
  String typeName = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: AppSize.s400,
        width: AppSize.s350,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p3,horizontal: AppPadding.p25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SMTextFConst(controller: idController, keyboardType: TextInputType.text, text: 'Id',),
                  SizedBox(height: AppSize.s16,),
                  SMTextFConst(controller:nameController, keyboardType: TextInputType.streetAddress, text: 'Name',),
                  SizedBox(height: AppSize.s16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type',
                        style: GoogleFonts.firaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff686464),
                          decoration: TextDecoration.none,
                        ),),
                      SizedBox(height: 2),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(top: 2,bottom: 1,left: 4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Color(0xffB1B1B1)), // Black border
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        child: DropdownButtonFormField<String>(
                          focusColor: Colors.transparent,
                          icon: Icon(Icons.arrow_drop_down_sharp,color: ColorManager.black,),
                          decoration: InputDecoration.collapsed(hintText: ''),
                          items: <String>['Cellular', 'A', 'B', 'C']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: GoogleFonts.roboto(color: Color(0xff686464),fontSize: 12,fontWeight: FontWeightManager.bold),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              typeName = newValue!;
                              print("Type::${typeName}");
                            });
                          },
                          value: 'Cellular',style: GoogleFonts.roboto(color: Color(0xff686464),fontSize: 12,fontWeight: FontWeightManager.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s16,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Assign Date',
                            style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff686464),
                              decoration: TextDecoration.none,
                            ),),
                        ],
                      ),
                      SizedBox(width: AppSize.s25,),
                      FormField<String>(
                        builder: (FormFieldState<String> field) {
                          return SizedBox(
                            width: 354,
                            height: 30,
                            child: TextFormField(
                              style: GoogleFonts.firaSans(
                                fontSize: FontSize.s12,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.mediumgrey,
                                //decoration: TextDecoration.none,
                              ),
                              controller: calenderController,
                              decoration: InputDecoration(
                                focusColor: ColorManager.mediumgrey,
                                hoverColor: ColorManager.mediumgrey,
                                hintText: 'dd-mm-yyyy',
                                hintStyle: GoogleFonts.firaSans(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.mediumgrey,
                                  //decoration: TextDecoration.none,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 1, color: ColorManager.mediumgrey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager
                                          .mediumgrey), // Set focused border color to red
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: ColorManager
                                          .mediumgrey), // Set enabled border color to red
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                                suffixIcon: Icon(Icons.calendar_month_outlined,
                                    color: ColorManager.blueprime),
                                errorText: field.errorText,
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1100),
                                  lastDate: DateTime(2026),
                                );
                                if (date != null) {
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(date);
                                  calenderController.text = formattedDate;
                                  field.didChange(formattedDate);
                                  // birthdayController.text =
                                  // date.toLocal().toString().split(' ')[0];
                                  // field.didChange(date.toLocal().toString().split(' ')[0]);
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please select date';
                                }
                                return null;
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width/22,),
                  Center(
                    child: isLoading ? SizedBox(
                      height: 25,
                        width: 25,
                        child: CircularProgressIndicator(color: ColorManager.blueprime,)):
                     CustomElevatedButton(
                        width: AppSize.s105,
                        height: AppSize.s30,
                        text: 'Add',
                        onPressed: () async{
                          setState(() {
                            isLoading = true;
                          });
                            await addEquipment(context, int.parse(idController.text), calenderController.text,
                                2, typeName, 11, nameController.text);
                            print("::${idController.text}");
                          print("::${typeName}");
                          print("::${calenderController.text}");
                          print("::${nameController.text}");
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pop(context);
                            nameController.clear();
                            idController.clear();
                            calenderController.clear();

                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
