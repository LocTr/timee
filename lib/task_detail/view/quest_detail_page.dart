import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/task_detail/bloc/task_detail_bloc.dart';
import 'package:tsks/task_detail/view/quest_detail_view.dart';

class QuestDetailPage extends StatelessWidget {
  static Route<void> route({required Quest quest}) {
    return MaterialPageRoute(
        builder: (context) => BlocProvider<TaskDetailBloc>(
              create: (context) => TaskDetailBloc(
                questsRepo: context.read<QuestsRepo>(),
                quest: quest,
              ),
              child: const QuestDetailPage(),
            ));
  }

  const QuestDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestDetailView();
  }
}
