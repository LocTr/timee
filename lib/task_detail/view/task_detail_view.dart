import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/shared_widget/header.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';
import 'package:timee/task_detail/widgets/subtask_entry.dart';
import 'package:timee/task_detail/widgets/task_point_slider.dart';
import 'package:collection/collection.dart';

class TaskDetailView extends StatefulWidget {
  const TaskDetailView({Key? key}) : super(key: key);

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TaskPointSlider(),
              ),
              BlocBuilder<TaskDetailBloc, TaskDetailState>(
                builder: (context, state) {
                  final subtasks = state.task.subtasks;
                  return Expanded(
                    child: ListView(
                      children: subtasks
                          .mapIndexed((index, subtask) => SubtaskEntry(
                              content: subtask.title,
                              isDone: subtask.isDone,
                              onChanged: (value) {
                                final subtask =
                                    subtasks[index].copyWith(isDone: value);
                                final newSubtask = subtasks.toList()
                                  ..[index] = subtask;
                                context
                                    .read<TaskDetailBloc>()
                                    .add(TaskDetailSubtaskChanged(
                                      subtasks: newSubtask,
                                    ));
                              }))
                          .toList(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
