import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prohealth/presentation/screens/oasis_module/charts/charts_detail_screen/charts_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../../../app/resources/establishment_resources/establish_theme_manager.dart';

import '../../../../oasis_form_builder/services/api/managers/form_builder_manager.dart';
import '../../hr_module/hr_home_screen/referesh_provider.dart';
import '../widgets/constant/blue_tabbar.dart';

class PatientChartScreen extends StatefulWidget {
  const PatientChartScreen({super.key});

  @override
  State<PatientChartScreen> createState() => _PatientChartScreenState();
}

class _PatientChartScreenState extends State<PatientChartScreen> {
  // Mixin to provide vsync (TickerProvider)
  int selectindex = 0;
  PageController _pageController = PageController();

  int pgeControllerId = 0;
  final ButtonSelectionControlleroasis myController =
      Get.put(ButtonSelectionControlleroasis());

// Method to update drawer content based on selected index
  Widget _getDrawerContent(int index) {
    switch (index) {
      case 0:
        return Drawerrightside(); // Replace with the widget for Consent For Care
      case 1:
        return DrawerrightsideA(); // Replace with the widget for Administrative Information
      case 2:
        return DrawerrightsideB(); // Replace with the widget for Clinical Record Items
      // case 3:
      //   return PatientHistoryImmunization(); // Replace with the widget for Patient History/Immunization
      // case 33:
      //   return DiagnosisCodes(); // Replace with the widget for Diagnosis Codes
      default:
        return DefaultDrawerContent(); // Default content if no index is selected
    }
  }

  Future<void> _saveIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentIndex', index);
  }

  void onPageChanged(int index) {
    Provider.of<PageIndexProvider>(context, listen: false).setIndex(index);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: _getDrawerContent(myController.selectedIndex.value),
        ),
      ),
      body: Container(
        child: InkWell(
            onTap: () async {
              await FormBuilderManager().initPatientForm(
                context,
                patientId: 1,
                subFormId: 1,
                chartId: 1,
                episodeId: 1,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChartsDetailScreen()));
            },
            child: Text("View OASIS")),
      ),
    );
  }
}

////

///
///
///
///

// class PatientChartScreen extends StatefulWidget {
//   const PatientChartScreen({super.key});
//
//   @override
//   State<PatientChartScreen> createState() => _PatientChartScreenState();
// }
//
// class _PatientChartScreenState extends State<PatientChartScreen> {
//
//
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this,);  // 4 tabs in this example
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           // This Row will have a height of 100
//           Container(
//             height: 100,
//            // color: Colors.blue,  // Set color for the top row
//             child: Row(
//               children: [
//                 Container(
//                   width: 450,
//                   //height: 200, // Height is also needed for a circular shape
//                   decoration: BoxDecoration(
//                     color: Color(0xFFB1D6F4), // Background color
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),  // Circular border on top-right
//                       bottomRight: Radius.circular(10), // Circular border on bottom-right
//                     ), // Rounded border (half of the width for a circle)
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(60),
//                               child: SizedBox(
//                                 width: 60,
//                                 height: 60,
//                                 child: Image.asset(
//                                   'images/hr_dashboard/man.png', // Replace with your image path
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 15),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 15),
// Text("JOHN SCOTT", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
//   fontWeight: FontWeight.w600,
//   color: ColorManager.textBlack,),),
//                           SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("DOB", style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorManager.mediumgrey,),),
//                                   SizedBox(height: 10),
//                                   Text("Chart Number", style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorManager.mediumgrey,) ),
//                                 ],
//                               ),
//                               //SizedBox(height: 10),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text("08-03-1997 (27)", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                     fontWeight: FontWeight.w600,
//                                     color: ColorManager.textBlack,),),
//                                   SizedBox(height: 10),
//                                   Text("123456", style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                     fontWeight: FontWeight.w600,
//                                     color: ColorManager.textBlack,),),
//                                 ],
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       // Add your widgets here
//                     ],
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//           SizedBox(height: 10),
//           // This SingleChildScrollView will make the container scrollable
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 child: Row(
//                   children: [
//                     // First Column with flex: 2
//                     Expanded(
//                       flex: 3,
//                       child: Container(
//                         color: Color(0xFF51B5E6),  // Color to identify this column
//                         child: Column(
//                           children: [
//                             TabBar(
//                               controller: _tabController,
//                               tabs: [
//                                 Tab(text: 'Tab 1'),
//                                 Tab(text: 'Tab 2'),
//                                 Tab(text: 'Tab 3'),
//                                 Tab(text: 'Tab 4'),
//                               ],
//                               labelColor: Colors.white,
//                               indicatorColor: Colors.white,
//                             ),
//                             SizedBox(
//                               height: 100,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     // Second Column with remaining space
//                     Expanded(
//                       flex: 7,
//                       child: Container(
//                         color: Colors.white,  // Color to identify this column
//                         child:  TabBarView(
//                           controller: _tabController,
//                           children: [
//                             // Content for Tab 1
//                             Center(child: Text('Content for Tab 1')),
//                             // Content for Tab 2
//                             Center(child: Text('Content for Tab 2')),
//                             // Content for Tab 3
//                             Center(child: Text('Content for Tab 3')),
//                             // Content for Tab 4
//                             Center(child: Text('Content for Tab 4')),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
// }
// }
