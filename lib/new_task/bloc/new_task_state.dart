part of 'new_quest_bloc.dart';

class NewQuestState extends Equatable {
  const NewQuestState(this.quest);

  final Quest quest;

  @override
  List<Object> get props => [quest];
}
