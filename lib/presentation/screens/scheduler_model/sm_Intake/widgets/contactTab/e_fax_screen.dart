import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_flow_contgainer_const.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';

import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/const_string.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/theme_manager.dart' show CustomTextStylesCommon;
import '../../../../em_module/widgets/button_constant.dart';
import '../../../textfield_dropdown_constant/schedular_textfield_const.dart';

class ContactEFaxScreen extends StatelessWidget {
  const ContactEFaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 10),
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
                      top: BorderSide(color: Color(0xFF1696C8),width: 5)
                  ),
                ),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 3,),
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor:  ColorManager.textPrimaryColor,
                        indicatorPadding:  EdgeInsets.symmetric(horizontal: 15,vertical: 1),
                        indicator: BoxDecoration(
                          color: ColorManager.SMFBlue,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        tabs: [
                          Tab(child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                           spacing: 5,
                            children: [
                              Flexible(child: Icon(Icons.fax_rounded,size: 30,color:  ColorManager.textPrimaryColor,)),
                              Flexible(child: Text("Send Fax",  style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                                fontWeight: FontWeight.w700,
                                color:  ColorManager.textPrimaryColor,),))
                            ],
                          ),),
                          Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Flexible(child: Icon(Icons.history,color:  ColorManager.textPrimaryColor,)),
                                Flexible(child: Text("History",  style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s14,
                                  fontWeight: FontWeight.w700,
                                  color:  ColorManager.textPrimaryColor,),))
                              ],
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                  Expanded(
                   // height: MediaQuery.of(context).size.height / 2, // Adjust height as needed
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SendFaxTab(),
                        FaxHistoryTab()
                      ],
                    ),
                  ),
                ],
              ),
          ), )
        )
        )
    );
  }
}
/// send fax
class SendFaxTab extends StatelessWidget {
  const SendFaxTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    TextEditingController faxController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController typeTextController = TextEditingController();
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
    child:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:0),
            Text('Receiver Information',style: CustomTextStylesCommon.commonStyle(
              color:Color(0xFF686464),
              fontWeight: FontWeight.w400,fontSize: 14,
            ),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: AppSize.s150,
                // padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30,),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  // borderRadius: BorderRadius.circular(5),
                  // border: Border.symmetric(vertical: BorderSide(width: 0.2,color: ColorManager.grey),horizontal: BorderSide(width: 0.2,color: ColorManager.grey),),//all(width: 1, color: Color(0xFFBCBCBC)),
                  border: Border(
                    bottom: BorderSide(width: 0.5,color: ColorManager.lightGrey),
                  ),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SchedularTextField(
                            controller: nameController,
                            labelText: 'Name',
                            isIconVisible: true,
                          ),
                        ),
                       SizedBox(width: 50,),
                        Flexible(
                          child: SchedularTextField(
                            controller: companyController,
                            labelText: 'Company',
                            isIconVisible: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: SchedularTextField(
                            controller: faxController,
                            labelText: 'Fax',
                            isIconVisible: true,
                              onlyAllowNumbers: true,
                          ),
                        ),
                        SizedBox(width: 50,),
                        Flexible(
                          child: SchedularTextField(
                            controller: phoneController,
                            labelText: 'Phone',
                            isIconVisible: true,
                            phoneField: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),),
            ),
            SizedBox(height:20),
            Row(
              children: [
                CustomIconButtonConst(
                 color:    ColorManager.bluebottom,
                  height: 35,
                    width: 140,
                    text: 'Upload files',
                    icon: Icons.file_upload_outlined,
                    onPressed: () {

                    }),
SizedBox(width: 40,),
                Container(
                  //width:140,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(
                            0xffB1B1B1)),
                    borderRadius:
                    BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets
                        .all(8.0),
                    child: Text(
                      'No file chosen'
                        ,style: CustomTextStylesCommon.commonStyle(
                    color:Color(0xFF686464),
                    fontWeight: FontWeight.w400,fontSize: 12,
                  ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height:20),
            SchedularTextField(
              width: double.maxFinite,
              controller: typeTextController,
              labelText: 'Type text here',
              isIconVisible: true,
            ),
            SizedBox(height:60),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                color:  ColorManager.bluebottom,
                width: AppSize.s100,
                text:"Send",
                onPressed: (){},
              ),
            ),
            SizedBox(height:40),
          ],
        ),
      ),
    ),
    );
  }
}

/// Fax history
class FaxHistoryTab extends StatelessWidget {
  const FaxHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView.builder(
                itemCount: 8,
                  itemBuilder: (BuildContext, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                Image.asset("images/sm/file.png",height: 30,),
                              ],
                            ),
                          //  Icon(Icons.contact_page_outlined,color: Color(0xFF686464),),
                            SizedBox(
                              width: 200,
                              child: Text('eFax sent by Warren. No document attached.',
                                  style:CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.mediumgrey,),),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2024/08/05',style: CustomTextStylesCommon.commonStyle(
                                color:Color(0xFF686464),
                                fontWeight: FontWeight.w400,fontSize: 12,
                              ),),
                              Text('8:17PM',style: CustomTextStylesCommon.commonStyle(
                                color:Color(0xFF686464),
                                fontWeight: FontWeight.w400,fontSize: 12,
                              ),),
                            ],
                          ),
                        )
                    
                      ],
                    ),
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

