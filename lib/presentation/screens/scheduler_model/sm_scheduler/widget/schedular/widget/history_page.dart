import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_scheduler/widget/schedular/sm_scheduler_screen_const.dart';
import 'package:prohealth/presentation/widgets/widgets/profile_bar/widget/pagination_widget.dart';

import '../../../../../../../app/resources/color.dart';
import '../../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../../app/resources/font_manager.dart';
import '../../../../../../../app/resources/theme_manager.dart';
import '../../../../../../../app/resources/value_manager.dart';
import '../../../../../../widgets/widgets/constant_textfield/const_textfield.dart';

class HistoryPageView extends StatefulWidget {
  const HistoryPageView({super.key});

  @override
  State<HistoryPageView> createState() => _HistoryPageViewState();
}

class _HistoryPageViewState extends State<HistoryPageView> {
  int currentPage = 1;
  int itemsPerPage = 10;
  final int totalPages = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 220,
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
                              borderSide: BorderSide(color:Color(0xFFC9C9C9),width: 1),
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
                                  color:  ColorManager.greylight,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                      ),

                    ),

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
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5,),
                    child: SchedularContainerConst(
                      child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [SizedBox(
                                      height:45,
                                      child: CircleAvatar(
                                        child: Image.asset('images/1.png'),
                                      ),
                                    ),
                                      Positioned(
                                        left:22,
                                        bottom :0,
                                        child: Container(

                                          width: 19,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF527FB9),
                                              borderRadius: BorderRadius.circular(3)
                                          ),
                                          child: Center(
                                            child: Text("ST",style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 8,
                                              color: ColorManager.white,
                                              decoration: TextDecoration.none,
                                            ),),
                                          ),
                                        ),)
                                    ],
                                  ),
                                  SizedBox(width: AppSize.s7),
                                  Text(
                                    'John Smith',
                                    style: CustomTextStylesCommon.commonStyle(fontSize: FontSize.s12,
                                      fontWeight: FontWeight.w700,
                                      color: ColorManager.mediumgrey,),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: ColorManager.bluebottom,),
                                SizedBox(width: 8,),
                                Container(
                                  child:Text("132 My Street,Kingston, New York 12401",
                                    textAlign: TextAlign.start,
                                    style:AllHRTableData.customTextStyle(context),
                                  ) ,
                                )
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE3F2F8),
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                  child: Center(
                                    child: Text("ST",style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: ColorManager.bluebottom,
                                      decoration: TextDecoration.none,
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),


                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text("Referral Date : ",style: AllHRTableData.customTextStyle(context),),
                                // Text("Intake Referral Date : 2023/25/03 : ",style: DocumentTypeDataStyle.customTextStyle(context),),
                                Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),

                              ],
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                SvgPicture.asset("images/sm/contact_s.svg",  height: 30,width: 20,),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Auto assigned on 2024/12/08 |",style: DocumentTypeDataStyle.customTextStyle(context),),
                                   // Text("2023/25/05",style: DocumentTypeDataStyle.customTextStyle(context),),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.start, // Aligns items in the row to the start (left)
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("10:00 AM ",style: DocumentTypeDataStyle.customTextStyle(context),),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ); },

                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
