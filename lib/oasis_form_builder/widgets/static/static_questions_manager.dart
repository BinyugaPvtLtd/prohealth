import 'package:flutter/material.dart';
import 'package:prohealth/oasis_form_builder/widgets/static/widgets/code_m0154/question_code_m0154.dart';
import 'package:prohealth/oasis_form_builder/widgets/static/widgets/code_m0155/question_code_m0155.dart';

class StaticQuestionsManager {
  Widget? getQuestion({required int id, required String code}) {
    switch (id) {
      case 154:
        return QuestionCodeM0154();
      case 155:
        return QuestionCodeM0155();
      case 0:
        return SizedBox();
    }
  }
}
