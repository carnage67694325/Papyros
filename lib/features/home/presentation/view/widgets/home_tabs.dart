import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_screen_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:papyros/features/home/presentation/view/widgets/recommand_post_view.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Trigger recommended posts fetch when the user lands on "Following" tab
    _tabController.addListener(() {
      if (_tabController.index == 1 && !_tabController.indexIsChanging) {
        // context.read<GetRecommPostsCubit>().getRecommPosts();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        const HomeScreenAppBar(),
        SizedBox(height: 2.h),
        TabBar(
          controller: _tabController,
          labelColor:
              ThemeHelper.isDarkMode(context) ? Colors.white : Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.lightPeach,
          tabs: const [
            Tab(text: 'Mainline'),
            Tab(text: 'Following'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              HomeViewBody(),
              RecommendedPostsView(), // You’ll define this next
            ],
          ),
        ),
      ],
    );
  }
}
