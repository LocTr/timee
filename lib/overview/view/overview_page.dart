import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:timee/overview/bloc/overview_bloc.dart';
import 'package:timee/overview/view/overview_view.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OverviewBloc(
        tasksRepo: context.read<TasksRepo>(),
      )..add(const OverviewSubscriptionRequested()),
      child: const OverviewView(),
    );
  }
}
