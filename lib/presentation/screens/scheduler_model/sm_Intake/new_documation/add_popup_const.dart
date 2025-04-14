import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
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
    return DialogueTemplate(
      width: AppSize.s420,
      height: AppSize.s500,
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
                                size: 17,
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
        // Visibility(
        //   visible: editDocProvider.showExpiryDateField,
        //   /// Conditionally display expiry date field
        //   child: HeaderContentConst(
        //     isAsterisk: true,
        //     heading: AppString.expiry_date,
        //     content: FormField<String>(
        //       builder: (FormFieldState<String> field) {
        //         return SizedBox(
        //           width: 354,
        //           height: 30,
        //           child: TextFormField(
        //             controller: editDocProvider.expiryDateController,
        //             cursorColor: ColorManager.black,
        //             style: DocumentTypeDataStyle.customTextStyle(context),
        //             decoration: InputDecoration(
        //               enabledBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                     color: ColorManager.fmediumgrey, width: 1),
        //                 borderRadius: BorderRadius.circular(6),
        //               ),
        //               focusedBorder: OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                     color: ColorManager.fmediumgrey, width: 1),
        //                 borderRadius: BorderRadius.circular(6),
        //               ),
        //               hintText: 'yyyy-mm-dd',
        //               hintStyle: DocumentTypeDataStyle.customTextStyle(context),
        //               border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(6),
        //                 borderSide: BorderSide(
        //                     width: 1, color: ColorManager.fmediumgrey),
        //               ),
        //               contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //               suffixIcon: Icon(Icons.calendar_month_outlined,
        //                   color: ColorManager.blueprime),
        //               errorText: field.errorText,
        //             ),
        //             onTap: () async {
        //               editDocProvider.pickDateValue(context);
        //               // DateTime? pickedDate = await showDatePicker(
        //               //   context: context,
        //               //   initialDate: DateTime.now(),
        //               //   firstDate: DateTime(1901),
        //               //   lastDate: DateTime(3101),
        //               // );
        //               // if (pickedDate != null) {
        //               //   editDocProvider.newDatePicked(pickedDate);
        //               //   expiryDateController.text =
        //               //       DateFormat('yyyy-MM-dd').format(pickedDate);
        //               // }
        //             },
        //             validator: (value) {
        //               if (value == null || value.isEmpty) {
        //                 return 'please select date';
        //               }
        //               return null;
        //             },
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
      ],
      bottomButtons:
      // editDocProvider.load
      //     ? SizedBox(
      //   height: AppSize.s30,
      //   width: AppSize.s30,
      //   child: CircularProgressIndicator(
      //     color: ColorManager.blueprime,
      //   ),
      // )
      //     :
      CustomElevatedButton(
        width: AppSize.s105,
        height: AppSize.s30,
        text: AppStringEM.submit,
        onPressed: () {},
      ),
      title: widget.title,
    );

  }
}
