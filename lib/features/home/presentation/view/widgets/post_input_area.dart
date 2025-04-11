import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class PostInputArea extends StatelessWidget {
  final TextEditingController postController;
  final GetUserProfileState profileState;

  const PostInputArea({
    super.key,
    required this.postController,
    required this.profileState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileState is GetUserProfileSuccess
            ? UserProfileHomeAvatar(
                userProfileImage: (profileState as GetUserProfileSuccess)
                    .userProfileEntity
                    .profileImage!,
                height: 65.h,
                width: 65.w,
              )
            : CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.grey[300],
              ),
        SizedBox(width: 12.w),
        Expanded(
          child: TextField(
            controller: postController,
            decoration: InputDecoration(
              hintText: 'What is happening?!',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 16.sp),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ),
      ],
    );
  }
}
