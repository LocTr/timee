import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsks/new_quest/bloc/new_quest_bloc.dart';
import 'package:tsks/new_quest/widgets/difficulty_stat_picker.dart';
import 'package:tsks/shared_widget/header.dart';

class NewquestView extends StatefulWidget {
  const NewquestView({Key? key}) : super(key: key);

  @override
  State<NewquestView> createState() => _NewquestViewState();
}

class _NewquestViewState extends State<NewquestView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const ScreenHeader(
                  title: 'New quest',
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        DifficultyStatPicker(),
                        BlocBuilder<NewQuestBloc, NewQuestState>(
                          builder: (context, state) {
                            return TextField(
                              decoration: const InputDecoration.collapsed(
                                hintText: 'What do you want to do?',
                              ),
                              style: Theme.of(context).textTheme.headline5,
                              onChanged: (value) {
                                context
                                    .read<NewQuestBloc>()
                                    .add(QuestDetailChange(
                                        quest: state.quest.copyWith(
                                      title: value,
                                    )));
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 36),
                        SizedBox(
                          height: 90,
                          child: BlocBuilder<NewQuestBloc, NewQuestState>(
                            builder: (context, state) {
                              return TextField(
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Any details?',
                                ),
                                onChanged: (value) {
                                  context
                                      .read<NewQuestBloc>()
                                      .add(QuestDetailChange(
                                          quest: state.quest.copyWith(
                                        detail: value,
                                      )));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<NewQuestBloc, NewQuestState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 24.0, left: 24.0, right: 24.0),
                          child: TextButton(
                            onPressed: (state.quest.title.isNotEmpty)
                                ? () {
                                    context
                                        .read<NewQuestBloc>()
                                        .add(const QuestSaved());
                                  }
                                : null,
                            child: const Text('SAVE'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
