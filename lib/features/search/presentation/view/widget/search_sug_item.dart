import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_router.dart';

class SearchSugItem extends StatelessWidget {
  const SearchSugItem({
    super.key,
    required this.name,
    required this.profileImage,
    required this.userId,
  });

  final String name;
  final String profileImage;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kProfileViewer,
          extra: userId,
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profileImage),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
