import 'package:papyros/features/chat_bot/domain/entites/chat_bot_entity.dart';

class ChatBotModel extends ChatBotEntity {
  String? userInput;

  ChatBotModel({this.userInput}) : super(userPrompt: userInput);

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        userInput: json['user_input'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_input': userInput,
      };
}
