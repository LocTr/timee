int getDateDifference(DateTime date) {
  //difference between provided date and today
  final now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
