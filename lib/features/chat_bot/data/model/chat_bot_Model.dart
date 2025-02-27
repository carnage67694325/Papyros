class ChatBotModel {
  String? userInput;

  ChatBotModel({this.userInput});

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        userInput: json['user_input'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_input': userInput,
      };
}
