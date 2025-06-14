import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../oasis_module/them_manager/oasis_them_mnager.dart';

class SchedularContainerConst extends StatelessWidget {
  final Widget child;
  // final double? height;
  const SchedularContainerConst({super.key, required this.child,
    //this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 3,
          ),
          left: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),


      ///
      // // height: height ?? 62,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   // border: Border(left: BorderSide(
      //   //   color: Color(0xFF579EBA),
      //   //   width: 5,
      //   // ),),
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.6),
      //       spreadRadius: 0,
      //       blurRadius: 4,
      //       offset: const Offset(0, 2),
      //     ),
      //   ],
      // ),
    child: child,);
  }
}





class borderSchedularContainerConst extends StatelessWidget {
  final Widget child;
  //final double? height;
  const borderSchedularContainerConst({super.key, required this.child,
  //  this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: height ?? 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12)),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 3,
          ),
          left: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          right: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Container(  //padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          decoration: BoxDecoration(
            border:  Border(
              left: BorderSide(
                color: Color(0xFFC30909),
                width: 6,
              ),
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                // bottomRight: Radius.circular(12),
                // topRight: Radius.circular(12),
                topLeft: Radius.circular(12)),
          ),
          child: child),);
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
        SizedBox(
        width: AppSize.s60,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onSaveClosePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:Color(0xffB4DB4C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.zero
            ),
            child: Text(
              'RN SOC',
              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,),
            ),
          ),
        ),
        SizedBox(width: AppSize.s10),

        // Submit Button
        SizedBox(
          width: AppSize.s60,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onSubmitPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffF6928A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
                padding: EdgeInsets.zero
            ),
            child: Text(
              'PT',
              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,),
            ),
          ),
        ),
        SizedBox(width: AppSize.s10),

        // Next Button
        SizedBox(
          width: AppSize.s60,
          height: AppSize.s25,
          child: ElevatedButton(
            onPressed: onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFEBD4D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
                padding: EdgeInsets.zero
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
                    borderRadius: BorderRadius.circular(5),
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
                    borderRadius: BorderRadius.circular(5),
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
                    borderRadius: BorderRadius.circular(5),
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








class CustomButtonRowstack extends StatelessWidget {
  final VoidCallback onRN;
  final VoidCallback onPT;
  final VoidCallback onOT;

  final GlobalKey _rnKey = GlobalKey(); // Add key for RN

   CustomButtonRowstack({
    Key? key,
    required this.onRN,
    required this.onPT,
    required this.onOT,
  }) : super(key: key);


  // void _showPopup(BuildContext context, GlobalKey key, String text) {
  //   ShowMoreTextPopup popup = ShowMoreTextPopup(
  //     context,
  //     text: text,
  //     textStyle: TextStyle(color: Colors.black),
  //     height: 200,
  //     width: 100,
  //     backgroundColor: Color(0xFF16CCCC),
  //   );
  //   popup.show(widgetKey: key);
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Save and Close Button with Positioned Icon
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 50,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: AppSize.s60,
                height: AppSize.s25,
                child: ElevatedButton(
                  onPressed: onRN,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xffB4DB4C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.zero
                  ),
                  child: Text(
                    'RN SOC',
                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 13,
                child: Image.asset("images/sm/checkgram.png", height: 20),
              ),
            ],
          ),
        ),

        SizedBox(width: AppSize.s10),


        Container(
          // padding: EdgeInsets.only(top: 15),
          margin: EdgeInsets.only(top: 20.0),
          height: 50,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: AppSize.s60,
                height: AppSize.s25,
                child: ElevatedButton(
                  onPressed: onPT,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF6928A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.zero
                  ),
                  child: Text(
                    'PT',
                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 13,
                child: Image.asset("images/sm/checkgram.png", height: 20,)

              )
            ],
          ),
        ),


        SizedBox(width: AppSize.s10),

        Container(
          // padding: EdgeInsets.only(top: 15),
          margin: EdgeInsets.only(top: 20.0),
          height: 50,
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: AppSize.s60,
                height: AppSize.s25,
                child: ElevatedButton(
                  onPressed: onOT,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFEBD4D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.zero
                  ),
                  child: Text(
                    'OT',
                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 13,
                child: Image.asset("images/sm/checkgram.png", height: 20,)

              )
            ],
          ),
        ),


      ],
    );
  }
}




class CustomButtonRowPop extends StatelessWidget {
  final VoidCallback onSaveClosePressed;
  final VoidCallback onSubmitPressed;
  final VoidCallback onNextPressed;

  const CustomButtonRowPop({
    Key? key,
    required this.onSaveClosePressed,
    required this.onSubmitPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Save and Close Button
        Row(
          children: [

            GestureDetector(
              onTap: onSaveClosePressed,
              child: Container(
                width: AppSize.s40,
                height: AppSize.s25,
                decoration: BoxDecoration(
                  color:Color(0xffB4DB4C),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'RN',
                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,),
                  ),
                ),
              ),
            ),


          ],

        ),
        SizedBox(width: AppSize.s20),

        // Submit Button
        Row(
          children: [
            GestureDetector(
              onTap: onSubmitPressed,
              child: Container(
                width: AppSize.s40,
                height: AppSize.s25,
                      decoration: BoxDecoration(
                    color: Color(0xffF6928A),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  child: Center(
                    child: Text(
                      'PT',
                      style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white,),
                    ),
                  ),
              ),
            ),

          ],
        ),
        SizedBox(width: AppSize.s20),

        // Next Button
        Row(
          children: [
            GestureDetector(
              onTap: onNextPressed,
              child: Container(
                width: AppSize.s40,
                height: AppSize.s25,
                decoration: BoxDecoration(
                  color: Color(0xffFEBD4D),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'OT',
                    style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.white,),
                  ),
                ),
              ),
            ),

            // Container(
            //   width: AppSize.s50,
            //   height: AppSize.s25,
            //   child: ElevatedButton(
            //     onPressed: onNextPressed,
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color(0xffFEBD4D),
            //
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5),
            //       ),
            //     ),
            //     child: Text(
            //       'OT',
            //       style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
            //         fontWeight: FontWeight.w400,
            //         color: ColorManager.white,),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}