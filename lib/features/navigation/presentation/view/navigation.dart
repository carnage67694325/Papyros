import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:papyros/features/groups/presentation/view/groups_view.dart';
import 'package:papyros/features/home/presentation/view/add_post_view.dart';
import 'package:papyros/features/home/presentation/view/home_view.dart';
import 'package:papyros/features/messaging/presentation/view/messaging_view.dart';
import 'package:papyros/features/search/presentation/view/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late PersistentTabController _controller;
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _screens() {
    return [
      const HomeView(),
      const GroupsView(),
      const AddPostView(),
      const SearchView(), // Index 3: hide navbar
      const MessagingView(),
      const ChatBotView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      buildNaviIcon(Icons.home),
      buildNaviIcon(Icons.group),
      buildNaviIcon(Icons.add_box_outlined),
      buildNaviIcon(Icons.search),
      buildNaviIcon(Icons.sms_outlined),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.assetsRoboNavIcon),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: ThemeHelper.isDarkMode(context)
          ? AppColors.darkBackGroundColor
          : AppColors.backGroundColor,
      context,
      controller: _controller,
      screens: _screens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style2,
      isVisible: isVisible,
      hideNavigationBarWhenKeyboardAppears: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      onItemSelected: (index) {
        if (index == 4) {
          GoRouter.of(context).push(AppRouter.kMessaging);
        }
        if (index == 2) {
          GoRouter.of(context).push(AppRouter.kAddPost);
        } else if (index == 5) {
          GoRouter.of(context).push(AppRouter.kChatBot);
        }
      },
      hideOnScrollSettings:
          const HideOnScrollSettings(hideNavBarOnScroll: true),
      animationSettings: const NavBarAnimationSettings(
        onNavBarHideAnimation: OnHideAnimationSettings(),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
    );
  }
}

PersistentBottomNavBarItem buildNaviIcon(IconData icon) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon, size: 30),
    activeColorPrimary: AppColors.lightPeach,
    inactiveColorPrimary: Colors.grey,
  );
}
