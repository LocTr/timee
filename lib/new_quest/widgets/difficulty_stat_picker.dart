import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quests_api/models/enums.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tsks/new_quest/bloc/new_quest_bloc.dart';
import 'package:tsks/utils/datetime_extension.dart';

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
            height: MediaQuery.of(context).size.height * 0.4,
            child: BlocBuilder<NewQuestBloc, NewQuestState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Difficulty:'),
                    ToggleSwitch(
                      totalSwitches: 3,
                      minWidth: 200,
                      labels: Difficulty.values.map((e) => e.name).toList(),
                      initialLabelIndex: state.quest.difficulty.index,
                      changeOnTap: true,
                      onToggle: (index) {
                        context.read<NewQuestBloc>().add(QuestDetailChange(
                            quest: state.quest.copyWith(
                                difficulty: Difficulty.values[index!])));
                      },
                    ),
                    const Text('  Stat gain:'),
                    ToggleSwitch(
                      initialLabelIndex: state.quest.stat.index,
                      minWidth: 200,
                      labels: Stat.values.map((e) => e.name).toList(),
                      onToggle: (index) {
                        context.read<NewQuestBloc>().add(QuestDetailChange(
                            quest: state.quest
                                .copyWith(stat: Stat.values[index!])));
                      },
                    )
                  ],
                );
              },
            )),
      );
    }

    return BlocBuilder<NewQuestBloc, NewQuestState>(
      builder: (context, state) {
        return GestureDetector(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Start date: ${state.quest.createdAt.getReadableDate()}     Repeat: ${state.quest.repeat.name}     '),
              const SizedBox(height: 12),
              Text('Difficulty: ${state.quest.difficulty.name}'
                  '     Stat gain: ${state.quest.stat.name}'),
            ],
          ),
        );
      },
    );
  }
}
