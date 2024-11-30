import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';

Future<void> pickImage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await PrefasHandelr.storeUserProfileImagePath(image.path);
      successSnackBar(context, 'Image selected: ${image.path}');
    } else {
      successSnackBar(context, 'No image selected');
    }
  } catch (e) {
    errorSnackBar(context, 'Error picking image: $e');
  }
}
