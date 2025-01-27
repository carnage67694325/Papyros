import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_app_bar.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/chat_bot_logo.dart';
import 'package:papyros/features/chat_bot/presentation/widgets/send_prompt_textfield.dart';
import 'package:papyros/generated/l10n.dart';

class ChatBotViewBody extends StatefulWidget {
  const ChatBotViewBody({super.key});

  @override
  State<ChatBotViewBody> createState() => _ChatBotViewBodyState();
}

class _ChatBotViewBodyState extends State<ChatBotViewBody> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 22, right: 26),
                child: ChatBotAppBar(),
              ),
              const SizedBox(height: 179),
              const ChatBotLogo(),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.only(left: 22, right: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text at the top
                  children: [
                    Text(
                      S.of(context).hello + ",",
                      style: AppStyles.chatHeader.copyWith(
                        color: AppColors.lightPeach,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Adjust spacing between the two texts
                    Flexible(
                      child: Text(
                        S.of(context).chatBotGreetings,
                        softWrap: true, // Ensure text wraps if necessary
                        style: AppStyles.chatHeader.copyWith(
                          fontSize: 32,
                        ),
                        overflow: TextOverflow
                            .visible, // Allow the text to go beyond if needed
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 290),
              SendPromptTextfield(
                  controller: TextEditingController(),
                  onSend: () {
                    successSnackBar(context, "Message sent successfully");
                  })
            ],
          ),
        )
      ],
    );
  }
}
