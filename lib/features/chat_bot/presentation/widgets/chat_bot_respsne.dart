import 'package:flutter/widgets.dart';
import 'package:papyros/core/utils/app_styles.dart';

class ChatBotResponse extends StatelessWidget {
  const ChatBotResponse({
    super.key,
    required this.response,
  });
  final String response;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
