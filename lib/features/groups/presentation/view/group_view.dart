import 'package:flutter/material.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_body.dart';

import '../model/group_mdel.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupViewBody(
      group: GroupModel(
          name: 'hama',
          memberCount: 5,
          hasNewPosts: true,
          mutualFriends: 5,
          newPostsCount: 5),
    );
  }
}
