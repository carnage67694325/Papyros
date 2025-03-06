import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_check_box.dart';
import 'package:papyros/generated/l10n.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          const CustomCheckBox(),
          SizedBox(
            width: 4.w,
          ),
          Text(
            S.of(context).rememberMe,
            style: AppStyles.textfieldHint.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
