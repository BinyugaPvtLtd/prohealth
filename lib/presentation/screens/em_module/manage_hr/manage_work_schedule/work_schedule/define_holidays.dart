import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/resources/establishment_resources/establish_theme_manager.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/work_schedule_manager.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/widgets/delete_popup_const.dart';
import 'package:prohealth/presentation/screens/hr_module/manage/widgets/custom_icon_button_constant.dart';
import 'package:prohealth/presentation/widgets/widgets/custom_icon_button_constant.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../../../data/api_data/establishment_data/work_schedule/work_week_data.dart';
import '../../../../../widgets/error_popups/delete_success_popup.dart';
import '../../../../../widgets/widgets/profile_bar/widget/pagination_widget.dart';
import 'widgets/add_holiday_popup_const.dart';

class DefineHolidaysProvider with ChangeNotifier {
  List<DefineHolidayData> _holidays = [];
  bool _isLoading = false;
  bool _isDeleteLoding = false;
  int _currentPage = 1;
  final int _itemsPerPage = 10;

  List<DefineHolidayData> get holidays => _holidays;
  bool get isLoading => _isLoading;
  bool get isDeleteLoding => _isDeleteLoding;
  int get currentPage => _currentPage;
  int get itemsPerPage => _itemsPerPage;
  final StreamController<List<DefineHolidayData>> holidayData = StreamController<List<DefineHolidayData>>.broadcast();

  Future<void> fetchHolidays(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      _holidays = await holidaysListGet(context);

    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  void addHoliday(BuildContext context, DefineHolidayData newHoliday)async {
    _holidays.add(newHoliday);
    notifyListeners();
    await fetchHolidays(context);
  }

  Future<void> deleteHoliday(BuildContext context, int holidayId) async {
    try {
      _isDeleteLoding = true;
      notifyListeners();
      await deleteHolidays(context, holidayId);
      _holidays.removeWhere((holiday) => holiday.holidayId == holidayId);
      _isDeleteLoding = false;

      notifyListeners(); // Update only the list
    } catch (e) {
      // Handle error
    }
  }

  void updateHoliday(DefineHolidayData updatedHoliday) {
    int index = _holidays.indexWhere((h) => h.holidayId == updatedHoliday.holidayId);
    if (index != -1) {
      _holidays[index] = updatedHoliday;
      notifyListeners(); // Only updates the specific item
    }
  }

  void updatePageNumber(int pageNumber) {
    _currentPage = pageNumber;
    notifyListeners();
  }
}

class DefineHolidays extends StatelessWidget {
  final TextEditingController holidayNameController = TextEditingController();
  final TextEditingController calenderController = TextEditingController();

  DefineHolidays({Key? key}) : super(key: key);

