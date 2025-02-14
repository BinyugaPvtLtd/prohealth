import 'package:flutter/material.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_option_data_model.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_checkbox_tab.dart';

import 'dynamic_option_section.dart';

class GroupDynamicCheckBoxSection extends StatefulWidget {
  const GroupDynamicCheckBoxSection(
      {super.key,
      required this.options,
      required this.onChanged,
      required this.answerId});
  final List<ChartOptionDataModel> options;
  final int answerId;
  final GroupDynamicOptionCallBack onChanged;
  @override
  State<GroupDynamicCheckBoxSection> createState() =>
      _GroupDynamicCheckBoxSection();
}

class _GroupDynamicCheckBoxSection extends State<GroupDynamicCheckBoxSection> {
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
        return DynamicCheckboxTab(
          label: value.label,
          value: value.value,
          selected: value.selected,
          onTap: (bool value, index) {
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
              for (int i = 0; i < option.length; i++) {
                if (i != index) {
                  option[i] = ChartOptionDataModel(
                      label: option[i].label,
                      value: option[i].value,
                      selected: false,
                      index: option[index].index);
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

class MultiDynamicCheckBox extends StatefulWidget {
  const MultiDynamicCheckBox(
      {super.key,
      required this.options,
      required this.multiSelectionClicked,
      required this.answerId});
  final List<ChartOptionDataModel> options;
  final MultiSelection multiSelectionClicked;
  final int answerId;

  @override
  State<MultiDynamicCheckBox> createState() => _MultiDynamicCheckBoxState();
}

class _MultiDynamicCheckBoxState extends State<MultiDynamicCheckBox> {
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
        return DynamicCheckboxTab(
          label: value.label,
          value: value.value,
          selected: value.selected,
          onTap: (bool value, index) {
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
            widget.multiSelectionClicked(output, widget.answerId);
          },
          index: i,
        );
      }).toList(),
    );
  }
}
