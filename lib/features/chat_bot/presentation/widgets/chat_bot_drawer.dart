import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
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
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.only(left: 51),
            child: Text(
              'Papchat',
              style: AppStyles.chatHeader,
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 90.w),
            child: const NewChatButton(),
          ),
          SizedBox(height: 680.h),
          Padding(
            padding: EdgeInsets.only(left: 19.w),
            child: const UserNameAndProfileCircle(),
          )
        ],
      ),
    );
  }
}
