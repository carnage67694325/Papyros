import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/features/darwer/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userHandle;
  final List<DrawerItem> items;
  final String userProfileImage;

  const CustomDrawer({
    super.key,
    required this.userName,
    this.userHandle = "",
    required this.items,
    required this.userProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile header
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        CachedNetworkImageProvider(userProfileImage),
                  ),
                  SizedBox(height: 12.w),
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  if (userHandle.isNotEmpty)
                    Text(
                      userHandle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14.sp,
                      ),
                    ),
                ],
              ),
            ),

            Divider(height: 1.h),

            // Menu items
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    _buildDrawerItem(context, items[index], index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, DrawerItem item, int index) {
    return ListTile(
      leading: Icon(
        item.icon,
        color: Colors.black,
        size: 22.h,
      ),
      title: Text(
        item.title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: () {
        Navigator.pop(context); // Close the drawer

        if (item.isLogout) {
          _showLogoutDialog(context);
        } else if (index == 0) {
          // Special handling for the first item (index 0)
          GoRouter.of(context).push(AppRouter.kProfileManage);
        } else {
          // Handle other items
          try {
            GoRouter.of(context).push("");
          } catch (e) {}
        }
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              GoRouter.of(context)
                  .go('/'); // Navigate to root route after logout
            },
            child: const Text("Log out", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
