import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart'; // adjust to your actual path

abstract class AudioHandler {
  static final AudioPlayer _player = AudioPlayer();
  static bool _isPlaying = false;

  static Future<Either<Failure, void>> playChatBotResponse(String url) async {
    if (_isPlaying) {
      log('Audio already playing');
      return Left(ServerFailure('Audio is already playing'));
    }

    try {
      await _player.play(UrlSource(url));
      log("Playing chatbot response");
      _isPlaying = true;

      _player.onPlayerComplete.listen((_) {
        _isPlaying = false;
        log("Audio playback completed");
      });

      return const Right(null);
    } catch (e, stack) {
      log("Error playing audio: $e", stackTrace: stack);
      return Left(ServerFailure('Failed to play audio: $e'));
    }
  }

  static Future<Either<Failure, void>> stopChatBotResponse() async {
    if (!_isPlaying) {
      log('No audio to stop');
      return Left(ServerFailure('No audio is playing'));
    }

    try {
      await _player.stop();
      log("Stopped chatbot response");
      _isPlaying = false;
      return const Right(null);
    } catch (e, stack) {
      log("Error stopping audio: $e", stackTrace: stack);
      return Left(ServerFailure('Failed to stop audio: $e'));
    }
  }
}
