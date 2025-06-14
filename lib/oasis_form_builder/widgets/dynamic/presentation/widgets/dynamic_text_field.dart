import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/oasis_form_builder/widgets/dynamic/presentation/widgets/dynamic_option_tab.dart';

class DynamicTextField extends StatelessWidget {
  const DynamicTextField(
      {super.key,
      required this.label,
      required this.value,
      required this.selected,
      required this.onTap,
      required this.index,
      required this.textEditingController});
  final String label;
  final String value;
  final int index;
  final DynamicCallBack onTap;
  final bool selected;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Container(
        height: 100,
        width: double.maxFinite,
        child: Column(
          children: [
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
            Container(
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  onTap(value, index);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter here",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
