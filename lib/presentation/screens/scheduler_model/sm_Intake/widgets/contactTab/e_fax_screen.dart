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
          padding: const EdgeInsets.all(10),
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
                      padding: const EdgeInsets.only(top: 10,bottom: 3,left: 30,right: 30),
                      child: TabBar(
                        onTap: (index) {
                        },
                        indicatorWeight: 2,
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        indicator: BoxDecoration(
                          color: ColorManager.SMFBlue, // Background color for selected tab
                          borderRadius: BorderRadius.circular(8), // Optional
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: ColorManager.textPrimaryColor,
                        labelStyle: TextStyle(
                          fontSize: FontSize.s14,
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
                              Icon(Icons.fax_rounded),
                              Text("Send Fax")
                            ],
                          ),),
                          Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Icon(Icons.history),
                                Text("History")
                              ],
                            ),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2, // Adjust height as needed
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
              ),
            ),
          ),
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
    return SingleChildScrollView(
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
                width: AppSize.s100,
                text:"Send",
                onPressed: (){},
              ),
            ),
            SizedBox(height:30),
          ],
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
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('05/08/24',style: CustomTextStylesCommon.commonStyle(
                              color:Color(0xFF686464),
                              fontWeight: FontWeight.w400,fontSize: 12,
                            ),),
                            Text('8:17PM',style: CustomTextStylesCommon.commonStyle(
                              color:Color(0xFF686464),
                              fontWeight: FontWeight.w400,fontSize: 12,
                            ),),
                          ],
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

