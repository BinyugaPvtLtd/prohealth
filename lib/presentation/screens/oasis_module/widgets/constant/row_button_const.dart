import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../them_manager/oasis_them_mnager.dart';

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
          width: AppSize.s137,
          height: AppSize.s30,
          child: ElevatedButton(
            onPressed: onSaveClosePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Save and Close',
              style: BoldfontStyle.customTextStyle(context),
            ),
          ),
        ),
        SizedBox(width: AppSize.s20),

        // Submit Button
        Container(
          width: AppSize.s137,
          height: 30,
          child: ElevatedButton(
            onPressed: onSubmitPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.white,
              elevation:3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Submit',
              style: BoldfontStyle.customTextStyle(context),
            ),
          ),
        ),
        SizedBox(width: AppSize.s20),

        // Next Button
        Container(
          width: AppSize.s137,
          height: 30,
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.bluebottom,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Next',
              style: BluebuttonStyle.customTextStyle(context),
            ),
          ),
        ),
      ],
    );
  }
}
