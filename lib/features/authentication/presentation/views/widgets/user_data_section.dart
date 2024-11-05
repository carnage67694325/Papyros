import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/date_of_birth_textfield.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/email_password_section.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/gender_selection_text_field.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/header_section.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/Sigup%20entity/sign_up_data_entity.dart';
import 'package:papyros/generated/l10n.dart';

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
                  signUpDataEntity.firstNameEntity = data;
                },
                hintText: S.of(context).firstName,
                hintStyle: AppStyles.textfieldHint,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomTextFormField(
                onChanged: (data) {
                  signUpDataEntity.lastNameEntity = data;
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
        DateOfBirthTextFormField(
            onChanged: (data) {
              signUpDataEntity.dobEntity = data;
            },
            hintText: "YY/DD/MM"),
        const SizedBox(height: 25),
        GenderSelectionTextFormField(
            onChanged: (data) {
              signUpDataEntity.genderEntity = data;
            },
            hintText: "gender"),
      ],
    );
  }
}
