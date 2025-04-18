import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';

import '../../../../../../app/resources/theme_manager.dart';

class CheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;
  final bool? isInfoIconVisible;

  CheckboxTile({
    this.isInfoIconVisible = false,
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
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            unselectedWidgetColor:
                ColorManager.bluebottom, // border color when unchecked
            checkboxTheme: CheckboxThemeData(
              side: BorderSide(
                  color: ColorManager.bluebottom, width: 2), // border styling
            ),
          ),
          child: Checkbox(
            splashRadius: 0,
            activeColor: ColorManager.bluebottom,
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
        SizedBox(
          width: 10,
        ),
        Text(
          widget.title,
          style: CustomTextStylesCommon.commonStyle(
            fontSize: AppSize.s12,
            fontWeight: FontWeight.w700,
            color: ColorManager.greylight,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        widget.isInfoIconVisible!
            ? const Icon(
                Icons.info_outline_rounded,
                color: Color(0xFF50B5E5),
              )
            : Offstage()
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
        SizedBox(
          width: 10,
        ),
        Text(
          widget.title,
          style: CustomTextStylesCommon.commonStyle(
              fontSize: AppSize.s12,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ],
    );
  }
}
