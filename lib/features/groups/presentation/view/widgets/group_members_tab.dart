import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';

class GroupMembersTab extends StatelessWidget {
  final SingleGroupModel group;

  const GroupMembersTab({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16.h,
          ),
        ),
        // Members List
        SliverList.builder(
          itemBuilder: (context, index) {
            return _buildMemberCard(context, index);
          },
          itemCount: 20, // Sample count
        ),
      ],
    );
  }

  Widget _buildMemberCard(BuildContext context, int index) {
    final isAdmin = index == 0;
    final isModerator = index < 3;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.getLightPeach(context),
              child: Text(
                'M${index + 1}',
                style: TextStyle(
                  color: AppColors.getDarkBrown(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isAdmin || isModerator)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isAdmin
                        ? AppColors.getPrimaryBlue(context)
                        : AppColors.getLightBrown(context),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isAdmin ? Icons.star : Icons.shield,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          'Member ${index + 1}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ThemeHelper.isDarkMode(context)
                ? Colors.white
                : AppColors.getDarkBrown(context),
          ),
        ),
        subtitle: Text(
          isAdmin ? 'Admin' : (isModerator ? 'Moderator' : 'Member'),
          style: TextStyle(
            color: isAdmin
                ? AppColors.getPrimaryBlue(context)
                : AppColors.getIconColor(context),
            fontSize: 12,
          ),
        ),
        trailing: PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: AppColors.getIconColor(context),
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'message',
              child: Text('Send Message'),
            ),
            const PopupMenuItem(
              value: 'profile',
              child: Text('View Profile'),
            ),
            if (!isAdmin)
              const PopupMenuItem(
                value: 'remove',
                child: Text('Remove from Group'),
              ),
          ],
        ),
      ),
    );
  }
}
