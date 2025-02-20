import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';

import '../../../../../../app/resources/theme_manager.dart';

class CheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;

  CheckboxTile({
    required this.title,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  _CheckboxTileState createState() => _CheckboxTileState();
}

class _CheckboxTileState extends State<CheckboxTile> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data:Theme.of(context).copyWith(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent
    ),
          child: Checkbox(
            splashRadius: 0,
            activeColor: ColorManager.blueprime,
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(_value);
              }
            },
          ),
        ),
        SizedBox(width: 10,),
        Text(widget.title,style: CustomTextStylesCommon.commonStyle(
          fontSize: AppSize.s12,
          fontWeight: FontWeight.w500,
          color: ColorManager.mediumgrey,),),
      ],


    );
  }
}

/// Use in Details Screen
class CheckboxTileDetails extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;

  CheckboxTileDetails({
    required this.title,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  _CheckboxTileDetailsState createState() => _CheckboxTileDetailsState();
}

class _CheckboxTileDetailsState extends State<CheckboxTileDetails> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: ColorManager.white),
          activeColor: ColorManager.blueprime,
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(_value);
            }
          },
        ),
        SizedBox(width: 10,),
        Text(widget.title,style: CustomTextStylesCommon.commonStyle(fontSize: AppSize.s12,
            fontWeight: FontWeight.w500,color: Colors.white),),
      ],


    );
  }
}
