import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserProfileAvatar extends StatefulWidget {
  const UserProfileAvatar({
    super.key,
    required this.userProfileImage,
  });

  final String userProfileImage;

  @override
  _UserProfileAvatarState createState() => _UserProfileAvatarState();
}

class _UserProfileAvatarState extends State<UserProfileAvatar> {
  ImageProvider? _currentImage;

  @override
  void initState() {
    super.initState();
    _loadInitialImage();
  }

  /// Load the initial image from SharedPreferences or fallback to network image
  Future<void> _loadInitialImage() async {
    final storedImagePath = await PrefasHandelr.retrieveStoredImagePath();
    if (storedImagePath != null) {
      setState(() {
        _currentImage = FileImage(File(storedImagePath));
      });
    } else {
      setState(() {
        _currentImage = CachedNetworkImageProvider(widget.userProfileImage);
      });
    }
  }

  /// Method to pick a new image and update the profile picture
  Future<void> _updateProfileImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Store the picked image path in SharedPreferences
      await PrefasHandelr.storeImagePath(pickedFile.path);

      // Clear the old image cache to ensure the new one loads
      setState(() {
        _currentImage = FileImage(File(pickedFile.path))
          ..evict(); // Clear cached image for the new file

        // Force a rebuild to load the new image
        _currentImage = FileImage(File(pickedFile.path));
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Image updated successfully: ${pickedFile.path}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image selected.")),
      );
    }
  }

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
              vertical: BorderSide(color: Colors.white, width: 2.5),
            ),
            shape: BoxShape.circle, // Makes the container circular
            image: DecorationImage(
              image: _currentImage ??
                  CachedNetworkImageProvider(widget.userProfileImage),
              fit: BoxFit
                  .cover, // Fills the circle while maintaining aspect ratio
            ),
          ),
        ),
        Positioned(
          right: 35,
          top: 40,
          child: GestureDetector(
            onTap: () => _updateProfileImage(
                context), // Trigger image picker on button press
            child: const AddImageButton(
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
