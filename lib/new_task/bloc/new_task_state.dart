part of 'new_task_bloc.dart';

class NewTaskState extends Equatable {
  const NewTaskState(this.task);

  final Task task;

  @override
  List<Object> get props => [task];
}
