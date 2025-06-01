import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewerImage extends StatelessWidget {
  const ProfileViewerImage({
    super.key,
    required this.profileImage,
    required this.backgroundImage,
  });
  final String profileImage;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 175.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 280.w,
            top: 150.h,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(profileImage),
            ),
          ),
        ],
      ),
    );
  }
}
