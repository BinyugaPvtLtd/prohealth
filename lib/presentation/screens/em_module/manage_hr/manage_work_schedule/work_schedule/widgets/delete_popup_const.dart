import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/app/resources/theme_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/button_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';

class DeletePopup extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  final bool? loadingDuration;
  final String title;
   DeletePopup({super.key, required this.onCancel,
    required this.onDelete, this.loadingDuration, required this.title});

  @override
  State<DeletePopup> createState() => _DeletePopupState();
}
//
class _DeletePopupState extends State<DeletePopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s400,
        height: AppSize.s210,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorManager.bluebottom,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.firaSans(
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.semiBold,
                        color: ColorManager.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close,color: ColorManager.white,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p20,
                horizontal: AppPadding.p20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    height: AppSize.s50,
                    width: AppSize.s150,
                    child: Text('Do you really want to delete ?',textAlign: TextAlign.center,
                      style:CustomTextStylesCommon.commonStyle(
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s16,
                        color: ColorManager.mediumgrey
                    ),),
                  )
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p24),
                  child: Center(
                    child:
                    TextButton(
                      onPressed: widget.onCancel,
                      child: Text('Cancle',
                          style: GoogleFonts.firaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.bluebottom,
                          )),)
                    //
                    // CustomButtonTransparent(
                    //   text: AppStringEM.cancel,
                    //   onPressed: () async{
                    //     widget.onCancel( );
                    //     Navigator.pop(context);
                    //   },
                    // ),
                  ),
                ),
                SizedBox(width: 20,),
                Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Center(
                  child: widget.loadingDuration == true
                      ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: ColorManager.blueprime,
                    ),
                  )
                      : CustomElevatedButton(
                    width: AppSize.s105,
                    height: AppSize.s30,
                    text: AppStringEM.delete,
                    onPressed: () {
                      widget.onDelete();
                      //Navigator.pop(context);
                    },
                  ),
                ),
              ),]
            ),
            //
          ],
        ),
      ),
    );
  }
}
///
class ReusableLoadingButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double borderRadius;
  final double paddingVertical;
  final double paddingHorizontal;
  final double width;
  final double height;
  final int loadingDuration;

  const ReusableLoadingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
    this.paddingVertical = 12.0,
    this.paddingHorizontal = 16.0,
    this.width = 100,
    this.height = 35.0,
    this.loadingDuration = 3,
  }) : super(key: key);

  @override
  _ReusableLoadingButtonState createState() => _ReusableLoadingButtonState();
}

class _ReusableLoadingButtonState extends State<ReusableLoadingButton> {
  bool _isLoading = false;

  void _handlePress() {
    setState(() {
      _isLoading = true;
    });

    widget.onPressed?.call();
    Future.delayed(Duration(seconds: widget.loadingDuration), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.blue,

      ),
    )
        : SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1696C8),
          foregroundColor: widget.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: widget.paddingVertical,
            horizontal: widget.paddingHorizontal,
          ),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.firaSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
