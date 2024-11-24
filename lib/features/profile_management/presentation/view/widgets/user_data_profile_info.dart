import 'package:flutter/material.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/gender_dropdown_menu.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_text_form_field.dart';
import 'package:papyros/generated/l10n.dart';

class UserProfileDataInfo extends StatelessWidget {
  const UserProfileDataInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileTextFormField(
            onSubmitted: (data) {},
            lableText: S.of(context).name,
            hintText: 'Your Name'),
        UserProfileTextFormField(
            onSubmitted: (data) {},
            lableText: S.of(context).bio,
            hintText: 'Your Bio'),
        UserProfileTextFormField(
            onSubmitted: (data) {},
            lableText: S.of(context).location,
            hintText: 'Your Location'),
        const GenderDropdown()
      ],
    );
  }
}
