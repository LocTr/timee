import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_api/models/task.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:uuid/uuid.dart';

part 'new_task_event.dart';
part 'new_task_state.dart';

class NewTaskBloc extends Bloc<NewTaskEvent, NewTaskState> {
  NewTaskBloc({required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo,
        super(NewTaskState(
          Task(
              title: '',
              finishedTaskPoint: 0,
              totalTaskPoint: 0,
              id: const Uuid().v4()),
        )) {
    on<TaskDetailChange>(_onTaskDetailChange);
    on<TaskSaved>(_onTaskSaved);
  }

  final TasksRepo _tasksRepo;

  _onTaskDetailChange(
    TaskDetailChange event,
    Emitter<NewTaskState> emit,
  ) {
    emit(NewTaskState(event.task));
  }

  _onTaskSaved(
    TaskSaved event,
    Emitter<NewTaskState> emit,
  ) async {
    await _tasksRepo.saveTask(state.task);
  }
}
