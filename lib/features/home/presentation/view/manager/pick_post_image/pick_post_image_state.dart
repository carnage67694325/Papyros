part of 'pick_post_image_cubit.dart';

@immutable
sealed class PickPostImageState {}

final class PickPostImageInitial extends PickPostImageState {}

final class PickPostImageLoading extends PickPostImageState {}

final class PickPostImageSuccess extends PickPostImageState {
  final String imagePath;

  PickPostImageSuccess({required this.imagePath});
}

final class PickPostImageFaliure extends PickPostImageState {
  final String errMessage;

  PickPostImageFaliure({required this.errMessage});
}
