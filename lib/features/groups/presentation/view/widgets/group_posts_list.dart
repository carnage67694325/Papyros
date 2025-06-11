import 'package:flutter/material.dart';
import 'package:papyros/features/groups/data/models/single_group_model/fullgroup.dart';
import 'package:papyros/features/groups/data/models/single_group_model/post.dart';
import 'package:papyros/features/home/presentation/view/widgets/full_post_view.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/empty_state.dart';

class GroupPostsList extends StatelessWidget {
  final Fullgroup group;

  const GroupPostsList({
    super.key,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    final groupPostList = group.posts;
    if (groupPostList == null || groupPostList.isEmpty) {
      return const EmptyPostsState();
    }

    return SliverList.builder(
      itemCount: groupPostList.length,
      itemBuilder: (context, index) {
        final post = groupPostList[index];
        final heroTag = "group-post-image-${post.id}";

        return GestureDetector(
          onTap: () => _openFullPostView(context, post, heroTag),
          child: PostCard(
            userId: post.createdBy ?? "unknown-user-id",
            description: post.description ?? "",
            userName: group.createdBy?.userName ?? "group-creator",
            userProfileImageUrl: group.createdBy?.profileImage ??
                "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
            imageUrl: post.images?.map((e) => e.image ?? '').toList() ?? [],
            postId: post.id ?? "",
            heroTag: heroTag,
            likes: post.likes ?? [],
          ),
        );
      },
    );
  }

  void _openFullPostView(BuildContext context, Post post, String heroTag) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );

          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: FullPostView(
                userId: post.createdBy ?? "user-id",
                heroTag: heroTag,
                description: post.description ?? "",
                imageUrl: post.images?.map((e) => e.image ?? '').toList() ?? [],
                userName: group.createdBy?.userName ?? "group-creator",
                userProfileImageUrl: group.createdBy?.profileImage ??
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                createdAtString: post.createdAt?.toIso8601String() ?? "",
                numberOfLikes: post.likes?.length ?? 0,
                numberOfComments: post.comments?.length ?? 0,
                tag: post.tag ?? "",
                postId: post.id ?? "",
                likes: post.likes ?? [],
                comments: post.comments ?? [],
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }
}
