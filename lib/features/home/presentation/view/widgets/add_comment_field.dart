// File: post/presentation/widgets/add_comment_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class AddCommentField extends StatelessWidget {
  final TextEditingController commentController;
  final void Function() onPressed;
  final bool isSubmitting; // Add isSubmitting parameter

  const AddCommentField({
    super.key,
    required this.commentController,
    required this.onPressed,
    this.isSubmitting = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccess) {
          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                UserProfileHomeAvatar(
                  userProfileImage: state.userProfileEntity.profileImage!,
                  height: 40.h,
                  width: 40.w,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                          color: ThemeHelper.isDarkMode(context)
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // Conditional widget based on isSubmitting state
                isSubmitting
                    ? SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: Center(
                          child: AppLoadingAnimation(size: 15.w),
                        ),
                      )
                    : IconButton(
                        icon:
                            const Icon(Icons.send, color: AppColors.lightBrown),
                        onPressed: onPressed,
                      ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
