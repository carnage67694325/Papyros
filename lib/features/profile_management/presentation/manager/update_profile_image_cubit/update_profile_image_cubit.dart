import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';

part 'update_profile_image_state.dart';

class UpdateProfileImageCubit extends Cubit<UpdateProfileImageState> {
  UpdateProfileImageCubit() : super(UpdateProfileImageInitial());
  Future<void> pickUserProfileImage() async {
    try {
      emit(UpdateProfileImageLoading()); // Show loading state

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Check if an image path already exists
        final storedImagePath =
            await PrefasHandelr.retrieveStoredUserProfileImagePath();
        if (storedImagePath != null && storedImagePath.isNotEmpty) {
          // If there is already a stored image, only update when a new one is picked
          await PrefasHandelr.storeUserProfileImagePath(image.path);
          emit(UpdateProfileImageSuccess(imagePath: image.path));
        } else {
          // If no image exists, directly store the new image
          await PrefasHandelr.storeUserProfileImagePath(image.path);
          emit(UpdateProfileImageSuccess(imagePath: image.path));
        }
      } else {
        emit(UpdateProfileFailure(errMessage: 'No image selected'));
      }
    } catch (e) {
      emit(UpdateProfileFailure(errMessage: 'Error picking image: $e'));
    }
  }

  // Load the stored image from SharedPreferences
  Future<void> loadStoredUserProfileImage() async {
    final storedImagePath =
        await PrefasHandelr.retrieveStoredUserProfileImagePath();
    if (storedImagePath != null) {
      emit(UpdateProfileImageSuccess(imagePath: storedImagePath));
    } else {
      emit(UpdateProfileFailure(errMessage: 'No stored image found'));
    }
  }

  Future<void> pickBackGroundProfileImage() async {
    try {
      emit(UpdateProfileImageLoading()); // Show loading state

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Check if an image path already exists
        final storedImagePath =
            await PrefasHandelr.retrieveStoredBackGroundProfileImagePath();
        if (storedImagePath != null && storedImagePath.isNotEmpty) {
          // If there is already a stored image, only update when a new one is picked
          await PrefasHandelr.storeBackGroundProfileImagePath(image.path);
          emit(UpdateProfileImageSuccess(imagePath: image.path));
        } else {
          // If no image exists, directly store the new image
          await PrefasHandelr.storeBackGroundProfileImagePath(image.path);
          emit(UpdateProfileImageSuccess(imagePath: image.path));
        }
      } else {
        emit(UpdateProfileFailure(errMessage: 'No image selected'));
      }
    } catch (e) {
      emit(UpdateProfileFailure(errMessage: 'Error picking image: $e'));
    }
  }

  // Load the stored image from SharedPreferences
  Future<void> loadStoredBackGroundProfileImage() async {
    final storedImagePath =
        await PrefasHandelr.retrieveStoredBackGroundProfileImagePath();
    if (storedImagePath != null) {
      emit(UpdateProfileImageSuccess(imagePath: storedImagePath));
    } else {
      emit(UpdateProfileFailure(errMessage: 'No stored image found'));
    }
  }
}
