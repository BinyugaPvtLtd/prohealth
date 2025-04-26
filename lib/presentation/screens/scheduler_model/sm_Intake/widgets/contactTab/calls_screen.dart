import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/web_manage/manage_screen.dart';

import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../intake_flow_contgainer_const.dart';

class ContactCallsScreen extends StatelessWidget {
  const ContactCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
              border: Border(
            top: BorderSide(color: Color(0xFF1696C8),width: 5)
          )),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 3,left: 30,right: 30),
                  child: TabBar(
                    onTap: (index) {

                    },
                    indicatorWeight: 3,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 1),
                    indicator: BoxDecoration(
                      color: ColorManager.SMFBlue, // Background color for selected tab
                      borderRadius: BorderRadius.circular(8), // Optional
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: ColorManager.textPrimaryColor,
                    labelStyle: TextStyle(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelColor: ColorManager.textPrimaryColor,
                    dividerColor: Colors.black54,
                    tabs: [
                      Tab(child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Icon(Icons.content_paste_search_outlined),
                          Text("Transcripts")
                        ],
                      ),),
                      Tab(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Icon(Icons.history),
                            Text("Transcription History")
                          ],
                        ),),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      LiveCallTab(),
                      CallTransictionTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class LiveCallTab extends StatelessWidget {
  const LiveCallTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isName = false;
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(),
          SizedBox(height:40),
          Container(
            height: 31,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xFFFFE1AD),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Intake Script', style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                    fontWeight: FontWeight.w700,
                    color:  ColorManager.textPrimaryColor,),),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.play_circle_outline_outlined),
                      Text('Play', style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                      color:  ColorManager.textPrimaryColor,),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_up_outlined,color: Color(0xFF1696C8),)),
          ),
          Container(
            height:160,
            color:Color(0xFF1696C8).withOpacity(0.1),
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        CheckboxTile(
                          title: 'What is Your First Name?',
                          initialValue: isName,
                          onChanged: (value) {
      
                          },
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 10,
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
                        Text('My First Name is Erica', style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                        fontWeight: FontWeight.w700,
                        color:  ColorManager.textPrimaryColor,),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 5),
                      child: Row(
                        children: [
                          Image.asset("images/sm/aii.png",height: 20,),
                          SizedBox(width: 2,),
                          Text(" : Erica ",style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF008000),),),
                          SizedBox(width: 2,),
                          Icon(Icons.copy,color: ColorManager.textPrimaryColor ,),
                        ],
                      ),
                    )
                  ]
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF1696C8),)),
          ),
      
        ],
      ),
    );
  }
}

/// Call logs
class CallTransictionTab extends StatelessWidget {
  const CallTransictionTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 40,bottom: 20,top: 20),
              child: Text('Yesterday',style: CustomTextStylesCommon.commonStyle(
                color:Color(0xFF2B647F),
                fontWeight: FontWeight.w600,fontSize: FontSize.s16,
              ),),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView.builder(
                itemCount: 5,
                  itemBuilder: (BuildContext,index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                //crossAxisAlignment:CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                     // SizedBox(height: 5,),
                                      Image.asset("images/sm/outgoing_call.jpg",height: 20,),
                                     // Icon(Icons.phone_callback_outlined,color: Color(0xFF16A34A),size: 25,),
                                    ],
                                  ),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 5,),
                                      Text('John Smith',style: CustomTextStylesCommon.commonStyle(
                                        color:Color(0xFF686464),
                                        fontWeight: FontWeight.w700,fontSize: FontSize.s14,
                                      )),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: 70,
                                        height: 18,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.red),borderRadius: BorderRadius.circular(5),color: Color(0xFFB0BEC5)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.circle,color: Colors.red,size:8 ,),
                                            Text('02:22:50',style:CustomTextStylesCommon.commonStyle(
                                              color:Color(0xFF686464),
                                              fontWeight: FontWeight.w400,fontSize: FontSize.s10,
                                            ) ,)
                                          ],
                                        ),
                                      )

                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 5,
                                children: [
                                  Text('12:30 PM',style: CustomTextStylesCommon.commonStyle(
                                    color:Color(0xFF374151),
                                    fontWeight: FontWeight.w500,fontSize: FontSize.s14,
                                  ),),
                                  Text('Follow-Up Added',style: CustomTextStylesCommon.commonStyle(
                                    color:Color(0xFF9CA3AF),
                                    fontWeight: FontWeight.w700,fontSize: FontSize.s14,
                                  ),)
                                ],
                              ),


                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Divider()
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


