import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:quests_api/models/enums.dart';

class DateUtil {
  static int getDateDifference(DateTime date) {
    //difference between provided date and today
    final now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static DateTime getNextResetDate(Repeat repeat) {
    final now = DateTime.now();
    switch (repeat) {
      case Repeat.daily:
        return DateTime(now.year, now.month, now.day + 1);

      case Repeat.weekly:
        return DateTime(now.year, now.month, now.day + 7);
      case Repeat.monthly:
        return DateTime(now.year, now.month + 1, now.day);
    }
  }

  static String getReadableDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }
}

void main(List<String> args) {
  final now = DateTime.now();
  String formattedStr = DateFormat.yMMMd().format(now);
  print(formattedStr);
  return;
}
