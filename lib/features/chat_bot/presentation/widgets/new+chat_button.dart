import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/assets.dart';

class NewChatButton extends StatelessWidget {
  const NewChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightPeach,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {},
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsIconsChatBotNote),
            Text(
              ' New chat',
              style: AppStyles.textfieldHint.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
