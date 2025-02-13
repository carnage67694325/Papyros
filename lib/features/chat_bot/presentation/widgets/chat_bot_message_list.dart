import 'package:flutter/cupertino.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bubble.dart';

class ChatbotMessagesList extends StatelessWidget {
  const ChatbotMessagesList({
    super.key,
    required this.messages,
  });

  final List<ChatBubble> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return messages[index];
      },
    );
  }
}
