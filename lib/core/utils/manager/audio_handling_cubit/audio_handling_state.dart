part of 'audio_handling_cubit.dart';

@immutable
sealed class AudioHandlingState {}

final class AudioHandlingInitial extends AudioHandlingState {}

final class AudioHandlingLoading extends AudioHandlingState {}

final class AudioHandlingPlaying extends AudioHandlingState {}

final class AudioHandlingStopped extends AudioHandlingState {}

final class AudioHandlingFailure extends AudioHandlingState {
  final String errMessage;

  AudioHandlingFailure({required this.errMessage});
}
