import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';

class GroupsQuickAction extends StatelessWidget {
  const GroupsQuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            _buildQuickActionTile(
              context,
              icon: Icons.group,
              title: 'Your Groups',
              subtitle: 'Groups you\'ve joined',
              onTap: () {},
            ),
            _buildQuickActionTile(
              context,
              icon: Icons.explore,
              title: 'Discover',
              subtitle: 'Find groups that interest you',
              onTap: () {},
            ),
            _buildQuickActionTile(
              context,
              icon: Icons.people,
              title: 'Invites',
              subtitle: 'Group invitations',
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.getPrimaryBlue(context),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.getPrimaryBlue(context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ThemeHelper.isDarkMode(context)
                ? Colors.white.withValues()
                : AppColors.getDarkBrown(context),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppColors.getIconColor(context),
            fontSize: 12,
          ),
        ),
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.getIconColor(context),
            ),
      ),
    );
  }
}
