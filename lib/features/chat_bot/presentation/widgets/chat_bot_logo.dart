import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';

class ChatBotLogo extends StatelessWidget {
  const ChatBotLogo({
    super.key,
    this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          Assets.assetsRoboIcon,
          height: height ?? 25,
        ));
  }
}
