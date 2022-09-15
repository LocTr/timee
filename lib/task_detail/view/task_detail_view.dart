import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/shared_widget/header.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';
import 'package:timee/task_detail/widgets/task_slider.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenHeader(
                title: BlocProvider.of<TaskDetailBloc>(context).task.title,
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
              Spacer(),
              BlocBuilder<TaskDetailBloc, TaskDetailState>(
                builder: (context, state) {
                  // TODO: consider smooooothen this slider or animation of some sort
                  return Slider(
                      value: state.finishedTaskPoint.toDouble(),
                      max: BlocProvider.of<TaskDetailBloc>(context)
                          .task
                          .totalTaskPoint
                          .toDouble(),
                      label: '${state.finishedTaskPoint.toInt()}',
                      onChanged: (value) {
                        BlocProvider.of<TaskDetailBloc>(context).add(
                            TaskDetailProgressChanged(
                                taskPoint: value.toInt()));
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
