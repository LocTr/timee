import 'package:flutter/material.dart';

class PointPicker extends StatefulWidget {
  const PointPicker({Key? key}) : super(key: key);

  @override
  State<PointPicker> createState() => _PointPickerState();
}

class _PointPickerState extends State<PointPicker> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;

        Widget selector(double size) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: width / 5,
              height: width / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  border:
                      Border.all(width: width / 140, color: Colors.black54)),
              child: Center(
                  child: Text(
                '12',
                style: TextStyle(fontSize: width / 16, color: Colors.black54),
              )),
            ),
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selector(width / 5),
                selector(width / 5),
                selector(width / 5),
                selector(width / 5),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selector(width / 5),
                selector(width / 5),
                selector(width / 5),
                selector(width / 5),
              ],
            ),
          ],
        );
      },
    );
  }
}
