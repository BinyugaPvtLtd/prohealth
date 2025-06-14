import 'package:flutter/cupertino.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/oasis_form_builder/dummy_data.dart';
import 'package:prohealth/oasis_form_builder/services/api/repository/form_builder_repository.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_question_data.dart';

import '../../../../../../data/api_data/api_data.dart';
import '../../../../app/services/api/api.dart';
import '../../../widgets/dynamic/data/chart_option_data_model.dart';

// Other imports
class FormBuilderManager {
  List<ChartOptionDataModel> getOptions(List data) {
    List<ChartOptionDataModel> dataSet = [];
    for (var element in data) {
      dataSet.add(ChartOptionDataModel.fromJson(element));
    }
    return dataSet;
  }

  ///get PatientFormById API
  Future<List<ChartQuestionDataModel>> getPatientFormByID(BuildContext context,
      {required patientId}) async {
    List<ChartQuestionDataModel> itemsList = [];
    try {
      final response = await Api(context).get(
          path: FormBuilderRepository.getPatientFormById(patientId: patientId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        for (var item in response.data["data"]) {
          try {
            print(item);
            itemsList.add(
              ChartQuestionDataModel.fromJson(item),
            );
          } catch (e) {
            print(e);
          }
          // itemsList.add(
          //   ChartQuestionDataModel(
          //       options: chartData,
          //       description: item["description"],
          //       questionType:
          //           item['question_type'] as String == AppStrings.comprehensive
          //               ? QuestionType.comprehensive
          //               : QuestionType.nonComprehensive,
          //       title: item["title"],
          //       groupOptions: item["group_options"],
          //       answerType: item['type'] as String == AppStrings.checkBox
          //           ? AnswerType.checkbox
          //           : item['type'] as String == AppStrings.option
          //               ? AnswerType.option
          //               : item['type'] as String == AppStrings.text
          //                   ? AnswerType.textBox
          //                   : AnswerType.none,
          //       code: "1",
          //       optionsAlignment: OptionsAlignment.vertical,
          //       id: item["question_type_id"],
          //       dynamicType: item["dynamic_type"],
          //       answerId: item["answer_id"]),
          // );
        }
        // print("Response:::::${response}");
      } else {
        print('Api Error');
      }

      return itemsList;
    } catch (e) {
      print("Error $e");
      return itemsList;
    }
  }

  Future<List<ChartQuestionDataModel>> getDummyDataPatientFormByID(
      BuildContext context,
      {required patientId}) async {
    List<ChartQuestionDataModel> itemsList = [];
    try {
      for (var item in OasisDummyData.newData["data"]) {
        try {
          print(item);
          itemsList.add(
            ChartQuestionDataModel.fromJson(item),
          );
        } catch (e) {
          print(e);
        }
      }
      // print("Response:::::${response}");

      return itemsList;
    } catch (e) {
      print("Error $e");
      return itemsList;
    }
  }

  ///ADD Patient Answers Patch API
  Future<ApiData> addPatientFormAnswer(
    BuildContext context,
    List<Map> answers,
  ) async {
    try {
      var response = await Api(context).patchList(
        path: FormBuilderRepository.patientFormAnswer,
        data: answers,
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Add Employee added");
        // orgDocumentGet(context);
        return ApiData(
            statusCode: response.statusCode!,
            success: true,
            data: response.data,
            message: response.statusMessage!);
      } else {
        print("Error 1");
        return ApiData(
            statusCode: response.statusCode!,
            success: false,
            message: response.data['message']);
      }
    } catch (e) {
      print("Error $e");
      return ApiData(
          statusCode: 404,
          success: false,
          message: AppString.somethingWentWrong);
    }
  }

  Future<ApiData> initPatientForm(
    BuildContext context, {
    required int patientId,
    required int subFormId,
    required int chartId,
    required int episodeId,
  }) async {
    try {
      var response = await Api(context).post(
        path: FormBuilderRepository.patientFormAnswer,
        data: {
          "patient_id": patientId,
          "sub_form_id": subFormId,
          "chart_id": chartId,
          "episode_id": episodeId
        },
      );
      print("patientFormAnswer initiated");
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Add Employee added");
        // orgDocumentGet(context);
        return ApiData(
            statusCode: response.statusCode!,
            success: true,
            data: response.data,
            message: response.statusMessage!);
      } else {
        print("Error 1");
        return ApiData(
            statusCode: response.statusCode!,
            success: false,
            message: response.data['message']);
      }
    } catch (e) {
      print("Error $e");
      return ApiData(
          statusCode: 404,
          success: false,
          message: AppString.somethingWentWrong);
    }
  }
}
