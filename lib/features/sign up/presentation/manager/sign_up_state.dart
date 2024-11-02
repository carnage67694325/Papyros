part of 'sign_up_cubit.dart';

@immutable
sealed class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupErrorState extends SignupState {
  String error;
  SignupErrorState(this.error);
}

class SignupSuccessState extends SignupState {
  SignupEntity signUpEntity;
  SignupSuccessState(this.signUpEntity);
}
