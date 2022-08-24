import 'package:flutter/material.dart';
import 'package:timee/timer/widget/progress_animation_widget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      )),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Do something!',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
              Wrap(
                spacing: 2.0,
                children: const [
                  SizedBox(
                    width: 8.0,
                  ),
                  Chip(
                    label: Text('Work'),
                  ),
                  Chip(
                    label: Text('Design'),
                  ),
                ],
              ),
              ProgressAnimationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
