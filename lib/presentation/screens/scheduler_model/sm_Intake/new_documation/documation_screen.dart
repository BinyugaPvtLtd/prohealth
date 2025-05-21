import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/resources/color.dart';
import '../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../app/resources/const_string.dart';
import '../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../app/resources/font_manager.dart';
import '../../../../../app/resources/provider/sm_provider/sm_slider_provider.dart';
import '../../../../../app/resources/theme_manager.dart';
import '../../../../../app/resources/value_manager.dart';
import '../../../../widgets/widgets/custom_icon_button_constant.dart';
import '../../../em_module/widgets/button_constant.dart';
import '../../../hr_module/manage/widgets/custom_icon_button_constant.dart';
import '../../sm_refferal/widgets/refferal_pending_widgets/widgets/referral_Screen_const.dart';
import '../../textfield_dropdown_constant/schedular_textfield_const.dart';
import '../../widgets/constant_widgets/dropdown_constant_sm.dart';
import '../widgets/intake_profile_bar.dart';
import 'add_popup_const.dart';

class DocumationScreenTab extends StatefulWidget {
  const DocumationScreenTab({super.key});

  @override
  State<DocumationScreenTab> createState() => _DocumationScreenTabState();
}

class _DocumationScreenTabState extends State<DocumationScreenTab> {

  TextEditingController ffdateController = TextEditingController();
  TextEditingController ffpostController = TextEditingController();
  TextEditingController ffappoController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SmIntakeProviderManager>(
      builder: (context,providerState,child) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppSize.s25,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Review and confirm the data pulled is correct',
                              style: SMItalicTextConst.customTextStyle(context))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Missing Paperwork: Therapy Notes',
                          style: TextStyle(fontSize: FontSize.s12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFC30909)),)
                      ],),
                    SizedBox(height: AppSize.s10,),
                    BlueBGHeadConst(HeadText: "Clinical Attachments*"),
                    SizedBox(height: AppSize.s10,),
                   Container(
                     child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: 3,
                         itemBuilder: (context,index){
                           return FileInfoCard(
                             fileName: "Erica Thompson REF.pdf",
                             uploadedInfo: providerState.isContactTrue
                                 ? "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca"
                                 : "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                             isContact: providerState.isContactTrue,
                             onHistoryTap: () {},
                             onTelegramTap: () {},
                             onPrintTap: () {},
                             onDownloadTap: () {},
                             onDeleteTap: () {},
                           );
                         }),
                   ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,
                          width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add  Clinical Attachment',);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),

                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Billing Attachments*"),
                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return FileInfoCard(
                              fileName: "Erica Thompson REF.pdf",
                              uploadedInfo: providerState.isContactTrue
                                  ? "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca"
                                  : "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                              isContact: providerState.isContactTrue,
                              onHistoryTap: () {},
                              onTelegramTap: () {},
                              onPrintTap: () {},
                              onDownloadTap: () {},
                              onDeleteTap: () {},
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                            onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Billing Attachment',);
                              },
                            );
                          },
                            text: "Add Attachment",
                        ),

                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Face to Face Encounter"),
                    SizedBox(height: AppSize.s10,),
                    Padding(
                      padding: EdgeInsets.only(left:providerState.isContactTrue ? 0 :  40),
                      child:
                      providerState.isContactTrue ? Container(
                        height: 150,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Row(
                                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: SchedularTextField(
                                        width: 240,
                                          controller:ffdateController ,
                                          labelText: 'F2F Date:',
                                          enable: false,
                                          showDatePicker:true
                                      )),
                                  SizedBox(width: AppSize.s90),
                                  Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: CustomDropdownTextFieldsm(
                                            width: 240,
                                            headText: 'Marketer',
                                            items: ['Spouse','Patient',],
                                            //dropDownMenuList: dropDownList,
                                            onChanged: (newValue) {

                                            }),
                                      )),
                                  Flexible(
                                      child: SizedBox(width:0)),
                                  // SizedBox(width: AppSize.s65),
                                ],
                              ),
                            ),
                           SizedBox(height: 20,),
                           // Flexible(child: SizedBox(width:100)),
                            Row(
                              children: [
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                      controller: ffpostController,
                                      labelText: 'Post-op Visit Note Needed',
                                      showDatePicker:true,
                                      initialCheckboxValue: true,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                                SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                      controller: ffappoController,
                                      labelText: 'F2F Appointment Needed',
                                      showDatePicker:true,
                                      initialCheckboxValue: false,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                                Flexible(
                                    child: SizedBox(width:0)),
                              ],
                            )
                          ],
                        ),
                      ) :
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 100),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: SchedularTextField(
                                        controller:ffdateController ,
                                        labelText: 'F2F Date:',
                                        enable: false,
                                        showDatePicker:true
                                    )),
                               SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: CustomDropdownTextFieldsm(
                                          headText: 'Marketer',
                                          items: ['Spouse','Patient',],
                                          //dropDownMenuList: dropDownList,
                                          onChanged: (newValue) {

                                          }),
                                    )),
                                SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                        controller: ffpostController,
                                        labelText: 'Post-op Visit Note Needed',
                                        showDatePicker:true,
                                      initialCheckboxValue: true,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                               SizedBox(width: AppSize.s58),
                                Flexible(
                                    child: SchedularTextFieldcheckbox(
                                      enable: false,
                                        controller: ffappoController,
                                        labelText: 'F2F Appointment Needed',
                                        showDatePicker:true,
                                      initialCheckboxValue: false,
                                      onCheckboxChanged: (val) {
                                        print("Checkbox value: $val");
                                      },
                                    )),
                                // Flexible(
                                //     child: SizedBox(width:0)),
                             SizedBox(width: AppSize.s105),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context,index){
                            return FileInfoCard(
                              fileName: "Erica Thompson REF.pdf",
                              uploadedInfo: providerState.isContactTrue
                                  ? "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca"
                                  : "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                              isContact: providerState.isContactTrue,
                              onHistoryTap: () {},
                              onTelegramTap: () {},
                              onPrintTap: () {},
                              onDownloadTap: () {},
                              onDeleteTap: () {},
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Face to Face Attachment',);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),
                    ///
                    SizedBox(height: AppSize.s30,),
                    BlueBGHeadConst(HeadText: "Consents"),
                    SizedBox(height: AppSize.s10,),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return FileInfoCard(
                              fileName: "Erica Thompson REF.pdf",
                              uploadedInfo: providerState.isContactTrue
                                  ? "Uploaded 1/26/2025, 8:17:00\nAM PST by Henry, Rebecca"
                                  : "Uploaded 1/26/2025, 8:17:00 AM PST by Henry, Rebecca",
                              isContact: providerState.isContactTrue,
                              onHistoryTap: () {},
                              onTelegramTap: () {},
                              onPrintTap: () {},
                              onDownloadTap: () {},
                              onDeleteTap: () {},
                            );
                          }),
                    ),
                    SizedBox(height: AppSize.s20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButtonConst(
                          icon: Icons.add,  width: 150,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddPopupConstant(title: 'Add Consents Attachment',);
                              },
                            );
                          },
                          text: "Add Attachment",
                        ),

                      ],
                    ),
                    SizedBox(height: AppSize.s80),
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        CustomButtonTransparent(
                          text: "Cancel",
                          onPressed: () {

                          },
                        ),
                        CustomElevatedButton(
                          width: AppSize.s100,
                          text: AppString.save,
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s30),
                  ],
                ),
              ),
            ),
        );
      }
    );

  }
}
