import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class QuestionCodeM0154 extends StatelessWidget {
  const QuestionCodeM0154({
    super.key,
  });

  final int id = 154;
  final String code = "M0154";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        elevation: 4,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  code.isNotEmpty
                      ? InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      child:
                                          Html(data: "<p>Hello <b>aa</b></p>"),
                                    ));
                          },
                          child: Text(
                            "($code)",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color(0xffFF0000),
                                    fontWeight: FontWeight.bold),
                          ))
                      : SizedBox(
                          width: 1,
                        ),
                  Expanded(
                    child: Html(
                      data: "<b>Hello this is a static Question</b>",
                    ),
                  ),
                ],
              ),
              Html(data: "qweqe23"),
            ],
          ),
        ),
      ),
    );
  }
}
