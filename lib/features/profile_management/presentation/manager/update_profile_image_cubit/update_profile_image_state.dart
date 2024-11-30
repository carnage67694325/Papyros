part of 'update_profile_image_cubit.dart';

@immutable
sealed class UpdateProfileImageState {}

final class UpdateProfileImageInitial extends UpdateProfileImageState {}

final class UpdateProfileImageLoading extends UpdateProfileImageState {}

final class UpdateProfileImageSuccess extends UpdateProfileImageState {
  final String imagePath;

  UpdateProfileImageSuccess({required this.imagePath});
}

final class UpdateProfileFailure extends UpdateProfileImageState {
  final String errMessage;

  UpdateProfileFailure({required this.errMessage});
}
