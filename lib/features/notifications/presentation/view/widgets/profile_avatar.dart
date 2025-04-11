import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size.w,
        height: size.w,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: size.w,
          height: size.w,
          color: Colors.grey.shade300,
          child: Icon(
            Icons.person,
            size: size / 2,
            color: Colors.grey.shade500,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: size.w,
          height: size.w,
          color: Colors.grey.shade300,
          child: Icon(
            Icons.error,
            size: size / 2,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
