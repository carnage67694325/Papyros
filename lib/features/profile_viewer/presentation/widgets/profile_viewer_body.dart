import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/home/presentation/view/widgets/full_post_view.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';
import 'package:papyros/features/home/presentation/view/widgets/shimmer_post_card.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_name_n_bio.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_viewer_image.dart';

class ProfileViewerBody extends StatefulWidget {
  const ProfileViewerBody({super.key});

  @override
  State<ProfileViewerBody> createState() => _ProfileViewerBodyState();
}

class _ProfileViewerBodyState extends State<ProfileViewerBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      log('Reached the bottom of the list');
      // Implement pagination logic here if needed
    }
  }

  Future<void> _refreshProfile() async {
    log('Refreshing profile...');
    // Add your refresh logic here
    // await context.read<ProfileViewCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileViewCubit, ProfileViewState>(
        listener: (context, state) {
          if (state is ProfileViewFailure) {
            errorSnackBar(context, state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refreshProfile,
            color: AppColors.lightPeach,
            backgroundColor: Colors.white,
            strokeWidth: 2.5,
            displacement: 40,
            child: NestedScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SliverAppBar(
                    title: Text('Profile Viewer'),
                    floating: true,
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProfileViewerImage(),
                        SizedBox(height: 20.h),
                        const ProfileNameNBio(),
                        SizedBox(height: 10.h),
                        if (state is ProfileViewSuccess)
                          _buildFollowStats(state.userViewer.user),
                        SizedBox(height: 20.h),
                        _buildTabBar(),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  _buildPostsTab(state),
                  _buildRepliesTab(),
                  _buildLikesTab(),
                  _buildFollowTab(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFollowStats(User? user) {
    if (user == null) return const SizedBox();

    final followersCount = user.followers?.length ?? 0;
    final followingCount = user.following?.length ?? 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _buildStatItem(followingCount.toString(), "following"),
          SizedBox(width: 20.w),
          _buildStatItem(followersCount.toString(),
              "follower${followersCount != 1 ? 's' : ''}"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: " $label",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.blue,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
        tabs: const [
          Tab(text: "Posts"),
          Tab(text: "Replies"),
          Tab(text: "Likes"),
          Tab(text: "Follow"),
        ],
      ),
    );
  }

  Widget _buildPostsTab(ProfileViewState state) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Show shimmer when loading
        if (state is ProfileViewLoading)
          SliverList.builder(
            itemBuilder: (context, index) => const PostCardShimmer(
              hasImage: true,
            ),
            itemCount: 5,
          )
        // Show posts when data is loaded successfully
        else if (state is ProfileViewSuccess && state.userViewer.posts != null)
          SliverList.builder(
            itemBuilder: (context, index) {
              final post = state.userViewer.posts![index];
              final heroTag = "post-image-${post.id}";

              return GestureDetector(
                onTap: () {
                  _openFullPostView(context, state, index, heroTag);
                },
                child: PostCard(
                  description: post.description ?? "",
                  userName: state.userViewer.user?.userName ?? "user-name",
                  userProfileImageUrl: state.userViewer.user?.profileImage ??
                      "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                  imageUrl:
                      post.images?.map((e) => e.toString()).toList() ?? [],
                  postId: post.id ?? "",
                  heroTag: heroTag,
                  likes: post.likes ?? [],
                ),
              );
            },
            itemCount: state.userViewer.posts!.length,
          )
        // Show empty state when no posts
        else if (state is ProfileViewSuccess &&
            (state.userViewer.posts == null || state.userViewer.posts!.isEmpty))
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.post_add_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No posts yet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Posts will appear here when available',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          )
        // Show error state
        else if (state is ProfileViewFailure)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Failed to load profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
    );
  }

  Widget _buildRepliesTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.reply_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "Replies",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Replies will be shown here",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikesTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "Likes",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Liked posts will be shown here",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "Follow",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Follow information will be shown here",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
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
                heroTag: heroTag,
                description: post.description ?? "",
                imageUrl: post.images?.map((e) => e.toString()).toList() ?? [],
                userName: user?.userName ?? "user-name",
                userProfileImageUrl: user?.profileImage ??
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png",
                createdAtString: post.createdAt?.toIso8601String() ?? "",
                numberOfLikes: post.likes?.length ?? 0,
                numberOfComments:
                    0, // You might want to add comments to your Post model
                tag: post.tag ?? "",
                postId: post.id ?? "",
                likes: post.likes ?? [],
                comments: [], // You might want to add comments to your Post model
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
