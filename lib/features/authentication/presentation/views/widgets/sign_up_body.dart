import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_divider.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/user_data_section.dart';
import 'package:papyros/generated/l10n.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UserDataSection(),
          const SizedBox(height: 45),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Text(S.of(context).agreement),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    S.of(context).conditions,
                    style: AppStyles.subHeader
                        .copyWith(color: AppColors.lightBrown, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            onPressed: () {},
            buttonText: Text(
              S.of(context).register,
              style: AppStyles.header.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                // Add navigation to login page
              },
              child: Text(
                S.of(context).haveAccount,
                style: AppStyles.subHeader.copyWith(
                  color: AppColors.lightBrown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
