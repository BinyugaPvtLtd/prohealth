import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';
import '../widgets/intake_profile_bar.dart';
import 'add_popup_const.dart';

class DocumationScreenTab extends StatefulWidget {
  const DocumationScreenTab({super.key});

  @override
  State<DocumationScreenTab> createState() => _DocumationScreenTabState();
}

class _DocumationScreenTabState extends State<DocumationScreenTab> {

  TextEditingController ffdateController = TextEditingController();
  TextEditingController ffpostController = TextEditingController();
  TextEditingController ffappoController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Review and confirm the data pulled is correct',
                              style: SMItalicTextConst.customTextStyle(context))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Missing Paperwork: Therapy Notes',
                          style: TextStyle(fontSize: FontSize.s12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFC30909)),)

                      ],),
                    SizedBox(height: AppSize.s10,),
                    BlueBGHeadConst(HeadText: "Clinical Attachments*"),
                    SizedBox(height: AppSize.s10,),
                   Container(
                     child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: 3,
                         itemBuilder: (context,index){
                           return Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                             child: Column(
                               children: [
                                 Container(
                                   height: providerState.isContactTrue ? AppSize.s95 :AppSize.s75 ,
                                   decoration: BoxDecoration(
                                     color: ColorManager.white,
                                     borderRadius: BorderRadius.circular(8.0),
                                     boxShadow: [
                                       BoxShadow(
                                         color: ColorManager.black.withOpacity(0.2),
                                         spreadRadius: 1,
                                         blurRadius: 5,
                                         offset: Offset(0, 4),
                                       ),
                                     ],
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Row(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(left: 10.0),
                                             child: Container(
                                                 color: ColorManager.blueprime,
                                                 height: AppSize.s45,
                                                 width: AppSize.s65,
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(10),
                                                   child: Image.asset("images/sm/eye_outline.png",),
                                                 )

                                               // Icon(
                                               //   Icons.remove_red_eye_outlined,
                                               //   color: ColorManager.white,
                                               //   size: AppSize.s24,
                                               // ),
                                             ),
                                           ),
                                           SizedBox(width: 10),
                                           Padding(
                                             padding: const EdgeInsets.only(bottom: 4,top: 4),
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Text(
                                                   "Erica Thompson REF.pdf",
                                                   style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                     fontWeight: FontWeight.w600,
                                                     color: ColorManager.mediumgrey,),
                                                 ),
                                                 SizedBox(height:AppSize.s3 ),

                                                 //SizedBox(height: AppSize.s1),
                                                 providerState.isContactTrue ?Text(
                                                   "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                   style:  TextStyle(fontSize: FontSize.s12,
                                                     fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                     color: ColorManager.granitegray,),
                                                 ) :Text(
                                                   "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                   style:  TextStyle(fontSize: FontSize.s12,
                                                     fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                     color: ColorManager.granitegray,),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(right: 20),
                                         child: Container(
                                           child: Center(
                                             child: providerState.isContactTrue ?Text(
                                               "Contents: Progress Notes,\nMedication Profile, Demographics",
                                               style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                 fontWeight: FontWeight.w600,
                                                 color: ColorManager.cream,),
                                             ) :Text(
                                               "Contents: Progress Notes, Medication Profile, Demographics",
                                               style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                 fontWeight: FontWeight.w600,
                                                 color: ColorManager.cream,),
                                             ),
                                           ),
                                         ),
                                       ),
                                       providerState.isContactTrue ? Column(
                                         children: [
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               IconButton(
                                                 icon: Icon(
                                                     size: 25,
                                                     Icons.history,
                                                     color: ColorManager.granitegray
                                                 ),
                                                 onPressed: () {},
                                               ),
                                               SizedBox(width: 20),
                                               InkWell(
                                                 child: Image.asset("images/sm/telegram.png",height: 22,)
                                                 ,onTap:(){},),
                                               SizedBox(width: 20),
                                               IconButton(
                                                   icon: Icon(
                                                       size: 25,
                                                       Icons.print_outlined,
                                                       color:  ColorManager.granitegray
                                                   ),
                                                   onPressed: () {}
                                               ),

                                               //
                                               // SizedBox(width: 20),
                                             ],
                                           ),
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               SizedBox(width: 20),
                                               //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                               IconButton(
                                                 icon: Icon(
                                                   size: 25,
                                                   Icons.file_download_outlined,
                                                   color: Color(0xff686464),
                                                 ),
                                                 onPressed: () { },
                                               ),
                                               SizedBox(width: 15),
                                               IconButton(
                                                 onPressed: () {

                                                 },
                                                 icon: Icon(
                                                   Icons.delete_outline,
                                                   size: 25,
                                                   color: Color(0xff686464),
                                                 ),
                                               ),
                                               SizedBox(width: 30),
                                             ],
                                           )
                                         ],
                                       ):
                                       Row(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           IconButton(
                                             icon: Icon(
                                                 size: 25,
                                                 Icons.history,
                                                 color: ColorManager.granitegray
                                             ),
                                             onPressed: () {},
                                           ),
                                           SizedBox(width: 20),
                                           InkWell(
                                             child: Image.asset("images/sm/telegram.png",height: 22,)
                                             ,onTap:(){},),
                                           SizedBox(width: 20),
                                           IconButton(
                                               icon: Icon(
                                                   size: 25,
                                                   Icons.print_outlined,
                                                   color:  ColorManager.granitegray
                                               ),
                                               onPressed: () {}
                                           ),
                                           SizedBox(width: 20),
                                           //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                           IconButton(
                                             icon: Icon(
                                               size: 25,
                                               Icons.file_download_outlined,
                                               color: Color(0xff686464),
                                             ),
                                             onPressed: () { },
                                           ),
                                           SizedBox(width: 15),
                                           IconButton(
                                             onPressed: () {

                                             },
                                             icon: Icon(
                                               Icons.delete_outline,
                                               size: 25,
                                               color: Color(0xff686464),
                                             ),
                                           ),
                                           SizedBox(width: 30),
                                           //
                                           // SizedBox(width: 20),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           );
                         }),
                   ),

                    // SizedBox(height: AppSize.s10,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 35),
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         height: AppSize.s75,
                    //         decoration: BoxDecoration(
                    //           color: ColorManager.white,
                    //           borderRadius: BorderRadius.circular(8.0),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: ColorManager.black.withOpacity(0.2),
                    //               spreadRadius: 1,
                    //               blurRadius: 5,
                    //               offset: Offset(0, 4),
                    //             ),
                    //           ],
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(left: 10.0),
                    //                   child: Container(
                    //                       color: ColorManager.blueprime,
                    //                       height: AppSize.s45,
                    //                       width: AppSize.s65,
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.all(10),
                    //                         child: Image.asset("images/sm/eye_outline.png",),
                    //                       )
                    //                     // Icon(
                    //                     //   Icons.remove_red_eye_outlined,
                    //                     //   color: ColorManager.white,
                    //                     //   size: AppSize.s24,
                    //                     // ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 10),
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(bottom: 4,top: 4),
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         "Erica Thompson REF.pdf",
                    //                         style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                    //                           fontWeight: FontWeight.w600,
                    //                           color: ColorManager.mediumgrey,),
                    //                       ),
                    //                       SizedBox(height:AppSize.s3 ),
                    //
                    //                       //SizedBox(height: AppSize.s1),
                    //                       Text(
                    //                         "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                    //                         style:  TextStyle(fontSize: FontSize.s12,
                    //                           fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                    //                           color: ColorManager.granitegray,),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(right: 20),
                    //               child: Container(
                    //                 child: Center(
                    //                   child: Text(
                    //                     "Contents: Progress Notes, Medication Profile, Demographics",
                    //                     style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: ColorManager.cream,),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Row(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //               children: [
                    //                 IconButton(
                    //                   icon: Icon(
                    //                       size: 25,
                    //                       Icons.history,
                    //                       color: ColorManager.granitegray
                    //                   ),
                    //                   onPressed: () {},
                    //                 ),
                    //                 SizedBox(width: 20),
                    //                 InkWell(
                    //                   child: Image.asset("images/sm/telegram.png",height: 22,)
                    //                   ,onTap:(){},),
                    //                 SizedBox(width: 20),
                    //                 IconButton(
                    //                     icon: Icon(
                    //                         size: 25,
                    //                         Icons.print_outlined,
                    //                         color:  ColorManager.granitegray
                    //                     ),
                    //                     onPressed: () {}
                    //                 ),
                    //                 SizedBox(width: 20),
                    //                 //SizedBox(width: MediaQuery.of(context).size.width / 120),
                    //                 IconButton(
                    //                   icon: Icon(
                    //                     size: 25,
                    //                     Icons.file_download_outlined,
                    //                     color: Color(0xff686464),
                    //                   ),
                    //                   onPressed: () {
                    //
                    //                     // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
                    //
                    //
                    //                   },
                    //                 ),
                    //                 SizedBox(width: 15),
                    //                 IconButton(
                    //                   onPressed: () {
                    //
                    //                   },
                    //                   icon: Icon(
                    //                     Icons.delete_outline,
                    //                     size: 25,
                    //                     color: Color(0xff686464),
                    //                   ),
                    //                 ),
                    //                 SizedBox(width: 30),
                    //                 //
                    //                 // SizedBox(width: 20),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 35,
                          child: ElevatedButton.icon(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add  Clinical Attachment',);
                              },
                            );

                          },
                            label: Text(
                                "Add Attachment",
                                style: TextStyle(
                                  fontSize: FontSize.s13,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                )//BlueButtonTextConst.customTextStyle(context),
                            ),
                            icon:Icon(Icons.add),

                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorManager.bluebottom,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                              ),),
                          ),
                        )

                      ],
                    ),

                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Billing Attachments*"),
                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: providerState.isContactTrue ? AppSize.s95 :AppSize.s75 ,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                  color: ColorManager.blueprime,
                                                  height: AppSize.s45,
                                                  width: AppSize.s65,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10),
                                                    child: Image.asset("images/sm/eye_outline.png",),
                                                  )
                                                // Icon(
                                                //   Icons.remove_red_eye_outlined,
                                                //   color: ColorManager.white,
                                                //   size: AppSize.s24,
                                                // ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 4,top: 4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Erica Thompson REF.pdf",
                                                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w600,
                                                      color: ColorManager.mediumgrey,),
                                                  ),
                                                  SizedBox(height:AppSize.s3 ),

                                                  //SizedBox(height: AppSize.s1),
                                                  providerState.isContactTrue ?Text(
                                                    "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ) :Text(
                                                    "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Container(
                                            child: Center(
                                              child: providerState.isContactTrue ?Text(
                                                "Contents: Progress Notes,\nMedication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ) :Text(
                                                "Contents: Progress Notes, Medication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        providerState.isContactTrue ? Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                      size: 25,
                                                      Icons.history,
                                                      color: ColorManager.granitegray
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(width: 20),
                                                InkWell(
                                                  child: Image.asset("images/sm/telegram.png",height: 22,)
                                                  ,onTap:(){},),
                                                SizedBox(width: 20),
                                                IconButton(
                                                    icon: Icon(
                                                        size: 25,
                                                        Icons.print_outlined,
                                                        color:  ColorManager.granitegray
                                                    ),
                                                    onPressed: () {}
                                                ),

                                                //
                                                // SizedBox(width: 20),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 20),
                                                //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                                IconButton(
                                                  icon: Icon(
                                                    size: 25,
                                                    Icons.file_download_outlined,
                                                    color: Color(0xff686464),
                                                  ),
                                                  onPressed: () { },
                                                ),
                                                SizedBox(width: 15),
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.delete_outline,
                                                    size: 25,
                                                    color: Color(0xff686464),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                              ],
                                            )
                                          ],
                                        ):
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                  size: 25,
                                                  Icons.history,
                                                  color: ColorManager.granitegray
                                              ),
                                              onPressed: () {},
                                            ),
                                            SizedBox(width: 20),
                                            InkWell(
                                              child: Image.asset("images/sm/telegram.png",height: 22,)
                                              ,onTap:(){},),
                                            SizedBox(width: 20),
                                            IconButton(
                                                icon: Icon(
                                                    size: 25,
                                                    Icons.print_outlined,
                                                    color:  ColorManager.granitegray
                                                ),
                                                onPressed: () {}
                                            ),
                                            SizedBox(width: 20),
                                            //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                            IconButton(
                                              icon: Icon(
                                                size: 25,
                                                Icons.file_download_outlined,
                                                color: Color(0xff686464),
                                              ),
                                              onPressed: () { },
                                            ),
                                            SizedBox(width: 15),
                                            IconButton(
                                              onPressed: () {

                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                size: 25,
                                                color: Color(0xff686464),
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            //
                                            // SizedBox(width: 20),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 35,
                          child: ElevatedButton.icon(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Billing Attachment',);
                              },
                            );
                          },
                            label: Text(
                                "Add Attachment",
                                style: TextStyle(
                                  fontSize: FontSize.s13,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                )//BlueButtonTextConst.customTextStyle(context),
                            ),
                            icon:Icon(Icons.add),

                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorManager.bluebottom,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                              ),),
                          ),
                        )

                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Face to Face Encounter"),
                    SizedBox(height: AppSize.s10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child:providerState.isContactTrue ? Column(
                        children: [
                          Row(
                             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: SchedularTextField(
                                      controller:ffdateController ,
                                      labelText: 'F2F Date:',
                                      enable: false,
                                      showDatePicker:true
                                  )),
                              SizedBox(width: AppSize.s58),
                              Flexible(
                                  child: SizedBox(width:1)),
                              Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: CustomDropdownTextFieldsm(
                                        headText: 'Marketer',
                                        items: ['Spouse','Patient',],
                                        //dropDownMenuList: dropDownList,
                                        onChanged: (newValue) {

                                        }),
                                  )),
                              Flexible(
                                  child: SizedBox(width:0)),
                              // SizedBox(width: AppSize.s65),
                            ],
                          ),
                          Flexible(
                              child: SizedBox(width:100)),
                          Row(
                            children: [
                              Flexible(
                                  child: SchedularTextFieldcheckbox(
                                    enable: false,
                                    controller: ffpostController,
                                    labelText: 'Post-op Visit Note Needed',
                                    showDatePicker:true,
                                    initialCheckboxValue: true,
                                    onCheckboxChanged: (val) {
                                      print("Checkbox value: $val");
                                    },
                                  )),
                              SizedBox(width: AppSize.s58),
                              Flexible(
                                  child: SizedBox(width:1)),
                              Flexible(
                                  child: SchedularTextFieldcheckbox(
                                    enable: false,
                                    controller: ffappoController,
                                    labelText: 'F2F Appointment Needed',
                                    showDatePicker:true,
                                    initialCheckboxValue: false,
                                    onCheckboxChanged: (val) {
                                      print("Checkbox value: $val");
                                    },
                                  )),
                              Flexible(
                                  child: SizedBox(width:0)),
                            ],
                          )
                        ],
                      ) :Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: SchedularTextField(
                                        controller:ffdateController ,
                                        labelText: 'F2F Date:',
                                        enable: false,
                                        showDatePicker:true
                                    )),
                               SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: CustomDropdownTextFieldsm(
                                          headText: 'Marketer',
                                          items: ['Spouse','Patient',],
                                          //dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {

                                          }),
                                    )),
                                SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                        controller: ffpostController,
                                        labelText: 'Post-op Visit Note Needed',
                                        showDatePicker:true,
                                      initialCheckboxValue: true,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                               SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                        controller: ffappoController,
                                        labelText: 'F2F Appointment Needed',
                                        showDatePicker:true,
                                      initialCheckboxValue: false,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                                // Flexible(
                                //     child: SizedBox(width:0)),
                             SizedBox(width: AppSize.s105),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: providerState.isContactTrue ? AppSize.s95 :AppSize.s75 ,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                  color: ColorManager.blueprime,
                                                  height: AppSize.s45,
                                                  width: AppSize.s65,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10),
                                                    child: Image.asset("images/sm/eye_outline.png",),
                                                  )
                                                // Icon(
                                                //   Icons.remove_red_eye_outlined,
                                                //   color: ColorManager.white,
                                                //   size: AppSize.s24,
                                                // ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 4,top: 4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Erica Thompson REF.pdf",
                                                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w600,
                                                      color: ColorManager.mediumgrey,),
                                                  ),
                                                  SizedBox(height:AppSize.s3 ),

                                                  //SizedBox(height: AppSize.s1),
                                                  providerState.isContactTrue ?Text(
                                                    "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ) :Text(
                                                    "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Container(
                                            child: Center(
                                              child: providerState.isContactTrue ?Text(
                                                "Contents: Progress Notes,\nMedication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ) :Text(
                                                "Contents: Progress Notes, Medication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        providerState.isContactTrue ? Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                      size: 25,
                                                      Icons.history,
                                                      color: ColorManager.granitegray
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(width: 20),
                                                InkWell(
                                                  child: Image.asset("images/sm/telegram.png",height: 22,)
                                                  ,onTap:(){},),
                                                SizedBox(width: 20),
                                                IconButton(
                                                    icon: Icon(
                                                        size: 25,
                                                        Icons.print_outlined,
                                                        color:  ColorManager.granitegray
                                                    ),
                                                    onPressed: () {}
                                                ),

                                                //
                                                // SizedBox(width: 20),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 20),
                                                //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                                IconButton(
                                                  icon: Icon(
                                                    size: 25,
                                                    Icons.file_download_outlined,
                                                    color: Color(0xff686464),
                                                  ),
                                                  onPressed: () { },
                                                ),
                                                SizedBox(width: 15),
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.delete_outline,
                                                    size: 25,
                                                    color: Color(0xff686464),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                              ],
                                            )
                                          ],
                                        ):
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                  size: 25,
                                                  Icons.history,
                                                  color: ColorManager.granitegray
                                              ),
                                              onPressed: () {},
                                            ),
                                            SizedBox(width: 20),
                                            InkWell(
                                              child: Image.asset("images/sm/telegram.png",height: 22,)
                                              ,onTap:(){},),
                                            SizedBox(width: 20),
                                            IconButton(
                                                icon: Icon(
                                                    size: 25,
                                                    Icons.print_outlined,
                                                    color:  ColorManager.granitegray
                                                ),
                                                onPressed: () {}
                                            ),
                                            SizedBox(width: 20),
                                            //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                            IconButton(
                                              icon: Icon(
                                                size: 25,
                                                Icons.file_download_outlined,
                                                color: Color(0xff686464),
                                              ),
                                              onPressed: () { },
                                            ),
                                            SizedBox(width: 15),
                                            IconButton(
                                              onPressed: () {

                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                size: 25,
                                                color: Color(0xff686464),
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            //
                                            // SizedBox(width: 20),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 35,
                          child: ElevatedButton.icon(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Face to Face Attachment',);
                              },
                            );
                          },
                            label: Text(
                                "Add Attachment",
                                style: TextStyle(
                                  fontSize: FontSize.s13,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                )//BlueButtonTextConst.customTextStyle(context),
                            ),
                            icon:Icon(Icons.add),

                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorManager.bluebottom,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                              ),),
                          ),
                        )

                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Consents"),
                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: providerState.isContactTrue ? AppSize.s95 :AppSize.s75 ,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Container(
                                                  color: ColorManager.blueprime,
                                                  height: AppSize.s45,
                                                  width: AppSize.s65,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10),
                                                    child: Image.asset("images/sm/eye_outline.png",),
                                                  )
                                                // Icon(
                                                //   Icons.remove_red_eye_outlined,
                                                //   color: ColorManager.white,
                                                //   size: AppSize.s24,
                                                // ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 4,top: 4),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Erica Thompson REF.pdf",
                                                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w600,
                                                      color: ColorManager.mediumgrey,),
                                                  ),
                                                  SizedBox(height:AppSize.s3 ),

                                                  //SizedBox(height: AppSize.s1),
                                                  providerState.isContactTrue ?Text(
                                                    "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ) :Text(
                                                    "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca", //  'Expiry: ${snapshot.data![index].expDate.isNotEmpty ? note.expDate : 'N/A'}',
                                                    style:  TextStyle(fontSize: FontSize.s12,
                                                      fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                      color: ColorManager.granitegray,),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Container(
                                            child: Center(
                                              child: providerState.isContactTrue ?Text(
                                                "Contents: Progress Notes,\nMedication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ) :Text(
                                                "Contents: Progress Notes, Medication Profile, Demographics",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.cream,),
                                              ),
                                            ),
                                          ),
                                        ),
                                        providerState.isContactTrue ? Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                      size: 25,
                                                      Icons.history,
                                                      color: ColorManager.granitegray
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(width: 20),
                                                InkWell(
                                                  child: Image.asset("images/sm/telegram.png",height: 22,)
                                                  ,onTap:(){},),
                                                SizedBox(width: 20),
                                                IconButton(
                                                    icon: Icon(
                                                        size: 25,
                                                        Icons.print_outlined,
                                                        color:  ColorManager.granitegray
                                                    ),
                                                    onPressed: () {}
                                                ),

                                                //
                                                // SizedBox(width: 20),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(width: 20),
                                                //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                                IconButton(
                                                  icon: Icon(
                                                    size: 25,
                                                    Icons.file_download_outlined,
                                                    color: Color(0xff686464),
                                                  ),
                                                  onPressed: () { },
                                                ),
                                                SizedBox(width: 15),
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.delete_outline,
                                                    size: 25,
                                                    color: Color(0xff686464),
                                                  ),
                                                ),
                                                SizedBox(width: 30),
                                              ],
                                            )
                                          ],
                                        ):
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                  size: 25,
                                                  Icons.history,
                                                  color: ColorManager.granitegray
                                              ),
                                              onPressed: () {},
                                            ),
                                            SizedBox(width: 20),
                                            InkWell(
                                              child: Image.asset("images/sm/telegram.png",height: 22,)
                                              ,onTap:(){},),
                                            SizedBox(width: 20),
                                            IconButton(
                                                icon: Icon(
                                                    size: 25,
                                                    Icons.print_outlined,
                                                    color:  ColorManager.granitegray
                                                ),
                                                onPressed: () {}
                                            ),
                                            SizedBox(width: 20),
                                            //SizedBox(width: MediaQuery.of(context).size.width / 120),
                                            IconButton(
                                              icon: Icon(
                                                size: 25,
                                                Icons.file_download_outlined,
                                                color: Color(0xff686464),
                                              ),
                                              onPressed: () { },
                                            ),
                                            SizedBox(width: 15),
                                            IconButton(
                                              onPressed: () {

                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                size: 25,
                                                color: Color(0xff686464),
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            //
                                            // SizedBox(width: 20),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 35,
                          child: ElevatedButton.icon(onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Consents Attachment',);
                              },
                            );
                          },
                            label: Text(
                                "Add Attachment",
                                style: TextStyle(
                                  fontSize: FontSize.s13,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                  decoration: TextDecoration.none,
                                )//BlueButtonTextConst.customTextStyle(context),
                            ),
                            icon:Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  ColorManager.bluebottom,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                              ),),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: AppSize.s80),
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        CustomButtonTransparent(
                          text: "Cancel",
                          onPressed: () {

                          },
                        ),
                        CustomElevatedButton(
                          width: AppSize.s100,
                          text: AppString.save,
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s30),
                  ],
                ),
              ),
            ),
        );
      }
    );

  }
}
