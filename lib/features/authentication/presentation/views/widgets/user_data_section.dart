import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/date_of_birth_textfield.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/email_password_section.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/header_section.dart';
import 'package:papyros/features/authentication/sign%20up/domain/entities/Sigup%20entity/sign_up_data_entity.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({super.key, required this.signUpDataEntity});
  final SignUpDataEntity signUpDataEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          headerText: S.of(context).gettingStarted,
          subHeaderText: S.of(context).createAccount,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                onChanged: (data) {
                  signUpDataEntity!.firstName = data;
                  signUpDataEntity!.userName = data;
                },
                hintText: S.of(context).firstName,
                hintStyle: AppStyles.textfieldHint,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextFormField(
                onChanged: (data) {
                  signUpDataEntity!.lastName = data;
                },
                hintText: S.of(context).lastName,
                hintStyle: AppStyles.textfieldHint,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        EmailPassWordSection(
          signUpDataEntity: signUpDataEntity,
        ),
        const SizedBox(height: 25),
        CustomTextFormField(
          obscureText: true,
          hintText: S.of(context).confirmPassword,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(
                    right: 16, left: 10, top: 16, bottom: 16)
                : const EdgeInsets.only(
                    left: 16, right: 10, top: 16, bottom: 16),
            child: SvgPicture.asset(
              AppIcons.assetsIconsLockPasswordicon,
              width: 20,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
          suffixIcon: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(right: 6, left: 16, top: 16, bottom: 16)
                : const EdgeInsets.only(
                    left: 6, right: 16, top: 16, bottom: 16),
            child: SvgPicture.asset(
              AppIcons.assetsIconsShowPasswordicon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 25),
        const DateOfBirthTextFormField(hintText: "YY/DD/MM"),
      ],
    );
  }
}
