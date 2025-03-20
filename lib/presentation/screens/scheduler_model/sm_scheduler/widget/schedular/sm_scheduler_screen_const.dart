import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../oasis_module/them_manager/oasis_them_mnager.dart';

class SchedularContainerConst extends StatelessWidget {
  final Widget child;
  final double? height;
  const SchedularContainerConst({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 62,
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border(left: BorderSide(
        //   color: Color(0xFF579EBA),
        //   width: 5,
        // ),),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    child: child,);
  }
}




class CustomButtonRow extends StatelessWidget {
  final VoidCallback onSaveClosePressed;
  final VoidCallback onSubmitPressed;
  final VoidCallback onNextPressed;

  const CustomButtonRow({
    Key? key,
    required this.onSaveClosePressed,
    required this.onSubmitPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Save and Close Button
        Container(
          width: AppSize.s80,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onSaveClosePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:Color(0xffB4DB4C),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'RN SOC',
              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,),
            ),
          ),
        ),
        SizedBox(width: AppSize.s20),

        // Submit Button
        Container(
          width: AppSize.s80,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onSubmitPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffF6928A),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'PT',
              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,),
            ),
          ),
        ),
        SizedBox(width: AppSize.s20),

        // Next Button
        Container(
          width: AppSize.s80,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFEBD4D),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'OT',
              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,),
            ),
          ),
        ),
      ],
    );
  }
}


class CustomButtonColumn extends StatelessWidget {
  final VoidCallback onSaveClosePressed;
  final VoidCallback onSubmitPressed;
  final VoidCallback onNextPressed;

  const CustomButtonColumn({
    Key? key,
    required this.onSaveClosePressed,
    required this.onSubmitPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Save and Close Button
        Row(
          children: [
            Container(
              width: AppSize.s40,
              height: AppSize.s25,
              child: ElevatedButton(
                onPressed: onSaveClosePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xffB4DB4C),
            
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'RN',
                  style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.white,),
                ),
              ),
            ),
            SizedBox(width: AppSize.s5,),
            Text("Pending")
          ],
          
        ),
        SizedBox(width: AppSize.s20),

        // Submit Button
        Row(
          children: [
            Container(
              width: AppSize.s40,
              height: AppSize.s25,
              child: ElevatedButton(
                onPressed: onSubmitPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6928A),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'PT',
                  style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.white,),
                ),
              ),
            ),
            SizedBox(width: AppSize.s5,),
            Text("Julie Andrews")
          ],
        ),
        SizedBox(width: AppSize.s20),

        // Next Button
        Row(
          children: [
            Container(
              width: AppSize.s40,
              height: AppSize.s25,
              child: ElevatedButton(
                onPressed: onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFEBD4D),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'OT',
                  style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.white,),
                ),
              ),
            ),
            SizedBox(width: AppSize.s5,),
            Text("Ross Geller")
          ],
        ),
      ],
    );
  }
}