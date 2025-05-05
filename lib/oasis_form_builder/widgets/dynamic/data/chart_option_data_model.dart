class ChartOptionDataModel {
  final String label;
  final String value;
  final int index;
  final bool selected;

  ChartOptionDataModel(
      {required this.index,
      required this.label,
      required this.value,
      required this.selected});

  ChartOptionDataModel.fromJson(
    Map<String, dynamic> json,
  )   : label = json['label'] ?? "",
        value = json['value'] ?? "",
        index = json['index'] as int,
        selected = json['selected'] ?? false;

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'selected': selected,
      };
}
