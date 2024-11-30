import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';

part 'update_profile_image_state.dart';

class UpdateProfileImageCubit extends Cubit<UpdateProfileImageState> {
  UpdateProfileImageCubit() : super(UpdateProfileImageInitial());
  Future<void> pickImage() async {
    try {
      emit(UpdateProfileImageLoading()); // Show loading state

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Store the image path in SharedPreferences
        await PrefasHandelr.storeImagePath(image.path);

        // Update the state with the new image path
        emit(UpdateProfileImageSuccess(imagePath: image.path));
      } else {
        emit(UpdateProfileFailure(errMessage: 'No image selected'));
      }
    } catch (e) {
      emit(UpdateProfileFailure(errMessage: 'Error picking image: $e'));
    }
  }

  // Load the stored image from SharedPreferences
  Future<void> loadStoredImage() async {
    final storedImagePath = await PrefasHandelr.retrieveStoredImagePath();
    if (storedImagePath != null) {
      emit(UpdateProfileImageSuccess(imagePath: storedImagePath));
    } else {
      emit(UpdateProfileFailure(errMessage: 'No stored image found'));
    }
  }
}
