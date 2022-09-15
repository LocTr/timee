part of 'task_detail_bloc.dart';

enum TaskStatus {
  initial,
  progressed,
}

class TaskDetailState extends Equatable {
  final int finishedTaskPoint;
  final List<Subtask> subtasks;
  final TaskStatus status;

  const TaskDetailState(
      {required this.finishedTaskPoint,
      required this.subtasks,
      required this.status});

  TaskDetailState copyWith({
    int? finishedTaskPoint,
    List<Subtask>? subtasks,
    TaskStatus? status,
  }) {
    return TaskDetailState(
        finishedTaskPoint: finishedTaskPoint ?? this.finishedTaskPoint,
        subtasks: subtasks ?? this.subtasks,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [finishedTaskPoint, subtasks, status];
}
