import 'package:flutter/material.dart';
import 'package:prohealth/oasis_form_builder/constants/enums.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_option_data_model.dart';

import 'dynamic_option_tab.dart';

typedef GroupDynamicOptionCallBack(ChartOptionDataModel data, int answerId);

class GroupDynamicOption extends StatefulWidget {
  const GroupDynamicOption(
      {super.key,
      required this.options,
      required this.onChanged,
      required this.optionsAlignment,
      required this.answerId});
  final List<ChartOptionDataModel> options;
  final GroupDynamicOptionCallBack onChanged;
  final int answerId;
  final OptionsAlignment optionsAlignment;
  @override
  State<GroupDynamicOption> createState() => _GroupDynamicOptionState();
}

class _GroupDynamicOptionState extends State<GroupDynamicOption> {
  List<ChartOptionDataModel> option = [];
  @override
  void initState() {
    for (var opt in widget.options) {
      option.add(opt);
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Column(
      children: option.map((value) {
        i++;
        return DynamicOptionTab(
          label: value.label,
          value: value.value,
          selected: value.selected,
          onTap: (String value, index) {
            setState(() {
              option[index] = option[index].selected
                  ? ChartOptionDataModel(
                      label: option[index].label,
                      value: option[index].value,
                      selected: false,
                      index: option[i].index)
                  : ChartOptionDataModel(
                      label: option[index].label,
                      value: option[index].value,
                      selected: true,
                      index: option[i].index);
              for (int i = 0; i < option.length; i++) {
                if (i != index) {
                  option[i] = ChartOptionDataModel(
                      label: option[i].label,
                      value: option[i].value,
                      selected: false,
                      index: option[i].index);
                }
              }
            });
            widget.onChanged(option[index], widget.answerId);
          },
          index: i,
        );
      }).toList(),
    );
  }
}

typedef MultiSelection = Function(
    List<ChartOptionDataModel> list, int answerId);

class MultiDynamicOption extends StatefulWidget {
  const MultiDynamicOption(
      {super.key,
      required this.options,
      required this.multiSelectionClicked,
      required this.optionsAlignment,
      required this.answerId});
  final List<ChartOptionDataModel> options;
  final MultiSelection multiSelectionClicked;
  final int answerId;
  final OptionsAlignment optionsAlignment;

  @override
  State<MultiDynamicOption> createState() => _MultiDynamicOptionState();
}

class _MultiDynamicOptionState extends State<MultiDynamicOption> {
  List<ChartOptionDataModel> option = [];
  @override
  void initState() {
    for (var opt in widget.options) {
      option.add(opt);
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Column(
      children: option.map((value) {
        i++;
        return DynamicOptionTab(
          label: value.label,
          value: value.value,
          selected: value.selected,
          onTap: (String value, index) {
            setState(() {
              option[index] = option[index].selected
                  ? ChartOptionDataModel(
                      label: option[index].label,
                      value: option[index].value,
                      selected: false,
                      index: option[index].index)
                  : ChartOptionDataModel(
                      label: option[index].label,
                      value: option[index].value,
                      selected: true,
                      index: option[index].index);
            });
            List<ChartOptionDataModel> output = [];
            for (var a in option) {
              if (a.selected == true) {
                output.add(a);
              }
            }
            print("here");
            widget.multiSelectionClicked(output, widget.answerId);
          },
          index: i,
        );
      }).toList(),
    );
  }
}
