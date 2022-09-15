part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState({
    required this.currentTime,
    // required this.task,
  });

  final int currentTime;
  // final Task task;

  @override
  List<Object> get props => [currentTime];
}

class TimerInitial extends TimerState {
  const TimerInitial({
    required super.currentTime,
    // required super.task,
  });
}

class TimerRunPause extends TimerState {
  const TimerRunPause({required super.currentTime});
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({required super.currentTime});
}
