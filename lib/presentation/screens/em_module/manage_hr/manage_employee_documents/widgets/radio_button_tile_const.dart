import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';

class CustomRadioListTile extends StatefulWidget {
  final String value;
  final String groupValue;
  final ValueChanged onChanged;
  final String title;

  const CustomRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  State<CustomRadioListTile> createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      value: widget.value,
      groupValue: widget.groupValue,
      onChanged: widget.onChanged,
      title: Text(widget.title,style: GoogleFonts.firaSans(
        fontSize: FontSize.s10,
        fontWeight: FontWeightManager.medium,
        color: ColorManager.mediumgrey,
        decoration: TextDecoration.none,
      ),),
    );
  }
}