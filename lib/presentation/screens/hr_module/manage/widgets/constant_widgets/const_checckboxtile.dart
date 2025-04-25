import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../app/resources/theme_manager.dart';

class CheckboxTile extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;
  final bool? isInfoIconVisible;
  final Image? icon;

  CheckboxTile({
    this.isInfoIconVisible = false,
    required this.title,
    this.initialValue = false,
    this.onChanged, this.icon,
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
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:  providerState.isContactTrue ? SMTextfieldResponsiveHeadings.customTextStyle(context) : SMTextfieldHeadings.customTextStyle(context)
                  //AllPopupHeadings.customTextStyle(context)
                ),
                SizedBox(width: 10,),
                widget.isInfoIconVisible!
                    ? widget.icon ??
                    SvgPicture.asset(
                  'images/sm/sm_refferal/i_circle.svg',
                  height: IconSize.I20,
                  width: IconSize.I20,
                )
                    : Offstage()
              ],
            ),
           //

          ],
        );
      }
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
