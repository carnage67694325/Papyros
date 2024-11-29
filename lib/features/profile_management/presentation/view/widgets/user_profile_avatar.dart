import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    required this.userProfileImage,
  });
  final String userProfileImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 115, // Diameter of the circle
          height: 115,
          decoration: BoxDecoration(
            border: const Border.symmetric(
                horizontal: BorderSide(color: Colors.white, width: 2.5),
                vertical: BorderSide(color: Colors.white, width: 2.5)),
            shape: BoxShape.circle, // Makes the container circular
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  userProfileImage // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReLD4P3O8RByhrHas25UgVcCDF0CucrSAP5A&s',
                  ),
              fit: BoxFit
                  .cover, // Fills the circle while maintaining the aspect ratio
            ),
          ),
        ),
        const Positioned(
            right: 35,
            top: 40,
            child: AddImageButton(
              height: 40,
            ))
      ],
    );
  }
}
