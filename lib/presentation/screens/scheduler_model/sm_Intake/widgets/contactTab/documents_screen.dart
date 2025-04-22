import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';

class ContactDocumentScreen extends StatelessWidget {
   ContactDocumentScreen({super.key});


  bool isName = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: const Border(
                  top: BorderSide(
                    color: Color(0xFF579EBA),
                    width: 5,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            onChanged: (value) {
                  
                            },
                            value: isName,
                          ),
                          Text("Insurance Claim", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.mediumgrey,),)
                        ],
                      ),
                      Icon(Icons.add,color: ColorManager.bluebottom,)
                    ],
                  ),

                      Row(
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
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
      width: 80,
      height: 80,
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
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}