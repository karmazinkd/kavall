import 'package:intl/intl.dart';

abstract class DateTimeHelper{
  static String convertDateTimeToString(DateTime dateTime){
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}