import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timee/models/task.dart';
import 'package:timee/task_detail/bloc/task_detail_bloc.dart';
import 'package:timee/task_detail/view/task_detail_view.dart';

class TaskDetailPage extends StatelessWidget {
  static Route<void> route({required Task task}) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<TaskDetailBloc>(
              create: (context) => TaskDetailBloc(task: task),
              child: const TaskDetailPage(),
            ));
  }

  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TaskDetailView();
  }
}
