import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
///done by saloni and prachi
class ThemeManager {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 150;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Color(0xFF686464),
      fontWeight: FontWeight.w400,
    );
  }
}

class ThemeManagerDark {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 150;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Color(0xFF2A2827),
      fontWeight: FontWeight.w400,
    );
  }
}

class ThemeManagerLightblue {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width /120 ;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Color(0xff2B647F),
      fontWeight: FontWeight.w600,
    );
  }
}

class ThemeManagerWhite {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 130;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}

class ThemeManagerBlack {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 130;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }
}

class ThemeManagerAccentblue {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 130;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Colors.blueAccent,
      fontWeight: FontWeight.w200,
    );
  }
}

class ThemeManagerblue {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 120;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Color(0xff2B647F),
      fontWeight: FontWeight.w700,
    );
  }
}

class ThemeManageWhitebold {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 99;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}

class RegisterTableHead {
  static TextStyle customTextStyle(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width / 100;
    return GoogleFonts.firaSans(
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }
}

class AknowledgementStyleConst {
  static TextStyle customTextStyle(BuildContext context) {
    return GoogleFonts.firaSans(
      fontSize: 10,
      color: Color(0xFF000000),
      fontWeight: FontWeight.w500,
    );
  }
}

///common theme
class CustomTextStylesCommon {
  static TextStyle commonStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.firaSans(
      fontSize: fontSize ?? 14,
      color: color ?? Color(0xff4B89BA),
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }
}