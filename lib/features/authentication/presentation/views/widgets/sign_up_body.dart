import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_check_box.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/user_data_section.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(26),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                const UserDataSection(),
                const SizedBox(height: 45),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CustomCheckBox(),
                        Text(S.of(context).agreement),
                      ],
                    ),
                    Padding(
                      padding: isArabic()
                          ? const EdgeInsets.only(right: 30)
                          : const EdgeInsets.only(left: 50),
                      child: CustomTextButton(
                        onTap: () {},
                        buttonText: S.of(context).conditions,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomElevatedButton(
              onPressed: () {},
              buttonText: Text(
                S.of(context).register,
                style: AppStyles.header.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: CustomTextButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSignIn);
                },
                buttonText: S.of(context).haveAccount),
          ),
        ),
      ],
    );
  }
}
