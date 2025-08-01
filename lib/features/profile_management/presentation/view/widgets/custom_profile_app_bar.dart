import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/new_user_data.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({
    super.key,
    required this.userProfileEntity,
  });
  final UserProfileEntity userProfileEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        SizedBox(width: 15.5.w),
        Text(
          S.of(context).editProfile,
          style: AppStyles.header
              .copyWith(fontSize: 16.5.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: isArabic() ? 100.w : 150.w,
        ),
        ElevatedButton(
          onPressed: () async {
            String? storedProfileImagePath =
                await PrefasHandelr.retrieveStoredUserProfileImagePath();
            String? storedBackgroundImagePath =
                await PrefasHandelr.retrieveStoredBackGroundProfileImagePath();

            await BlocProvider.of<UpdateUserCubit>(context).updateUserProfile(
              UserProfileEntity(
                  userName:
                      NewUserData.newUserName ?? userProfileEntity.userName,
                  firstName: userProfileEntity.firstName,
                  lastName: userProfileEntity.lastName,
                  email: userProfileEntity.email,
                  phone: userProfileEntity.phone,
                  bio: NewUserData.newUserBio ?? userProfileEntity.bio,
                  profileImage: storedProfileImagePath,
                  backgroundImage: storedBackgroundImagePath,
                  location:
                      NewUserData.newUserLocation ?? userProfileEntity.location,
                  dob: userProfileEntity.dob,
                  gender: userProfileEntity.gender),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightBrown, // Light brown background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            elevation: 4, // Remove shadow
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          ),
          child: Text(
            S.of(context).save,
            style: AppStyles.textfieldHint.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }
}
