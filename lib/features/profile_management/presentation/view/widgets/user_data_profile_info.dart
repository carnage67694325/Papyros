import 'package:flutter/material.dart';
import 'package:papyros/core/utils/new_user_data.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/gender_dropdown_menu.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_text_field.dart';
import 'package:papyros/generated/l10n.dart';

class UserProfileDataInfo extends StatelessWidget {
  const UserProfileDataInfo({
    super.key,
    required this.name,
    required this.bio,
    required this.location,
    required this.gender,
  });
  final String name;
  final String bio;
  final String location;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileTexField(
          onChanged: (data) {
            NewUserData().newUserName = data;
          },
          lableText: S.of(context).name,
          hintText: 'Your Name',
          initialValue: NewUserData().newUserName ?? name,
        ),
        UserProfileTexField(
          onChanged: (data) {
            NewUserData().newUserBio = data;
          },
          lableText: S.of(context).bio,
          hintText: 'Your Bio',
          initialValue: NewUserData().newUserBio ?? bio,
        ),
        UserProfileTexField(
          onChanged: (data) {
            NewUserData().newUserLocation = data;
          },
          lableText: S.of(context).location,
          hintText: 'Your Location',
          initialValue: NewUserData().newUserLocation ?? location,
        ),
        GenderDropdown(
          initialValue: gender,
        )
      ],
    );
  }
}
