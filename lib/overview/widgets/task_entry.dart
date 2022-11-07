import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:quests_api/models/quest.dart';
import 'package:tsks/overview/bloc/overview_bloc.dart';
import 'package:tsks/utils/datetime_extension.dart';

class TaskEntry extends StatelessWidget {
  final Quest quest;
  const TaskEntry({Key? key, required this.quest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (context) {
              context
                  .read<OverviewBloc>()
                  .add(OverviewQuestCompleted(quest: quest));
            },
            icon: Icons.done,
          )
        ],
      ),
      key: Key(quest.id),
      child: Card(
        //TODO: match color to theme
        color: const Color(0xFAFAFAFA),
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(quest.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Available until: ${quest.nextResetDate.getReadableDate()}'),
                        Text('is done: ${quest.isDone}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
