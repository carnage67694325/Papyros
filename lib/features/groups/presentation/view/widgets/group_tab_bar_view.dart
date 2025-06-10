import 'package:flutter/material.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_members_tab.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_body.dart';
import 'package:papyros/features/groups/presentation/view/widgets/posts_tab.dart';

class GroupTabBarView extends StatelessWidget {
  const GroupTabBarView({
    super.key,
    required TabController tabController,
    required this.widget,
  }) : _tabController = tabController;

  final TabController _tabController;
  final GroupViewBody widget;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        // Posts Tab
        GroupPostsTab(group: widget.group),
        // Members Tab
        GroupMembersTab(group: widget.group),
      ],
    );
  }
}
