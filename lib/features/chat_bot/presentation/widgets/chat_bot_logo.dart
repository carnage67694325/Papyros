import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';

class ChatBotLogo extends StatelessWidget {
  const ChatBotLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.assetsRobotCricle),
        Positioned(
            left: 24,
            right: 24,
            top: 24,
            bottom: 24,
            child: SvgPicture.asset(Assets.assetsRoboIcon))
      ],
    );
  }
}
