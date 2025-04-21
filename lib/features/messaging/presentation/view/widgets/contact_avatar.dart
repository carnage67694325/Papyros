import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    super.key,
    required this.userImage,
    this.avatarSize,
  });

  final String userImage;
  final double? avatarSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarSize ?? 30.r,
      backgroundImage: CachedNetworkImageProvider(
        userImage,
      ),
    );
  }
}
