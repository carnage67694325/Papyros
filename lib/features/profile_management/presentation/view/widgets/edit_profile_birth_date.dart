import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/generated/l10n.dart';

class EditProfileBirthDate extends StatelessWidget {
  const EditProfileBirthDate({
    super.key,
    required this.date,
  });
  final String date;
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
        SizedBox(
          height: 5.h,
        ),
        Text(
          date.substring(0, 10),
          style: AppStyles.header
              .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
