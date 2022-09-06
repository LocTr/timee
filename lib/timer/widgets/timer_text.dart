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
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text('$hoursStr:$minutesStr:$secondsStr',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900));
  }
}
