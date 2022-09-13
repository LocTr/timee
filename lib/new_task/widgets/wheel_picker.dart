import 'package:flutter/material.dart';

class WheelPicker extends StatelessWidget {
  const WheelPicker({
    Key? key,
    required this.onSelectedItemChange,
    required this.itemCount,
    this.size = 60,
  }) : super(key: key);

  final Function(int) onSelectedItemChange;
  final int itemCount;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          return Text(
            (index % itemCount).toString().padLeft(2, '0'),
            style: TextStyle(fontFamily: 'PT Mono', fontSize: size),
          );
        },
      ),
      physics: const FixedExtentScrollPhysics(),
      itemExtent: size + (size / 10),
      onSelectedItemChanged: onSelectedItemChange,
      //arbitrary number to flatten the list
      diameterRatio: 1000,
      controller: FixedExtentScrollController(),
      useMagnifier: true,
      overAndUnderCenterOpacity: .3,
    );
  }
}
