import 'package:flutter/material.dart';
import 'package:timee/new_task/view/new_task_view.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const NewTaskView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NewTaskView();
  }
}
