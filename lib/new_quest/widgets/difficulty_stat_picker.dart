import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_api/models/enums.dart';
import 'package:tsks/new_quest/bloc/new_quest_bloc.dart';

class DifficultyStatPicker extends StatelessWidget {
  const DifficultyStatPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewQuestBloc, NewQuestState>(
      builder: (context, state) {
        return Row(
          children: [
            Text('Difficulty:'),
            DropdownButton<Difficulty>(
              items: Difficulty.values
                  .map((val) => DropdownMenuItem<Difficulty>(
                        value: val,
                        child: Text(val.name),
                      ))
                  .toList(),
              value: state.quest.difficulty,
              onChanged: (Difficulty? value) {
                context.read<NewQuestBloc>().add(QuestDetailChange(
                    quest: state.quest.copyWith(difficulty: value)));
              },
            ),
            Text('    Stat gain:'),
            InkWell(
              onTap: () {},
              child: Text(context.read<NewQuestBloc>().state.quest.stat.name),
            ),
          ],
        );
      },
    );
  }
}
