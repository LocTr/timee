import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timee/deprecated/model/task.dart';
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

  TimerBloc({required Ticker ticker, required this.task})
      : _ticker = ticker,
        super(TimerInitial(currentTime: task.timeSpent)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerTicked>(_onTicked);
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
    emit(TimerRunInProgress(currentTime: event.initialTime));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick().listen((duration) {
      add(TimerTicked(time: duration + 1));
    });
  }

  void _onPaused(
    TimerPaused event,
    Emitter<TimerState> emit,
  ) {
    if (state is TimerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TimerRunPause(currentTime: state.currentTime));
    }
  }

  void _onResumed(
    TimerResumed event,
    Emitter<TimerState> emit,
  ) {
    if (state is TimerRunPause) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgress(currentTime: state.currentTime));
    }
  }

  void _onTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    emit(TimerRunInProgress(currentTime: event.time));
  }
}
