part of 'new_quest_bloc.dart';

abstract class NewQuestEvent extends Equatable {
  const NewQuestEvent();

  @override
  List<Object> get props => [];
}

class QuestDetailChange extends NewQuestEvent {
  const QuestDetailChange({required this.quest});

  final Quest quest;

  @override
  List<Object> get props => [quest];
}

class QuestSaved extends NewQuestEvent {
  const QuestSaved();
}
