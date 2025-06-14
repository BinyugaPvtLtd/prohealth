import 'package:flutter/material.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/data/chart_option_data_model.dart';

class FormBuilderProvider with ChangeNotifier {
  List<Map<String, dynamic>> optionsToBeSaved = [];

  resetOptionsToBeSaved() {
    optionsToBeSaved = [];
    notifyListeners();
  }

  bool checkContain({required int answerId}) {
    bool contain = false;
    for (var a in optionsToBeSaved) {
      if (a["answer_id"] == answerId) {
        contain = true;
      }
    }
    return contain;
  }

  addOption(
      {required ChartOptionDataModel data,
      required int answerId,
      required bool isGrouped}) {
    if (optionsToBeSaved.isNotEmpty) {
      int i = 0;
      int remove = -1;
      if (checkContain(answerId: answerId)) {
        for (var a in optionsToBeSaved) {
          if (isGrouped) {
            if (a["answer_id"] == answerId) {
              if (data.selected) {
                optionsToBeSaved[i]["values"] = [
                  {
                    "index": data.index,
                    "label": data.label,
                    "value": data.value,
                    "selected": data.selected
                  }
                ];
              } else {
                remove = i;
              }
            }
          } else {
            if (a["answer_id"] == answerId) {
              List list = a["values"];
              list.add({
                "index": data.index,
                "label": data.label,
                "value": data.value,
                "selected": data.selected
              });
              optionsToBeSaved[i]["values"] = list;
            }
          }
          i++;
        }
        if (remove > -1) {
          optionsToBeSaved.removeAt(remove);
        }
      } else {
        optionsToBeSaved.add({
          "answer_id": answerId,
          "values": [
            {
              "index": data.index,
              "label": data.label,
              "value": data.value,
              "selected": data.selected
            }
          ]
        });
      }
    } else {
      optionsToBeSaved.add({
        "answer_id": answerId,
        "values": [
          {
            "index": data.index,
            "label": data.label,
            "value": data.value,
            "selected": data.selected
          }
        ]
      });
    }
    print("list updated");
    print(optionsToBeSaved);
  }

  addMultiOption(
      {required List data, required int answerId, required bool isGrouped}) {
    if (optionsToBeSaved.isNotEmpty) {
      int i = 0;
      if (checkContain(answerId: answerId)) {
        for (var a in optionsToBeSaved) {
          if (a["answer_id"] == answerId) {
            optionsToBeSaved[i]["values"] = data;
          }
          i++;
        }
      } else {
        optionsToBeSaved.add({"answer_id": answerId, "values": data});
      }
    } else {
      optionsToBeSaved.add({"answer_id": answerId, "values": data});
    }
    print("list updated");
    print(optionsToBeSaved);
  }
}
