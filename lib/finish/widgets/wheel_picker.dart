import 'package:flutter/material.dart';

class WheelPicker extends StatelessWidget {
  const WheelPicker({
    Key? key,
    required this.onSelectedItemChange,
    required this.itemCount,
  }) : super(key: key);

  final Function(int) onSelectedItemChange;

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (index % itemCount).toString().padLeft(2, '0'),
              style: const TextStyle(fontFamily: 'PT Mono', fontSize: 60),
            ),
          );
        },
      ),
      physics: const FixedExtentScrollPhysics(),
      itemExtent: 80,
      onSelectedItemChanged: onSelectedItemChange,
      //arbitrary number to flatten the list
      diameterRatio: 100,
      controller: FixedExtentScrollController(),
      useMagnifier: true,
      overAndUnderCenterOpacity: .3,
    );
  }
}
