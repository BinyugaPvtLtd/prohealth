import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

typedef DynamicCallBack = Function(String value, int index);

class DynamicOptionTab extends StatelessWidget {
  const DynamicOptionTab(
      {super.key,
      required this.label,
      required this.value,
      required this.selected,
      required this.onTap,
      required this.index});
  final String label;
  final String value;
  final int index;
  final DynamicCallBack onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: InkWell(
        onTap: () {
          onTap(value, index);
        },
        hoverColor: const Color(0xff51B5E6),
        child: Material(
          elevation: 1,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: selected
                    ? const Color(0xff51B5E6)
                    : Theme.of(context).canvasColor,
              ),
              padding: const EdgeInsets.all(4),
              child: Center(
                child: Html(
                  data: label,
                  style: {
                    "h1": Style(
                      color: selected
                          ? Colors.white
                          : const Color(0xff686464), // Customize text color
                      fontSize: FontSize(24), // Set font size
                      fontWeight: FontWeight.bold, // Make it bold
                    ),
                    "p": Style(
                      color: selected
                          ? Colors.white
                          : const Color(0xff686464), // Set text color
                    ),
                    "b": Style(
                      color: selected
                          ? Colors.white
                          : const Color(0xff686464), // Style for <b> tags
                    ),
                  },
                ),
              )),
        ),
      ),
    );
  }
}
