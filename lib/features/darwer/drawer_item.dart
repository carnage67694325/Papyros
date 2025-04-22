// Model class for drawer items
import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String title;
  final bool isLogout;

  const DrawerItem({
    required this.icon,
    required this.title,
    this.isLogout = false,
  });
}
