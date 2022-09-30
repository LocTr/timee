import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_api/models/task.dart';
import 'package:tasks_repo/tasks_repo.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc({required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo,
        super(const OverviewState()) {
    on<OverviewSubscriptionRequested>(_onSubscriptionRequiested);
  }

  final TasksRepo _tasksRepo;

  Future<void> _onSubscriptionRequiested(
    OverviewSubscriptionRequested event,
    Emitter<OverviewState> emit,
  ) async {
    await emit.forEach<List<Task>>(
      _tasksRepo.getTasks(),
      onData: (tasks) => OverviewState(tasks: tasks),
    );
  }
}
