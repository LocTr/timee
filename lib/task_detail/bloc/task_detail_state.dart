part of 'task_detail_bloc.dart';

class TaskDetailState extends Equatable {
  final Task task;

  const TaskDetailState({required this.task});

  bool get isComplete {
    return task.finishedTaskPoint == task.totalTaskPoint ? true : false;
  }

  @override
  List<Object> get props => [task];
}
