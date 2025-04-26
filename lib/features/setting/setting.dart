import 'package:flutter/material.dart';
import '../../core/utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Settings and privacy",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          settingTile(Icons.lock_outline, "Your account"),
          settingTile(Icons.security, "Security and account access"),
          settingTile(Icons.privacy_tip_outlined, "Privacy and safety"),
          settingTile(Icons.notifications_outlined, "Notifications"),
          settingTile(Icons.language_outlined, "Language and display"),
          settingTile(Icons.help_outline, "Help center"),
        ],
      ),
    );
  }

  Widget settingTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.iconColor),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Add routing if needed
          },
        ),
        const Divider(indent: 16, endIndent: 16, height: 0),
      ],
    );
  }
}
