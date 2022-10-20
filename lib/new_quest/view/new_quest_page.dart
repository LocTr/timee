import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/new_quest/bloc/new_quest_bloc.dart';
import 'package:tsks/new_quest/view/new_quest_view.dart';

class NewQuestPage extends StatelessWidget {
  const NewQuestPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => NewQuestBloc(
          tasksRepo: context.read<QuestsRepo>(),
        ),
        child: const NewquestView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NewquestView();
  }
}
