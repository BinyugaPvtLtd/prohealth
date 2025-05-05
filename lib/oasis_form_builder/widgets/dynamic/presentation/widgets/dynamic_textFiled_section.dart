import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_option_data_model.dart';

import '../../../../../app/resources/color.dart';
import 'dynamic_option_section.dart';

class TextFieldSection extends StatefulWidget {
  const TextFieldSection(
      {super.key,
      required this.options,
      required this.onChanged,
      required this.answerId});
  final List<ChartOptionDataModel> options;
  final MultiSelection onChanged;
  final int answerId;
  @override
  State<TextFieldSection> createState() => _TextFieldSection();
}

class _TextFieldSection extends State<TextFieldSection> {
  List<ChartOptionDataModel> option = [];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    for (var opt in widget.options) {
      option.add(opt);
    }
    controllers = List.generate(
      widget.options.length,
      (index) => TextEditingController(text: widget.options[index].value),
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Column(
      children: option.map((value) {
        i++;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          child: Container(
            height: 100,
            width: double.maxFinite,
            child: Column(
              children: [
                Expanded(
                  child: Html(
                    data: value.label,
                    style: {
                      "h1": Style(
                        color: const Color(0xff686464), // Customize text color
                        fontSize: FontSize(24), // Set font size
                        fontWeight: FontWeight.bold, // Make it bold
                      ),
                      "p": Style(
                        color: const Color(0xff686464), // Set text color
                      ),
                      "b": Style(
                        color: const Color(0xff686464), // Style for <b> tags
                      ),
                    },
                  ),
                ),
                Container(
                  child: TextField(
                    controller: controllers[i],
                    onChanged: (value) {
                      List<ChartOptionDataModel> list = [];
                      int i = 0;
                      for (var a in widget.options) {
                        list.add(ChartOptionDataModel(
                            index: a.index,
                            label: a.label,
                            value: controllers[i].text,
                            selected:
                                controllers[i].text.isNotEmpty ? true : false));
                        i++;
                      }
                      widget.onChanged(list, widget.answerId);
                    },
                    // onSubmitted: (value) {
                    //   List<ChartOptionDataModel> list = [];
                    //   int i = 0;
                    //   for (var a in widget.options) {
                    //     list.add(ChartOptionDataModel(
                    //         index: a.index,
                    //         label: a.label,
                    //         value: controllers[i].text,
                    //         selected:
                    //             controllers[i].text.isNotEmpty ? true : false));
                    //     i++;
                    //   }
                    //   widget.onChanged(list, widget.answerId);
                    // },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter here",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorManager.grey)),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
