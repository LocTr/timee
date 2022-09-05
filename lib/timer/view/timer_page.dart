import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/overview/models/task.dart';
import 'package:timee/timer/bloc/timer_bloc.dart';
import 'package:timee/timer/view/timer_view.dart';
import 'package:timee/utils/ticker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(
          ticker: const Ticker(),
          duration: 0,
          task: const Task(
            title: 'title',
            isDone: false,
            targetTime: 200,
            timeSpent: 0,
          )),
      child: const TimerView(),
    );
  }
}
