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
    return DefaultTabController(
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
                    color: Color(0xFF579EBA),
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
                    child: const TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Color(0xFF50B5E5),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      tabs: [
                        Tab(text: 'Call Log'),
                        Tab(text: 'E-Fax'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                   Expanded(
                    child: TabBarView(
                      physics: ScrollPhysics(),
                      children: [
                        Padding(
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
                                        Row(
                                          children: [
                                            Text(
                                              '6 mins 23 secs',
                                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.mediumgrey,),
                                            ),
                                          ],
                                        ),
                                      ],

                                    ),
                                  )
                              );
                            }),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("This is Tab 2 content"),
                                SizedBox(height: 20),
                                Text("More content..."),
                                SizedBox(height: 180),
                                Text("End of Tab 2"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
