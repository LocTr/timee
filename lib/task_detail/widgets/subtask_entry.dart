import 'package:flutter/material.dart';

class SubtaskEntry extends StatelessWidget {
  const SubtaskEntry({
    Key? key,
    required this.content,
    this.onChanged,
    required this.isDone,
  }) : super(key: key);

  final String content;
  final bool isDone;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: onChanged,
        value: isDone ? true : false,
      ),
      title: Text(
        content,
        style: TextStyle(
            decoration:
                isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
    );
  }
}
