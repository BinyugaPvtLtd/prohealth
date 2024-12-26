import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/presentation/screens/em_module/widgets/dialogue_template.dart';

import '../../../app/resources/font_manager.dart';
import '../../../app/resources/theme_manager.dart';
import '../../screens/em_module/widgets/button_constant.dart';

class FourNotFourPopup extends StatelessWidget {
  const FourNotFourPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  DialogueTemplate(
        width: 450,
        height: 250,
        body: [
          Center(
            child: Icon(
              Icons.cancel,
              color: Colors.red, // Icon color
              size: 30,
            ),
          ),
          SizedBox(height: 5,),
          Text("Something went wrong with the server",
            textAlign: TextAlign.center,
            style: CustomTextStylesCommon.commonStyle(
                fontWeight: FontWeight.w600,
                fontSize: FontSize.s14,
                color: ColorManager.mediumgrey
            ),),

        ],
        bottomButtons: CustomElevatedButton(onPressed: (){
          Navigator.pop(context);
        },text: 'OK',height: 30,width: 90,), title: 'Error');
  }
}
///
//DialogueTemplate(
//         width: 550, height: 450,
//         body: [
//           Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal: 50),
//           child: Center(
//             child: Column(children: [
//               Text('Whoops, that page is gone.',
//               style: CustomTextStylesCommon.commonStyle(fontSize: 20,
//                   color: ColorManager.mediumgrey,fontWeight: FontWeight.w600),),
//               SizedBox(height: 20,),
//               Container(
//                   height: 250,
//                   width: 350,
//                   child: Image.asset('images/error/pana.png',fit: BoxFit.contain))
//             ],),
//           ),)
//       ], bottomButtons: Container(), title: 'Error');