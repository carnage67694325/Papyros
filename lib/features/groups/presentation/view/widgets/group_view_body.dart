// Group View with Tabs
import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/presentation/model/group_mdel.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_tab_bar.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_tab_bar_view.dart';

class GroupViewBody extends StatefulWidget {
  final GroupModel group;

  const GroupViewBody({
    super.key,
    required this.group,
  });

  @override
  State<GroupViewBody> createState() => _GroupViewBodyState();
}

class _GroupViewBodyState extends State<GroupViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App Bar
            GroupViewAppbar(widget: widget),

            // Tab Bar
            GroupViewTabBar(tabController: _tabController),
          ];
        },
        body: GroupTabBarView(tabController: _tabController, widget: widget),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _openChatroom(context);
        },
        backgroundColor: AppColors.getPrimaryBlue(context),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  // void _openChatroom(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => GroupChatroom(group: widget.group),
  //     ),
  //   );
  // }
}

class GroupViewAppbar extends StatelessWidget {
  const GroupViewAppbar({
    super.key,
    required this.widget,
  });

  final GroupViewBody widget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.mediumBrown,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.group.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: AppColors.buildLinearGradient(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Text(
                  widget.group.name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.group.memberCount} members',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // _openChatroom(context);
          },
          icon: const Icon(Icons.chat_bubble_outline),
          tooltip: 'Group Chat',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}

// Posts Tab using your existing PostsTab structure

// Members Tab
