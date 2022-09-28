// import 'package:equatable/equatable.dart';

// class Task extends Equatable {
//   final String title;
//   final DateTime createdDate;
//   final DateTime completedDate;
//   final int totalTaskPoint;
//   final int finishedTaskPoint;
//   final List<Group> groups;
//   final List<Subtask> subtasks;

//   const Task({
//     required this.title,
//     required this.createdDate,
//     required this.completedDate,
//     required this.totalTaskPoint,
//     required this.finishedTaskPoint,
//     this.groups = const [],
//     this.subtasks = const [],
//   });

//   @override
//   List<Object?> get props => [
//         title,
//         createdDate,
//         completedDate,
//         totalTaskPoint,
//         finishedTaskPoint,
//         groups,
//         subtasks,
//       ];
// }

// class Subtask extends Equatable {
//   final String title;
//   final bool isDone;

//   const Subtask({required this.title, required this.isDone});

//   Subtask copyWith({String? title, bool? isDone}) {
//     return Subtask(title: title ?? this.title, isDone: isDone ?? this.isDone);
//   }

//   @override
//   List<Object?> get props => [title, isDone];
// }

// class Group extends Equatable {
//   final String title;

//   const Group({required this.title});

//   @override
//   List<Object?> get props => [title];
// }
