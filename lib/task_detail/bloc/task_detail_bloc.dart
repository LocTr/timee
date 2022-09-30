import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_api/models/task.dart';
import 'package:tasks_repo/tasks_repo.dart';

part 'task_detail_event.dart';
part 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc({required this.taskInitial, required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo,
        super(TaskDetailState(task: taskInitial)) {
    on<TaskDetailProgressChanged>(_onTaskProgressed);
    on<TaskDetailSubtaskChanged>(_onTaskDetailSubtaskChanged);
    on<TaskDetailProgressConfirmed>(_onTaskDetailProgressConfirmed);
  }

  final Task taskInitial;

  final TasksRepo _tasksRepo;

  _onTaskProgressed(TaskDetailProgressChanged event, Emitter emit) async {
    if (event.taskPoint != state.task.finishedTaskPoint) {
      Task newTask = state.task.copyWith(finishedTaskPoint: event.taskPoint);

      emit(TaskDetailState(task: newTask));
    }
  }

  _onTaskDetailProgressConfirmed(
    TaskDetailProgressConfirmed event,
    Emitter<TaskDetailState> emit,
  ) {
    _tasksRepo.saveTask(state.task);
  }

  _onTaskDetailSubtaskChanged(
    TaskDetailSubtaskChanged event,
    Emitter<TaskDetailState> emit,
  ) async {
    Task newTask = state.task.copyWith(subtasks: event.subtasks);
    await _tasksRepo.saveTask(newTask);

    emit(TaskDetailState(task: newTask));
  }
}
