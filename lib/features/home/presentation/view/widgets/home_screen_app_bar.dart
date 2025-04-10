import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.backGroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 21.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 7.w,
                  ),
                  UserProfileHomeAvatar(
                      userProfileImage: state is GetUserProfileSuccess
                          ? state.userProfileEntity.profileImage!
                          : "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-color-icon.png"),
                  SizedBox(
                    width: 85.w,
                  ),
                  SvgPicture.asset(Assets.assetsPapyrus),
                ],
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        );
      },
    );
  }
}
