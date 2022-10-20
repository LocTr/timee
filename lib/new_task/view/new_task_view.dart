import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsks/new_task/bloc/new_quest_bloc.dart';
import 'package:tsks/shared_widget/header.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({Key? key}) : super(key: key);

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'New task',
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 90,
                        child: BlocBuilder<NewQuestBloc, NewQuestState>(
                          builder: (context, state) {
                            return TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter task name',
                              ),
                              onChanged: (value) {
                                context
                                    .read<NewQuestBloc>()
                                    .add(TaskDetailChange(
                                        quest: state.quest.copyWith(
                                      title: value,
                                    )));
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
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
                                      .add(const TaskSaved());
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
    );
  }
}
