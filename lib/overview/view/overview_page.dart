import 'package:flutter/material.dart';
import 'package:timee/new_task/view/new_task_page.dart';
import 'package:timee/overview/models/task.dart';

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
                onPressed: () {}, icon: const Icon(Icons.pie_chart_outline)),
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

const tasks = <Task>[
  Task(
    title: 'Study java or c#',
    targetTime: 36000,
    timeSpent: 1800,
    isDone: false,
  ),
  Task(
    title: 'Exercise',
    targetTime: 4800,
    timeSpent: 1200,
    isDone: false,
  ),
];
