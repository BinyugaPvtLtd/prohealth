import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

typedef DynamicCheckBoxCallBack = void Function(bool value, int index);

class DynamicCheckboxTab extends StatelessWidget {
  const DynamicCheckboxTab(
      {super.key,
      required this.label,
      required this.value,
      required this.selected,
      required this.onTap,
      required this.index});
  final String label;
  final String value;
  final int index;
  final DynamicCheckBoxCallBack onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        children: [
          Checkbox(
              value: selected,
              onChanged: (value) {
                onTap(value!, index);
              }),
          Expanded(
            child: Html(
              data: label,
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
        ],
      ),
    );
  }
}
