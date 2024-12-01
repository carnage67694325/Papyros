import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    required this.userProfileImage,
  });

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

          return Stack(
            children: [
              Container(
                width: 115, // Diameter of the circle
                height: 115,
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
              ),
              Positioned(
                right: 35,
                top: 40,
                child: AddImageButton(
                  onTap: () async {
                    await BlocProvider.of<UpdateProfileImageCubit>(context)
                        .pickUserProfileImage();
                  },
                  height: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
