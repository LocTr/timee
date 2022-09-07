import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/overview/models/task.dart';
import 'package:timee/timer/bloc/timer_bloc.dart';
import 'package:timee/timer/view/timer_view.dart';
import 'package:timee/utils/ticker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  static Route<void> route({required Task initialTask}) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider(
              create: (context) => TimerBloc(
                ticker: const Ticker(),
                task: initialTask,
              ),
              child: const TimerPage(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return const TimerView();
  }
}
