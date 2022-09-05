import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/shared_widget/header.dart';
import 'package:timee/timer/bloc/timer_bloc.dart';
import 'package:timee/timer/widgets/timer_text.dart';

import '../widgets/animated_progress_arc.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  // somehow this cannot init properly on stateless widget
  final AnimatedProgressArcController controller =
      AnimatedProgressArcController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeader(
                title: 'Do something',
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
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: LayoutBuilder(
                    builder: ((context, constraints) {
                      double size =
                          (constraints.maxWidth > constraints.maxHeight)
                              ? constraints.maxHeight
                              : constraints.maxWidth;
                      return Center(
                        child: SizedBox(
                          width: size,
                          height: size,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              BlocBuilder<TimerBloc, TimerState>(
                                builder: (context, state) {
                                  return TimerText(
                                      duration: state.duration,
                                      fontSize: size / 5);
                                },
                              ),
                              AnimatedProgressArc(
                                size: size,
                                strokeWidth: 20,
                                controller: controller,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.start();
                        },
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {
                          controller.pause();
                        },
                        icon: const Icon(Icons.pause_rounded)),
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