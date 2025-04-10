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
    this.tag,
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;
  final String createdAtString;
  final int numberOfLikes;
  final String? heroTag;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        imageUrl != null && imageUrl!.isNotEmpty && imageUrl![0] != null;
    final uniqueHeroTag = heroTag ?? 'full-post-image-${imageUrl?[0]}';

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: buildPostFullViewAppBar(context),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
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
                  if (tag != null)
                    Container(
                      height: 25.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightPeach,
                      ),
                      child: Center(
                        child: Text(
                          tag!,
                          style: TextStyle(
                            color: AppColors.backGroundColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              height: 30.h,
            ),

            // Description
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

            // Image
            if (hasImage)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: GestureDetector(
                  onTap: () => showImageInFull(context, uniqueHeroTag),
                  child: Hero(
                    tag: uniqueHeroTag,
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

            Divider(
              color: Colors.grey.withOpacity(0.2),
              thickness: 1,
              height: 30.h,
            ),

            // Interaction
            PostInteractSectionWithStats(numberOfLikes: numberOfLikes),

            // Comments Header
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

            // Example comments
            _buildCommentItem(
              userName: 'User One',
              comment: 'Really interesting post!',
              timeAgo: '1h ago',
              avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
            ),
            _buildCommentItem(
              userName: 'User Two',
              comment: 'Nice info!',
              timeAgo: '30m ago',
              avatarUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
            ),

            // Add comment
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

  AppBar buildPostFullViewAppBar(BuildContext context) {
    return AppBar(
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
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.favorite_border,
                        size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text('Like',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                    SizedBox(width: 16.w),
                    Icon(Icons.reply, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text('Reply',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> showImageInFull(BuildContext context, String heroTag) {
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
              tag: heroTag,
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
        return FadeTransition(opacity: anim, child: child);
      },
    );
  }
}

String timeAgo(String createdAtString) {
  DateTime createdAt = DateTime.parse(createdAtString);
  Duration diff = DateTime.now().difference(createdAt);

  if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (diff.inDays < 30) return '${diff.inDays}d ago';

  int months = (diff.inDays / 30).floor();
  if (months < 12) return '$months mo ago';

  return '${(diff.inDays / 365).floor()}y ago';
}
