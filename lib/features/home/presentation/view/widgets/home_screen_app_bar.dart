import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              const UserProfileHomeAvatar(
                  userProfileImage:
                      "https://images.immediate.co.uk/production/volatile/sites/3/2017/12/yoda-the-empire-strikes-back-28a7558.jpg?quality=90&webp=true&resize=800,534"),
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
  }
}
