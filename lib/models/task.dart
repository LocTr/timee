class Task {
  final String title;
  final DateTime createdDate;
  final DateTime completedDate;
  final int totalTaskPoint;
  final int finishedTaskPoint;
  final List<Group> groups;
  final List<Subtask> subtasks;

  Task({
    required this.title,
    required this.createdDate,
    required this.completedDate,
    required this.totalTaskPoint,
    required this.finishedTaskPoint,
    this.groups = const [],
    this.subtasks = const [],
  });
}

class Subtask {
  final String title;
  final bool isDone;

  const Subtask({required this.title, required this.isDone});
}

class Group {
  final String title;

  const Group({required this.title});
}
