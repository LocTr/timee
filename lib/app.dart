import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:tsks/overview/view/overview_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.tasksRepo}) : super(key: key);

  final TasksRepo tasksRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: tasksRepo,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Rubik',
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
          thumbShape: RoundSliderThumbShape(
            elevation: 0.0,
            enabledThumbRadius: 12,
            pressedElevation: 0.0,
          ),
          trackHeight: 22,
        ),
      ),
      home: const OverviewPage(),
    );
  }
}
