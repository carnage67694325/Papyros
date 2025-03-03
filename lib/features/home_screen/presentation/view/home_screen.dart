import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/features/authentication/presentation/views/getting_started_view.dart';
import 'package:papyros/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      const GettingStartedView(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
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
              _controller.index = index - 1;
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
