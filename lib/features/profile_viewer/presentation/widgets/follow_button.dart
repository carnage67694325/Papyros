import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/follow_cubit/follow_cubit.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({
    super.key,
    required this.userId, // ID of the profile being viewed
    required this.followersList, // followers of that profile
  });

  final String userId;
  final List<dynamic> followersList;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    _checkIfFollowing();
  }

  Future<void> _checkIfFollowing() async {
    final String? currentUserId = await PrefasHandelr.getUserId();

    if (currentUserId == null) {
      log("User ID not found in prefs.");
      return;
    }

    setState(() {
      isFollowing = widget.followersList.contains(currentUserId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowCubit, FollowState>(
      listener: (context, state) {
        if (state is FollowFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
        if (state is FollowSuccess) {
          setState(() {
            isFollowing = !isFollowing; // Toggle follow status
          });
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(45.w, 45.h),
            backgroundColor:
                isFollowing ? AppColors.lightPeach : AppColors.backGroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: AppColors.lightPeach,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          onPressed: () async {
            await BlocProvider.of<FollowCubit>(context).follow(widget.userId);
          },
          child: state is FollowLoading
              ? const AppLoadingAnimation()
              : Text(
                  isFollowing ? 'Unfollow' : 'Follow',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color:
                        isFollowing ? AppColors.backGroundColor : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        );
      },
    );
  }
}
