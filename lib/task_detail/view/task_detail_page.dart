import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_api/models/task.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:tsks/task_detail/bloc/task_detail_bloc.dart';
import 'package:tsks/task_detail/view/task_detail_view.dart';

class TaskDetailPage extends StatelessWidget {
  static Route<void> route({required Task task}) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<TaskDetailBloc>(
              create: (context) => TaskDetailBloc(
                tasksRepo: context.read<TasksRepo>(),
                taskInitial: task,
              ),
              child: const TaskDetailPage(),
            ));
  }

  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TaskDetailView();
  }
}
