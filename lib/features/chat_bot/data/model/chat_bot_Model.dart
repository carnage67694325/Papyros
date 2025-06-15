import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';

class ChatBotModel extends ChatBotEntity {
  final String? userInput;
  final String? text;
  final String? audio;

  ChatBotModel({
    this.userInput,
    this.text,
    this.audio,
  }) : super(userPrompt: userInput, botResponse: text, botAudio: audio);

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        text: json['text'] as String?,
        audio: json['audio'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': userInput,
        'text': text,
        'audio': audio,
      };
}
