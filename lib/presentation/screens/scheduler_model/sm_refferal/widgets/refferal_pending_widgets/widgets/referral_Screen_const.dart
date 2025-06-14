import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';

class BlueBGHeadConst extends StatelessWidget {
  final String HeadText;
  const BlueBGHeadConst({super.key, required this.HeadText});

  @override
  Widget build(BuildContext context) {
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
        return Container(
          height: AppSize.s33,
          decoration: BoxDecoration(
            color: ColorManager.SMFBlue,
          ),
          padding: EdgeInsets.only(left: 25, right: 30),
          // margin: EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                HeadText,
                style:TextStyle(
                  fontSize: providerState.isContactTrue? FontSize.s13 :FontSize.s16,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.mediumgrey,
                ),
              ),
              Icon(
                Icons.arrow_drop_up_outlined,
                size: IconSize.I24,
                color: ColorManager.mediumgrey,
              ),
            ],
          ),
        );
      }
    );
  }
}


class SMCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SMCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: BorderSide(color: ColorManager.bluebottom,width: 2),
      splashRadius: 0,
      activeColor: ColorManager.bluebottom,
      value: value,
      onChanged: onChanged,
    );
  }
}




class CustomSearchFieldSM extends StatelessWidget {
  final VoidCallback onPressed;
   TextEditingController? searchController;
  final double? width;

   CustomSearchFieldSM({Key? key,required this.onPressed, this.width,  this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 381,
      height: 36,
      child: TextField(
        textCapitalization: TextCapitalization.words,
        style: DocumentTypeDataStyle.customTextStyle(context),
        controller: searchController,
        onChanged: (_) => onPressed(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF8F8F8),
          hintText: 'Search',
          alignLabelWithHint: true,
          hintStyle:  CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF7F7F7F),),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200,//Color(0xFFF0F0F0),
                width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Center(
              child: Image.asset(
                "images/sm/sm_refferal/magnifying_glass.png",
                height: IconSize.I24,
                width: IconSize.I24,
                //color: ColorManager.mediumgrey,
              ),
              //Image.asset("images/sm/search_icon.jpg",)
            ),
            onPressed: onPressed,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        ),
      ),
    );
  }
}
