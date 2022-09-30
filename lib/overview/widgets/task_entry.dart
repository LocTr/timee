import 'package:flutter/material.dart';
import 'package:task_api/models/task.dart';
import 'package:tsks/task_detail/view/task_detail_page.dart';

class TaskEntry extends StatelessWidget {
  final Task task;
  const TaskEntry({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completePercentage = (task.finishedTaskPoint / task.totalTaskPoint);
    return Card(
      //TODO: match color to theme
      color: const Color(0xFAFAFAFA),
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
                      children: [
                        Text(task.id.isEmpty ? 'empty' : task.id),
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
              //TODO: match color to theme
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
