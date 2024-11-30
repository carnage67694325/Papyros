import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/remove_image_button.dart';

class BackGroundProfileImage extends StatelessWidget {
  const BackGroundProfileImage({
    super.key,
    required this.image, // Initially passed image URL
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UpdateProfileImageCubit(), // Initialize cubit and load image if stored
      child: BlocConsumer<UpdateProfileImageCubit, UpdateProfileImageState>(
        listener: (context, state) {
          if (state is UpdateProfileFailure) {
            // Show an error message if image loading fails
            errorSnackBar(context, state.errMessage);
          } else if (state is UpdateProfileImageSuccess) {
            // Optionally show success snackbar or perform other actions
            successSnackBar(context, 'Image updated successfully!');
          }
        },
        builder: (context, state) {
          // Define the ImageProvider to be used based on the state
          ImageProvider imageProvider;

          if (state is UpdateProfileImageLoading) {
            // Show cached network image as a placeholder while loading
            imageProvider = CachedNetworkImageProvider(image);
          } else if (state is UpdateProfileImageSuccess) {
            // Show the selected image (local file)
            imageProvider = FileImage(File(state.imagePath));
          } else {
            // Default image (cached network image)
            imageProvider = CachedNetworkImageProvider(image);
          }
          return Stack(children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.24,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            Positioned(
              right: 220,
              top: 90,
              child: AddImageButton(
                onTap: () async {
                  await BlocProvider.of<UpdateProfileImageCubit>(context)
                      .pickBackGroundProfileImage();
                },
              ),
            ),
            const Positioned(
              right: 140,
              top: 90,
              child: RemoveImageButton(),
            ),
          ]);
        },
      ),
    );
  }
}
