import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_profile_image_cubit/update_profile_image_cubit.dart';

class UserProfileHomeAvatar extends StatelessWidget {
  const UserProfileHomeAvatar({
    super.key,
    required this.userProfileImage,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;

  final String userProfileImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateProfileImageCubit(), // Initialize the cubit and load the stored image
      child: BlocConsumer<UpdateProfileImageCubit, UpdateProfileImageState>(
        listener: (context, state) {
          if (state is UpdateProfileFailure) {
            // Show an error message if image loading fails
            errorSnackBar(context, state.errMessage);
          } else if (state is UpdateProfileImageSuccess) {
            // Optionally show success snackbar or perform other actions

            // successSnackBar(context, 'Image updated successfully!');
          }
        },
        builder: (context, state) {
          ImageProvider? imageProvider;

          if (state is UpdateProfileImageLoading) {
            imageProvider = CachedNetworkImageProvider(
                userProfileImage); // Placeholder while loading
          } else if (state is UpdateProfileImageSuccess) {
            imageProvider = FileImage(
                File(state.imagePath)); // Display the newly picked image
          } else {
            imageProvider =
                CachedNetworkImageProvider(userProfileImage); // Default image
          }

          return Container(
            width: width ?? 45.w, // Diameter of the circle
            height: height ?? 45.h,
            decoration: BoxDecoration(
              border: const Border.symmetric(
                horizontal: BorderSide(color: Colors.white, width: 2.5),
                vertical: BorderSide(color: Colors.white, width: 2.5),
              ),
              shape: BoxShape.circle, // Makes the container circular
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit
                    .cover, // Fills the circle while maintaining aspect ratio
              ),
            ),
          );
        },
      ),
    );
  }
}
