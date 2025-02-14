import 'package:flutter/cupertino.dart';
import 'package:prohealth/oasis_form_builder/widgets/static/widgets/code_m0154/question_code_m0154.dart';
import 'package:prohealth/oasis_form_builder/widgets/static/widgets/code_m0155/question_code_m0155.dart';

class StaticQuestionRepository {
  final Map<int, Widget> staticQuestion = {
    154: QuestionCodeM0154(),
    155: QuestionCodeM0155(),
  };

  Widget? getQuestion({required int id}) {
    return staticQuestion[id];
  }
}
