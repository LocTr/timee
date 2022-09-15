import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final int targetTime;
  final int timeSpent;
  final bool isDone;

  const Task(
      {required this.title,
      required this.targetTime,
      required this.timeSpent,
      required this.isDone});

  Task copyWith({
    String? title,
    int? targetTime,
    int? timeSpent,
    bool? isDone,
  }) {
    return Task(
        title: title ?? this.title,
        targetTime: targetTime ?? this.targetTime,
        timeSpent: timeSpent ?? this.timeSpent,
        isDone: isDone ?? this.isDone);
  }

  @override
  List<Object?> get props => [title, targetTime, timeSpent, isDone];
}

class TaskImp {
  final String title;
  final int targetTime;
  final int timeSpent;
  final bool isDone;

  const TaskImp({
    required this.title,
    required this.targetTime,
    this.timeSpent = 0,
    this.isDone = false,
  });
}

class RecursiveTask extends Task {
  RecursiveTask(
      {required super.title,
      required super.targetTime,
      required super.timeSpent,
      required super.isDone});
}
