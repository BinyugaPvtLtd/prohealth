import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../sm_Intake/widgets/intake_update_schedular/information_update.dart';
// import 'curate_screen.dart';

class RPAutoSyncScreen extends StatelessWidget {
  final VoidCallback onAutoBackPressed;
  final VoidCallback onCuratePressed;
  const RPAutoSyncScreen({super.key, required this.onAutoBackPressed, required this.onCuratePressed,
  //  required this.onCurateButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
      child:  ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onAutoBackPressed,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: IconSize.I16,
                        color: ColorManager.mediumgrey,
                      ),
                    ),
                    Text(
                      "Go back",
                      style: CustomTextStylesCommon.commonStyle(
                        color: ColorManager.mediumgrey,
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Synced Results",
                    style: CustomTextStylesCommon.commonStyle(
                      color: ColorManager.bluebottom,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSize.s30,),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 500,
                        child: ScrollConfiguration(
                          behavior: ScrollBehavior().copyWith(scrollbars: false),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              //int serialNumber = index + 1 + (currentPage - 1) * itemsPerPage;
                              // String formattedSerialNumber = serialNumber.toString().padLeft(2, '0');
                              // EmployeeDocumentModal employeedoc = paginatedData[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 7.0),
                                child: IntakeContainer(
                                  child: Container(
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
                                          topLeft: Radius.circular(12)),
                                    ),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children:[
                                                  Container(
                                                      width: AppSize.s80,
                                                      height: AppSize.s16,
                                                      decoration: BoxDecoration(
                                                        color: ColorManager.greenDark,
                                                        borderRadius: BorderRadius.only(topRight: Radius.circular(8)),),
                                                      child: Center(
                                                        child: Text(
                                                            'Curated',
                                                            textAlign: TextAlign.center,
                                                            style: CustomTextStylesCommon.commonStyle(
                                                                color: ColorManager.white,
                                                                fontSize: FontSize.s11,
                                                                fontWeight: FontWeight.w400)),
                                                      )),
                                                ]
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: AppPadding.p20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(child: Container()),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          "Ross Geller",
                                                          textAlign: TextAlign.start,
                                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w700,
                                                            color: ColorManager.mediumgrey,),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Text(
                                                          "Received Date: 4/30/25",
                                                          textAlign: TextAlign.start,
                                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,),
                                                        ),
                                                        SizedBox(height: 3,),
                                                        Text(
                                                          "07: 35 PM",
                                                          textAlign: TextAlign.start,
                                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w400,
                                                            color: ColorManager.mediumgrey,),
                                                        ),
                                                      ],
                                                    ),
                                                  ), // SizedBox(width: MediaQuery.of(context).size.width/25,),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(right: 5,),
                                                      child: Image.asset('images/logo_login.png',width: 90,fit: BoxFit.contain,),
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Expanded(
                                                    flex: 1,
                                                    child: IconButton(
                                                      hoverColor: Colors.transparent,
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      onPressed: (){},
                                                      icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I22,)),),
                                                  Expanded(child: Container()),
                                                  // Container(
                                                  //   width: 120,
                                                  //   height: 33,
                                                  //   child: ElevatedButton(
                                                  //     onPressed: () async{
                                                  //       onCuratePressed();
                                                  //       // CurateScreen(
                                                  //       //   onCurateBackPressed: (){
                                                  //       //     //onCurateButtonPressed();
                                                  //       //     },
                                                  //       //   onCurateScreenPressed: () {  },);
                                                  //     },
                                                  //     style: ElevatedButton.styleFrom(
                                                  //       padding: EdgeInsets.symmetric(
                                                  //           horizontal: 6,
                                                  //           vertical: 12),
                                                  //       backgroundColor:
                                                  //       ColorManager.white,
                                                  //       shape: RoundedRectangleBorder(
                                                  //         borderRadius: BorderRadius.circular(12),
                                                  //         side: BorderSide(color: ColorManager.bluebottom),
                                                  //       ),
                                                  //     ),
                                                  //     child: Text("Add To Referral",//"Add To Referral",
                                                  //         style: CustomTextStylesCommon.commonStyle(
                                                  //           fontSize: FontSize.s12,
                                                  //           fontWeight: FontWeight.w600,
                                                  //           color:
                                                  //           ColorManager.bluebottom,
                                                  //         )),
                                                  //   ),
                                                  // ),
                                                  Container(
                                                    width: 120,
                                                    height: 36,
                                                    child: ElevatedButton(
                                                      onPressed: () async{
                                                        onCuratePressed();
                                                        // CurateScreen(
                                                        //   onCurateBackPressed: (){
                                                        //     //onCurateButtonPressed();
                                                        //     },
                                                        //   onCurateScreenPressed: () {  },);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 6,
                                                            vertical: 12),
                                                        backgroundColor: ColorManager.white,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12),
                                                          side: BorderSide(color: ColorManager.redDark),
                                                        ),
                                                      ),
                                                      child: Text("Curate",//"Add To Referral",
                                                          style: CustomTextStylesCommon.commonStyle(
                                                            fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w600,
                                                            color: ColorManager.redDark,
                                                          )),
                                                    ),
                                                  ),
                                                  Expanded(child: Container()),
                                                  Expanded(
                                                    flex: 1,
                                                    child: IconButton(
                                                        hoverColor: Colors.transparent,
                                                        splashColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onPressed: (){},
                                                        icon: Icon(Icons.delete,color: ColorManager.mediumgrey,size: IconSize.I22,))
                                                  ),
                                                ],),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: AppSize.s12),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
