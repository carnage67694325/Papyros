import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'pick_post_image_state.dart';

class PickPostImageCubit extends Cubit<PickPostImageState> {
  PickPostImageCubit() : super(PickPostImageInitial());
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    try {
      emit(PickPostImageLoading());

      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        emit(PickPostImageSuccess(imagePath: image.path));
      } else {
        emit(PickPostImageFaliure(errMessage: 'No image selected'));
      }
    } catch (e) {
      emit(PickPostImageFaliure(errMessage: 'Error picking image: $e'));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      emit(PickPostImageLoading());

      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        emit(PickPostImageSuccess(imagePath: image.path));
      } else {
        emit(PickPostImageFaliure(errMessage: 'No image captured'));
      }
    } catch (e) {
      emit(PickPostImageFaliure(errMessage: 'Error capturing image: $e'));
    }
  }
}