  String convertDayMonthYearToIso(String dayMonthYear) {
    List<String> parts = dayMonthYear.split(' ');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    DateTime dateTime = DateTime(day, month, year);
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DefineHolidaysProvider>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          provider.fetchHolidays(context);
        });
        int totalItems = provider.holidays.length;
        int totalPages = (totalItems / provider.itemsPerPage).ceil();
        List<DefineHolidayData> paginatedData = provider.holidays
            .skip((provider.currentPage - 1) * provider.itemsPerPage)
            .take(provider.itemsPerPage)
            .toList();

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomIconButtonConst(
                  height: AppSize.s30,
                  width: AppSize.s152,
                  icon: Icons.add,
                  text: AddPopupString.addNewHoliday,
                  onPressed: ()async{
                    holidayNameController.clear();
                    calenderController.clear();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ChangeNotifierProvider(
                              create: (_) => AddHolidayProvider(),
                              child: AddHolidayPopup(
                                  onSave: () async {
                                    await provider.fetchHolidays(context);  // Refresh data after saving
                                  }
                              ));
                        });
                  },
                ),
              ),
              SizedBox(height: AppSize.s20),
              _buildTableHeader(context),
              SizedBox(height: AppSize.s10),
              Expanded(
                child: StreamBuilder<List<DefineHolidayData>>(
                  stream: provider.holidayData.stream,
                  builder: (context, snapshot) {
                    holidaysListGet(context).then((data) {
                      provider.holidayData.add(data);
                    }).catchError((error) {});

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.blueprime,
                        ),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          ErrorMessageString.noHoliday,
                          style: AllNoDataAvailable.customTextStyle(context),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: paginatedData.length,
                            itemBuilder: (context, index) {
                              int serialNumber =
                                  (provider.currentPage - 1) * provider.itemsPerPage + index + 1;
                              String formattedSerialNumber =
                              serialNumber.toString().padLeft(2, '0');
                              DefineHolidayData defineData = paginatedData[index];

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical:AppSize.s8,horizontal: AppPadding.p2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff000000).withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  height: AppSize.s50,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: AppPadding.p10),
                                              child: Text(
                                                formattedSerialNumber,
                                                style: DocumentTypeDataStyle.customTextStyle(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(flex: 1, child: SizedBox()),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            defineData.holidayName,
                                            textAlign: TextAlign.start,
                                            style: TableSubHeading.customTextStyle(context),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              defineData.date.toString(),
                                              textAlign: TextAlign.center,
                                              style: TableSubHeading.customTextStyle(context),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return FutureBuilder<DefinePrefillHolidayData>(
                                                        future: holidaysPrefillGet(context, defineData.holidayId),
                                                        builder: (context, snapshotPrefill) {
                                                          if (snapshotPrefill.connectionState ==
                                                              ConnectionState.waiting) {
                                                            return Center(
                                                              child: CircularProgressIndicator(
                                                                color: ColorManager.blueprime,
                                                              ),
                                                            );
                                                          }
                                                          return ChangeNotifierProvider(
                                                            create: (_) => EditHolidayProvider(
                                                              onSave: () {
                                                                provider.fetchHolidays(context);
                                                              },
                                                              holidayDate: snapshotPrefill.data!.date,
                                                              holidayName: snapshotPrefill.data!.holidayName,
                                                            ),
                                                            child: EditHolidayPopup(
                                                              holidayId: defineData.holidayId,
                                                              holidayName: snapshotPrefill.data!.holidayName,
                                                              holidayDate: snapshotPrefill.data!.date,
                                                              onSave: () {
                                                                provider.fetchHolidays(context);
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.edit_outlined,
                                                  size: IconSize.I18,
                                                  color: IconColorManager.bluebottom,
                                                ),
                                              ),
                                              SizedBox(width: AppSize.s10),
                                              IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) => DeletePopup(
                                                      title: DeletePopupString.deleteholiday,
                                                      loadingDuration: provider.isDeleteLoding,
                                                      onCancel: () => Navigator.pop(context),
                                                      onDelete: () async {
                                                        await provider.deleteHoliday(context, defineData.holidayId);
                                                        Navigator.pop(context);
                                                        //Future.delayed(Duration(milliseconds: 300), () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) => DeleteSuccessPopup(),
                                                        );
                                                        // });
                                                      },
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  size: IconSize.I18,
                                                  color: IconColorManager.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        PaginationControlsWidget(
                          currentPage: provider.currentPage,
                          items: provider.holidays,
                          itemsPerPage: provider.itemsPerPage,
                          onPreviousPagePressed: () {
                            if (provider.currentPage > 1) {
                              provider.updatePageNumber(provider.currentPage - 1);
                            }
                          },
                          onPageNumberPressed: (pageNumber) {
                            provider.updatePageNumber(pageNumber);
                          },
                          onNextPagePressed: () {
                            if (provider.currentPage < totalPages) {
                              provider.updatePageNumber(provider.currentPage + 1);
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildTableHeader(BuildContext context) {
    return Container(
      height: AppSize.s30,
      decoration: BoxDecoration(
        color: ColorManager.fmediumgrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(AppStringEM.srno,
                    style: TableHeading.customTextStyle(context)),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 2,
              child: Text(AppStringEM.holidayName,
                  textAlign: TextAlign.start,
                  style: TableHeading.customTextStyle(context)),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(AppStringEM.date,
                    style: TableHeading.customTextStyle(context)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(AppStringEM.actions,
                    textAlign: TextAlign.start,
                    style: TableHeading.customTextStyle(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
