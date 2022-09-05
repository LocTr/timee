class Task {
  final String title;
  final int targetTime;
  final int timeSpent;
  final bool isDone;

  const Task(
      {required this.title,
      required this.targetTime,
      required this.timeSpent,
      required this.isDone});
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
