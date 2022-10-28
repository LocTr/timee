import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/enums.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/utils/dateUtil.dart';

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
      if (getDateDifference(quest.nextResetDate) <= 0) {
        final date = quest.nextResetDate;
        switch (quest.repeat) {
          case Repeat.daily:
            _questsRepo.saveQuest(quest.copyWith(
              isDone: false,
              nextResetDate: DateTime(date.year, date.month, date.day + 1),
            ));
            break;
          case Repeat.weekly:
            _questsRepo.saveQuest(quest.copyWith(
              isDone: false,
              nextResetDate: DateTime(date.year, date.month, date.day + 7),
            ));
            break;
          case Repeat.monthly:
            _questsRepo.saveQuest(quest.copyWith(
              isDone: false,
              nextResetDate: DateTime(date.year, date.month + 1, date.day),
            ));
            break;
          default:
        }
      }
    }
  }
}
