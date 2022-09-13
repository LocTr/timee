import 'package:flutter/material.dart';
import 'package:timee/new_task/widgets/wheel_picker.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int hours = 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double width = constraints.maxWidth;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width / 4,
                      height: 240,
                      child: WheelPicker(
                        itemCount: 25,
                        onSelectedItemChange: (value) {
                          hours = value;
                        },
                      ),
                    ),
                    const Text(
                      ":",
                      style:
                          const TextStyle(fontFamily: 'PT Mono', fontSize: 60),
                    ),
                    SizedBox(
                      width: width / 4,
                      height: 240,
                      child: WheelPicker(
                        itemCount: 60,
                        onSelectedItemChange: (value) {
                          print(value);
                        },
                      ),
                    ),
                    const Text(
                      ":",
                      style:
                          const TextStyle(fontFamily: 'PT Mono', fontSize: 60),
                    ),
                    SizedBox(
                      width: width / 4,
                      height: 240,
                      child: WheelPicker(
                        itemCount: 60,
                        onSelectedItemChange: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
