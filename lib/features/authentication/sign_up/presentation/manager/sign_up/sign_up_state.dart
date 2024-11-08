part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpInFailure extends SignUpState {
  final String errMessage;

  SignUpInFailure({required this.errMessage});
}

final class SignUpInSuccess extends SignUpState {
  final SignUpEntity signUpEntity;

  SignUpInSuccess({required this.signUpEntity});
}
