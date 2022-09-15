import 'package:flutter/material.dart';
import 'package:timee/models/task.dart';
import 'package:timee/task_detail/view/task_detail_page.dart';

class TaskEntry extends StatelessWidget {
  final Task task;
  const TaskEntry({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completePercentage = (task.finishedTaskPoint / task.totalTaskPoint);
    return Card(
      color: Color(0xFAFAFAFA),
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(TaskDetailPage.route(task: task));
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Wrap(
                      children: const [
                        Text('this'),
                        Text('is'),
                      ],
                    ),
                  ),
                ),
                Text(
                    '${(completePercentage * 100).toStringAsFixed(2)}% completed'),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            LinearProgressIndicator(
              minHeight: 6.0,
              value: completePercentage,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
