import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_api/models/quest.dart';
import 'package:tsks/overview/bloc/overview_bloc.dart';
import 'package:tsks/task_detail/view/quest_detail_page.dart';
import 'package:tsks/utils/date_util.dart';

class TaskEntry extends StatelessWidget {
  final Quest quest;
  const TaskEntry({Key? key, required this.quest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //TODO: match color to theme
      color: const Color(0xFAFAFAFA),
      clipBehavior: Clip.antiAlias,
      borderOnForeground: true,
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push<void>(QuestDetailPage.route(quest: quest));
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(quest.title),
                    subtitle: Wrap(
                      children: [
                        Text(DateUtil.getReadableDate(quest.createdAt)),
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
