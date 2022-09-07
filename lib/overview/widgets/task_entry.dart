import 'package:flutter/material.dart';
import 'package:timee/overview/models/task.dart';
import 'package:timee/timer/view/timer_page.dart';

class TaskEntry extends StatelessWidget {
  final Task task;
  const TaskEntry({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeRemaining = task.targetTime - task.timeSpent;
    final hoursStr = (timeRemaining / 3600).floor().toString();
    final minutesStr =
        (timeRemaining / 60 % 60).floor().toString().padLeft(2, '0');
    return Card(
      color: Color(0xFAFAFAFA),
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(TimerPage.route(initialTask: task));
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
                Text('$hoursStr h $minutesStr m to go'),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
            const LinearProgressIndicator(
              minHeight: 6.0,
              value: 0.5,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
