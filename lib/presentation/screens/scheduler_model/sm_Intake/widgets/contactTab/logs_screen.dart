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
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)),
          //     border: const Border(
          //   top: BorderSide(color: Color(0xFF1696C8),width: 5)
          // ),
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
          // boxShadow: [
          //   BoxShadow(
          //     color: ColorManager.black.withOpacity(0.2),
          //     blurRadius: 2,
          //     spreadRadius: 1,
          //     offset: const Offset(0, 2), // Downward shadow
          //   ),
          // ],
        ),
        child: Container(
          //height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                // bottomLeft: Radius.circular(12),
                //bottomRight: Radius.circular(12),
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)),
            border: const Border(
                top: BorderSide(color: Color(0xFF1696C8), width: 5)),
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 3,
                    ),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: ColorManager.textPrimaryColor,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 1),
                      indicator: BoxDecoration(
                        color: ColorManager.SMFBlue,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'Call Log',
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.textPrimaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'E-Fax',
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.textPrimaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
        ),
      ),
    ));
  }
}

class CallLogsTab extends StatelessWidget {
  const CallLogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "images/sm/logo_ph.png",
                                height: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSize.s5),
                              Text(
                                'Prohealth',
                                style: CustomTextStylesCommon.commonStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.mediumgrey,
                                ),
                              ),
                              SizedBox(height: AppSize.s2),
                              Text(
                                '2024/08/05',
                                style: CustomTextStylesCommon.commonStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.mediumgrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '6 mins 23 secs',
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s12,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.mediumgrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
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
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 25,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "images/sm/file.png",
                              height: 30,
                            ),
                          ],
                        ),
                        //SizedBox(width: 20,),
                        SizedBox(
                          width: 200,
                          child: Text(
                            'eFax sent by Warren. No document attached.',
                            style: CustomTextStylesCommon.commonStyle(
                              fontSize: FontSize.s12,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.mediumgrey,
                            ),
                          ),
                        )
                        // Column(
                        //   children: [
                        //     Text(
                        //       'eFax sent by Warren. No document \nattached.',
                        //       style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                        //         fontWeight: FontWeight.w500,
                        //         color: ColorManager.mediumgrey,),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: AppSize.s5),
                        Text(
                          '2024/08/05',
                          style: CustomTextStylesCommon.commonStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.mediumgrey,
                          ),
                        ),
                        SizedBox(height: AppSize.s2),
                        Text(
                          '8:17PM',
                          style: CustomTextStylesCommon.commonStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.mediumgrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
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
