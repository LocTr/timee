import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsks/new_quest/view/new_quest_page.dart';
import 'package:tsks/overview/bloc/overview_bloc.dart';
import 'package:tsks/report/view/report_page.dart';

import '../widgets/task_entry.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: match color to theme
      backgroundColor: const Color(0xFFFFFFFF),
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
                      if (state.quests.isEmpty) {
                        return const Text('No task yet.');
                      } else {
                        return Column(
                          children: state.quests
                              .map((task) => TaskEntry(quest: task))
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
                  Navigator.push(context, NewQuestPage.route());
                },
                icon: const Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}
