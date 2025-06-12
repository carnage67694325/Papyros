import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/new_chat_button.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/user_name_profile_circle.dart';

class ChatBotDrawer extends StatelessWidget {
  const ChatBotDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: ThemeHelper.isDarkMode(context)
          ? AppColors.darkBackGroundColor
          : AppColors.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.only(left: 51),
            child: Text(
              'Pyroschat',
              style: AppStyles.chatHeader.copyWith(
                color: ThemeHelper.isDarkMode(context)
                    ? Colors.white
                    : Colors.black.withValues(alpha: .75),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 75.w),
            child: const NewChatButton(),
          ),
          SizedBox(height: 725.h),
          Padding(
            padding: EdgeInsets.only(left: 19.w),
            child: const UserNameAndProfileCircle(),
          )
        ],
      ),
    );
  }
}
