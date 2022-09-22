import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/new_task/view/new_task_page.dart';
import 'package:timee/overview/bloc/overview_bloc.dart';
import 'package:timee/report/view/report_page.dart';

import '../widgets/task_entry.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Text('Today tasks',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  BlocBuilder<OverviewBloc, OverviewState>(
                    builder: (context, state) {
                      if (state.tasks.isEmpty) {
                        return const Text('No task yet.');
                      } else {
                        for (var task in state.tasks) {
                          print('id:' + task.id);
                        }
                        return Column(
                          children: state.tasks
                              .map((task) => TaskEntry(task: task))
                              .toList(),
                        );
                      }
                    },
                  )
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
