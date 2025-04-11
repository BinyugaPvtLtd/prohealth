import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../widgets/intake_profile_bar.dart';

class DocumationScreenTab extends StatefulWidget {
  const DocumationScreenTab({super.key});

  @override
  State<DocumationScreenTab> createState() => _DocumationScreenTabState();
}

class _DocumationScreenTabState extends State<DocumationScreenTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 80,left: 80,bottom: 5),
        child: Column(
          children: [
            SizedBox(height: AppSize.s10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text(
                'Review and confirm the data pulled is correct',
          style: TextStyle(fontSize: FontSize.s12,
          fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
          color: ColorManager.granitegray,),)
      
            ],),
            SizedBox(height: AppSize.s5,),
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
            BlueBGHeadConst(HeadText: "Clinical Attachments"),
            SizedBox(height: AppSize.s10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 35),
             child: Column(
               children: [
                 Container(
                   height: AppSize.s75,
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
                                 Text(
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
                             child: Text(
                               "Contents: Progress Notes, Medication Profile, Demographics",
                               style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                 fontWeight: FontWeight.w600,
                                 color: ColorManager.cream,),
                             ),
                           ),
                         ),
                       ),
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
                             onPressed: () {
      
                               // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                             },
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
           ),
            SizedBox(height: AppSize.s10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s75,
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
                                  Text(
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
                              child: Text(
                                "Contents: Progress Notes, Medication Profile, Demographics",
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.cream,),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed: () {
      
                                // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                              },
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
            ),
            SizedBox(height: AppSize.s15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton.icon(onPressed: () {
      
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
            BlueBGHeadConst(HeadText: "Billing Attachments"),
            SizedBox(height: AppSize.s10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s75,
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
                                  Text(
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
                              child: Text(
                                "Contents: Progress Notes, Medication Profile, Demographics",
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.cream,),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed: () {
      
                                // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                              },
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
            ),
            SizedBox(height: AppSize.s10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s75,
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
                                  Text(
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
                              child: Text(
                                "Contents: Progress Notes, Medication Profile, Demographics",
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.cream,),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed: () {
      
                                // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                              },
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
            ),
            SizedBox(height: AppSize.s15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton.icon(onPressed: () {
      
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s75,
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
                                  Text(
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
                              child: Text(
                                "Contents: Progress Notes, Medication Profile, Demographics",
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.cream,),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed: () {
      
                                // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                              },
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
            ),
            SizedBox(height: AppSize.s10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Container(
                    height: AppSize.s75,
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
                                  Text(
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
                              child: Text(
                                "Contents: Progress Notes, Medication Profile, Demographics",
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.cream,),
                              ),
                            ),
                          ),
                        ),
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
                              onPressed: () {
      
                                // DowloadFile().downloadPdfFromBase64(fileExtension,"Compensation");
      
      
                              },
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
            ),
            SizedBox(height: AppSize.s15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton.icon(onPressed: () {
      
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
          ],
        ),
      ),
    );
  }
}
