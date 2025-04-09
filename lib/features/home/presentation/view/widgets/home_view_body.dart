import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_screen_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';
import 'package:papyros/features/home/presentation/view/widgets/shimmer_post_card.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
    // You can add more scroll-based functionalities here if needed
    // For example, infinite scrolling by checking if scrolled to bottom
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Load more data when reaching the bottom
      log('Reached the bottom of the list');
      // Implement pagination logic here if needed
    }
  }

  Future<void> _refreshPosts() async {
    log('Refreshing posts...');
    await context.read<GetAllPostsCubit>().getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllPostsCubit, GetAllPostsState>(
      listener: (context, state) {
        if (state is GetAllPostsFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshPosts,
          color: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          strokeWidth: 2.5,
          displacement: 40,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    HomeScreenAppBar(),
                    SizedBox(height: 14),
                  ],
                ),
              ),
              // Show shimmer when loading
              if (state is GetAllPostsLoading)
                SliverList.builder(
                  itemBuilder: (context, index) => const PostCardShimmer(
                    hasImage:
                        true, // Alternating with/without images for variety
                  ),
                  itemCount: 5, // Show a few shimmer cards while loading
                )
              // Show posts when data is loaded successfully
              else if (state is GetAllPostsSuccess)
                SliverList.builder(
                  itemBuilder: (context, index) => PostCard(
                    description: state.posts[index].description!,
                    userName:
                        state.posts[index].createdBy!.userName ?? "user-name",
                    userProfileImageUrl: state
                            .posts[index].createdBy!.profileImage ??
                        "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                    imageUrl:
                        state.posts[index].images?.map((e) => e.image).toList(),
                  ),
                  itemCount: state.posts.length,
                )
              // Show error state
              else if (state is GetAllPostsFailure)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline,
                              size: 48, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Failed to load posts',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pull down to try again',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              // Initial state
              else
                const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
            ],
          ),
        );
      },
    );
  }
}
