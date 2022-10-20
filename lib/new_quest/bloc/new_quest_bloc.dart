import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/enums.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';

part 'new_quest_event.dart';
part 'new_quest_state.dart';

class NewQuestBloc extends Bloc<NewQuestEvent, NewQuestState> {
  NewQuestBloc({required QuestsRepo tasksRepo})
      : _questsRepo = tasksRepo,
        super(NewQuestState(
          Quest(
            nextResetDate: DateTime.now(),
            repeat: Repeat.daily,
            title: '',
          ),
        )) {
    on<QuestDetailChange>(_onQuestsDetailChange);
    on<QuestSaved>(_onQuestsSaved);
  }

  final QuestsRepo _questsRepo;

  _onQuestsDetailChange(
    QuestDetailChange event,
    Emitter<NewQuestState> emit,
  ) {
    emit(NewQuestState(event.quest));
  }

  _onQuestsSaved(
    QuestSaved event,
    Emitter<NewQuestState> emit,
  ) async {
    await _questsRepo.saveQuest(state.quest);
  }
}
