import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final int duration;
  final double fontSize;

  const TimerText({Key? key, required this.duration, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(getTimeString(duration),
        style: TextStyle(
          fontFamily: 'PT Mono',
          fontSize: fontSize,
        ));
  }

  static String getTimeString(int duration) {
    final hour = (duration / 3600).floor();
    final hourStr = hour == 0 ? '' : '${hour.toString()}:';
    final minuteStr = '${(duration / 60).floor().toString().padLeft(2, '0')}:';
    final secondStr = (duration % 60).floor().toString().padLeft(2, '0');
    return '$hourStr$minuteStr$secondStr';
  }
}
