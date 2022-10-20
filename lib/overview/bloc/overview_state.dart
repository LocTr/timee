part of 'overview_bloc.dart';

class OverviewState extends Equatable {
  const OverviewState({this.quests = const []});

  final List<Quest> quests;

  @override
  List<Object> get props => [quests];
}
