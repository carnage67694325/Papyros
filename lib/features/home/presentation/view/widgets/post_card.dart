import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
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
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;

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
          /// Header Row: User Profile + Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                UserProfileHomeAvatar(
                  userProfileImage: userProfileImageUrl,
                  height: 55.h,
                  width: 55.w,
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
                          padding: const EdgeInsets.only(top: 6.0),
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

          /// Description above image if image exists
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

          /// Image
          if (hasImage)
            Padding(
              padding: EdgeInsets.only(
                  left: 65.0.h, right: 32.h, top: 8.h, bottom: 6.h),
              child: GestureDetector(
                onTap: () => showImageInFull(context),
                child: Hero(
                  tag: imageUrl!,
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

          /// Interact Section
          const PostInteractSection(),
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
                tag: imageUrl!,
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
              // Description container below the image
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  description,
                  style: AppStyles.postContent,
                  textAlign: TextAlign.center,
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
