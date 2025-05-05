import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/establishment_resources/establishment_string_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../em_module/widgets/dialogue_template.dart';
import '../../../em_module/widgets/header_content_const.dart';

class AddPopupConstant extends StatefulWidget {
  final String title;
   AddPopupConstant({super.key, required this.title});

  @override
  State<AddPopupConstant> createState() => _AddPopupConstantState();
}

class _AddPopupConstantState extends State<AddPopupConstant> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        height: 450,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff1696C8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child:  Text(
                      widget.title,
                      style:PopupBlueBarText.customTextStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.type_of_the_document,
                    content: Container(
                      width: 354,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: DocumentTypeDataStyle.customTextStyle(context),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ///
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.name_of_the_document,
                    content: Container(
                      width: 354,
                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "",
                            style: DocumentTypeDataStyle.customTextStyle(context),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  /// upload  doc
                  HeaderContentConst(
                    isAsterisk: false,
                    heading: AppString.upload_document,
                    content: InkWell(
                      onTap:(){},
                      child: Container(
                        height: AppSize.s30,
                        width: AppSize.s354,
                        padding: EdgeInsets.only(left: AppPadding.p10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.containerBorderGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "",
                                      style: DocumentTypeDataStyle.customTextStyle(context),
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.all(4),
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.file_upload_outlined,
                                      color: ColorManager.black,
                                      size: 20,
                                    ),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

Spacer(),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomElevatedButton(
        width: AppSize.s105,
        height: AppSize.s30,
        text: AppStringEM.submit,
        onPressed: () {},
      ),
    ],
  ),
)


//Container(
//                   width: double.infinity, // Ensure full width
//                   height: 300, // Adjust height as needed
//                   child: Timeline(
//                     children: <Widget>[
//                       Container(height: 20, color: Colors.blue),
//                       Container(height: 20, color: Colors.green),
//                       Container(height: 20, color: Colors.red),
//                       Container(height: 20, color: Colors.orange),
//                      // Container(height: 20, color: Colors.pink),
//                     ],
//                     indicators: <Widget>[
//                       Icon(Icons.access_alarm,size: 10,),
//                       Icon(Icons.backup,size: 10,),
//                       Icon(Icons.accessibility_new,size: 10,),
//                       Icon(Icons.access_alarm,size: 10,),
//                     ],
//                     isLeftAligned: true,
//                     itemGap: 2.0,
//                     lineColor: Colors.blueAccent,
//                     indicatorSize: 20.0,
//                     indicatorColor: Colors.blue,
//                     strokeWidth: 3.0,
//                   ),
//                 ),

          ],
        ),
      ),

    );

    ///
    ///
    ///



    return DialogueTemplate(
      width: AppSize.s400,
      height: AppSize.s430,
      body: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderContentConst(
              isAsterisk: false,
              heading: AppString.type_of_the_document,
              content: Container(
                width: 354,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "",
                      style: DocumentTypeDataStyle.customTextStyle(context),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            ///
            HeaderContentConst(
              isAsterisk: false,
              heading: AppString.type_of_the_document,
              content: Container(
                width: 354,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorManager.fmediumgrey, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "",
                      style: DocumentTypeDataStyle.customTextStyle(context),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),
            /// upload  doc
            HeaderContentConst(
              isAsterisk: false,
              heading: AppString.upload_document,
              content: InkWell(
                onTap:(){},
                child: Container(
                  height: AppSize.s30,
                  width: AppSize.s354,
                  padding: EdgeInsets.only(left: AppPadding.p10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.containerBorderGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "",
                                style: DocumentTypeDataStyle.customTextStyle(context),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.all(4),
                              onPressed: (){},
                              icon: Icon(
                                Icons.file_upload_outlined,
                                color: ColorManager.black,
                                size: 20,
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),

      ],
      bottomButtons: CustomElevatedButton(
        width: AppSize.s105,
        height: AppSize.s30,
        text: AppStringEM.submit,
        onPressed: () {},
      ),
      title: widget.title,
    );


  }
}
