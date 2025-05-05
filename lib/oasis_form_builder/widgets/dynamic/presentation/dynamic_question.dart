import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:prohealth/oasis_form_builder/constants/enums.dart';
import 'package:prohealth/oasis_form_builder/services/provider/form_builder_provider.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_option_data_model.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_checkbox_section.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_option_section.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_textFiled_section.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/dialogue_template.dart';
import 'package:provider/provider.dart';

class DynamicQuestion extends StatelessWidget {
  final String title;
  final AnswerType type;
  final String code;
  final List<ChartOptionDataModel> options;
  final String description;
  final bool groupOptions;
  final int answerId;
  final OptionsAlignment optionsAlignment;
  const DynamicQuestion({
    super.key,
    required this.title,
    required this.type,
    required this.code,
    required this.options,
    required this.description,
    required this.groupOptions,
    required this.optionsAlignment,
    required this.answerId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        elevation: 4,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  code.isNotEmpty
                      ? InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => DialogueTemplate(
                                      width: 300,
                                      height: 200,
                                      body: [Text("Dummy Description")],
                                      bottomButtons: SizedBox(),
                                      title: 'Description',
                                    ));
                          },
                          child: Text(
                            "($code)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color(0xffFF0000),
                                    fontWeight: FontWeight.bold),
                          ))
                      : SizedBox(
                          width: 1,
                        ),
                  Expanded(
                    child: Html(
                      data: title,
                    ),
                  ),
                ],
              ),
              Html(data: description),
              type == AnswerType.option
                  ? groupOptions
                      ? GroupDynamicOption(
                          options: options,
                          onChanged: (data, answerId) {
                            Provider.of<FormBuilderProvider>(context,
                                    listen: false)
                                .addOption(
                                    data: data,
                                    answerId: answerId,
                                    isGrouped: true);
                          },
                          optionsAlignment: optionsAlignment,
                          answerId: answerId,
                        )
                      : MultiDynamicOption(
                          options: options,
                          multiSelectionClicked: (data, answerId) {
                            List list = [];
                            for (var a in data) {
                              list.add({
                                "index": a.index,
                                "label": a.label,
                                "value": a.value,
                                "selected": a.selected
                              });
                            }
                            Provider.of<FormBuilderProvider>(context,
                                    listen: false)
                                .addMultiOption(
                                    data: list,
                                    answerId: answerId,
                                    isGrouped: true);
                          },
                          optionsAlignment: optionsAlignment,
                          answerId: answerId,
                        )
                  : type == AnswerType.checkbox
                      ? groupOptions
                          ? GroupDynamicCheckBoxSection(
                              options: options,
                              onChanged: (data, answerId) {
                                Provider.of<FormBuilderProvider>(context,
                                        listen: false)
                                    .addOption(
                                        data: data,
                                        answerId: answerId,
                                        isGrouped: true);
                              },
                              answerId: answerId,
                            )
                          : MultiDynamicCheckBox(
                              options: options,
                              multiSelectionClicked: (data, answerId) {
                                List list = [];
                                for (var a in data) {
                                  list.add({
                                    "index": a.index,
                                    "label": a.label,
                                    "value": a.value,
                                    "selected": a.selected
                                  });
                                }
                                Provider.of<FormBuilderProvider>(context,
                                        listen: false)
                                    .addMultiOption(
                                        data: list,
                                        answerId: answerId,
                                        isGrouped: true);
                              },
                              answerId: answerId,
                            )
                      : type == AnswerType.textBox
                          ? TextFieldSection(
                              options: options,
                              onChanged: (data, answerId) {
                                List list = [];
                                for (var a in data) {
                                  list.add({
                                    "index": a.index,
                                    "label": a.label,
                                    "value": a.value,
                                    "selected": a.selected
                                  });
                                }
                                Provider.of<FormBuilderProvider>(context,
                                        listen: false)
                                    .addMultiOption(
                                        data: list,
                                        answerId: answerId,
                                        isGrouped: false);
                              },
                              answerId: answerId,
                            )
                          : SizedBox(
                              height: 1,
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
