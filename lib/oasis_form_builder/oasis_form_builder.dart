import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/oasis_form_builder/constants/enums.dart';
import 'package:prohealth/oasis_form_builder/services/api/managers/form_builder_manager.dart';
import 'package:prohealth/oasis_form_builder/services/provider/form_builder_provider.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_question_data.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/dynamic_question.dart';
import 'package:prohealth/oasis_form_builder/widgets/static/static_questions_repository.dart';
import 'package:provider/provider.dart';

class OasisFormBuilder extends StatelessWidget {
  final String title = "Form Title";
  OasisFormBuilder({
    super.key,
  });
  List<Widget> comprehensiveQtn = [];
  List<Widget> nonComprehensiveQtn = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getForm(context, patientId: 2),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      comprehensiveQtn.isNotEmpty
                          ? Expanded(
                              child: Column(
                              children: comprehensiveQtn,
                            ))
                          : SizedBox(
                              width: 1,
                            ),
                      nonComprehensiveQtn.isNotEmpty
                          ? Expanded(
                              child: Column(
                              children: nonComprehensiveQtn,
                            ))
                          : SizedBox(
                              width: 1,
                            )
                    ],
                  ),
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                border: Border.all(
                                    color: ColorManager.blueprime, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: ColorManager.blueprime,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () async {
                            await FormBuilderManager().addPatientFormAnswer(
                                context,
                                Provider.of<FormBuilderProvider>(context,
                                        listen: false)
                                    .optionsToBeSaved);

                            Navigator.pop(context);
                            // print("Hit");
                            // print(Provider.of<FormBuilderProvider>(context,
                            //         listen: false)
                            //     .optionsToBeSaved);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.blueprime,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            child: Text(
                              "Save",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()));
            }
            if (snap.hasError) {
              return Center(child: Text("Error : ${snap.error}"));
            } else {
              return Center(child: Text("Error"));
            }
          }),
    );
  }

  Future<int> getForm(BuildContext context, {required int patientId}) async {
    // List<ChartQuestionDataModel> response = await FormBuilderManager()
    //     .getPatientFormByID(context, patientId: patientId);
    List<ChartQuestionDataModel> response = await FormBuilderManager()
        .getDummyDataPatientFormByID(context, patientId: patientId);

    for (var element in response) {
      try {
        if (element.groupOptions!) {
          for (var a in element.options!) {
            if (a.selected || element.answerType == AnswerType.textBox) {
              Provider.of<FormBuilderProvider>(context, listen: false)
                  .addOption(
                      data: a, answerId: element.answerId!, isGrouped: true);
            }
          }
        } else {
          List list = [];
          for (var v in element.options!) {
            if (v.selected || element.answerType == AnswerType.textBox) {
              list.add({
                "index": v.index,
                "label": v.label,
                "value": v.value,
                "selected": v.selected
              });
            }
          }
          if (list.isNotEmpty) {
            Provider.of<FormBuilderProvider>(context, listen: false)
                .addMultiOption(
                    data: list, answerId: element.answerId!, isGrouped: true);
          }
        }

        if (element.dynamicType!) {
          if (element.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(DynamicQuestion(
              title: element.title ?? "",
              type: element.answerType ?? AnswerType.option,
              code: element.code ?? "",
              options: element.options ?? [],
              description: element.description ?? "",
              groupOptions: element.groupOptions ?? false,
              optionsAlignment:
                  element.optionsAlignment ?? OptionsAlignment.vertical,
              answerId: element.answerId!,
            ));
          } else {
            nonComprehensiveQtn.add(DynamicQuestion(
              title: element.title ?? "",
              type: element.answerType ?? AnswerType.option,
              code: element.code ?? "",
              options: element.options ?? [],
              description: element.description ?? "",
              groupOptions: element.groupOptions ?? false,
              optionsAlignment:
                  element.optionsAlignment ?? OptionsAlignment.vertical,
              answerId: element.answerId!,
            ));
          }
        } else {
          if (element.questionType == QuestionType.comprehensive) {
            comprehensiveQtn.add(StaticQuestionRepository().getQuestion(
                  id: element.id ?? 0,
                ) ??
                SizedBox(
                  height: 1,
                ));
          } else {
            nonComprehensiveQtn.add(StaticQuestionRepository().getQuestion(
                  id: element.id ?? 0,
                ) ??
                SizedBox(
                  height: 1,
                ));
          }
        }
      } catch (e) {
        print("In conversion error");
        print(e);
      }
    }
    return 1;
  }
}
