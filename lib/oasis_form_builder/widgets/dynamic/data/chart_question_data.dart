import 'package:prohealth/oasis_form_builder/constants/app_strings.dart';
import 'package:prohealth/oasis_form_builder/constants/enums.dart';

import 'chart_option_data_model.dart';

class ChartQuestionDataModel {
  final AnswerType? answerType;
  final QuestionType? questionType;
  final String? title;
  final bool? dynamicType;
  final OptionsAlignment? optionsAlignment;
  final bool? groupOptions;
  final String? description;
  final int id;
  final int? answerId;
  final String? code;
  final List<ChartOptionDataModel>? options;

  ChartQuestionDataModel(
      {required this.options,
      required this.description,
      required this.questionType,
      required this.title,
      required this.groupOptions,
      required this.answerType,
      required this.code,
      required this.optionsAlignment,
      required this.id,
      required this.dynamicType,
      required this.answerId});

  ChartQuestionDataModel.fromJson(Map<String, dynamic> json)
      : answerType = json['type'] as String == AppStrings.checkBox
            ? AnswerType.checkbox
            : json['type'] as String == AppStrings.option
                ? AnswerType.option
                : json['type'] as String == AppStrings.textField
                    ? AnswerType.textBox
                    : AnswerType.none,
        questionType =
            json['question_type'] as String == AppStrings.comprehensive
                ? QuestionType.comprehensive
                : QuestionType.nonComprehensive,
        title = json['title'] ?? "",
        groupOptions = json['group_options'] ?? false,
        options = json['values']
                .map<ChartOptionDataModel>(
                    (element) => ChartOptionDataModel.fromJson(element))
                .toList() ??
            [],
        id = json['question_type_id'] as int,
        answerId = json['answer_id'] as int,
        code = json['code'] ?? "",
        dynamicType = json["dynamic_type"] as bool,
        optionsAlignment = json['options_alignment'] == AppStrings.horizontal
            ? OptionsAlignment.horizontal
            : OptionsAlignment.vertical,
        description = json['description'] ?? "";

  Map<String, dynamic> toJson() => {
        'question_type_id': id,
        'type': AnswerType.option == answerType
            ? AppStrings.option
            : AnswerType.checkbox == answerType
                ? AppStrings.checkBox
                : "",
        'questionType': QuestionType.comprehensive == questionType
            ? AppStrings.comprehensive
            : AppStrings.nonComprehensive,
        'title': title,
        'group_options': groupOptions,
        'description': description,
        'options': options,
      };
}
