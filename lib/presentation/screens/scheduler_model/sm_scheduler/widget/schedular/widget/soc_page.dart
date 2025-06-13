import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/tab_widget/request_log.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../../app/resources/const_string.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../../../../app/services/api/managers/sm_module_manager/refferals_manager/scheduler_tab_manager.dart';
import '../../../../../../../data/api_data/sm_data/sm_model_data/sm_data.dart';
import '../../../../../../widgets/widgets/constant_textfield/const_textfield.dart';
import '../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../textfield_dropdown_constant/chatbotContainer.dart';
import '../sm_scheduler_screen_const.dart';

class SocPageView extends StatefulWidget {
  final VoidCallback onAutoTap;
  const SocPageView({super.key, required this.onAutoTap});

  @override
  State<SocPageView> createState() => _SocPageViewState();
}

class _SocPageViewState extends State<SocPageView> {

  bool _isCheckedbulk = true;
  bool _isBulkAssignActive = false;

  bool _isChecked = false;



  bool _isChatbotVisible = false;
  void _toggleChatbotVisibility() {
    setState(() {
      _isChatbotVisible = !_isChatbotVisible;
    });
  }

  String _selectedValue = 'Sort';
  final StreamController<List<PatientModels>> _streamController = StreamController<List<PatientModels>>();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Stack(
    children:[Padding(
        padding: const EdgeInsets.only(right: 70,left: 40,bottom: 5),
        child: Column(
          children: [
            SizedBox(height: AppSize.s20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [

                      CustomSearchFieldSM(
                        searchController: _searchController,
                        onPressed: (){},
                      ),
                      SizedBox(width: AppSize.s20,),
                      IconButton(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: providerContact.toggleFilter,
                          icon: Image.asset("images/sm/sm_refferal/filter_icon.png",height: AppSize.s18,width: AppSize.s16)//Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                      ),
                    ],
                  ),
                ),

                //     CustomDropdownTextField(
                //       width: 130,
                //       isAstric:false,
                //       iconColor: ColorManager.mediumgrey,
                //       initialValue: 'Employee Type',
                //       headText: "",
                //       items: ['Employee 1','Employee 2','Employee 3'],
                //       onChanged: (newValue) {
                //         // for (var a in snapshot.data!) {
                //         //   if (a.empType == newValue) {
                //         //     clinicialName = a.empType!;
                //         //     clinicalId = a.employeeTypesId!;
                //         //     print("Dept ID'''''' ${clinicalId}");
                //         //     print("';';';''''''''Dept ID ${clinicialName}");
                //         //     // Do something with docType
                //         //   }
                //         // }
                //       },
                //     ),
                //     CustomDropdownTextField(
                //       width:120,
                //       isAstric:false,
                //       iconColor: ColorManager.mediumgrey,
                //       initialValue: 'Clinician Type',
                //       headText: "",
                //       items: ['Clinical 1','Clinical 2','Clinical 3'],
                //       onChanged: (newValue) {
                //         // for (var a in snapshot.data!) {
                //         //   if (a.empType == newValue) {
                //         //     clinicialName = a.empType!;
                //         //     clinicalId = a.employeeTypesId!;
                //         //     print("Dept ID'''''' ${clinicalId}");
                //         //     print("';';';''''''''Dept ID ${clinicialName}");
                //         //     // Do something with docType
                //         //   }
                //         // }
                //       },
                //     ),
                //
                //     Container(
                //       decoration: BoxDecoration(
                //           border:  Border.all(color: Color(0xFFF0F0F0), width: 0.2),
                //           borderRadius: BorderRadius.all(Radius.circular(8))
                //       ),
                //       child: CustomDropdownTextField(
                //         width:100,
                //         isAstric:false,
                //         iconColor: ColorManager.mediumgrey,
                //         initialValue: 'Filter by',
                //         headText: "", // Default fallback if depId doesn't match any of the expected values
                //         items: ['Weekly','Monthly',],
                //         onChanged: (newValue) {
                //           // for (var a in snapshot.data!) {
                //           //   if (a.empType == newValue) {
                //           //     clinicialName = a.empType!;
                //           //     clinicalId = a.employeeTypesId!;
                //           //     print("Dept ID'''''' ${clinicalId}");
                //           //     print("';';';''''''''Dept ID ${clinicialName}");
                //           //     // Do something with docType
                //           //   }
                //           // }
                //         },
                //       ),
                //     ),
                //
                //     Padding(
                //       padding: const EdgeInsets.only(left: 30.0,right: 10),
                //       child: Text("SOC",style: DocumentTypeDataStyle.customTextStyle(context),),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //       child: Container(
                //         child:  Switch(
                //           focusColor: Colors.transparent,
                //           hoverColor: Colors.transparent,
                //           value: isSwitched,
                //           onChanged: (value) {
                //             setState(() {
                //               isSwitched = value;
                //               print(isSwitched);
                //             });
                //           },
                //           activeTrackColor: ColorManager.bluebottom,
                //           inactiveTrackColor:ColorManager.bluebottom ,
                //           activeColor: ColorManager.white,
                //         ),
                //       ),
                //     ),
                //     Text("Discipline",style: DocumentTypeDataStyle.customTextStyle(context),),
                //     SizedBox(width: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 125,
                      height: 35,
                      child: ElevatedButton.icon(onPressed: () {
                        setState(() {
                          _isBulkAssignActive = !_isBulkAssignActive; // Toggle the button state
                        });
                      },
                        label: Text(
                            _isBulkAssignActive ? "Save" : "Bulk Assign",
                            style: TextStyle(
                              fontSize:_isBulkAssignActive ? FontSize.s14:FontSize.s12,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.white,
                              decoration: TextDecoration.none,
                            )//BlueButtonTextConst.customTextStyle(context),
                        ),
                        icon: _isBulkAssignActive
                            ? null // Hide the icon when it's in "Save" state
                            : SvgPicture.asset(
                          "images/sm/bulk_assign.svg",
                          height: 13,
                          width: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  ColorManager.bluebottom,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                          ),),
                      ),
                    )

                  ],
                ),
              ],
            ),
            SizedBox(height: 30,),
            Expanded(
              child:  StreamBuilder<List<PatientModels>>(
                  stream:  _streamController.stream,
                  builder: (context ,snapshot) {
                    PatientSchedulerManager().getToBeSchedulerData( context: context,).then((data) {
                      _streamController.add(data);
                    }).catchError((error) {
                      // Handle error
                    });
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 76),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.blueprime,
                          ),
                        ),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 76),
                            child: Text(
                              AppStringSMModule.pendingNoData,
                              style: AllNoDataAvailable.customTextStyle(
                                  context),
                            ),
                          ));
                    }
                    if (snapshot.hasData) {
                      return ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) { return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
                    child: Row(
                      children: [
                      _isBulkAssignActive
                      ? Container(
                      width: 40,
                      height: 100,
                      // color: Colors.red,
                      child:  Checkbox(
                        splashRadius: 0,
                        activeColor: ColorManager.blueprime,
                        value: _isCheckedbulk,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedbulk = value!;
                          });
                        },
                      ),
                    ):Container(width: 40,height: 100,),
                        Flexible(
                          child: SchedularContainerConst(
                           // height: 110,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Container(
                                          width: AppSize.s56,
                                          height: AppSize.s16,
                                          decoration: BoxDecoration(
                                            color:Color(0xFF4FB4F4),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),),
                                          child: Center(
                                            child: Text(
                                                'Wound',
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.w400)),
                                          )),
                                    ]
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: AppPadding.p20,bottom: AppPadding.p10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child:  ClipOval(
                                                      child: snapshot.data![index].ptImgUrl == 'imgurl' ||
                                                          snapshot.data![index].ptImgUrl == null
                                                          ? CircleAvatar(
                                                        radius: 22,
                                                        backgroundColor: Colors.transparent,
                                                        child: Image.asset("images/profilepic.png"),
                                                      )
                                                          : Image.network(
                                                        snapshot.data![index].ptImgUrl!,
                                                        loadingBuilder: (context, child, loadingProgress) {
                                                          if (loadingProgress == null) {
                                                            return child;
                                                          } else {
                                                            return Center(
                                                              child: CircularProgressIndicator(
                                                                value: loadingProgress.expectedTotalBytes != null
                                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                                    (loadingProgress.expectedTotalBytes ?? 1)
                                                                    : null,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        errorBuilder: (context, error, stackTrace) {
                                                          return CircleAvatar(
                                                            radius: 21,
                                                            backgroundColor: Colors.transparent,
                                                            child: Image.asset("images/profilepic.png"),
                                                          );
                                                        },
                                                        fit: BoxFit.cover,
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    ),
                                      ),
                                      SizedBox(width: AppSize.s12),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${snapshot.data![index].ptFirstName} ${snapshot.data![index].ptLastName}",
                                              style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w700,
                                                color: ColorManager.mediumgrey,),
                                            ),
                                            SizedBox(height: AppSize.s5),
                                            Text(
                                              'MRN #584234',
                                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.mediumgrey,),
                                            ),
                                            SizedBox(height: AppSize.s5),
                                            Text(
                                              'Anxiety',
                                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.mediumgrey,),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        width: 300,
                                        child: CustomButtonRow(
                                          onSaveClosePressed: widget.onAutoTap,
                                          onSubmitPressed: () {
                                            // Action for Submit button
                                            print('Submit pressed');
                                          },
                                          onNextPressed: () {
                                            // Action for Next button
                                            print('Next pressed');
                                          },
                                        ),
                                      ),

                                      // SizedBox(width: 10,),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text("Kaiser Med Advantage ",
                                              style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w400,
                                                color: ColorManager.mediumgrey,),),

                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("San Josaquin z3",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),),

                                              SizedBox(height: AppSize.s5),
                                              Text("58244",
                                                style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // SizedBox(width: 5,),

                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                                      SizedBox(height: AppSize.s8),
                                                      Text("SOC Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                                    ],),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                                      SizedBox(height: AppSize.s8),
                                                      Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                                    ],),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              child: Image.asset("images/sm/contact_text.png",height: 55,)
                                              ,onTap: _toggleChatbotVisibility,),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            onTap: (){},
                                            child:Column(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 10,),
                                                Icon(Icons.block_flipped,size: IconSize.I22,color: Color(0xFF2F6D8A),weight: 10,),
                                                SizedBox(height: 10,),
                                                Text("Non-Admit",
                                                  style: TextStyle(
                                                    fontSize: FontSize.s11,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF2F6D8A),
                                                  ),)
                                              ],
                                            )
                                        ),
                                      ),

                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 40),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                child: SvgPicture.asset(
                                                  'images/sm/sm_refferal/i_circle.svg',
                                                  height:30,
                                                  //width: IconSize.I20,
                                                )
                                                //child: Image.asset("images/sm/i_circle.png",height: 60,)
                                                ,onTap: ()async{
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return  Requestlog();
                                                  },
                                                );
                                              },),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        flex: 2,
                                        // child: Row(
                                        //   children: [
                                        //     Padding(
                                        //       padding: const EdgeInsets.symmetric(vertical: 5),
                                        //       child: ClipRRect(
                                        //         borderRadius: BorderRadius.circular(60),
                                        //         child: SizedBox(
                                        //           width: AppSize.s40,
                                        //           height: AppSize.s45,
                                        //           child: Image.asset(
                                        //             'images/hr_dashboard/man.png', // Replace with your image path
                                        //             fit: BoxFit.cover,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: AppSize.s10,),
                                        //     Row(
                                        //       children: [
                                        //         Container(
                                        //           width: AppSize.s50,
                                        //           height: AppSize.s25,
                                        //           child: ElevatedButton(
                                        //             onPressed: (){},
                                        //             style: ElevatedButton.styleFrom(
                                        //               backgroundColor:Color(0xffB4DB4C),
                                        //               shape: RoundedRectangleBorder(
                                        //                 borderRadius: BorderRadius.circular(5),
                                        //               ),
                                        //             ),
                                        //             child: Text(
                                        //               'RN',
                                        //               style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s10,
                                        //                 fontWeight: FontWeight.w400,
                                        //                 color: ColorManager.white,),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         SizedBox(width: AppSize.s5,),
                                        //         Text("Pending")
                                        //       ],
                                        //
                                        //     ),
                                        //   ],
                                        // ),
                                        ///
                                        ///
                                        ///
                                        child:Column(// Horizontally center the children
                                          children: [
                                            SizedBox(
                                              height: 80, // Adjust the height to give space for stacked avatars
                                              child: Stack(
                                                children: [
                                                  for (var i = 0; i < 3; i++) // Loop 3 times for the 3 avatars
                                                    Positioned(
                                                      left: 0, // Keep the left position constant
                                                      top: (i * (1 - .4) * 40).toDouble(), // Stagger the top position
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar(
                                                            backgroundColor: Colors.blue,
                                                            child: Container(
                                                              clipBehavior: Clip.antiAlias,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.white, width: 1),
                                                                borderRadius: BorderRadius.circular(50),
                                                              ),
                                                              // padding: const EdgeInsets.all(5.0),
                                                              child: Image.asset(
                                                                'images/hr_dashboard/man.png', // Replace with your image path
                                                                fit: BoxFit.cover,
                                                              ),
                                                              // Image.network(
                                                              //   "https://github.com/identicons/guest.png", // Network image URL
                                                              //   fit: BoxFit.cover, // Ensures the image fills the CircleAvatar
                                                              // ),
                                                            ),
                                                            radius: 16,
                                                          ),
                                                          SizedBox(width: AppSize.s12,),
                                                          Container(
                                                            width: AppSize.s40,
                                                            height: AppSize.s20,
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
                                                          SizedBox(width: AppSize.s12,),
                                                          Text("Pending",style: TextStyle(fontSize: FontSize.s12,
                                                            fontWeight: FontWeight.w300,fontStyle: FontStyle.italic,
                                                            color: ColorManager.granitegray,),),
                                                        ],
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ); },

                ),
              );
  }
  else{
  return const SizedBox();
  }
}
)
            ),
          ],
        ),
      ),
      if (_isChatbotVisible)
        Positioned.fill(
          child: GestureDetector(
            onTap: _toggleChatbotVisibility, // Close popup on tapping outside
            child: Container(
                color: Colors.transparent
            ),
          ),
        ),
      AnimatedPositioned(duration:Duration(milliseconds: 300),
          bottom: _isChatbotVisible ? 0 : -500, // Slide in from bottom-right
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 460,
            width: 550,

            child: ChatBotContainer(
              onClose: _toggleChatbotVisibility,
            ),

          ) ),
      ///
      ///

    ] ,

      ),
    );
  }

  Widget buildDropdownButton(BuildContext context) {
    final Map<String, String> displayTextMap = {
      'Sort': 'Filter by',
      'Opened': 'Opened',
      'Notopen': 'Not Opened',
      'Partial': 'Partial',
      'Completed': 'Completed',
    };

    return Column(
      children: [
        DropdownButton2<String>(
          value: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
              //filterData();
            });
          },
          style: AllPopupHeadings.customTextStyle(context),
          iconStyleData:  IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: ColorManager.mediumgrey,
            ),
          ),
          // iconSize: 20,
          underline: const SizedBox(),
          buttonStyleData: ButtonStyleData(
            height: 32,
            width: 130,
            padding:
            const EdgeInsets.symmetric(horizontal: 8), // Internal padding.
            elevation: 2, // Shadow depth.
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   border: Border.all(color: const Color(0xff50B5E5), width: 1.2),
            //   borderRadius: BorderRadius.circular(12.0),
            //   // boxShadow: [
            //   //   BoxShadow(
            //   //     color: const Color(0xff000000).withOpacity(0.25),
            //   //     blurRadius: 2,
            //   //     offset: const Offset(0, 2),
            //   //   ),
            //   // ],
            // ),
            overlayColor: WidgetStateProperty.all(
                Colors.grey.withOpacity(0.1)), // Background color when pressed.
          ),

          /// buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
          // dropdownMaxHeight: 200,
          // dropdownDecoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(12),
          //   color: Colors.white,
          // ),
          // itemPadding: const EdgeInsets.symmetric(horizontal: 8), // Updated padding
          selectedItemBuilder: (context) =>
              displayTextMap.keys.map((String value) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(displayTextMap[value]!),
                );
              }).toList(),
          items: displayTextMap.keys.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(displayTextMap[value]!),
            );
          }).toList(),
        ),
      ],
    );
  }

}


