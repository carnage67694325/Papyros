// lib/features/home/presentation/view/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/darwer/custom_drawer.dart';
import 'package:papyros/features/darwer/drawer_item.dart';
import 'package:papyros/features/home/domain/use_cases/add_like_usecase.dart';
import 'package:papyros/features/home/presentation/view/manager/add_like_cubit/add_like_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/get_recomm_posts_cubit/get_recomm_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String userName = 'User Name'; // Default value
  String userProfileImage = '';

  @override
  void initState() {
    BlocProvider.of<GetAllPostsCubit>(context).getAllPosts();
    BlocProvider.of<GetRecommPostsCubit>(context).getRecommPosts();

    BlocProvider.of<GetUserProfileCubit>(context).getUserProfile();
    _loadUserPrefs(); // Load user preferences
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Define drawer items
    final List<DrawerItem> drawerItems = [
      const DrawerItem(
        icon: Icons.person,
        title: 'Profile',
        // Use the route name as defined in your router
      ),
      const DrawerItem(
        icon: Icons.bookmark_border,
        title: 'Bookmarks',
      ),
      const DrawerItem(
        icon: Icons.list_alt,
        title: 'Lists',
      ),
      const DrawerItem(
        icon: Icons.settings_outlined,
        title: 'Settings and privacy',
      ),
      const DrawerItem(
        icon: Icons.logout,
        title: 'Log out',
        isLogout: true,
      ),
    ];

    return Scaffold(
      drawer: CustomDrawer(
        userProfileImage: userProfileImage,
        userName: userName,
        items: drawerItems,
      ),
      body: BlocProvider(
        create: (context) => AddLikeCubit(
          getIt.get<AddLikeUscase>(),
        ),
        child: const HomeViewBody(),
      ),
    );
  }

  Future<void> _loadUserPrefs() async {
    final name = await PrefasHandelr.getUserName();
    final profileImage = await PrefasHandelr.getUserProfileImage();

    if (mounted) {
      setState(() {
        userName = name ?? 'User Name';
        userProfileImage = profileImage ?? '';
      });
    }
  }
}
