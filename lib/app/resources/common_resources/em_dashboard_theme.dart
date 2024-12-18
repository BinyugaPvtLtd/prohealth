import 'package:flutter/material.dart';
import '../color.dart';
import '../font_manager.dart';
///general setting pie chart text
class GeneralSettingNumStyle {
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: FontSize.s30,
      fontWeight: FontWeight.w600,
      color: ColorManager.white,
      decoration: TextDecoration.none,
    );
  }
}

class GeneralSettingTextStyle {
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: FontSize.s14,
      fontWeight: FontWeight.w700,
      color: ColorManager.white,
      decoration: TextDecoration.none,
    );
  }
}
///all container head
class EmDashContainerHeadTextStyle {
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w700,
      color: ColorManager.mediumgrey,
      decoration: TextDecoration.none,
    );
  }
}
///hello container txt style
class EmDashHelloText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: FontSize.s28,
        color:ColorManager.bluebottom,
        fontWeight: FontWeight.w700,
    decoration: TextDecoration.none);
  }
}

class EmDashHelloSubText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: FontSize.s14,
        color:ColorManager.mediumgrey,
        fontWeight: FontWeight.w400,
    decoration: TextDecoration.none);
  }
}

///
class EmDashText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: FontSize.s16,
        color:ColorManager.mediumgrey,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none);
  }
}

///EM dash all listview head text
class EmDashListviewHeadText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: FontSize.s13,
        color:ColorManager.mediumgrey,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.none);
  }
}

///EM dash all listview data text
class EmDashListviewDataText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
        fontSize: FontSize.s12,
        color:ColorManager.black,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none);
  }
}

///view more text
class EmDashViewMoreText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeight.w600,
      color: ColorManager.bluebottom,
      decoration: TextDecoration.underline,
    );
  }
}

///remote staff
class EmDashstaffText{
  static TextStyle customTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeight.w600,
      color: ColorManager.black,
      decoration: TextDecoration.none,
    );
  }
}