import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';

class TaskPointSlider extends StatefulWidget {
  const TaskPointSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskPointSlider> createState() => _TaskPointSliderState();
}

class _TaskPointSliderState extends State<TaskPointSlider> {
  double sliderValue = 0;

  late double maxValue;

  bool isChanged = false;

  @override
  void initState() {
    var bloc = context.read<TaskDetailBloc>();
    sliderValue = bloc.state.task.finishedTaskPoint.toDouble();
    maxValue = bloc.state.task.totalTaskPoint.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text('${sliderValue.toInt()}/$maxValue',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            const SizedBox(width: 24),
          ],
        ),
        Slider(
          value: sliderValue,
          max: maxValue,
          onChanged: (value) {
            setState(() {
              isChanged = true;
              sliderValue = value;
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
