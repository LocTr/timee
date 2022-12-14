// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quests_api/models/task.dart';
// import 'package:tsks/new_task/bloc/new_task_bloc.dart';
// import 'package:collection/collection.dart';

// class NewSubtasks extends StatelessWidget {
//   const NewSubtasks({Key? key}) : super(key: key);

//   Widget _addedSubtasks() {
//     return BlocBuilder<NewTaskBloc, NewTaskState>(
//       builder: (context, state) {
//         if (state.quest.subtasks.isNotEmpty) {
//           return Column(
//             children: state.quest.subtasks
//                 .mapIndexed(
//                   (index, element) => _Subtask(
//                     subtask: state.quest.subtasks[index],
//                     onClick: () {
//                       context.read<NewTaskBloc>().add(
//                             TaskDetailChange(
//                               quest: state.quest.copyWith(
//                                   subtasks: state.quest.subtasks.toList()
//                                     ..removeAt(index)),
//                             ),
//                           );
//                     },
//                   ),
//                 )
//                 .toList(),
//           );
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _addedSubtasks(),
//         const _Addsubtask(),
//       ],
//     );
//   }
// }

// class _Subtask extends StatelessWidget {
//   const _Subtask({Key? key, required this.subtask, this.onClick})
//       : super(key: key);

//   final Subtask subtask;

//   final VoidCallback? onClick;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(subtask.title),
//         const Spacer(),
//         IconButton(onPressed: onClick, icon: const Icon(Icons.remove)),
//       ],
//     );
//   }
// }

// class _Addsubtask extends StatefulWidget {
//   const _Addsubtask({Key? key}) : super(key: key);

//   @override
//   State<_Addsubtask> createState() => _AddsubtaskState();
// }

// class _AddsubtaskState extends State<_Addsubtask> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Expanded(
//           child: TextField(
//             onSubmitted: (value) {
//               var bloc = context.read<NewTaskBloc>();
//               final subtasks = bloc.state.quest.subtasks.toList()
//                 ..add(Subtask(title: value, isDone: false));
//               context.read<NewTaskBloc>().add(TaskDetailChange(
//                     quest: bloc.state.quest.copyWith(subtasks: subtasks),
//                   ));
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
