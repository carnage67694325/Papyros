import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/new+chat_button.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/user_name_profile_circle.dart';

class ChatBotDrawer extends StatelessWidget {
  const ChatBotDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 51),
            child: Text(
              'Papchat',
              style: AppStyles.chatHeader,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 90),
            child: NewChatButton(),
          ),
          const SizedBox(height: 680),
          const Padding(
            padding: EdgeInsets.only(left: 19),
            child: UserNameAndProfileCircle(),
          )
        ],
      ),
    );
  }
}
