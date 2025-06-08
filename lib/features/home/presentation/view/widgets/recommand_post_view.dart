import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/home/presentation/view/manager/get_recomm_posts_cubit/get_recomm_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/full_post_view.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';
import 'package:papyros/features/home/presentation/view/widgets/shimmer_post_card.dart';

class RecommendedPostsView extends StatefulWidget {
  const RecommendedPostsView({super.key});

  @override
  State<RecommendedPostsView> createState() => _RecommendedPostsViewState();
}

class _RecommendedPostsViewState extends State<RecommendedPostsView> {
  late ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      log('Reached bottom of recommended posts');
      // Add pagination logic here if needed
    }
  }

  Future<void> _refreshRecommPosts() async {
    log('Refreshing recommended posts...');
    await context.read<GetRecommPostsCubit>().getRecommPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRecommPostsCubit, GetRecommPostsState>(
      listener: (context, state) {
        if (state is GetRecommPostsFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshRecommPosts,
          color: AppColors.lightPeach,
          backgroundColor: Colors.white,
          strokeWidth: 2.5,
          displacement: 40,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state is GetRecommPostsSuccess
                ? state.posts.length
                : state is GetRecommPostsLoading
                    ? 5
                    : 0,
            itemBuilder: (context, index) {
              if (state is GetRecommPostsLoading) {
                return const PostCardShimmer(hasImage: true);
              } else if (state is GetRecommPostsSuccess) {
                final post = state.posts[index];
                final heroTag = "recomm-post-${post.id}";
                return GestureDetector(
                  onTap: () {
                    openFullPostView(context, state, index, heroTag);
                  },
                  child: PostCard(
                    userId: post.createdBy.id ?? "user-id",
                    description: post.description,
                    userName: post.createdBy.userName ?? "user-name",
                    userProfileImageUrl: post.createdBy.profileImage ??
                        "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                    imageUrl: post.images.map((e) => e.image).toList(),
                    postId: post.id,
                    heroTag: heroTag,
                    likes: post.likes,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }

  void openFullPostView(BuildContext context, GetRecommPostsSuccess state,
      int index, String heroTag) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );

          final post = state.posts[index];

          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation),
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: FullPostView(
                userId: post.createdBy.id ?? "user-id",
                heroTag: heroTag,
                description: post.description,
                imageUrl: post.images.map((e) => e.image).toList(),
                userName: post.createdBy.userName ?? "user-name",
                userProfileImageUrl: post.createdBy.profileImage ??
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                createdAtString: post.createdAt,
                numberOfLikes: post.likes.length,
                numberOfComments: post.comments?.length ?? 0,
                tag: post.tag,
                postId: post.id,
                likes: post.likes,
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
