part of 'overview_bloc.dart';

class OverviewState extends Equatable {
  const OverviewState({this.tasks = const []});

  final List<Task> tasks;

  @override
  List<Object> get props => [tasks];
}
