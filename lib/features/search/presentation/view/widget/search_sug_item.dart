import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSugItem extends StatelessWidget {
  const SearchSugItem({
    super.key,
    required this.name,
    required this.profileImage,
  });

  final String name;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
