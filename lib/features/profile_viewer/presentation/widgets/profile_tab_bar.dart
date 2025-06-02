import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class ProfileTabBar extends StatelessWidget {
  final TabController tabController;

  const ProfileTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.lightPeach,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
        tabs: const [
          Tab(text: "Posts"),
          Tab(text: "Replies"),
          Tab(text: "Likes"),
          Tab(text: "Follow"),
        ],
      ),
    );
  }
}
