import 'package:flutter/material.dart';
import 'package:papyros/features/home/presentation/view/widgets/full_post_view.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';
import 'package:papyros/features/home/presentation/view/widgets/shimmer_post_card.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/profile_view_cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/empty_state.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/error_state.dart';

class PostsTab extends StatelessWidget {
  final ProfileViewState state;

  const PostsTab({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        if (state is ProfileViewLoading)
          const LoadingState()
        else if (state is ProfileViewSuccess)
          _buildSuccessState(state as ProfileViewSuccess)
        else if (state is ProfileViewFailure)
          const ErrorState()
        else
          const SliverToBoxAdapter(child: SizedBox()),
      ],
    );
  }

  Widget _buildSuccessState(ProfileViewSuccess state) {
    final posts = state.userViewer.posts;
    if (posts == null || posts.isEmpty) {
      return const EmptyPostsState();
    }
    return PostsList(state: state);
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => const PostCardShimmer(hasImage: true),
      itemCount: 5,
    );
  }
}

class PostsList extends StatelessWidget {
  final ProfileViewSuccess state;

  const PostsList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        final post = state.userViewer.posts![index];
        final heroTag = "post-image-${post.id}";

        return GestureDetector(
          onTap: () => _openFullPostView(context, state, index, heroTag),
          child: PostCard(
            userId: state.userViewer.user?.id ?? "unknown-user-id",
            description: post.description ?? "",
            userName: state.userViewer.user?.userName ?? "user-name",
            userProfileImageUrl: state.userViewer.user?.profileImage ??
                "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
            imageUrl: post.images?.map((e) => e.image ?? '').toList() ?? [],
            postId: post.id ?? "",
            heroTag: heroTag,
            likes: post.likes ?? [],
          ),
        );
      },
      itemCount: state.userViewer.posts!.length,
    );
  }

  void _openFullPostView(BuildContext context, ProfileViewSuccess state,
      int index, String heroTag) {
    final post = state.userViewer.posts![index];
    final user = state.userViewer.user;

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
                userId: user?.id ?? "user-id",
                heroTag: heroTag,
                description: post.description ?? "",
                imageUrl: post.images?.map((e) => e.image ?? '').toList() ?? [],
                userName: user?.userName ?? "user-name",
                userProfileImageUrl: user?.profileImage ??
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                createdAtString: post.createdAt?.toIso8601String() ?? "",
                numberOfLikes: post.likes?.length ?? 0,
                numberOfComments: 0,
                tag: post.tag ?? "",
                postId: post.id ?? "",
                likes: post.likes ?? [],
                comments: [],
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
