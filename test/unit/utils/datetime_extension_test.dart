import 'package:flutter_test/flutter_test.dart';
import 'package:quests_api/models/enums.dart';
import 'package:tsks/utils/datetime_extension.dart';

void main() {
  group('datetime_extension should be correct', () {
    test('get date difference should return correct number', () {
      final date1 = DateTime(2022, 1, 1, 12);
      final date2 = DateTime(2022, 1, 2, 0);
      final date3 = DateTime(2021, 12, 29);

      expect(date1.getDateDifference(date2), equals(1));
      expect(date2.getDateDifference(date1), equals(-1));
      expect(date1.getDateDifference(date3), equals(-3));
    });

    test('daily repeat should add 1 day to current day', () {
      final baseDate = DateTime(1999, 1, 1);
      final currentDate = DateTime(2022, 11, 8);
      final expected = DateTime(2022, 11, 9);
      expect(currentDate.getNextRepeatDate(baseDate, Repeat.daily),
          equals(expected));
    });
    test('weekly repeat should be correct', () {
      // is monday and friday
      final base1 = DateTime(2022, 10, 24);
      final base2 = DateTime(2022, 8, 12);
      // is Tuesday
      final currentDate = DateTime(2022, 11, 8);
      // should be monday and friday
      final expected1 = DateTime(2022, 11, 14);
      final expected2 = DateTime(2022, 11, 11);
      expect(currentDate.getNextRepeatDate(base1, Repeat.weekly),
          equals(expected1));
      expect(currentDate.getNextRepeatDate(base2, Repeat.weekly),
          equals(expected2));
    });

    test('monthy repeat should be correct', () {
      final base1 = DateTime(1999, 12, 1);
      final base2 = DateTime(2008, 3, 25);

      final currentDate = DateTime(2022, 11, 8);
      final expected1 = DateTime(2022, 12, 1);
      final expected2 = DateTime(2022, 11, 25);
      expect(currentDate.getNextRepeatDate(base1, Repeat.monthly),
          equals(expected1));
      expect(currentDate.getNextRepeatDate(base2, Repeat.monthly),
          equals(expected2));
    });
  });
}
