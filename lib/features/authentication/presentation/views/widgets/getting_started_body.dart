import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/language_toggle.dart';
import 'package:papyros/generated/l10n.dart';

class GettingStartedBody extends StatelessWidget {
  const GettingStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.buildLinearGradient()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LanguageToggle(),
          SizedBox(
            height: 109.h,
          ),
          Text(
            S.of(context).logo,
            textAlign: TextAlign.center,
            style: AppStyles.logo,
          ),
          SizedBox(
            height: 445.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: CustomElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignIn);
              },
              backgroundColor: Colors.white,
              buttonText: Text(S.of(context).getStarted,
                  style: AppStyles.header.copyWith(
                    color: AppColors.darkBrown,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomTextButton(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSignUp);
            },
            buttonText: S.of(context).dontHaveAccount,
            fontColor: Colors.white,
          )
        ],
      ),
    );
  }
}
