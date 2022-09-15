import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/deprecated/timer/bloc/timer_bloc.dart';
import 'package:timee/deprecated/model/task.dart';

import 'animated_progress_arc.dart';

class ControlSection extends StatefulWidget {
  const ControlSection({
    Key? key,
    required this.controller,
    required this.currentTask,
  }) : super(key: key);

  final AnimatedProgressArcController controller;
  final Task currentTask;

  @override
  State<ControlSection> createState() => _ControlSectionState();
}

class _ControlSectionState extends State<ControlSection> {
  bool isFinishPopup = false;

  List<Widget> renderFinishOptions() {
    return [
      Center(
          child: Text('FINISH?',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.amber))),
      const SizedBox(
        height: 24,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded)),
          IconButton(
              onPressed: () {
                setState(() {
                  isFinishPopup = false;
                });
              },
              icon: const Icon(Icons.close_rounded)),
        ],
      ),
    ];
  }

  List<Widget> renderControlOptions() {
    return [
      BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          if (state is TimerInitial) {
            return TextButton(
              onPressed: () {
                widget.controller.start();
                context.read<TimerBloc>().add(
                    TimerStarted(initialTime: widget.currentTask.timeSpent));
              },
              child: const Text('START'),
            );
          } else if (state is TimerRunPause) {
            return TextButton(
              onPressed: () {
                widget.controller.pause();
                context.read<TimerBloc>().add(const TimerResumed());
              },
              child: const Text('RESUME'),
            );
          } else {
            return TextButton(
              onPressed: () {
                widget.controller.pause();
                context.read<TimerBloc>().add(const TimerPaused());
              },
              child: const Text('PAUSE'),
            );
          }
        },
      ),
      TextButton(
        onPressed: () {
          setState(() {
            isFinishPopup = true;
          });
        },
        child: const Text('FINISH'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              isFinishPopup ? renderFinishOptions() : renderControlOptions(),
        ),
      ),
    );
  }
}
