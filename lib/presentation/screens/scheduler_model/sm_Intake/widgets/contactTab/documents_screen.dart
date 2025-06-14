import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';

class ContactDocumentScreen extends StatefulWidget {
   ContactDocumentScreen({super.key});

  @override
  State<ContactDocumentScreen> createState() => _ContactDocumentScreenState();
}

class _ContactDocumentScreenState extends State<ContactDocumentScreen> {
  bool isName = false;
  bool isubform = false;
  bool isra = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 10),
        child: Container(
         // height: MediaQuery.of(context).size.height * 0.6,
          //padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)),
              //     border: const Border(
              //   top: BorderSide(color: Color(0xFF1696C8),width: 5)
              // ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 3,
                ),
                left: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                right: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: ColorManager.black.withOpacity(0.2),
              //     blurRadius: 2,
              //     spreadRadius: 1,
              //     offset: const Offset(0, 2), // Downward shadow
              //   ),
              // ],
            ),
            child: Container(
              //height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(12),
                  //bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)),
                border: const Border(
                    top: BorderSide(color: Color(0xFF1696C8),width: 5)
                ),
              ),
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        splashRadius: 0,
                        value: isName,
                        onChanged: (bool? value) {
                          setState(() {
                            isName = value ?? false;
                          });
                        },
                        side:  BorderSide(color: ColorManager.blueprime,width: 2), // 👈 blue border color
                        activeColor:ColorManager.blueprime,
                      ),
                      SizedBox(width: 3,),
                      Text("Insurance Claim", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.mediumgrey,),)
                    ],
                  ),
                  Icon(Icons.add,color: ColorManager.bluebottom,)
                ],
              ),
          SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                    SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                        ///
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                        ///
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            splashRadius: 0,
                            value: isubform,
                            onChanged: (bool? value) {
                              setState(() {
                                isubform = value ?? false;
                              });
                            },
                            side: const BorderSide(color: Color(0xFF1696C8),width: 2), // 👈 blue border color
                            activeColor:Color(0xFF1696C8),
                          ),
                          SizedBox(width: 3,),
                          Text("UB04 Form", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.mediumgrey,),)
                        ],
                      ),
                      Icon(Icons.add,color: ColorManager.bluebottom,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        ///
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                        ///
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),

                        ///
                        SizedBox(width: 80,
                          height: 80,)
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            splashRadius: 0,
                            value: isra,
                            onChanged: (bool? value) {
                              setState(() {
                                isra = value ?? false;
                              });
                            },
                            side: const BorderSide(color: Color(0xFF1696C8),width: 2), // 👈 blue border color
                            activeColor:Color(0xFF1696C8),
                          ),
                          SizedBox(width: 3,),
                          Text("Referral & Assessment", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.mediumgrey,),)
                        ],
                      ),
                      Icon(Icons.add,color: ColorManager.bluebottom,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                        ///
                        Column(
                          children: [
                            FileThumbnail(
                              onClose: () {
                                print("Close icon tapped");
                              },
                            ),
                            SizedBox(height: 8,),
                            Text("untitled.01", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),),
                            SizedBox(height: 8,),
                            Text("5.3MB", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),),
                          ],
                        ),
                        SizedBox(width: 80,
                          height: 80,)

                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),)
        ),
      ),
    );
  }
}






















class FileThumbnail extends StatelessWidget {
  final VoidCallback onClose;

  const FileThumbnail({
    Key? key,
    required this.onClose,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              "images/sm/d_file.png", // Hardcoded image path
              height: 70,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 16,
                color: ColorManager.mediumgrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}