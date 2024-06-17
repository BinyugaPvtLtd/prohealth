/// Work Schedule Data
class WorkWeekScheduleData {
  final int? weekScheduleId;
  final String weekDays;
  final String officeStartTime;
  final String officeEndTime;
  final int? companyId;
  final String officeId;
  final bool sucess;
  final String message;
  WorkWeekScheduleData(
      {this.weekScheduleId,
      required this.weekDays,
      required this.officeStartTime,
      required this.officeEndTime,
      this.companyId,
      required this.officeId,
      required this.sucess,
      required this.message});
}

/// Work Shift Data
class WorkWeekShiftScheduleData {
  final int? weekShiftScheduleId;
  final String weekDays;
  final String shiftName;
  final String officeStartTime;
  final String officeEndTime;
  final int? companyId;
  final String officeId;
  final bool sucess;
  final String message;
  WorkWeekShiftScheduleData(
      {this.weekShiftScheduleId,
      required this.weekDays,
      required this.shiftName,
      required this.officeStartTime,
      required this.officeEndTime,
      this.companyId,
      required this.officeId,
      required this.sucess,
      required this.message});
}

/// Holiday Data
class DefineHolidayData {
  final bool success;
  final String message;
  final String holidayName;
  final String date;
  final int? holidayId;
  final int? companyId;

  DefineHolidayData(
      {required this.success,
      required this.message,
      required this.date,
      required this.holidayName,
      this.holidayId,
      this.companyId});
}
