import 'package:flutter/material.dart';
import 'package:timee/shared_widget/header.dart';

import '../widgets/animated_progress_arc.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  final AnimatedProgressArcController controller =
      AnimatedProgressArcController();

  @override
  Widget build(BuildContext context) {
    print('build again @@');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeader(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(
                    spacing: 2.0,
                    children: const [
                      Chip(
                        label: Text('Work'),
                      ),
                      Chip(
                        label: Text('Design'),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Center(
                    child: AnimatedProgressArc(
                  size: 250,
                  strokeWidth: 20,
                  controller: controller,
                )),
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
