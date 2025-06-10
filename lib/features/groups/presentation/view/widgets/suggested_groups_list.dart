import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/groups/presentation/model/group_mdel.dart';

class SuggestedGroupsList extends StatelessWidget {
  const SuggestedGroupsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildSuggestedGroupCard(context, _suggestedGroups[index]);
        },
        childCount: _suggestedGroups.length,
      ),
    );
  }

  Widget _buildSuggestedGroupCard(BuildContext context, GroupModel group) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12).r,
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.getLightBrown(context),
              child: Text(
                group.name[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ThemeHelper.isDarkMode(context)
                          ? Colors.white
                          : AppColors.getDarkBrown(context),
                    ),
                  ),
                  Text(
                    '${group.memberCount} members',
                    style: TextStyle(
                      color: AppColors.getIconColor(context),
                      fontSize: 12.sp,
                    ),
                  ),
                  if (group.mutualFriends > 0)
                    Text(
                      '${group.mutualFriends} friends are members',
                      style: TextStyle(
                        color: AppColors.getPrimaryBlue(context),
                        fontSize: 12.sp,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.getPrimaryBlue(context),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Join',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<GroupModel> _suggestedGroups = [
  GroupModel(
    name: 'UI/UX Designers',
    memberCount: 9800,
    mutualFriends: 12,
  ),
  GroupModel(
    name: 'Travel Adventures',
    memberCount: 7500,
    mutualFriends: 8,
  ),
  GroupModel(
    name: 'Tech Startups',
    memberCount: 5600,
    mutualFriends: 15,
  ),
  GroupModel(
    name: 'Fitness Motivation',
    memberCount: 11200,
    mutualFriends: 6,
  ),
];
