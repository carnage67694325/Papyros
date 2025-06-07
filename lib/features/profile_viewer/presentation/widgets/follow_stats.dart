import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user.dart';

class FollowStats extends StatelessWidget {
  final User? user;

  const FollowStats({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox();

    final followersCount = user!.followers?.length ?? 0;
    final followingCount = user!.following?.length ?? 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _StatItem(
            count: followingCount.toString(),
            label: "following",
          ),
          SizedBox(width: 20.w),
          _StatItem(
            count: followersCount.toString(),
            label: "follower${followersCount != 1 ? 's' : ''}",
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  ThemeHelper.isDarkMode(context) ? Colors.white : Colors.black,
            ),
          ),
          TextSpan(
            text: " $label",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
