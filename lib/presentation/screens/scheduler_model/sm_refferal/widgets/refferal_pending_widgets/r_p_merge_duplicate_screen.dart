import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../em_module/manage_hr/manage_employee_documents/widgets/radio_button_tile_const.dart';
import '../../../../em_module/widgets/button_constant.dart';
import '../../../../em_module/widgets/text_form_field_const.dart';
import '../../../../hr_module/onboarding/download_doc_const.dart';

class RPMergeDuplicateScreen extends StatefulWidget {
  final VoidCallback onMergeBackPressed;

  const RPMergeDuplicateScreen({super.key, required this.onMergeBackPressed});

  @override
  State<RPMergeDuplicateScreen> createState() => _RPMergeDuplicateScreenState();
}

class _RPMergeDuplicateScreenState extends State<RPMergeDuplicateScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController patientsController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController(text: "1");
  String selectedType = "Insurance";
  bool isChecked = false;
  List<bool> isCheckedList = List.generate(5, (index) => false); // Initialize list with false

  bool firstNameChecked = false;
  bool lastNameChecked = false;
  bool patientsChecked = false;
  bool zipCodeChecked = false;
  bool referredChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 70),
      child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: widget.onMergeBackPressed,
                        child: Icon(
                          Icons.arrow_back,
                          size: IconSize.I16,
                          color: ColorManager.mediumgrey,
                        )),
                    Row(
                      children: [
                        Container(
                          width: AppSize.s105,
                          height: AppSize.s30,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: ColorManager.bluebottom,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TransparentButtonTextConst.customTextStyle(
                                  context),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        CustomElevatedButton(
                          width: AppSize.s105,
                          height: AppSize.s30,
                          text: "Submit",
                          color: ColorManager.bluebottom,
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          child: Column(children: [
                            Container(
                              height: 250,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border(
                                  top: BorderSide(
                                    color: ColorManager.bluebottom,
                                    width: 3,
                                  ),
                                ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: ColorManager.black.withOpacity(0.5),
                                //     offset: Offset(0, 4),
                                //     blurRadius: 4,
                                //     spreadRadius: 0,
                                //   ),
                                // ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 10,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: SizedBox(
                                      width: AppSize.s53,
                                      height: AppSize.s50,
                                      child: Image.asset(
                                        'images/1.png', // Replace with your image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "John S",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeight.w800,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                  Text(
                                      "C #1",
                                      textAlign: TextAlign.center,
                                      style: DocDefineTableDataID.customTextStyle(context)
                                  ),
                                  Text(
                                      "Sync 05/08/2024  | 6:35 PM",
                                      textAlign: TextAlign.center,
                                      style: DocDefineTableDataID.customTextStyle(context)
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [

                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("PCP ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Smam J",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Referral Source: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Sunshine Hospital",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Referral Date: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("09/15/2024",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Marketer: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Sophia Scott",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomElevatedButton(
                                  width: AppSize.s130,
                                  height: AppSize.s35,
                                  text: "Accept This",
                                  color: ColorManager.bluebottom,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BlueBGHeadConst(HeadText: "Patient Information"),
                            Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value:firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: lastNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Last Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child:SMCheckbox(
                                          value: lastNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              lastNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: patientsController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Patient or Caregiver Phone Number",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: patientsChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              patientsChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: zipCodeController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Zip Code",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: zipCodeChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              zipCodeChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Referred for",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: referredChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              referredChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Insurance"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [

                                  CustomRadioListTile(
                                    value: 'Insurance',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                    title: 'Insurance',
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Insurance Number",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMCheckbox(
                                        value: firstNameChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            firstNameChecked = value!;
                                          });
                                        },
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Text("Do you have secondary Insurance? ",
                                        style: DocDefineTableDataID.customTextStyle(context),  )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Secondary Insurance",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Suggested Plan Of Care"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child:SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Diagnosis"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Documents"),
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 30),
                              height: 450,
                              child: ScrollConfiguration(
                                behavior: ScrollBehavior().copyWith(scrollbars: false),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 2,//paginatedData.length,
                                    itemBuilder: (context, index) {
                                      //  int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                                      // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                                      var fileUrl = "url";//policiesdata.docurl;
                                      final fileExtension = fileUrl.split('/').last;

                                      Widget fileWidget;
                                      if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
                                        fileWidget = Image.network(
                                          fileUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(
                                              Icons.broken_image,
                                              size: IconSize.I45,
                                              color: ColorManager.faintGrey,
                                            );
                                          },
                                        );
                                      }
                                      else if (['pdf', 'doc', 'docx'].contains(fileExtension)) {
                                        fileWidget = Icon(
                                          Icons.description,
                                          size: IconSize.I45,
                                          color: ColorManager.faintGrey,
                                        );
                                      }
                                      else {
                                        fileWidget = Icon(
                                          Icons.insert_drive_file,
                                          size: IconSize.I45,
                                          color: ColorManager.faintGrey,
                                        );
                                      }
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p10),
                                            child: Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.symmetric(horizontal: AppSize.s5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(0xff000000).withOpacity(0.25),
                                                          spreadRadius: 0,
                                                          blurRadius: 4,
                                                          offset: const Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    height: AppSize.s65,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  print("FileExtension:${fileExtension}");
                                                                  downloadFile(fileUrl);
                                                                  //DowloadFile();
                                                                  //.downloadPdfFromBase64(fileExtension,"Acknowledgement");
                                                                },
                                                                child: Container(
                                                                    width: AppSize.s62,
                                                                    height: AppSize.s45,
                                                                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p8),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      border: Border.all(width: 2, color: ColorManager.faintGrey),
                                                                    ),
                                                                    child: SvgPicture.asset('images/doc_vector.svg')),
                                                              ),
                                                              SizedBox(width: AppSize.s10,),
                                                              Text(
                                                                "Document 1",
                                                                //policiesdata.fileName.toString(),
                                                                textAlign: TextAlign.center,
                                                                style:  DocDefineTableData.customTextStyle(context),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 150,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {},
                                                                // {
                                                                //   showDialog(
                                                                //     context: context,
                                                                //     builder: (context) =>
                                                                //         ManageHistoryPopup(
                                                                //           docHistory: 'new',//policiesdata.docHistory,
                                                                //         ),
                                                                //   );
                                                                // },
                                                                icon: Icon(
                                                                  Icons.history,
                                                                  size:IconSize.I22,color: IconColorManager.bluebottom,
                                                                ),
                                                                splashColor: Colors.transparent,
                                                                highlightColor: Colors.transparent,
                                                                hoverColor: Colors.transparent,
                                                              ),
                                                              SizedBox(width: AppSize.s5,),
                                                              ///print
                                                              IconButton(
                                                                onPressed: () {
                                                                  print("FileExtension:${fileExtension}");
                                                                  // DowloadFile()
                                                                  //     .downloadPdfFromBase64(
                                                                  //     fileExtension,
                                                                  //     "DME.pdf");
                                                                  downloadFile(fileUrl);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .print_outlined,
                                                                  size:IconSize.I22,color: IconColorManager.bluebottom,
                                                                ),
                                                                splashColor:
                                                                Colors.transparent,
                                                                highlightColor:
                                                                Colors.transparent,
                                                                hoverColor:
                                                                Colors.transparent,
                                                              ),
                                                              SizedBox(width: AppSize.s5,),
                                                              ///download saloni
                                                              PdfDownloadButton(apiUrl: "",// policiesdata.docurl,
                                                                iconsize: IconSize.I22,
                                                                documentName: "",//policiesdata.docName!
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0,left: 20),
                                                  child: SMCheckbox(
                                                    value: firstNameChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        firstNameChecked = value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ]),
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    ///column 2
                    Expanded(
                        child: Container(
                          child: Column(children: [
                            Container(
                              height: 250,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border(
                                  top: BorderSide(
                                    color: ColorManager.bluebottom,
                                    width: 3,
                                  ),
                                ),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: ColorManager.black.withOpacity(0.5),
                                //     offset: Offset(0, 4),
                                //     blurRadius: 4,
                                //     spreadRadius: 0,
                                //   ),
                                // ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 10,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: SizedBox(
                                      width: AppSize.s53,
                                      height: AppSize.s50,
                                      child: Image.asset(
                                        'images/1.png', // Replace with your image path
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "John S",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStylesCommon.commonStyle(
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeight.w800,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                  Text(
                                      "C #1",
                                      textAlign: TextAlign.center,
                                      style: DocDefineTableDataID.customTextStyle(context)
                                  ),
                                  Text(
                                      "Sync 05/08/2024  | 6:35 PM",
                                      textAlign: TextAlign.center,
                                      style: DocDefineTableDataID.customTextStyle(context)
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [

                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("PCP ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Smam J",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Referral Source: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Sunshine Hospital",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Referral Date: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("09/15/2024",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container()),
                                      Expanded(child: Container(
                                        child: Text("Marketer: ",style: DocDefineTableDataID.customTextStyle(context)),
                                      )),
                                      SizedBox(width: 50,),
                                      Expanded(child: Container(
                                        child: Text("Sophia Scott",style: DocDefineTableData.customTextStyle(context),),
                                      )),
                                      Expanded(flex: 2,child: Container()),
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomElevatedButton(
                                  width: AppSize.s130,
                                  height: AppSize.s35,
                                  text: "Accept This",
                                  color: ColorManager.bluebottom,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            BlueBGHeadConst(HeadText: "Patient Information"),
                            Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value:firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: lastNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Last Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child:SMCheckbox(
                                          value: lastNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              lastNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: patientsController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Patient or Caregiver Phone Number",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: patientsChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              patientsChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: zipCodeController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Zip Code",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: zipCodeChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              zipCodeChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Referred for",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: referredChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              referredChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Insurance"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [

                                  CustomRadioListTile(
                                    value: 'Insurance',
                                    groupValue: selectedType,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedType = value!;
                                      });
                                    },
                                    title: 'Insurance',
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Insurance Number",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMCheckbox(
                                        value: firstNameChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            firstNameChecked = value!;
                                          });
                                        },
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Text("Do you have secondary Insurance? ",
                                        style: DocDefineTableDataID.customTextStyle(context),  )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "Secondary Insurance",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Suggested Plan Of Care"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child:SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Diagnosis"),
                            Container(
                              padding: EdgeInsets.only(left: 25,top: 30),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SMTextFConst(
                                        controller: firstNameController,
                                        isAsteric: false,
                                        keyboardType: TextInputType.text,
                                        text: "First Name",
                                      ),
                                      SizedBox(width: AppSize.s15,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25.0),
                                        child: SMCheckbox(
                                          value: firstNameChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              firstNameChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            BlueBGHeadConst(HeadText: "Documents"),
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 30),
                              height: 450,
                              child: ScrollConfiguration(
                                behavior: ScrollBehavior().copyWith(scrollbars: false),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 2,//paginatedData.length,
                                    itemBuilder: (context, index) {
                                      //  int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                                      // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                                      var fileUrl = "url";//policiesdata.docurl;
                                      final fileExtension = fileUrl.split('/').last;

                                      Widget fileWidget;
                                      if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
                                        fileWidget = Image.network(
                                          fileUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(
                                              Icons.broken_image,
                                              size: IconSize.I45,
                                              color: ColorManager.faintGrey,
                                            );
                                          },
                                        );
                                      }
                                      else if (['pdf', 'doc', 'docx'].contains(fileExtension)) {
                                        fileWidget = Icon(
                                          Icons.description,
                                          size: IconSize.I45,
                                          color: ColorManager.faintGrey,
                                        );
                                      }
                                      else {
                                        fileWidget = Icon(
                                          Icons.insert_drive_file,
                                          size: IconSize.I45,
                                          color: ColorManager.faintGrey,
                                        );
                                      }
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p10),
                                            child: Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.symmetric(horizontal: AppSize.s5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: const Color(0xff000000).withOpacity(0.25),
                                                          spreadRadius: 0,
                                                          blurRadius: 4,
                                                          offset: const Offset(0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    height: AppSize.s65,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: (){
                                                                  print("FileExtension:${fileExtension}");
                                                                  downloadFile(fileUrl);
                                                                  //DowloadFile();
                                                                  //.downloadPdfFromBase64(fileExtension,"Acknowledgement");
                                                                },
                                                                child: Container(
                                                                    width: AppSize.s62,
                                                                    height: AppSize.s45,
                                                                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p8),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(4),
                                                                      border: Border.all(width: 2, color: ColorManager.faintGrey),
                                                                    ),
                                                                    child: SvgPicture.asset('images/doc_vector.svg')),
                                                              ),
                                                              SizedBox(width: AppSize.s10,),
                                                              Text(
                                                                "Document 1",
                                                                //policiesdata.fileName.toString(),
                                                                textAlign: TextAlign.center,
                                                                style:  DocDefineTableData.customTextStyle(context),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(width: 150,),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {},
                                                                // {
                                                                //   showDialog(
                                                                //     context: context,
                                                                //     builder: (context) =>
                                                                //         ManageHistoryPopup(
                                                                //           docHistory: 'new',//policiesdata.docHistory,
                                                                //         ),
                                                                //   );
                                                                // },
                                                                icon: Icon(
                                                                  Icons.history,
                                                                  size:IconSize.I22,color: IconColorManager.bluebottom,
                                                                ),
                                                                splashColor: Colors.transparent,
                                                                highlightColor: Colors.transparent,
                                                                hoverColor: Colors.transparent,
                                                              ),
                                                              SizedBox(width: AppSize.s5,),
                                                              ///print
                                                              IconButton(
                                                                onPressed: () {
                                                                  print("FileExtension:${fileExtension}");
                                                                  // DowloadFile()
                                                                  //     .downloadPdfFromBase64(
                                                                  //     fileExtension,
                                                                  //     "DME.pdf");
                                                                  downloadFile(fileUrl);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .print_outlined,
                                                                  size:IconSize.I22,color: IconColorManager.bluebottom,
                                                                ),
                                                                splashColor:
                                                                Colors.transparent,
                                                                highlightColor:
                                                                Colors.transparent,
                                                                hoverColor:
                                                                Colors.transparent,
                                                              ),
                                                              SizedBox(width: AppSize.s5,),
                                                              ///download saloni
                                                              PdfDownloadButton(apiUrl: "",// policiesdata.docurl,
                                                                iconsize: IconSize.I22,
                                                                documentName: "",//policiesdata.docName!
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0,left: 20),
                                                  child: SMCheckbox(
                                                    value: firstNameChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        firstNameChecked = value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ),
                          ]),
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
