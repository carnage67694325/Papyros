import 'package:flutter/material.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_members_tab.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_body.dart';
import 'package:papyros/features/groups/presentation/view/widgets/posts_tab.dart';

class GroupTabBarView extends StatelessWidget {
  const GroupTabBarView({
    super.key,
    required TabController tabController,
    required this.groupModel,
  }) : _tabController = tabController;

  final TabController _tabController;
  final SingleGroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        // Posts Tab
        GroupPostsTab(group: groupModel),
        // Members Tab
        GroupMembersTab(group: groupModel),
      ],
    );
  }
}
