import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/widget/tab_widget/request_log.dart';
import 'package:provider/provider.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../textfield_dropdown_constant/chatbotContainer.dart';
import '../sm_scheduler_screen_const.dart';

class PendingPageView extends StatefulWidget {
  final VoidCallback onAutoTap;
  const PendingPageView({super.key,required this.onAutoTap});

  @override
  State<PendingPageView> createState() => _PendingPageViewState();
}

class _PendingPageViewState extends State<PendingPageView> {


  bool isSwitched = false;

  String _selectedValue = 'Sort';


  bool _isBulkAssignActive = false; // to track if bulk assign is tapped
  bool _isChatbotVisible = false;
  void _toggleChatbotVisibility() {
    setState(() {
      _isChatbotVisible = !_isChatbotVisible;
    });
  }


  // ///checkbox
   bool _isCheckedbulk = true;




  List RandomImages = [
    'images/profilepic.png',
    'images/1.png',
    'images/hr_dashboard/man.png',
  ];

  @override
  Widget build(BuildContext context) {
    final providerContact = Provider.of<SmIntakeProviderManager>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children:[ Padding(
          padding:const EdgeInsets.only(right: 70,left: 40,bottom: 5),
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
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ListView.builder(
                    itemCount: 5,
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
                          ):Container(width: 40,
                            height: 100,),
                          Flexible(
                            child: SchedularContainerConst(
                            //  height: 110,
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
                                    padding: const EdgeInsets.only(left: AppPadding.p20 ,bottom: AppPadding.p10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                        SizedBox(width: AppSize.s12),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Jeh Tiwari',
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
                                                      SizedBox(height: AppSize.s5),
                                                      Text("SOC Date : ",style: DocDefineTableDataID.customTextStyle(context),),
                                                    ],),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                      Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
                                                      SizedBox(height: AppSize.s5),
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
                                                //child: Image.asset("images/sm/contact_text.png",height: 55,)
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 6,),
                                                    Image.asset("images/sm/contact_icon.png",height: 25,),
                                                    SizedBox(height: 8,),
                                                    Text("Contact",
                                                      style: TextStyle(
                                                        fontSize: FontSize.s12,
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xFF2F6D8A),
                                                      ),)
                                                  ],
                                                )
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
                                                      fontSize: FontSize.s12,
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
                ),
              ),
            ],
          ),
        ),
         // if (_isChatbotVisible)
          // Background overlay when the popup is visible
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


        ] ,

      ),

    );
  }

  Widget buildStackImages() {
    final double  size =100;
    final item = RandomImages.map((RandomImages)=>buildImages(RandomImages)).toList();
    return stackimage(items: item,
      size: size,);

  }

  Widget  buildImages(String RandomImages){
    return ClipOval(
      child: Container(
        color: Colors.black,
          padding: EdgeInsets.all(5),
          child: ClipOval(child: Image.asset(RandomImages,fit: BoxFit.cover,))),
    );
  }



}






class stackimage extends StatelessWidget {

  final List<Widget> items;
  final double size;

  const stackimage({
    Key? key,
    required this.items,
    this.size =100,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items.asMap().map((index ,item){
      final left =size -20;
      final value = Container(
        width: size,
        height: size,
        child: item,
        margin: EdgeInsets.only(top :left* index)
      );
      return MapEntry(index, value);
    }).values.toList();
    return Stack(

      children: allItems
    );
  }
}
