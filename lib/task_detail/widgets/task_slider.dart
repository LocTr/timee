import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';

class TaskSlider extends StatelessWidget {
  const TaskSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<TaskDetailBloc>();
    // TODO: consider smooooothen this slider or animation of some sort
    return Column(
      children: [
        Slider(
            value: bloc.state.finishedTaskPoint.toDouble(),
            max: BlocProvider.of<TaskDetailBloc>(context)
                .task
                .totalTaskPoint
                .toDouble(),
            label: bloc.state.finishedTaskPoint.toInt().toString(),
            onChanged: (value) {
              BlocProvider.of<TaskDetailBloc>(context)
                  .add(TaskDetailProgressChanged(taskPoint: value.toInt()));
            }),
        if (bloc.state.status == TaskStatus.progressed)
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
