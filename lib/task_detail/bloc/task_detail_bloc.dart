import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timee/models/task.dart';

part 'task_detail_event.dart';
part 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  final Task task;

  TaskDetailBloc({required this.task})
      : super(TaskDetailState(
          finishedTaskPoint: task.finishedTaskPoint,
          subtasks: task.subtasks,
          status: TaskStatus.initial,
        )) {
    on<TaskDetailProgressChanged>(_onTaskProgressed);
  }

  _onTaskProgressed(TaskDetailProgressChanged event, Emitter emit) {
    if (event.taskPoint != state.finishedTaskPoint) {
      emit(state.copyWith(finishedTaskPoint: event.taskPoint));
    }
  }
}
