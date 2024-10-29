import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/email_password_section.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/header_section.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/remember_me_section.dart';
import 'package:papyros/generated/l10n.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                HeaderSection(
                    headerText: S.of(context).signIN,
                    subHeaderText: S.of(context).continueYourJourny),
                const SizedBox(
                  height: 54,
                ),
                const EmailPassWordSection(),
                const SizedBox(
                  height: 11,
                ),
                CustomTextButton(
                  onTap: () {},
                  buttonText: S.of(context).forgotPass,
                ),
                const SizedBox(
                  height: 25,
                ),
                const RememberMeSection(),
                const SizedBox(height: 47),
                CustomElevatedButton(
                  onPressed: () {},
                  buttonText: Text(
                    S.of(context).signIN,
                    style: AppStyles.header.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomTextButton(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUp);
                  },
                  buttonText: S.of(context).dontHaveAccount,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
