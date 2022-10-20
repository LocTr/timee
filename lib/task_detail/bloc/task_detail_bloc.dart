import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';

part 'task_detail_event.dart';
part 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc({required Quest quest, required QuestsRepo questsRepo})
      : _questsRepo = questsRepo,
        super(TaskDetailState(task: quest));

  final QuestsRepo _questsRepo;
}
