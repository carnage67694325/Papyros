import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';
import 'package:papyros/generated/l10n.dart';

class ChatbotGreetingState extends StatelessWidget {
  const ChatbotGreetingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 88.h),
        ChatBotLogo(
          height: 97.h,
        ),
        SizedBox(height: 25.h),
        Padding(
          padding: EdgeInsets.only(left: 22.w, right: 26.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text at the top
            children: [
              Text(
                "${S.of(context).hello},",
                style: AppStyles.chatHeader.copyWith(
                  color: AppColors.lightPeach,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(width: 8.w), // Adjust spacing between the two texts
              Flexible(
                child: Text(
                  S.of(context).chatBotGreetings,
                  softWrap: true, // Ensure text wraps if necessary
                  style: AppStyles.chatHeader.copyWith(
                      fontSize: 32.sp,
                      color: ThemeHelper.isDarkMode(context)
                          ? Colors.white
                          : Colors.black.withValues(
                              alpha: 0.75,
                            )),
                  overflow: TextOverflow
                      .visible, // Allow the text to go beyond if needed
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
