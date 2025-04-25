import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';

class CustomRadioListTile extends StatefulWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final String title;

  const CustomRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  _CustomRadioListTileState createState() => _CustomRadioListTileState();
}
class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
      child: Row(
         //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Radio<String>(
           splashRadius: 0,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
          // const SizedBox(width: 0),
          Text(
            widget.title,
            style: DocumentTypeDataStyle.customTextStyle(context),
          ),
        SizedBox( width: AppSize.s40,)
        ],
      ),
    );
  }
}
/// SM
class CustomRadioListTileSM extends StatefulWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final String title;
  final TextStyle? style;
  const CustomRadioListTileSM({super.key, required this.value, this.groupValue, required this.onChanged, required this.title, this.style});

  @override
  State<CustomRadioListTileSM> createState() => _CustomRadioListTileSMState();
}

class _CustomRadioListTileSMState extends State<CustomRadioListTileSM> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Radio<String>(
            splashRadius: 0,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
            activeColor: ColorManager.bluebottom,
          ),
          // const SizedBox(width: 0),
          Text(
            widget.title,
            style: widget.style ?? DocumentTypeDataStyle.customTextStyle(context),
          ),
          SizedBox( width: AppSize.s40,)
        ],
      ),
    );
  }
}



///sm physician info
class CustomRadioListTileSMp extends StatefulWidget {
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final String title;
  const CustomRadioListTileSMp({super.key, required this.value, this.groupValue, required this.onChanged, required this.title});

  @override
  State<CustomRadioListTileSMp> createState() => _CustomRadioListTileSMpState();
}

class _CustomRadioListTileSMpState extends State<CustomRadioListTileSMp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
        return Padding(
          padding: providerState.isContactTrue?EdgeInsets.only(top: 2,bottom: 2,right: 0) :EdgeInsets.only(top: 2,bottom: 2,right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Transform.scale(
                 scale:providerState.isContactTrue? 1.0:1.5,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: ColorManager.bluebottom, // border color when not selected
                  ),
                  child: Radio<String>(
                    splashRadius: 0,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    value: widget.value,
                    groupValue: widget.groupValue,
                    onChanged: widget.onChanged,
                    activeColor: ColorManager.bluebottom,
                  ),
                ),
              ),
              providerState.isContactTrue? SizedBox(width: 4):SizedBox(width: 8),
              Text(
                widget.title,
                style: providerState.isContactTrue ?SMTextfieldResponsiveHeadings.customTextStyle(context) :DocumentTypeDataStyle.customTextStyle(context),
              ),
              //SizedBox( width: AppSize.s50,)
            ],
          ),
        );
      }
    );
  }
}