import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_api/models/enums.dart';
import 'package:tsks/new_quest/bloc/new_quest_bloc.dart';

class DifficultyStatPicker extends StatelessWidget {
  const DifficultyStatPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _pickerDialog() {
      return Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.only(top: 200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        ),
        child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            child: BlocBuilder<NewQuestBloc, NewQuestState>(
              builder: (ancestorContext, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                );
              },
            )),
      );
    }

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
            const Text('    Stat gain:'),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.watch<NewQuestBloc>(),
                        child: _pickerDialog(),
                      );
                    });
              },
              child: Text(context.read<NewQuestBloc>().state.quest.stat.name),
            ),
          ],
        );
      },
    );
  }
}
