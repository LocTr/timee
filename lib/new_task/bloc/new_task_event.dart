part of 'new_task_bloc.dart';

abstract class NewTaskEvent extends Equatable {
  const NewTaskEvent();

  @override
  List<Object> get props => [];
}

class TaskDetailChange extends NewTaskEvent {
  const TaskDetailChange({required this.task});

  final Task task;

  @override
  List<Object> get props => [task];
}
