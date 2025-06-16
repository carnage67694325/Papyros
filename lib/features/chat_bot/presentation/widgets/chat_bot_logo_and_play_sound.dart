import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/manager/audio_handling_cubit/audio_handling_cubit.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';

class ChatBotLogoAndPlaySound extends StatelessWidget {
  const ChatBotLogoAndPlaySound({
    super.key,
    required this.audioUrl,
  });
  final String audioUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioHandlingCubit, AudioHandlingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            ChatBotLogo(
              height: 35.w,
            ),
            SizedBox(
              height: 4.h,
            ),
            IconButton(
                onPressed: () async {
                  if (state is AudioHandlingPlaying) {
                    await BlocProvider.of<AudioHandlingCubit>(context)
                        .stopSound();
                  } else {
                    await BlocProvider.of<AudioHandlingCubit>(context)
                        .playSound(audioUrl);
                  }
                },
                icon: state is AudioHandlingStopped ||
                        state is AudioHandlingInitial
                    ? const Icon(
                        Icons.play_circle,
                        color: AppColors.lightPeach,
                      )
                    : const Icon(
                        Icons.stop_circle,
                        color: AppColors.lightPeach,
                      ))
          ],
        );
      },
    );
  }
}
