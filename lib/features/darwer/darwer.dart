import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.lightPeach, AppColors.mediumBrown],
                ),
              ),
              child: Center(
                child: Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            drawerItem(
              context,
              icon: Icons.person,
              title: 'Profile',
              route: '/profile',
            ),
            drawerItem(
              context,
              icon: Icons.bookmark_border,
              title: 'Bookmarks',
              route: '/bookmarks',
            ),
            drawerItem(
              context,
              icon: Icons.list_alt,
              title: 'Lists',
              route: '/lists',
            ),
            drawerItem(
              context,
              icon: Icons.settings_outlined,
              title: 'Settings and privacy',
              route: '/settings',
            ),
            drawerItem(
              context,
              icon: Icons.logout,
              title: 'Log out',
              route: 'logout',
              isLogout: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(child: Text('Main Content Area')),
    );
  }

  Widget drawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String route,
        bool isLogout = false,
      }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.iconColor),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer

        if (isLogout) {
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
                    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  },
                  child: const Text("Log out", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        } else {
          if (ModalRoute.of(context)?.settings.name != route) {
            Navigator.pushNamed(context, route);
          }
        }
      },
    );
  }
}
