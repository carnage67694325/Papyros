import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/chat_bot/domain/use_cases/chat_bot_send_prompt_UseCase.dart';
import 'package:papyros/features/chat_bot/presentation/manager/cubit/send_prompt_cubit.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_drawer.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_view_body.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SendPromptCubit(getIt.get<ChatBotSendPromptUseCase>()),
      child: const Scaffold(
        drawer: ChatBotDrawer(),
        body: ChatBotViewBody(),
      ),
    );
  }
}
