import 'package:flutter/material.dart';

import '../../../../../../../../app/resources/color.dart';
import '../../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../../app/resources/value_manager.dart';
import '../../sm_scheduler_screen_const.dart';

class Requestlog extends StatefulWidget {
  const Requestlog({super.key});

  @override
  State<Requestlog> createState() => _RequestlogState();
}

class _RequestlogState extends State<Requestlog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        height: 400,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xff50B5E5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:  Text(
                     "Request Log",
                      style:PopupBlueBarText.customTextStyle(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                ],
              ),
            ),

            Container(child:

            Padding(
              padding: const EdgeInsets.only(right: 40,left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: SizedBox(
                                width: AppSize.s40,
                                height: AppSize.s45,
                                child: Image.asset(
                                  'images/hr_dashboard/man.png', // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: AppSize.s12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jeh Tiwari',
                            style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.mediumgrey,),
                          ),
                          SizedBox(height: AppSize.s5),
                          Text(
                            'Anxiety',
                            style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtonRowPop(
                        onSaveClosePressed: () {
                          // Action for Save and Close button
                          print('Save and Close pressed');
                        },
                        onSubmitPressed: () {
                          // Action for Submit button
                          print('Submit pressed');
                        },
                        onNextPressed: () {
                          // Action for Next button
                          print('Next pressed');
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),

            ),
            Divider(),


            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       width: double.infinity, // Ensure full width
            //       height: 300, // Adjust height as needed
            //       child: Timeline(
            //         children: <Widget>[
            //           Container(height: 30, color: Colors.blue),
            //           Container(height: 30, color: Colors.green),
            //           Container(height: 30, color: Colors.red),
            //           Container(height: 30, color: Colors.orange),
            //         ],
            //         indicators: <Widget>[
            //           Icon(Icons.access_alarm),
            //           Icon(Icons.backup),
            //           Icon(Icons.accessibility_new),
            //           Icon(Icons.access_alarm),
            //         ],
            //         isLeftAligned: true,
            //         itemGap: 20.0,
            //         lineColor: Colors.blueAccent,
            //         indicatorSize: 20.0,
            //         indicatorColor: Colors.blue,
            //         strokeWidth: 3.0,
            //       ),
            //     ),
            //   ),
            // )




          ],
        ),
      ),

    );
  }
}

















class Timeline extends StatelessWidget {
  final List<Widget> children;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final double itemGap;
  final Color lineColor;
  final double indicatorSize;
  final Color indicatorColor;
  final double strokeWidth;

  const Timeline({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.lineColor = Colors.grey,
    this.indicatorSize = 30.0,
    this.indicatorColor = Colors.blue,
    this.strokeWidth = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: children.length,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      itemBuilder: (context, index) {
        final child = children[index];
        final _indicators = indicators;
        Widget? indicator;
        if (_indicators != null) {
          indicator = _indicators[index];
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomPaint(
            //  size: Size(indicatorSize, 100),  // Define custom paint size
              foregroundPainter: _TimelinePainter(
                lineColor: lineColor,
                indicatorColor: indicatorColor,
                indicatorSize: indicatorSize,
                strokeWidth: strokeWidth,
                hideDefaultIndicator: indicator != null,
              ),
              child: SizedBox(
                width: indicatorSize,
                height: 10,
                child: indicator,
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: child),
          ],
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  final Color lineColor;
  final Color indicatorColor;
  final double indicatorSize;
  final double strokeWidth;
  final bool hideDefaultIndicator;

  _TimelinePainter({
    required this.lineColor,
    required this.indicatorColor,
    required this.indicatorSize,
    required this.strokeWidth,
    required this.hideDefaultIndicator,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth;

    // Draw the line vertically
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);

    if (!hideDefaultIndicator) {
      // Draw the indicator (circle) in the middle
      final paintCircle = Paint()..color = indicatorColor;
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), indicatorSize, paintCircle);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
