import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timee/overview/models/task.dart';
import 'package:timee/utils/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final Task task;
  // TimerBloc() : super(TimerInitial(duration: 60)) {
  //   on<TimerEvent>((event, emit) {

  //   });
  // }

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker, required int duration, required this.task})
      : _ticker = ticker,
        super(TimerInitial(duration: duration)) {
    on<TimerEvent>((event, emit) {});
  }

  @override
  Future<void> close() {
    // close the stream subscription!
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    emit(TimerRunInProgress(duration: event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick().listen((duration) {
      add(TimerTicked(duration: duration));
    });
  }

  void _onPaused(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunInProgress(duration: event.duration));
    }
  }

  void _onResumed(
    TimerResumed event,
    Emitter<TimerState> emit,
  ) async {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(duration: state.duration));
    }
  }

  void _onTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) async {
    emit(TimerRunInProgress(duration: event.duration));
  }
}
