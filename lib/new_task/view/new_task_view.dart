import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsks/new_task/bloc/new_task_bloc.dart';
import 'package:tsks/new_task/widgets/new_subtasks.dart';
import 'package:tsks/new_task/widgets/point_picker.dart';
import 'package:tsks/shared_widget/header.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({Key? key}) : super(key: key);

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'New task',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 90,
                        child: BlocBuilder<NewTaskBloc, NewTaskState>(
                          builder: (context, state) {
                            return TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter task name',
                              ),
                              onChanged: (value) {
                                context
                                    .read<NewTaskBloc>()
                                    .add(TaskDetailChange(
                                        task: state.task.copyWith(
                                      title: value,
                                    )));
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      const PointPicker(),
                      const NewSubtasks(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<NewTaskBloc, NewTaskState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 24.0, left: 24.0, right: 24.0),
                        child: TextButton(
                          onPressed: (state.task.title.isNotEmpty &&
                                  state.task.totalTaskPoint != 0)
                              ? () {
                                  context
                                      .read<NewTaskBloc>()
                                      .add(const TaskSaved());
                                }
                              : null,
                          child: const Text('SAVE'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