//SchedularContainerConst(
//                       height: 80,
//
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                             children:[
//                               Container(
//                                   width: AppSize.s88,
//                                   height: AppSize.s20,
//                                   decoration: BoxDecoration(
//                                     color:Color(0xFFE3F2F8),
//                                     borderRadius: BorderRadius.only(
//                                         topRight:
//                                         Radius.circular(12)),),
//                                   child: Center(
//                                     child: Text(
//                                          'Chart #1',
//                                         textAlign: TextAlign.center,
//                                         style: CustomTextStylesCommon.commonStyle(
//                                             color: Color(0xFFE1696C8),
//                                             fontSize: FontSize.s12,
//                                             fontWeight: FontWeight.w600)),
//                                   )),
//                             ]
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Row(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 5),
//                                             child: ClipRRect(
//                                               borderRadius: BorderRadius.circular(60),
//                                               child: SizedBox(
//                                                 width: AppSize.s45,
//                                                 height: AppSize.s50,
//                                                 child: Image.asset(
//                                                   'images/hr_dashboard/man.png', // Replace with your image path
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(width: AppSize.s7),
//                                       Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Jeh Tiwari',
//                                             style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                               fontWeight: FontWeight.w700,
//                                               color: ColorManager.mediumgrey,),
//                                           ),
//                                           SizedBox(height: AppSize.s5),
//                                           Text(
//                                             'Anxiety',
//                                             style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
//                                               fontWeight: FontWeight.w400,
//                                               color: ColorManager.mediumgrey,),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               Expanded(
//                                 flex: 3,
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
//                                     SizedBox(width: 15,),
//                                     Container(
//                                       width: 230,
//                                       child:Text("Tufts International Center, 20 Sawyer Ave, Medford MA 02155",
//                                         textAlign: TextAlign.start,
//                                         style:DocDefineTableDataID.customTextStyle(context),
//                                       ) ,
//                                     )
//                                   ],
//                                 ),
//                               ),
//
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF692A8),
//                                           borderRadius: BorderRadius.circular(5), // Makes the borders curved with radius 5
//                                         ),
//                                         width: 22,
//                                         height: 20,
//                                         child: Center(
//                                           child: Text(
//                                             "PT",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 12,
//                                               color: ColorManager.white,
//                                               decoration: TextDecoration.none,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Row(
//                                   children: [
//
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           color: Color(0xFFF8E3F8).withOpacity(0.5),
//                                           borderRadius: BorderRadius.circular(5), // Makes the borders curved with radius 5
//                                         ),
//                                         width: 22,
//                                         height: 20,
//                                         child: Center(
//                                           child: Text(
//                                             "A+",
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.w700,
//                                               fontSize: 12,
//                                               color:  Color(0xFFC416C8),
//                                               decoration: TextDecoration.none,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 2,
//                                 child: Row(
//                                   children: [
//                                     Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
//                                     // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
//                                     Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
//                                   ],
//                                 ),
//                               ),
//
//
//                               // Row(
//                               //   children: [
//                               //     Padding(
//                               //         padding: const EdgeInsets.only(right: 0),
//                               //         child: Image.asset("images/sm/contact.png",height: 50,width: 60,)
//                               //     ),
//                               //     Padding(
//                               //       padding: const EdgeInsets.all(8.0),
//                               //       child: Container(
//                               //           decoration: BoxDecoration(
//                               //             borderRadius:
//                               //             BorderRadius.circular(8),
//                               //             color:Color(0xFFDCEFF7) ,
//                               //           ),
//                               //           height:40,
//                               //           width: 40,
//                               //
//                               //           child: Icon(Icons.edit,color: ColorManager.bluebottom,)),
//                               //     ),
//                               //   ],
//                               // ),
//
//                               Expanded(
//                                 flex: 3,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//
//                                     SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
//                                     SizedBox(width: 15,),
//                                     Icon(Icons.edit_outlined,color: ColorManager.bluebottom,),
//                                     // Container(
//                                     //     width: 200,
//                                     //     height: 55,
//                                     //     child:Row(
//                                     //       children: [
//                                     //         Container(
//                                     //           width: 100,
//                                     //           child:  ElevatedButton.icon(onPressed: ()async{
//                                     //             await  showDialog(
//                                     //               context: context,
//                                     //               builder: (BuildContext context) {
//                                     //                 return VendorSelectNoti(
//                                     //                   message: 'Please Select A File',
//                                     //                 );
//                                     //               },
//                                     //             );
//                                     //           },label: Text("Auto", style: TextStyle(
//                                     //             fontSize: FontSize.s13,
//                                     //             fontWeight: FontWeight.w600,
//                                     //             color: ColorManager.white,
//                                     //             decoration: TextDecoration.none,
//                                     //           )),
//                                     //             //icon: Icon(Icons.flash_auto,color:ColorManager.white ,size: 16,),
//                                     //           icon: Image.asset("images/sm/auto.png",height: 30,width: 18,),
//                                     //             style: ElevatedButton.styleFrom(
//                                     //               backgroundColor:  ColorManager.bluebottom,
//                                     //               shape: RoundedRectangleBorder(
//                                     //                 borderRadius: BorderRadius.only(
//                                     //                   topLeft: Radius.circular(12), // Round only the top-left corner
//                                     //                   bottomLeft: Radius.circular(12), // Round only the bottom-left corner
//                                     //                 ),
//                                     //                 side: BorderSide(
//                                     //                   color: Color(0xFF0A74DA), // Border color
//                                     //                   width: 1,
//                                     //                 ),
//                                     //               ),
//                                     //             ),
//                                     //           ),
//                                     //         ),
//                                     //         Container(
//                                     //           width: 100,
//                                     //           child:  ElevatedButton.icon(onPressed: (){
//                                     //             showDialog(
//                                     //               context: context,
//                                     //               builder: (BuildContext context) {
//                                     //                 return AddErrorPopup(
//                                     //                   message: 'File is too large!',
//                                     //                 );
//                                     //               },
//                                     //             );
//                                     //           },label: Text("Manual", style: TextStyle(
//                                     //             fontSize: FontSize.s13,
//                                     //             fontWeight: FontWeight.w600,
//                                     //             color: ColorManager.bluebottom,
//                                     //             decoration: TextDecoration.none,
//                                     //           )),
//                                     //             //icon: Icon(Icons.swipe_rounded,color:ColorManager.bluebottom ,size: 16,),
//                                     //              icon: Image.asset("images/sm/manual.png",height: 30,width: 18,),
//                                     //             style: ElevatedButton.styleFrom(
//                                     //               backgroundColor: Colors.white,
//                                     //               shape: RoundedRectangleBorder(
//                                     //                 borderRadius: BorderRadius.only(
//                                     //                   topRight: Radius.circular(12), // Round only the top-left corner
//                                     //                   bottomRight: Radius.circular(12), // Round only the bottom-left corner
//                                     //                 ),
//                                     //                 side: BorderSide(
//                                     //                   color: Color(0xFF0A74DA), // Border color
//                                     //                   width: 1,
//                                     //                 ),
//                                     //               ),
//                                     //             ),
//                                     //           ),
//                                     //         ),
//                                     //
//                                     //
//                                     //       ],
//                                     //     )
//                                     // )
//                                     SizedBox(width: 15,),
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(top: 0),
//                                         child: Row(
//                                           children: [
//                                             Stack(
//
//                                               children: [ClipRRect(
//                                                 borderRadius: BorderRadius.circular(60),
//                                                 child: SizedBox(
//                                                   width: AppSize.s45,
//                                                   height: AppSize.s50,
//                                                   child: Image.asset(
//                                                     'images/1.png', // Replace with your image path
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                                 Positioned(
//                                                   left:22,
//                                                   bottom :0,
//                                                   child: Container(
//                                                     color: Color(0xFF527FB9),
//                                                     width: 19,
//                                                     height: 19,
//                                                     child: Center(
//                                                       child: Text("ST",style: TextStyle(
//                                                         // fontWeight: FontWeight.w600,
//                                                         // fontSize: FontSize.s13,
//                                                         color: ColorManager.white,
//                                                         decoration: TextDecoration.none,
//                                                       ),),
//                                                     ),
//                                                   ),)
//                                               ],
//                                             ),
//                                             SizedBox(width: AppSize.s7),
//                                             Text(
//                                               'John Smith',
//                                               style:DocumentTypeDataStyle.customTextStyle(context),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
