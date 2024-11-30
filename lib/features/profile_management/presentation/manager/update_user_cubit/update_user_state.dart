part of 'update_user_cubit.dart';

@immutable
sealed class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}

final class UpdateUserLoading extends UpdateUserState {}

final class UpdateUserSuccess extends UpdateUserState {}

final class UpdateUserFailure extends UpdateUserState {
  final String errMessage;

  UpdateUserFailure({required this.errMessage});
}
