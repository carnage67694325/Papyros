import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:papyros/features/home/presentation/view/add_post_view.dart';
import 'package:papyros/features/home/presentation/view/home_view.dart';
import 'package:papyros/features/notifications/presentation/view/notifications_view.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/notifications_view_body.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late PersistentTabController _controller;
  bool isVisable = true;

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
      const NotificationsView(),
      const AddPostView(),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.black,
      ),
      const ChatBotView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      buildNaviIcon(Icons.home),
      buildNaviIcon(Icons.notifications_none),
      buildNaviIcon(Icons.add_box_outlined),
      buildNaviIcon(Icons.search),
      buildNaviIcon(Icons.sms_outlined),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(Assets.assetsRoboNavIcon)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final int preIndex = _controller.index;
    return PersistentTabView(
      context,
      controller: _controller,
      isVisible: isVisable,
      screens: _screens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style2,
      hideNavigationBarWhenKeyboardAppears: true,
      onItemSelected: (index) {
        if (index == 5) {
          GoRouter.of(context).push(AppRouter.kChatBot);
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              _controller.index -= 1;
            });
          });
        }
        if (index == 2) {
          GoRouter.of(context).push(AppRouter.kAddPost);
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              _controller.index -= 1;
            });
          });
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
          )),
    );
  }
}

PersistentBottomNavBarItem buildNaviIcon(IconData icon) {
  return PersistentBottomNavBarItem(
    icon: Icon(
      icon,
      size: 30,
    ),
    activeColorPrimary: AppColors.lightPeach,
    inactiveColorPrimary: Colors.grey,
  );
}
