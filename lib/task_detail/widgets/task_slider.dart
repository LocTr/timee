import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';

class TaskSlider extends StatefulWidget {
  const TaskSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskSlider> createState() => _TaskSliderState();
}

class _TaskSliderState extends State<TaskSlider> {
  double sliderValue = 0;

  bool isChanged = false;

  @override
  void initState() {
    var bloc = context.read<TaskDetailBloc>();
    sliderValue = bloc.state.task.finishedTaskPoint.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: sliderValue,
          max: 100,
          label: sliderValue.toInt().toString(),
          onChanged: (value) {
            setState(() {
              isChanged = true;
              sliderValue;
            });
          },
          onChangeEnd: (value) {
            context
                .read<TaskDetailBloc>()
                .add(TaskDetailProgressChanged(taskPoint: sliderValue.toInt()));
          },
        ),
        if (isChanged)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.done_rounded)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.close_rounded)),
            ],
          ),
      ],
    );
  }
}
