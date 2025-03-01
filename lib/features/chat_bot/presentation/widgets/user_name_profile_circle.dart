import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';

class UserNameAndProfileCircle extends StatelessWidget {
  const UserNameAndProfileCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsPoflieCricle),
        const SizedBox(width: 10),
        Text(
          'User Name',
          style: AppStyles.chatHeader
              .copyWith(fontSize: 15, color: Colors.black),
        ),
        const SizedBox(
          height: 19,
        )
      ],
    );
  }
}
