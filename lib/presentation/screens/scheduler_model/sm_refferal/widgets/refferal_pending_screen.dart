import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/app/resources/font_manager.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalPendingScreen extends StatefulWidget {
  final VoidCallback onEyeButtonPressed;
  final VoidCallback onMergeDuplicatePressed;
  const RefferalPendingScreen({super.key, required this.onEyeButtonPressed,
    required this.onMergeDuplicatePressed});

  @override
  _RefferalPendingScreenState createState() => _RefferalPendingScreenState();
}

class _RefferalPendingScreenState extends State<RefferalPendingScreen> {
  bool _isFilterOpen = false; // Track filter panel state

  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen; // Toggle panel visibility
    });
  }

  bool _MContainerVisible = false;
  bool _OContainerVisible = false;
  bool _RContainerVisible = false;
  bool _AContainerVisible = false;
  bool _IContainerVisible = false;
  bool _ICContainerVisible = false;
  bool _PContainerVisible = false;

  void toggleContainerM() {
    setState(() {
      _MContainerVisible = !_MContainerVisible;
    });
  }
  void toggleContainerO() {
    setState(() {
      _OContainerVisible = !_OContainerVisible;
    });
  }
  void toggleContainerR() {
    setState(() {
      _RContainerVisible = !_RContainerVisible;
    });
  }
  void toggleContainerA() {
    setState(() {
      _AContainerVisible = !_AContainerVisible;
    });
  }
  void toggleContainerI() {
    setState(() {
      _IContainerVisible = !_IContainerVisible;
    });
  }
  void toggleContainerIC() {
    setState(() {
      _ICContainerVisible = !_ICContainerVisible;
    });
  }
  void toggleContainerP() {
    setState(() {
      _PContainerVisible = !_PContainerVisible;
    });
  }


  ///
  ///checkbox
  bool _isChecked = false;

  List<String> hardcodedItems = ['All','Referral App','E-Fax','E-Referrals','Manual',];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                     CustomSearchFieldSM(
                       onPressed: (){},
                     ),
                      SizedBox(width: AppSize.s20,),
                      IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: _toggleFilter,
                        icon: Icon(Icons.filter_alt, color: ColorManager.mediumgrey,),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: AppSize.s30,
                        child: CustomIconButton(
                          color: ColorManager.bluebottom,
                          icon: Icons.add,
                          textWeight: FontWeight.w600,
                          textSize: FontSize.s11,
                          text: "Add Refferal",
                          onPressed: ()async{},
                        ),
                      ),
                      SizedBox(width: AppSize.s10,),
                      SmDropdownConst(
                        height: AppSize.s30,
                        width:AppSize.s150,
                        isAstric:false,
                        // Adjust headText based on depId
                        initialValue: 'Office',
                        headText: "", // Default fallback if depId doesn't match any of the expected values
                        items: ['Office 1','Office 2','Office 3'],
                        onChanged: (newValue) {
                          // for (var a in snapshot.data!) {
                          //   if (a.empType == newValue) {
                          //     clinicialName = a.empType!;
                          //     clinicalId = a.employeeTypesId!;
                          //     print("Dept ID'''''' ${clinicalId}");
                          //     print("';';';''''''''Dept ID ${clinicialName}");
                          //     // Do something with docType
                          //   }
                          // }
                        },
                      ),
                      SizedBox(width: AppSize.s10,),
                      SmDropdownConst(
                       height: AppSize.s30,
                        width:AppSize.s150,
                        isAstric:false,
                        // Adjust headText based on depId
                        initialValue: 'All',
                        headText: "", // Default fallback if depId doesn't match any of the expected values
                        items: ['All','Referral App','E-Fax','E-Referrals','Manual',],
                        onChanged: (newValue) {
                          // for (var a in snapshot.data!) {
                          //   if (a.empType == newValue) {
                          //     clinicialName = a.empType!;
                          //     clinicalId = a.employeeTypesId!;
                          //     print("Dept ID'''''' ${clinicalId}");
                          //     print("';';';''''''''Dept ID ${clinicialName}");
                          //     // Do something with docType
                          //   }
                          // }
                        },
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.s20,),
              Row(
                children: [
                  Text("Time",
                  style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12),),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s20,),
                  Text("Date", style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s20,),
                  Text("Most Recent",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s20,),
                  Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  SizedBox(width: AppSize.s20,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: AppSize.s30,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),
                  ],
              ),
              SizedBox(height: AppSize.s30,),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border:  Border(
                              left: BorderSide(
                                color: ColorManager.greenDark,
                                width: 6,
                              ),
                            ),
                          ),
                          child:
                          Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:[
                                    Container(
                                        width: AppSize.s99,
                                        height: AppSize.s20,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFFFE4E2),
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                              Radius.circular(12)),),
                                        child: Center(
                                          child: Text(
                                              'Potencial Duplicate',
                                              textAlign: TextAlign.center,
                                              style: CustomTextStylesCommon.commonStyle(
                                                  color: ColorManager.mediumgrey,
                                                  fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400)),
                                        )),
                                  ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(60),
                                            child: SizedBox(
                                              width: AppSize.s45,
                                              height: AppSize.s50,
                                              child: Image.asset(
                                                'images/1.png', // Replace with your image path
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppSize.s12),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "John smith",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                              SizedBox(height: AppSize.s4,),
                                              Text(
                                                "Refferal Date: 09/15/2024",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                              Text(
                                                "7:35 PM",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: AppSize.s35),
                                          Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),


                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Refferal Source: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Sunshine Hospital",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "PCP: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Sam Johnson",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Primary Diagnosis: ",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                            fontWeight: FontWeight.w400,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(height: AppSize.s4,),
                                        Text(
                                          "Migraine",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        Text("Manual",style: DocDefineTableData.customTextStyle(context),),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                      flex: 4,
                                      child: Row(
                                        children: [
                                        Text("Marketer: ",style: DocDefineTableData.customTextStyle(context),),
                                        SizedBox(width: AppSize.s15),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(60),
                                          child: SizedBox(
                                            width: AppSize.s45,
                                            height: AppSize.s50,
                                            child: Image.asset(
                                              'images/1.png', // Replace with your image path
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.s7),
                                        Text(
                                          "Sophia Scott",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                            fontWeight: FontWeight.w700,
                                            color: ColorManager.mediumgrey,),
                                        ),
                                        SizedBox(width: AppSize.s7),
                                          InkWell(
                                            onTap: () async {
                                              try {
                                                widget.onEyeButtonPressed();
                                              }
                                              catch (e){
                                                print("Error: $e");
                                              }
                                            },
                                            child: Container(
                                              width: AppSize.s45,
                                              height: AppSize.s45,
                                              child: Image.asset(
                                                'images/eye.png',
                                                height: AppSize.s15,
                                                width: AppSize.s22,
                                                color: ColorManager.bluebottom,
                                              ),
                                            ),
                                          ),
                                        SizedBox(width: AppSize.s7),

                                        IconButton(
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onPressed: (){},
                                            icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                        SizedBox(width: AppSize.s7),
                                        Container(
                                          height:33,
                                          width: 130,
                                          child: ElevatedButton.icon(
                                            icon: Image.asset("images/sm/move.png",height: 20,width: 20,),
                                            onPressed: (){
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              backgroundColor: ColorManager.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                side: BorderSide(color: ColorManager.bluebottom),
                                              ),
                                            ), label: Text(
                                              "Move to Intake",
                                              style: CustomTextStylesCommon.commonStyle( fontSize: FontSize.s12,
                                                fontWeight: FontWeight.w600,
                                                color: ColorManager.bluebottom,)
                                          ),
                                          ),
                                        ),
                                        SizedBox(width: AppSize.s7),
                                          PopupMenuButton<String>(
                                            splashRadius: 0,
                                            onSelected: (value) {
                                              if (value == 'Option 1') {
                                                widget.onEyeButtonPressed;
                                                print('Option 1 Selected');
                                              } else if (value == 'Option 2') {
                                                print('Option 2 Selected');
                                              }
                                            },
                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: 'Option 1',
                                                child: Text('Option 1'),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Option 2',
                                                child: Text('Option 2'),
                                              ),
                                            ],
                                            child: Icon(Icons.more_vert),
                                          ),

                                        ],
                                  ))
                                ],
                              ),
                              SizedBox(height: 5,)
                            ],
                          ),
                        ),
                      ); },

                  ),
                ),
              ),
            ],
          ),
        ),

        // Sliding Filter Panel

        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          right: _isFilterOpen ? -0 : -320, // Slide in/out effect
          top: 0,
          bottom: 10,
          child: Container(
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: SingleChildScrollView(// Wrap the Column inside SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: _toggleFilter,
                        child: Row(
                          children: [
                           Icon(Icons.menu_open),
                            Text(
                              "Filter Options",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(onPressed: (){}, child: Text("CLEAR ALL"))
                    ],
                  ),
                  Divider(),
                  // Example filter fields
                  InkWell(
                    onTap:  toggleContainerM,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Marketer"),

                         Icon(
                            _MContainerVisible
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _MContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _MContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerO,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Received Date"),

                        Icon(
                          _OContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _OContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _OContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Referral Source"),

                        Icon(
                          _RContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _RContainerVisible ? 500 : 0,
                    width: 300,
                   // color: Colors.grey,
                   // alignment: Alignment.center,
                    child: _RContainerVisible
                        ?Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color of the bottom border
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Set the color when focused
                            ),
                          //  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          ),
                          onChanged: (value) {
                            // Handle search logic here (e.g., filtering options)
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       _isChecked = !_isChecked;  // Toggle checkbox state
                        //     });
                        //   },
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //    //   shape: BoxShape.,
                        //       color:  Colors.transparent, // Checked or unchecked background color
                        //       border: Border.all(color: Colors.blue), // Border color of the circle
                        //     ),
                        //     padding: EdgeInsets.all(10),
                        //     child: _isChecked
                        //         ? Icon(Icons.clear, color: Colors.white)  // Use 'clear' icon instead of 'check'
                        //         : Icon(Icons.check_box_outline_blank, color: ColorManager.grey),  // Unchecked state icon
                        //   ),
                        // ),
                        Row(
                          children: [

                               Checkbox(
                                splashRadius: 0,
                                activeColor: ColorManager.blueprime,
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            Checkbox(
                              splashRadius: 0,
                              activeColor: ColorManager.blueprime,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),

                            Text(
                              'Lorem Ipsum',
                              style: onlyFormDataStyle.customTextStyle(context),
                            ),
                          ],
                        ),


                      ],
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerA,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Agency"),

                        Icon(
                          _AContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _AContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _AContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerI,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Insurance"),

                        Icon(
                          _IContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _IContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _IContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),
                  InkWell(
                    onTap:  toggleContainerIC,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Insurance Category"),

                        Icon(
                          _ICContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _ICContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _ICContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),

                  Divider(),
                  InkWell(
                    onTap:  toggleContainerP,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Potential Discharge Date"),

                        Icon(
                          _PContainerVisible
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),

                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 30),
                    height: _PContainerVisible ? 200 : 0,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: _PContainerVisible
                        ? Text(
                      'Container is Open',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                        : null,
                  ),
                  Divider(),

                ],
              ),
            ),
          ),
        ),






        // AnimatedPositioned(
        //   duration: Duration(milliseconds: 300),
        //   right: _isFilterOpen ? 0 : -220, // Slide in/out effect
        //   top: 0,
        //   bottom: 10,
        //   child: Container(
        //     width: 200,
        //
        //     padding: EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       boxShadow: [
        //         BoxShadow(color: Colors.black26, blurRadius: 5),
        //       ],
        //     ),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text("Filter Options", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        //         Divider(),
        //         // Example filter fields
        //         Text("Status"),
        //         DropdownButton<String>(
        //           items: ["All", "Pending", "Approved"]
        //               .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        //               .toList(),
        //           onChanged: (val) {},
        //         ),
        //         SizedBox(height: 10),
        //         Text("Date Range"),
        //         ElevatedButton(
        //           onPressed: () {},
        //           child: Text("Select Date"),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}


///
// SizedBox(height: 30,),
// Expanded(
// child: ScrollConfiguration(
// behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
// child: ListView.builder(
// itemCount: 5,
// itemBuilder: (BuildContext context, int index) {
// String phoneNumber = "7743968124";//"9657058623";
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
// child: SchedularContainerConst(
// child:
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// flex: 2,
// child: Padding(
// padding: const EdgeInsets.only(left: 25.0),
// child: Row(
// children: [
// Stack(
// children: [
// ClipRRect(
// borderRadius: BorderRadius.circular(60),
// child: SizedBox(
// width: AppSize.s45,
// height: AppSize.s50,
// child: Image.asset(
// 'images/1.png', // Replace with your image path
// fit: BoxFit.cover,
// ),
// ),
// ),
// Positioned(
// left:22,
// bottom :0,
// child: Container(
// width: 19,
// height: 15,
// decoration: BoxDecoration(
// color: Color(0xFF527FB9),
// borderRadius: BorderRadius.circular(3)
// ),
// child: Center(
// child: Text("ST",style: TextStyle(
// fontWeight: FontWeight.w400,
// fontSize: 8,
// color: ColorManager.white,
// decoration: TextDecoration.none,
// ),),
// ),
// ),)
// ],
// ),
// SizedBox(width: AppSize.s7),
// Text(
// 'John Smith',
// style: DocDefineTableData.customTextStyle(context),
// ),
// ],
// ),
// ),
// ),
//
// Expanded(
// flex: 3,
// child: Row(
// children: [
// Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,size: IconSize.I20,),
// SizedBox(width: AppSize.s15,),
// Container(
// child:Text("132 My Street,Kingston, New York 12401",
// textAlign: TextAlign.start,
// style:DocDefineTableDataID.customTextStyle(context),
// ) ,
// )
// ],
// ),
// ),
//
// Expanded(
// flex: 1,
// child: Row(
// children: [
// Container(
// width: 25,
// height: 15,
// decoration: BoxDecoration(
// color: Color(0xFFE3F2F8),
// borderRadius: BorderRadius.circular(3)
// ),
// child: Center(
// child: Text("ST",style: TextStyle(
// fontWeight: FontWeight.w700,
// fontSize: 12,
// color: ColorManager.bluebottom,
// decoration: TextDecoration.none,
// ),),
// ),
// )
// ],
// ),
// ),
//
//
// Expanded(
// flex: 2,
// child: Row(
// children: [
// Text("Referral Date : ",style: DocDefineTableDataID.customTextStyle(context),),
// // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
// Text("2023/25/05",style: DocDefineTableData.customTextStyle(context),),
//
// ],
// ),
// ),
// Expanded(
// flex: 1,
// child: Row(
// children: [
// SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
// ],
// ),
// ),
//
// ///dont delete
// // Expanded(
// //   flex: 1,
// //   child: Row(
// //     children: [
// //       GestureDetector(
// //         onTap: () => _makeCall(phoneNumber),
// //         child: SvgPicture.asset(
// //           "images/sm/contact_s.svg",
// //           height: 30,
// //           width: 20,
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
//
// Expanded(
// flex: 2,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
// // crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Auto assigned on 2024/12/08 |",style: DocDefineTableData.customTextStyle(context),),
// // Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),
// ],
// ),
// Row(
// // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
// // crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("10:00 AM ",style: DocDefineTableData.customTextStyle(context),),
//
// ],
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ); },
//
// ),
// ),
// ),
//
// PaginationControlsWidget(
//   currentPage: currentPage,
//   items: snapshot.data,
//   itemsPerPage: itemsPerPage,
//   onPreviousPagePressed: () {
//     if (currentPage > 1) {
//       currentPage--;
//     }
//   },
//   onPageNumberPressed: (pageNumber) {
//     currentPage = pageNumber;
//   },
//   onNextPagePressed: () {
//     if (currentPage < totalPages) {
//       currentPage++;
//     }
//   },
// )