part of 'profile_view_cubit.dart';

@immutable
sealed class ProfileViewState {}

final class ProfileViewInitial extends ProfileViewState {}

final class ProfileViewLoading extends ProfileViewState {}

final class ProfileViewSuccess extends ProfileViewState {
  final UserViewer userViewer;

  ProfileViewSuccess({required this.userViewer});
}

final class ProfileViewFailure extends ProfileViewState {
  final String errMessage;

  ProfileViewFailure({required this.errMessage});
}
