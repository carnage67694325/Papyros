import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/authentication/sign_in/presentation/views/sign_in_view.dart';
import 'package:papyros/features/chat_bot/presentation/view/chat_bot_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

PersistentTabController _controller = PersistentTabController(initialIndex: 0);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      context,
      screens: [
        Container(
          color: Colors.red,
        ),
        const ChatBotView(),
      ],
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.home,
              color: AppColors.lightPeach,
            ),
            title: "Home"),
        PersistentBottomNavBarItem(
            activeColorPrimary: AppColors.lightPeach,
            icon: const Icon(
              Icons.home,
              color: AppColors.lightPeach,
            ),
            title: "Home"),
      ],
    );
  }
}
