import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_divider.dart';
import 'package:papyros/features/comments/data/models/Addcommentmodel.dart';
import 'package:papyros/features/home/presentation/view/widgets/add_comment_field.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_section.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_header.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_image.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interaction_with_stats.dart';

class FullViewBody extends StatelessWidget {
  const FullViewBody({
    super.key,
    required this.userName,
    required this.userProfileImageUrl,
    required this.createdAtString,
    required this.tag,
    required this.description,
    required this.hasImage,
    required this.imageUrl,
    required this.uniqueHeroTag,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.postId,
    required this.likes,
    required this.comments,
  });

  final String userName;
  final String userProfileImageUrl;
  final String createdAtString;
  final String? tag;
  final String description;
  final bool hasImage;
  final List<String?>? imageUrl;
  final String uniqueHeroTag;
  final int numberOfLikes;
  final int numberOfComments;
  final String? postId;
  final List<String> likes;
  final List<CommentModel> comments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PostHeader(
              userName: userName,
              userProfileImageUrl: userProfileImageUrl,
              createdAtString: createdAtString,
              tag: tag,
            ),
          ),
          const CustomDivider(),

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
              child: PostImage(
                imageUrl: imageUrl![0]!,
                heroTag: uniqueHeroTag,
              ),
            ),

          const CustomDivider(),

          // Interaction
          PostInteractSectionWithStats(
            numberOfLikes: numberOfLikes,
            numberOfComments: numberOfComments,
            postId: postId!,
            likes: likes,
          ),

          // Comments Section
          CommentSection(
            comments: comments,
          ),

          // Add comment
          AddCommentField(userProfileImageUrl: userProfileImageUrl),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
