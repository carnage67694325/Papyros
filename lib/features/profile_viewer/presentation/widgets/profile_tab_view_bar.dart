import 'package:flutter/material.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/profile_view_cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/post_list.dart';
import 'empty_tab.dart';

class ProfileTabView extends StatelessWidget {
  final TabController tabController;
  final ProfileViewState state;

  const ProfileTabView({
    super.key,
    required this.tabController,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        PostsTab(state: state),
        const EmptyTab(
          icon: Icons.reply_outlined,
          title: "Replies",
          subtitle: "Replies will be shown here",
        ),
        const EmptyTab(
          icon: Icons.favorite_outline,
          title: "Likes",
          subtitle: "Liked posts will be shown here",
        ),
        const EmptyTab(
          icon: Icons.people_outline,
          title: "Follow",
          subtitle: "Follow information will be shown here",
        ),
      ],
    );
  }
}
