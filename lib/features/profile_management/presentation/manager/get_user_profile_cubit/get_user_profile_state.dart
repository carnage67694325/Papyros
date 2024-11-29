part of 'get_user_profile_cubit.dart';

@immutable
sealed class GetUserProfileState {}

final class GetUserProfileInitial extends GetUserProfileState {}

final class GetUserProfileLoading extends GetUserProfileState {}

final class GetUserProfileFailure extends GetUserProfileState {
  final String errMessage;

  GetUserProfileFailure({required this.errMessage});
}

final class GetUserProfileSuccess extends GetUserProfileState {
  final UserProfileEntity userProfileEntity;

  GetUserProfileSuccess({required this.userProfileEntity});
}
