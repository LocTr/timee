import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsks/new_task/bloc/new_task_bloc.dart';

class PointPicker extends StatefulWidget {
  const PointPicker({Key? key}) : super(key: key);

  @override
  State<PointPicker> createState() => _PointPickerState();
}

class _PointPickerState extends State<PointPicker> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;

        Widget selector(int value) {
          return BlocBuilder<NewTaskBloc, NewTaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  context.read<NewTaskBloc>().add(TaskDetailChange(
                          task: state.task.copyWith(
                        totalTaskPoint: value,
                      )));
                },
                child: Container(
                  width: width / 5,
                  height: width / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      border: Border.all(
                        width: width / 140,
                        color: state.task.totalTaskPoint == value
                            ? Theme.of(context).primaryColor
                            : Colors.black54,
                      )),
                  child: Center(
                      child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: width / 16,
                      color: state.task.totalTaskPoint == value
                          ? Theme.of(context).primaryColor
                          : Colors.black54,
                    ),
                  )),
                ),
              );
            },
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selector(1),
                selector(2),
                selector(3),
                selector(5),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                selector(8),
                selector(13),
                selector(21),
                selector(34),
              ],
            ),
          ],
        );
      },
    );
  }
}
