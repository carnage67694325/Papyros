import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';
import 'package:papyros/features/groups/presentation/model/group_mdel.dart';

class GroupPostsTab extends StatelessWidget {
  final SingleGroupModel group;

  const GroupPostsTab({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    // Simulate loading state for demo
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Create Post Section
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.getLightGreyBlue(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.getLightPeach(context),
                  child: Icon(
                    Icons.person,
                    color: AppColors.getDarkBrown(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.getTextfieldBackGroundColor(context),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Share something with the group...',
                      style: TextStyle(
                        color: AppColors.getIconColor(context),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_camera,
                    color: AppColors.getPrimaryBlue(context),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Posts List - Using sample data for demo
        SliverList.builder(
          itemBuilder: (context, index) {
            return _buildSamplePostCard(context, index);
          },
          itemCount: 5, // Sample count
        ),
      ],
    );
  }

  Widget _buildSamplePostCard(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.getLightPeach(context),
                child: Text(
                  'U${index + 1}',
                  style: TextStyle(
                    color: AppColors.getDarkBrown(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.getDarkBrown(context),
                      ),
                    ),
                    Text(
                      '2 hours ago',
                      style: TextStyle(
                        color: AppColors.getIconColor(context),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: AppColors.getIconColor(context),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'This is a sample post content for the group. It could contain text, images, or other media content.',
            style: TextStyle(
              color: AppColors.getDarkBrown(context),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(context, Icons.favorite_border, '12'),
              const SizedBox(width: 16),
              _buildActionButton(context, Icons.comment_outlined, '5'),
              const SizedBox(width: 16),
              _buildActionButton(context, Icons.share_outlined, 'Share'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.getIconColor(context),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.getIconColor(context),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
