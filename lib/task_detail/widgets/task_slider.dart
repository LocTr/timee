import 'package:flutter/material.dart';

class TaskSlider extends StatelessWidget {
  const TaskSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(value: 5, max: 100, onChanged: (double) {});
  }
}
