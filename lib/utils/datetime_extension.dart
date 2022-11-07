import 'package:intl/intl.dart';
import 'package:quests_api/models/enums.dart';

extension DateTimeExtension on DateTime {
  int getDateDifference(DateTime date) {
    //difference between provided date and this
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(year, month, day))
        .inDays;
  }

  DateTime getNextRepeatDate(DateTime baseDate, Repeat repeat) {
    switch (repeat) {
      case Repeat.daily:
        return DateTime(baseDate.year, baseDate.month, baseDate.day + 1);
      case Repeat.weekly:
        return DateTime(baseDate.year, baseDate.month, baseDate.day + 7);
      case Repeat.monthly:
        return DateTime(baseDate.year, baseDate.month + 1, baseDate.day);
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
