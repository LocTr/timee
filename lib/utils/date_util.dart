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
}
