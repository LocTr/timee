part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState({
    required this.duration,
    // required this.task,
  });

  final int duration;
  // final Task task;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial({
    required super.duration,
    // required super.task,
  });
}

class TimerRunPause extends TimerState {
  const TimerRunPause({required super.duration});
}
