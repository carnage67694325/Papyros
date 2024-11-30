import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        const SizedBox(width: 15.5),
        Text(
          S.of(context).editProfile,
          style: AppStyles.header
              .copyWith(fontSize: 16.5, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: isArabic() ? 100 : 150,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightBrown, // Light brown background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            elevation: 4, // Remove shadow
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: Text(
            S.of(context).save,
            style: AppStyles.textfieldHint.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
