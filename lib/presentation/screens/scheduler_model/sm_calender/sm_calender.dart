import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/data/api_data/sm_data/scheduler_create_data/schedular_data.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular_create/widget/calender_const.dart';

import '../../../../app/resources/value_manager.dart';
import '../../em_module/widgets/button_constant.dart';
import '../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';

class SmCalenderScreen extends StatefulWidget {
  final VoidCallback onCalenderSearchPressed;
   SmCalenderScreen({super.key, required this.onCalenderSearchPressed});

  @override
  State<SmCalenderScreen> createState() => _SmCalenderScreenState();
}

class _SmCalenderScreenState extends State<SmCalenderScreen> {
  final StreamController<SchedularData> _schedulerController =
  StreamController<SchedularData>();

   final PageController _pageController = PageController();

   int selectedIndex = 0;

   void selectButton(int index) {
     setState(() {
       selectedIndex = index;
     });

     _pageController.animateToPage(
       index,
       duration: const Duration(milliseconds: 500),
       curve: Curves.ease,
     );
   }

   void goBack() {
     if (selectedIndex > 0) {
       setState(() {
         selectedIndex--;
       });
       _pageController.animateToPage(
         selectedIndex,
         duration: const Duration(milliseconds: 500),
         curve: Curves.ease,
       );
     }
   }
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0,top: 20,right: 35),
              child: Row(
                children: [
                  CustomSearchFieldSM(
                    searchController: _searchController,
                    width: 381,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: AppSize.s20,
                  ),
                  CustomElevatedButton(
                    width: AppSize.s90,
                    height: AppSize.s36,
                    text: "Search",
                    color:  ColorManager.bluebottom,
                    onPressed: widget.onCalenderSearchPressed,
                        //(){
                     // CalenderConstant(onBack: goBack,);
                   // },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Image.asset("images/sm/sm_calender/rafiki.png",height: 440,width: 602,)
          ],
        ),
      )
      // Container(
      //     height: MediaQuery.of(context).size.height / 1,
      //     child: CalenderConstant(onBack: goBack,)),
    ///
    //       StreamBuilder<SchedularData>(
    //           stream: _schedulerController.stream,
    //           builder: (context,snapshot) {
    //             getSchedularByClinitian(context: context, clinicialId: 134).then((data) {
    //               _schedulerController.add(data);
    //             }).catchError((error) {
    // // Handle error
    //             });
    //             if(snapshot.connectionState == ConnectionState.waiting){
    //               return Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 150),
    //                 child: Center(child: CircularProgressIndicator(color: ColorManager.blueprime,),),
    //               );
    //             }
    //             if(snapshot.data!.isBlank!){
    //               return const Padding(
    //                 padding: EdgeInsets.symmetric(vertical: 150),
    //                 child: Center(child: Text('No record found!'),),
    //               );
    //             }
    //             if(snapshot.hasData){
    //               return Container(
    //                     height: MediaQuery.of(context).size.height / 1,
    //                     child: CalenderConstant(schedularData: snapshot.data!, onBack: goBack,));
    //             }
    //             else{
    //               return const SizedBox();
    //             }
    //
    //           }
    //       ),
    );
  }
}
