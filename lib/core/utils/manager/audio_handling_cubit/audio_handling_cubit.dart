import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/utils/functions/audio_handler.dart';

part 'audio_handling_state.dart';

class AudioHandlingCubit extends Cubit<AudioHandlingState> {
  AudioHandlingCubit() : super(AudioHandlingInitial());

  Future<void> playSound(String url) async {
    emit(AudioHandlingLoading());

    final result = await AudioHandler.playChatBotResponse(url);
    result.fold(
      (failure) => emit(AudioHandlingFailure(errMessage: failure.errMessage)),
      (_) => emit(AudioHandlingSuccess()),
    );
  }

  Future<void> stopSound(String url) async {
    emit(AudioHandlingLoading());

    final result = await AudioHandler.stopChatBotResponse();
    result.fold(
      (failure) => emit(AudioHandlingFailure(errMessage: failure.errMessage)),
      (_) => emit(AudioHandlingSuccess()),
    );
  }
}
