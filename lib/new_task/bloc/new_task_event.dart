part of 'new_quest_bloc.dart';

abstract class NewQuestEvent extends Equatable {
  const NewQuestEvent();

  @override
  List<Object> get props => [];
}

class TaskDetailChange extends NewQuestEvent {
  const TaskDetailChange({required this.quest});

  final Quest quest;

  @override
  List<Object> get props => [quest];
}

class TaskSaved extends NewQuestEvent {
  const TaskSaved();
}
