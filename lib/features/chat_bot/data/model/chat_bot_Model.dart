import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';

class ChatBotModel extends ChatBotEntity {
  final String? userInput;
  final String? response;

  ChatBotModel({this.userInput, this.response})
      : super(userPrompt: userInput, botResponse: response);

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        userInput: json['user_input'] as String?,
        response: json['response'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_input': userInput,
        'response': response,
      };
}
