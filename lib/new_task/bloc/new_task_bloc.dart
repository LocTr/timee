import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_api/models/task.dart';

part 'new_task_event.dart';
part 'new_task_state.dart';

class NewTaskBloc extends Bloc<NewTaskEvent, NewTaskState> {
  NewTaskBloc()
      : super(NewTaskState(
          Task(title: '', finishedTaskPoint: 0, totalTaskPoint: 0),
        )) {
    on<TaskDetailChange>(_onTaskDetailChange);
  }

  _onTaskDetailChange(
    TaskDetailChange event,
    Emitter<NewTaskState> emit,
  ) async {
    emit(NewTaskState(event.task));
  }
}
