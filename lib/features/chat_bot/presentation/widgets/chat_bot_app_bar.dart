import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/theme_helper.dart';

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
          'Pyroschat',
          style: AppStyles.chatHeader.copyWith(
            color: ThemeHelper.isDarkMode(context)
                ? Colors.white
                : Colors.black.withValues(
                    alpha: 0.75,
                  ),
          ),
        ),
        SvgPicture.asset(Assets.assetsIconsChatBotNote,
            colorFilter: ColorFilter.mode(
              ThemeHelper.isDarkMode(context) ? Colors.white : Colors.black,
              BlendMode.srcIn,
            )),
      ],
    );
  }
}
