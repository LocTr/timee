import 'package:flutter/material.dart';

class TaskEntry extends StatelessWidget {
  const TaskEntry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFAFAFAFA),
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      elevation: 0.0,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Code this app'),
                    subtitle: Wrap(
                      children: const [
                        Text('this'),
                        Text('is'),
                      ],
                    ),
                  ),
                ),
                const Text('1h30m to go'),
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
