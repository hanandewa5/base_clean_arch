import 'package:intl/intl.dart';

class CustomDateUtils {
  static String parseDateToFullDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(tempDate);
    return date;
  }

  static String parseDateToDetailDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal(); // iso8601
    String date = DateFormat('y-MM-dd HH:mm aaa', 'id_ID').format(tempDate);
    return date;
  }

  static String dateTimeToFullDisplayDate(DateTime dateTime) {
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm:ss', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDateHour(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToSimpleDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  /// Generate current date
  ///
  /// Returns [String] the current date and time in UTC format
  /// example [dateCode] // 20210101
  static String dateCode() {
    final DateTime dateTime = DateTime.now();
    final int monthDefault = dateTime.month; //months from 1-12
    final String year = dateTime.year.toString();
    final String month = (monthDefault < 10 ? '0' : '') + monthDefault.toString();
    final String day = (dateTime.day < 10 ? '0' : '') + dateTime.day.toString();
    final String now = '$year$month$day';
    return now;
  }

  /// Generate current time transaction
  ///
  /// Returns [String] the current hours, minutes and seconds in UTC format as a string
  /// example [timeTransaction] // 200215
  static String timeTransaction() {
    final DateTime dateTime = DateTime.now();
    final String hours = '${dateTime.hour < 10 ? '0' : ''}${dateTime.hour}';
    final String minutes = '${dateTime.minute < 10 ? '0' : ''}${dateTime.minute}';
    final String seconds = '${dateTime.second < 10 ? '0' : ''}${dateTime.second}';
    final String time = '$hours$minutes$seconds';
    return time;
  }

  /// Generate current date time transaction
  ///
  /// Returns [String] the current year, month, day, hours, minutes, seconds and millisecond in UTC format as a string
  /// example [dateUTCBuyItems] // 2022-06-29 07:40:59.76+00
  static String dateUTCBuyItems() {
    final DateTime dateTime = DateTime.now().toUtc();
    final int monthDefault = dateTime.month; //months from 1-12
    final String year = dateTime.year.toString();
    final String month = (monthDefault < 10 ? '0' : '') + monthDefault.toString();
    final String day = (dateTime.day < 10 ? '0' : '') + dateTime.day.toString();

    final String hours = '${dateTime.hour < 10 ? '0' : ''}${dateTime.hour}';
    final String minutes = '${dateTime.minute < 10 ? '0' : ''}${dateTime.minute}';
    final String seconds = '${dateTime.second < 10 ? '0' : ''}${dateTime.second}';
    final String milliseconds = '${dateTime.millisecond}';

    final String dateUTC = '$year-$month-$day $hours:$minutes:$seconds.$milliseconds+00';
    return dateUTC;
  }
}
