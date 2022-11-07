import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/utils/datetime_extension.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc({required QuestsRepo questsRepo})
      : _questsRepo = questsRepo,
        super(const OverviewState()) {
    on<OverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<OverviewQuestRenewed>(_onOverviewQuestRenewed);
    on<OverviewQuestCompleted>(_onOverviewQuestCompleted);
  }

  final QuestsRepo _questsRepo;

  Future<void> _onSubscriptionRequested(
    OverviewSubscriptionRequested event,
    Emitter<OverviewState> emit,
  ) async {
    await emit.forEach<List<Quest>>(
      _questsRepo.getQuests(),
      onData: (quests) => OverviewState(quests: quests),
    );
  }

  Future<void> _onOverviewQuestRenewed(
    OverviewQuestRenewed event,
    Emitter<OverviewState> emit,
  ) async {
    for (var quest in state.quests) {
      if (quest.nextResetDate.getDateDifference(DateTime.now()) <= 0) {
        await _questsRepo.saveQuest(quest.copyWith(
          isDone: false,
          nextResetDate:
              DateTime.now().getNextRepeatDate(DateTime.now(), quest.repeat),
        ));
      }
    }
  }

  Future<void> _onOverviewQuestCompleted(
    OverviewQuestCompleted event,
    Emitter<OverviewState> emit,
  ) async {
    await _questsRepo.saveQuest(event.quest.copyWith(
      isDone: true,
      //TODO: next reset date
      // nextResetDate: DateUtil.getNextRepeatDate(
      //     event.quest.nextResetDate, event.quest.repeat),
    ));
  }
}
