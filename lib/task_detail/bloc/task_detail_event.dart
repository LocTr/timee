part of 'task_detail_bloc.dart';

abstract class TaskDetailEvent extends Equatable {
  const TaskDetailEvent();

  @override
  List<Object> get props => [];
}

class TaskDetailProgressChanged extends TaskDetailEvent {
  const TaskDetailProgressChanged({required this.taskPoint});

  final int taskPoint;

  @override
  List<Object> get props => [taskPoint];
}
