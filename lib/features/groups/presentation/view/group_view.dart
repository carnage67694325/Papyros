import 'package:flutter/material.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_body.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key, required this.group});
  final Group group;
  @override
  Widget build(BuildContext context) {
    return GroupViewBody(
      group: group,
    );
  }
}
