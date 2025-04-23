import 'package:flutter/material.dart';

import '../../../../../../app/resources/color.dart';

import 'package:flutter/material.dart';

import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';


class ContactLogsScreen extends StatelessWidget {
  const ContactLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: const Border(
                    top: BorderSide(
                      color: Color(0xFF1696C8),
                      width: 5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: const Offset(0, 1.2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor:  ColorManager.textPrimaryColor,
                        indicator: BoxDecoration(
                          color: ColorManager.SMFBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        tabs: [
                          Tab(child: Text('Call Log',  style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color:  ColorManager.textPrimaryColor,),),),

                          Tab(child: Text('E-Fax',  style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                            fontWeight: FontWeight.w700,
                            color:  ColorManager.textPrimaryColor,),),),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                     Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          CallLogsTab(),
                          ///
                          EFaxTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}











class CallLogsTab extends StatelessWidget {
  const CallLogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child:ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5,),
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset("images/sm/logo_ph.png",height: 40,),
                            ],
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSize.s5),
                              Text(
                                'Prohealth',
                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.mediumgrey,),
                              ),
                              SizedBox(height: AppSize.s2),
                              Text(
                                '05/08/2024 ',
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.mediumgrey,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Text(
                              '6 mins 23 secs',
                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.mediumgrey,),
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                )
            );
          }),
    );
  }
}









class EFaxTab extends StatelessWidget {
  const EFaxTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child:ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5,),
                child: Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset("images/sm/file.png",height: 30,),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text(
                                'eFax sent by Warren. No document \nattached.',
                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.mediumgrey,),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: AppSize.s5),
                            Text(
                              '05/08/24',
                              style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.mediumgrey,),
                            ),
                            SizedBox(height: AppSize.s2),
                            Text(
                              '8:17PM',
                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.mediumgrey,),
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                )
            );
          }),
    );
  }
}











//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(height: 20,),
//           Container(
//             height:MediaQuery.of(context).size.height *0.6,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border(top: BorderSide(
//                 color: Color(0xFF579EBA),
//                 width: 5,
//               ),),
//               // border: Border.symmetric(vertical: BorderSide.none,horizontal: BorderSide(width: 1,color: Color(0xFFBCBCBC)),),//all(width: 1, color: Color(0xFFBCBCBC)),
//               boxShadow: [
//                 BoxShadow(
//                   color: ColorManager.black.withOpacity(0.2),
//                   blurRadius: 2,
//                   spreadRadius: 0,
//                   offset: const Offset(0, 1.2), // Downward shadow
//                 ),
//               ],
//             ),
//             child:  Column(
//           children: [
//           // 🔄 This replaces SizedBox(height: 40)
//           TabBar(
//           labelColor: Colors.blue,
//             unselectedLabelColor: Colors.grey,
//             tabs: [
//               Tab(text: 'Tab 1'),
//               Tab(text: 'Tab 2'),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Divider(),
//           ),
//           // 🔽 Tab content area
//           Expanded(
//             child: TabBarView(
//               children: [
//                 Center(child: Text('Content for Tab 1')),
//                 Center(child: Text('Content for Tab 2')),
//               ],
//             ),
//           ),
//         ],
//       )
//           ),
//         ],
//       ),
//     );
//   }
// }
