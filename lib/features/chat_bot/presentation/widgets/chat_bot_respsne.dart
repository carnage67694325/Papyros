import 'package:flutter/widgets.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';

class ChatBotResponse extends StatelessWidget {
  const ChatBotResponse({
    super.key,
    required this.response,
  });
  final String response;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Text(
              response,
              style: AppStyles.chatHeader.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                wordSpacing: 1.0,
              ),
              softWrap: true,
            ),
          ),
          ChatBotLogo(
            height: 35,
          )
        ],
      ),
    );
  }
}
