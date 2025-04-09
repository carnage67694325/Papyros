import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interact_seaction.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interaction_with_stats.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class FullPostView extends StatelessWidget {
  const FullPostView({
    super.key,
    required this.description,
    this.imageUrl,
    required this.userName,
    required this.userProfileImageUrl,
    required this.createdAtString,
    required this.numberOfLikes,
    this.heroTag,
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;
  final String createdAtString;
  final int numberOfLikes;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        imageUrl != null && imageUrl!.isNotEmpty && imageUrl![0] != null;

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.iconColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  UserProfileHomeAvatar(
                    userProfileImage: userProfileImageUrl,
                    height: 60.h,
                    width: 60.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: AppStyles.chatHeader.copyWith(fontSize: 18),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          timeAgo(createdAtString),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content divider
            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              height: 30.h,
            ),

            // Full description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SelectionContainer.disabled(
                child: Text(
                  description,
                  style: AppStyles.postContent.copyWith(
                    fontSize: 16.sp,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            // Image if exists
            if (hasImage)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: GestureDetector(
                  onTap: () => showImageInFull(context),
                  child: Hero(
                    tag: heroTag ?? 'fullPost-${imageUrl!}',
                    child: Container(
                      height: 300.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(imageUrl![0]!),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            // Divider before interaction section
            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              height: 30.h,
            ),

            // Interaction section
            PostInteractSectionWithStats(numberOfLikes: numberOfLikes),

            // Comments section header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Comments',
                    style: AppStyles.chatHeader.copyWith(fontSize: 18),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.backGroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Sample comments (you would replace this with actual comments)
            _buildCommentItem(
              userName: 'User One',
              comment:
                  'This is really interesting! I didn\'t know that about Cleopatra.',
              timeAgo: '1h ago',
              avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
            ),
            _buildCommentItem(
              userName: 'User Two',
              comment:
                  'Great post! Would love to see more historical facts like this.',
              timeAgo: '30m ago',
              avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
            ),

            // Add comment section
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  UserProfileHomeAvatar(
                    userProfileImage: userProfileImageUrl,
                    height: 40.h,
                    width: 40.w,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    icon: const Icon(Icons.send,
                        color: AppColors.backGroundColor),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentItem({
    required String userName,
    required String comment,
    required String timeAgo,
    required String avatarUrl,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: CachedNetworkImageProvider(avatarUrl),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                SelectionContainer.disabled(
                  child: Text(
                    comment,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.favorite_border,
                        size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      'Like',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.reply, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      'Reply',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> showImageInFull(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierLabel: "FullImagePreview",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.9),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Hero(
              tag: heroTag ?? 'fullPost-${imageUrl!}',
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 3.0,
                child: CachedNetworkImage(
                  imageUrl: imageUrl![0]!,
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }
}

String timeAgo(String createdAtString) {
  // Parse the ISO 8601 date string
  DateTime createdAt = DateTime.parse(createdAtString);
  DateTime now = DateTime.now();

  // Calculate the difference
  Duration difference = now.difference(createdAt);

  // Convert to appropriate time unit
  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} ${difference.inSeconds == 1 ? 'second' : 'seconds'} ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  }
}
