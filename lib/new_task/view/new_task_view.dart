import 'package:flutter/material.dart';
import 'package:timee/new_task/widgets/wheel_picker.dart';
import 'package:timee/shared_widget/header.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int hours = 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'New task',
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double width = constraints.maxWidth;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 5,
                        height: width / 2,
                        child: WheelPicker(
                          size: width / 6.5,
                          itemCount: 25,
                          onSelectedItemChange: (value) {
                            hours = value;
                          },
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontFamily: 'PT Mono',
                          fontSize: width / 6.5,
                        ),
                      ),
                      SizedBox(
                        width: width / 5,
                        height: width / 2,
                        child: WheelPicker(
                          size: width / 6.5,
                          itemCount: 60,
                          onSelectedItemChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontFamily: 'PT Mono',
                          fontSize: width / 6.5,
                        ),
                      ),
                      SizedBox(
                        width: width / 5,
                        height: width / 2,
                        child: WheelPicker(
                          size: width / 6.5,
                          itemCount: 60,
                          onSelectedItemChange: (value) {},
                        ),
                      ),
                    ],
                  );
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter task name',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('SAVE'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
