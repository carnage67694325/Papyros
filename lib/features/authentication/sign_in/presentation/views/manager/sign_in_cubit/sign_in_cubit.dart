import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';
import 'package:papyros/features/authentication/sign_in/domain/use_cases_dart/sign_in_use_case.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInUseCase) : super(SignInInitial());

  final SignInUseCase signInUseCase;

  Future<void> signIn({required String email, required String pass}) async {
    emit(SignInLoading());
    var response = await signInUseCase.call(email: email, pass: pass);

    response.fold(
      (failure) {
        emit(SignInFailure(errMessage: failure.errMessage));
      },
      (signInEntity) {
        emit(SignInSuccess(signInEntity: signInEntity));
      },
    );
  }
}
