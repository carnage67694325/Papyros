import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115, // Diameter of the circle
      height: 115,
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(color: Colors.white, width: 2.5),
            vertical: BorderSide(color: Colors.white, width: 2.5)),
        shape: BoxShape.circle, // Makes the container circular
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReLD4P3O8RByhrHas25UgVcCDF0CucrSAP5A&s',
          ),
          fit: BoxFit
              .cover, // Fills the circle while maintaining the aspect ratio
        ),
      ),
    );
  }
}
