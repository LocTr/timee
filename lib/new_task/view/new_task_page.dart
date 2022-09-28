import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:timee/new_task/bloc/new_task_bloc.dart';
import 'package:timee/new_task/view/new_task_view.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => NewTaskBloc(
          tasksRepo: context.read<TasksRepo>(),
        ),
        child: const NewTaskView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NewTaskView();
  }
}
