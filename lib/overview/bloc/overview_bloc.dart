import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_repo/quests_repo.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc({required QuestsRepo questsRepo})
      : _questsRepo = questsRepo,
        super(const OverviewState()) {
    on<OverviewSubscriptionRequested>(_onSubscriptionRequested);
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
}
