// File: post/presentation/widgets/post_app_bar.dart
import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onMorePressed;

  const PostAppBar({
    super.key,
    required this.onBackPressed,
    required this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: onBackPressed,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
          ),
          onPressed: onMorePressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
