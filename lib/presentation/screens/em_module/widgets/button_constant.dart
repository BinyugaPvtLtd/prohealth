import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///button constant with transparent bg, colored text
class CustomButtonTransparentSM extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonTransparentSM({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'FiraSans',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFFF6928A),
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(0xFFF6928A)),
        ),
      ),
    );
  }
}

///custom button submit
class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  // final Color color;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double width;
  final double height;
  final TextStyle style;
  final Widget? child;

  const CustomElevatedButton({
    Key? key,
    this.text,
    required this.onPressed,
    // this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.paddingVertical = 12.0,
    this.paddingHorizontal = 16.0,
    this.width = 100,
    //this.width = double.infinity,
    this.height = 35.0,
    this.style = const TextStyle(color: Colors.white),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1696C8),
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: paddingVertical,
            horizontal: paddingHorizontal,
          ),
        ),
        child: text != null
            ? Text(text!,
                style: GoogleFonts.firaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ))
            : child,
      ),
    );
  }
}
