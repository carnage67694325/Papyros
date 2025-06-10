import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/groups/presentation/model/group_mdel.dart';

class GroupsList extends StatefulWidget {
  const GroupsList({super.key});

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildGroupCard(context, _sampleGroups[index]);
        },
        childCount: _sampleGroups.length,
      ),
    );
  }

  Widget _buildGroupCard(BuildContext context, GroupModel group) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.getLightPeach(context),
          child: Text(
            group.name[0].toUpperCase(),
            style: TextStyle(
              color: AppColors.getDarkBrown(context),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        title: Text(
          group.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ThemeHelper.isDarkMode(context)
                ? Colors.white
                : AppColors.getDarkBrown(context),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${group.memberCount} members',
              style: TextStyle(
                color: AppColors.getIconColor(context),
                fontSize: 12.sp,
              ),
            ),
            if (group.hasNewPosts)
              Text(
                '${group.newPostsCount} new posts',
                style: TextStyle(
                  color: AppColors.getPrimaryBlue(context),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        trailing: Icon(
          Icons.more_vert,
          color: AppColors.getIconColor(context),
        ),
        onTap: () {
          GoRouter.of(context).push(AppRouter.kGroupView);
        },
      ),
    );
  }

  final List<GroupModel> _sampleGroups = [
    GroupModel(
      name: 'Flutter Developers',
      memberCount: 12500,
      hasNewPosts: true,
      newPostsCount: 5,
    ),
    GroupModel(
      name: 'Photography Enthusiasts',
      memberCount: 8900,
      hasNewPosts: true,
      newPostsCount: 2,
    ),
    GroupModel(
      name: 'Book Club',
      memberCount: 1200,
      hasNewPosts: false,
    ),
    GroupModel(
      name: 'Cooking Recipes',
      memberCount: 15600,
      hasNewPosts: true,
      newPostsCount: 8,
    ),
  ];
}
