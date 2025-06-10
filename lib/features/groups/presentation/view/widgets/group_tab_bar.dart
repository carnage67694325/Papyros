import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';

class GroupViewTabBar extends StatelessWidget {
  const GroupViewTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        TabBar(
          controller: _tabController,
          labelColor:
              ThemeHelper.isDarkMode(context) ? Colors.white : Colors.black,
          unselectedLabelColor: AppColors.getIconColor(context),
          indicatorColor: AppColors.lightPeach,
          tabs: const [
            Tab(text: 'Posts'),
            Tab(text: 'Members'),
          ],
        ),
      ),
      pinned: true,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // or any color you want
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
