import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interact_seaction.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.description,
    this.imageUrl,
    required this.userName,
    required this.userProfileImageUrl,
    required this.heroTag,
    required this.postId,
    required this.likes,
    required this.userId,
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;
  final String heroTag;
  final String postId;
  final List<dynamic> likes;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        imageUrl != null && imageUrl!.isNotEmpty && imageUrl![0] != null;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backGroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kProfileViewer, extra: userId);
                  },
                  child: UserProfileHomeAvatar(
                    userProfileImage: userProfileImageUrl,
                    height: 55.h,
                    width: 55.w,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        userName,
                        style: AppStyles.chatHeader.copyWith(fontSize: 16),
                      ),
                      if (!hasImage)
                        Padding(
                          padding: EdgeInsets.only(top: 6.0.h),
                          child: Text(
                            description,
                            style: AppStyles.postContent,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.more_horiz,
                          color: AppColors.iconColor),
                      onPressed: () {},
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ],
            ),
          ),

          /// Description above image
          if (hasImage)
            Padding(
              padding: EdgeInsets.only(left: 65.0.h, right: 32.h, top: 8.h),
              child: Text(
                description,
                style: AppStyles.postContent,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          /// Image with unique Hero
          if (hasImage)
            Padding(
              padding: EdgeInsets.only(
                  left: 65.0.h, right: 32.h, top: 8.h, bottom: 6.h),
              child: GestureDetector(
                onTap: () => showImageInFull(context),
                child: Hero(
                  tag: heroTag, // Unique tag
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl![0]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          PostInteractSection(
            postId: postId,
            likes: likes,
          ),
        ],
      ),
    );
  }

  Future<Object?> showImageInFull(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierLabel: "ImagePreview",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: heroTag, // Consistent tag
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl![0]!,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SelectionContainer.disabled(
                  child: Text(
                    description,
                    style: AppStyles.postContent.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
