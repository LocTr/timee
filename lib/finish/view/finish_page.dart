import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: 200,
        height: 300,
        child: ListWheelScrollView.useDelegate(
          childDelegate: ListWheelChildBuilderDelegate(
              builder: (BuildContext context, int index) {
            return Container(
              color: Colors.amber[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (index % 10).toString(),
                  style: TextStyle(fontFamily: 'PT Mono', fontSize: 80),
                ),
              ),
            );
          }),
          physics: const FixedExtentScrollPhysics(),
          itemExtent: 100,
          onSelectedItemChanged: (value) {
            //TODO: add listener
          },
          controller: FixedExtentScrollController(),
        ),
      )),
    );
  }
}
