import 'package:intl/intl.dart';
import 'package:quests_api/models/enums.dart';

extension DateTimeExtension on DateTime {
  int getDateDifference(DateTime date) {
    //difference between provided date and this
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(year, month, day))
        .inDays;
  }

  DateTime nextWeekday(int weekday) {
    return add(Duration(days: (weekday - this.weekday) % DateTime.daysPerWeek));
  }

  DateTime nextMonthday(int day) {
    return this.day < day
        ? add(Duration(days: (day - this.day)))
        : DateTime(year, month + 1, day);
  }

  DateTime getNextRepeatDate(DateTime baseDate, Repeat repeat) {
    switch (repeat) {
      case Repeat.daily:
        return DateTime(year, month, day + 1);
      case Repeat.weekly:
        return nextWeekday(baseDate.weekday);
      case Repeat.monthly:
        return nextMonthday(baseDate.day);
    }
  }

  String getReadableDate() {
    return DateFormat.yMMMd().format(this);
  }
}

void main(List<String> args) {
  final now = DateTime.now();
  String formattedStr = DateFormat.yMMMd().format(now);
  print(formattedStr);
  return;
}
