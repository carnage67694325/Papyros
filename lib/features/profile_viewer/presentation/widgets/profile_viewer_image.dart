import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewerImage extends StatelessWidget {
  const ProfileViewerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 175.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://www.pelago.com/img/countries/egypt/0801-0336_egypt-xlarge.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 280.w,
            top: 150.h,
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                  'https://www.pelago.com/img/countries/egypt/0801-0336_egypt-xlarge.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
