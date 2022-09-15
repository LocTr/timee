import 'package:flutter/material.dart';
import 'package:timee/shared_widget/header.dart';
import 'package:timee/task_detail/widgets/task_slider.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(
                title: 'Title',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(
                    spacing: 4.0,
                    children: const [
                      Chip(
                        label: Text('Work'),
                      ),
                      Chip(
                        label: Text('Design'),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Slider(
                  value: progress,
                  max: 100,
                  label: '$progress',
                  onChanged: (value) {
                    setState(() {
                      progress = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
