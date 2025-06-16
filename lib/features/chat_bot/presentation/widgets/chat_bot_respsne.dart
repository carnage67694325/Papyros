import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo_and_play_sound.dart';

class ChatBotResponse extends StatefulWidget {
  const ChatBotResponse({
    super.key,
    required this.response,
    required this.scrollController,
    required this.audioRespone,
  });

  final String response;
  final String audioRespone;

  final ScrollController scrollController;

  @override
  State<ChatBotResponse> createState() => _ChatBotResponseState();
}

class _ChatBotResponseState extends State<ChatBotResponse> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opacity = 1.0; // Trigger fade animation
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).h,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        opacity: opacity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  widget.response..replaceAll(RegExp(r'[*]+'), '').trim(),
                  style: AppStyles.chatHeader.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1.0,
                      color: ThemeHelper.isDarkMode(context)
                          ? Colors.white
                          : Colors.black.withValues(
                              alpha: 0.75,
                            )),
                  softWrap: true,
                ),
              ),
              const Spacer(),
              ChatBotLogoAndPlaySound(
                audioUrl: widget.audioRespone,
              ),
              SizedBox(
                width: 4.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
