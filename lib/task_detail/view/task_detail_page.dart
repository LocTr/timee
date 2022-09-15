import 'package:flutter/material.dart';
import 'package:timee/models/task.dart';
import 'package:timee/task_detail/view/task_detail_view.dart';

class TaskDetailPage extends StatelessWidget {
  static Route<void> route({required Task initialTask}) {
    return MaterialPageRoute(builder: (context) => const TaskDetailPage());
  }

  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TaskDetailView();
  }
}
