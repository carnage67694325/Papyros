import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/generated/l10n.dart';

class EditProfileBirthDate extends StatelessWidget {
  const EditProfileBirthDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${S.of(context).birthDate} , ",
              style: AppStyles.textfieldHint
                  .copyWith(color: AppColors.darkBrown.withOpacity(0.70)),
            ),
            CustomTextButton(onTap: () {}, buttonText: S.of(context).edit),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'August 20, 2003',
          style: AppStyles.header
              .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
