import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 25.h),
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
            SizedBox(width: 12.w),
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
        SizedBox(height: 25.h),
        EmailPassWordSection(
          signUpEntity: signUpEntity,
        ),
        SizedBox(height: 25.h),
        DateOfBirthTextFormField(
            onChanged: (data) {
              signUpEntity.dobEntity = data;
            },
            hintText: "YY/DD/MM"),
        SizedBox(height: 25.h),
        GenderSelectionTextFormField(
            onChanged: (data) {
              signUpEntity.genderEntity = data;
            },
            hintText: "gender"),
      ],
    );
  }
}
