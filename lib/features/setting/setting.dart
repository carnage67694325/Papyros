import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';
import '../../core/utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Settings and privacy",
          style: TextStyle(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          settingTile(Icons.notifications_outlined, "Notifications", () {}),
          settingTile(Icons.language_outlined, "Language and display", () {
            GoRouter.of(context).push(AppRouter.kLanguage);
          }),
          settingTile(Icons.help_outline, "Help center", () {}),
        ],
      ),
    );
  }

  Widget settingTile(IconData icon, String title, Function()? ontap) {
    return Column(
      children: [
        ListTile(
            leading: Icon(icon, color: AppColors.iconColor),
            title: Text(title, style: const TextStyle(fontSize: 16)),
            trailing: const Icon(Icons.chevron_right),
            onTap: ontap),
        Divider(indent: 16.w, endIndent: 16.w, height: 0.h),
      ],
    );
  }
}
