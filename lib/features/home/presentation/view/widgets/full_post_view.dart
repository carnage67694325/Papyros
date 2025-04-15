import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_divider.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_field.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_section.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_header.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_image.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interaction_with_stats.dart';

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
    required this.numberOfComments,
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;
  final String createdAtString;
  final int numberOfLikes;
  final int numberOfComments;

  final String? heroTag;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        imageUrl != null && imageUrl!.isNotEmpty && imageUrl![0] != null;
    final uniqueHeroTag = heroTag ?? 'full-post-image-${imageUrl?[0]}';

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PostAppBar(
        onBackPressed: () => Navigator.of(context).pop(),
        onMorePressed: () {},
      ),
      body: SingleChildScrollView(
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
            ),

            // Comments Section
            const CommentSection(),

            // Add comment
            AddCommentField(userProfileImageUrl: userProfileImageUrl),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
