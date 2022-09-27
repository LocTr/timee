part of 'task_detail_bloc.dart';

abstract class TaskDetailEvent extends Equatable {
  const TaskDetailEvent();

  @override
  List<Object> get props => [];
}

class TaskDetailProgressConfirmed extends TaskDetailEvent {
  const TaskDetailProgressConfirmed();
}

class TaskDetailProgressChanged extends TaskDetailEvent {
  const TaskDetailProgressChanged({required this.taskPoint});

  final int taskPoint;

  @override
  List<Object> get props => [taskPoint];
}

class TaskDetailSubtaskChanged extends TaskDetailEvent {
  const TaskDetailSubtaskChanged({required this.subtasks});

  final List<Subtask> subtasks;

  @override
  List<Object> get props => [subtasks];
}
