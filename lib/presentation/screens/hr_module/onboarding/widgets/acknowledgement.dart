import 'package:flutter/material.dart';
import 'package:prohealth/resources/color.dart';
import 'package:prohealth/resources/const_string.dart';
import 'package:prohealth/resources/theme_manager.dart';
import 'package:prohealth/resources/value_manager.dart';

class AcknowledgementTab extends StatelessWidget {
  const AcknowledgementTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p80, vertical: AppPadding.p40),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: AppSize.s181,
          width: MediaQuery.of(context).size.width / 70,
          padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Adding top padding
                  Row(
                    children: [
                      Container(
                          width: AppSize.s62,
                          height: AppSize.s45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 2, color:ColorManager.faintOrange ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: AppSize.s24,
                          )),
                      SizedBox(width: AppSize.s10),
                      Text(AppString.ackCandidate,
                          style: AknowledgementStyleConst.customTextStyle(context))
                    ],
                  ),
                  SizedBox(height: AppSize.s10),
                  Row(
                    children: [
                      Container(
                          width: AppSize.s62,
                          height: AppSize.s45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 2, color: ColorManager.faintOrange),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: AppSize.s24,
                          )),
                      SizedBox(width: AppSize.s10),
                      Text(AppString.ackConfidential,
                          style:
                              AknowledgementStyleConst.customTextStyle(context))
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Adding top padding
                  Row(
                    children: [
                      Container(
                          width: AppSize.s62,
                          height: AppSize.s45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 2, color: ColorManager.faintOrange),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: AppSize.s24,
                          )),
                      SizedBox(width: AppSize.s10),
                      Text(AppString.ackonCall,
                          style:
                              AknowledgementStyleConst.customTextStyle(context))
                    ],
                  ),
                  SizedBox(height: AppSize.s20),
                  Row(
                    children: [
                      Container(
                          width: AppSize.s62,
                          height: AppSize.s45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 2, color:ColorManager.faintOrange),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: ColorManager.blueprime,
                            ),
                            iconSize: AppSize.s24,
                          )),
                      SizedBox(width: AppSize.s10),
                      Text(AppString.ackpolicy,
                          style:
                              AknowledgementStyleConst.customTextStyle(context))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
