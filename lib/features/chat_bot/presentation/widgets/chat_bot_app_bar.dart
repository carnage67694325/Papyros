import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';

class ChatBotAppBar extends StatelessWidget {
  const ChatBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 28,
          ),
        ),
        Text(
          'Papchat',
          style: AppStyles.chatHeader,
        ),
        SvgPicture.asset(Assets.assetsIconsChatBotNote),
      ],
    );
  }
}
