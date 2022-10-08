import 'package:date_format/date_format.dart';

String formatDayMonthHourMinuteSeconds(
  DateTime dateTime, {
  String dateSplit = "/",
  String hourSplit = ":",
}) {
  return formatDate(
      dateTime, [dd, dateSplit, mm, " ", HH, hourSplit, nn, hourSplit, ss]);
}
