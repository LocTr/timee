import 'package:flutter/material.dart';

class TimerText extends StatelessWidget {
  final int duration;
  final double fontSize;

  const TimerText({Key? key, required this.duration, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hoursStr = (duration / 3600).floor().toString().padLeft(2, '0');
    final minutesStr = (duration / 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString();
    return Text('$hoursStr:$minutesStr:$secondsStr',
        style: TextStyle(
          fontFamily: 'PT Mono',
          fontSize: fontSize,
        ));
  }

  String getTimeString() {
    final hour = (duration / 3600).floor();
    final hourStr = hour == 0 ? '' : '${hour.toString()}:';
    final minuteStr = (duration / 60).floor().toString().padLeft(2, '0');
    final secondStr = (duration % 60).floor().toString();
    return '$hourStr:$minuteStr:$secondStr';
  }
}
