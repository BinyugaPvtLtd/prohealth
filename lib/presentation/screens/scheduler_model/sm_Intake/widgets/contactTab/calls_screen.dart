import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/web_manage/manage_screen.dart';

import '../../../../../../app/resources/theme_manager.dart';
import '../../../../hr_module/manage/widgets/constant_widgets/const_checckboxtile.dart';
import '../intake_flow_contgainer_const.dart';

class ContactCallsScreen extends StatelessWidget {
  const ContactCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
              border: Border(
            top: BorderSide(color: Color(0xFF1696C8),width: 5)
          )),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: TabBar(
                      onTap: (index) {

                      },
                      indicatorWeight: 3,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                      indicator: BoxDecoration(
                        color: Color(0xFF50B5E538), // Background color for selected tab
                        borderRadius: BorderRadius.circular(8), // Optional
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: ColorManager.textPrimaryColor,
                      labelStyle: TextStyle(
                        fontSize: 14,
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
                            Icon(Icons.send_to_mobile_outlined),
                            Text("Live Call")
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
                  Container(
                    height: MediaQuery.of(context).size.height / 2, // Adjust height as needed
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
    return Column(
      children: [
        SizedBox(height:40),
        Container(
          height: 31,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Color(0xFFFFE1AD).withOpacity(0.2),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Intake Script'),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.play_circle_outline_outlined),
                    Text('Play')
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
          height:150,
          color:Color(0xFF1696C8).withOpacity(0.1),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
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
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                      ),
                      Text('My First Name is Erica')
                    ],
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
    );
  }
}

/// Call logs
class CallTransictionTab extends StatelessWidget {
  const CallTransictionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('Yesterday',style: CustomTextStylesCommon.commonStyle(
              color:Color(0xFF2B647F),
              fontWeight: FontWeight.w500,fontSize: 14,
            ),),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView.builder(
              itemCount: 5,
                itemBuilder: (BuildContext,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: IntakeFlowContainerConst(
                      height: AppSize.s50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add_ic_call_outlined,color: Color(0xFF16A34A),),
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                    Text('John Smith',style: CustomTextStylesCommon.commonStyle(
                                      color:Color(0xFF686464),
                                      fontWeight: FontWeight.w500,fontSize: 12,
                                    )),
                                    Container(
                                      width: 70,
                                      height: 13,
                                      decoration: BoxDecoration(border: Border.all(color: Colors.red),borderRadius: BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.circle,color: Colors.red,size: 6,),
                                          Text('02:22:50',style:CustomTextStylesCommon.commonStyle(
                                            color:Color(0xFF686464),
                                            fontWeight: FontWeight.w400,fontSize: 8,
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
                              spacing: 10,
                              children: [
                                Text('12:30 PM',style: CustomTextStylesCommon.commonStyle(
                                  color:Color(0xFF374151),
                                  fontWeight: FontWeight.w400,fontSize: 14,
                                ),),
                                Text('Follow-Up Added',style: CustomTextStylesCommon.commonStyle(
                                  color:Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,fontSize: 12,
                                ),)
                              ],
                            )

                          ],
                        ),
                      ),),
                  );
                }),
          ),
        ],
      ),
    );
  }
}


