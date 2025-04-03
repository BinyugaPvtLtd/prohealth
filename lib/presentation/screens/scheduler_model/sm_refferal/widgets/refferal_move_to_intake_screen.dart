import 'package:flutter/material.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';

class RefferalMoveToIntakeScreen extends StatefulWidget {
  const RefferalMoveToIntakeScreen({super.key});

  @override
  State<RefferalMoveToIntakeScreen> createState() => _RefferalMoveToIntakeScreenState();
}

class _RefferalMoveToIntakeScreenState extends State<RefferalMoveToIntakeScreen> {
  bool _isFilterOpen = false; // Track filter panel state

  void _toggleFilter() {
    setState(() {
      _isFilterOpen = !_isFilterOpen; // Toggle panel visibility
    });
  }
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
                      Container(
                        width: 381,
                        height: 36,
                        child:TextField(
                          textCapitalization:
                          TextCapitalization.words,
                          style: DocumentTypeDataStyle.customTextStyle(context),
                          // onChanged: _search,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF8F8F8),
                              hintText: 'Search',
                              alignLabelWithHint: true,
                              hintStyle: DocumentTypeDataStyle.customTextStyle(context),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Color(0xFFF0F0F0),width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Colors.grey.shade200,width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                icon: Center(
                                  child: Icon(
                                    Icons.search,
                                    size: IconSize.I18,
                                    color:  Colors.grey.shade100,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                        ),

                      ),
                      SizedBox(width: 20,),
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
                          textWeight: FontWeight.w500,
                          textSize: FontSize.s11,
                          text: "Add Refferal",
                          onPressed: ()async{},
                        ),
                      ),
                      SizedBox(width: 10,),
                      SmDropdownConst(
                        height: AppSize.s30,
                        width:150,
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
                      SizedBox(width: 10,),
                      SmDropdownConst(
                        height: AppSize.s30,
                        width:150,
                        isAstric:false,
                        initialValue: 'Filter By',
                        headText: "",
                        items: const ['All','Referral App','E-Fax','E-Referrals','Manual',],
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
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Time",
                    style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12),),
                  SizedBox(width: 10,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),                  SizedBox(width: 20,),
                  Text("Date",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: 10,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),                  SizedBox(width: 20,),
                  Text("Most Recent",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: 10,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),                  SizedBox(width: 20,),
                  Text("Hospitals",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: 10,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),                  SizedBox(width: 20,),
                  Text("PCP",
                      style: TextStyle(color: ColorManager.textBlack,fontSize: FontSize.s12)),
                  SizedBox(width: 10,),
                  Image.asset("images/sm/sm_refferal/refferal_arrow.png",height: IconSize.I14,width: IconSize.I16,),                  SizedBox(width: 20,),],
              ),
              SizedBox(height: 30,),
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
                          ),
                          child: Column(
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
                                    flex: 2,
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
                                              Text(
                                                "Refferal Date: 09/15/2024",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorManager.mediumgrey,),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("Ch #1",style: DocDefineTableData.customTextStyle(context),),
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
                                    Image.asset("images/logo.png",width: 100,),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                      flex: 3,
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
                                          IconButton(onPressed: (){},
                                              icon: Icon(Icons.remove_red_eye_outlined,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                          SizedBox(width: AppSize.s7),
                                          IconButton(onPressed: (){},
                                              icon: Icon(Icons.phone,color: ColorManager.bluebottom,size: IconSize.I18,)),
                                          SizedBox(width: AppSize.s7),
                                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: ColorManager.mediumgrey,))
                                        ],
                                      ))

                                ],
                              ),
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
          right: _isFilterOpen ? 0 : -220, // Slide in/out effect
          top: 0,
          bottom: 10,
          child: Container(
            width: 200,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 5),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Filter Options", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Divider(),
                // Example filter fields
                Text("Status"),
                DropdownButton<String>(
                  items: ["All", "Pending", "Approved"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) {},
                ),
                SizedBox(height: 10),
                Text("Date Range"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Select Date"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
