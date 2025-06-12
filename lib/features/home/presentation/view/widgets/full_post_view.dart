import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/domain/use_cases/add_comments_use_case.dart';

import 'package:papyros/features/home/presentation/view/manager/add_comment/add_comment_cubit.dart';

import 'package:papyros/features/home/presentation/view/widgets/full_view_body.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_app_bar.dart';

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
    this.postId,
    required this.likes,
    required this.comments,
    required this.userId,
  });

  final String userName;
  final String userProfileImageUrl;
  final String description;
  final List<String?>? imageUrl;
  final String createdAtString;
  final int numberOfLikes;
  final int numberOfComments;
  final String? postId;
  final String? heroTag;
  final String? tag;
  final List<dynamic> likes;
  final List<CommentModel> comments;
  final String userId;
  @override
  Widget build(BuildContext context) {
    final hasImage =
        imageUrl != null && imageUrl!.isNotEmpty && imageUrl![0] != null;
    final uniqueHeroTag = heroTag ?? 'full-post-image-${imageUrl?[0]}';

    return Scaffold(
      appBar: PostAppBar(
        onBackPressed: () => Navigator.of(context).pop(),
        onMorePressed: () {},
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AddCommentCubit(getIt.get<AddCommentUseCase>()))
        ],
        child: FullViewBody(
          userId: userId,
          userName: userName,
          userProfileImageUrl: userProfileImageUrl,
          createdAtString: createdAtString,
          tag: tag,
          description: description,
          hasImage: hasImage,
          imageUrl: imageUrl,
          uniqueHeroTag: uniqueHeroTag,
          numberOfLikes: numberOfLikes,
          numberOfComments: numberOfComments,
          postId: postId,
          likes: likes,
          comments: comments,
        ),
      ),
    );
  }
}
