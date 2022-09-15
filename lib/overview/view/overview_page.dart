import 'package:flutter/material.dart';
import 'package:timee/models/task.dart';
import 'package:timee/new_task/view/new_task_page.dart';
import 'package:timee/report/view/report_page.dart';

import '../widgets/task_entry.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Today tasks',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  TaskEntry(
                    task: tasks[0],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TaskEntry(
                    task: tasks[1],
                  ),
                ],
              ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, ReportPage.route());
                },
                icon: const Icon(Icons.pie_chart_outline)),
            IconButton(
                onPressed: () {
                  Navigator.push(context, NewTaskPage.route());
                },
                icon: const Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}

final tasks = <Task>[
  Task(
    title: 'Finish this app',
    completedDate: DateTime.now().add(const Duration(days: 10)),
    createdDate: DateTime.now(),
    totalTaskPoint: 100,
    finishedTaskPoint: 58,
  ),
  Task(
    title: 'Exercise',
    createdDate: DateTime.now(),
    completedDate: DateTime.now(),
    totalTaskPoint: 5,
    finishedTaskPoint: 0,
  ),
];
