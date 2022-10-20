part of 'task_detail_bloc.dart';

class TaskDetailState extends Equatable {
  final Quest task;

  const TaskDetailState({required this.task});

  @override
  List<Object> get props => [task];
}
