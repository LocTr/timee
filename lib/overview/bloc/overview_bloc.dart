import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/utils/date_util.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc({required QuestsRepo questsRepo})
      : _questsRepo = questsRepo,
        super(const OverviewState()) {
    on<OverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<OverviewQuestRenewed>(_onOverviewQuestRenewed);
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
      if (DateUtil.getDateDifference(quest.nextResetDate) <= 0) {
        _questsRepo.saveQuest(quest.copyWith(
          isDone: false,
          nextResetDate: DateUtil.getNextResetDate(quest.repeat),
        ));
      }
    }
  }
}
