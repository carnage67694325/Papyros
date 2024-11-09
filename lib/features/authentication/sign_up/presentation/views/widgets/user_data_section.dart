import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/header_section.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/widgets/date_of_birth_textfield.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/widgets/email_password_section.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/widgets/gender_selection_text_field.dart';
import 'package:papyros/generated/l10n.dart';

class UserDataSection extends StatelessWidget {
  const UserDataSection({super.key, required this.signUpEntity});
  final SignUpEntity signUpEntity;
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
                  signUpEntity.firstNameEntity = data;
                },
                hintText: S.of(context).firstName,
                hintStyle: AppStyles.textfieldHint,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextFormField(
                onChanged: (data) {
                  signUpEntity.lastNameEntity = data;
                },
                hintText: S.of(context).lastName,
                hintStyle: AppStyles.textfieldHint,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        EmailPassWordSection(
          signUpEntity: signUpEntity,
        ),
        const SizedBox(height: 25),
        DateOfBirthTextFormField(
            onChanged: (data) {
              signUpEntity.dobEntity = data;
            },
            hintText: "YY/DD/MM"),
        const SizedBox(height: 25),
        GenderSelectionTextFormField(
            onChanged: (data) {
              signUpEntity.genderEntity = data;
            },
            hintText: "gender"),
      ],
    );
  }
}
