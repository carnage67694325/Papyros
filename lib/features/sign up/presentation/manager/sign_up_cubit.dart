import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/Sigup entity/signup_entity.dart';
import '../../domain/use_cases/signup_use_case.dart';

part 'sign_up_state.dart';

// @injectable
class SignupCubit extends Cubit<SignupState> {
  // @factoryMethod
  SignupCubit(this.signUpUseCase) : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  SignUpUseCase signUpUseCase;
  signUp(
      {required String email,
      required String password,
      required String phone,
      required String firstname,
      required String lastname,
      required String confirmPassword}) async {
    emit(SignupLoadingState());
    var result = await signUpUseCase.call(
        email: email,
        password: password,
        phone: phone,
        firstname: firstname,
        lastname: lastname,
        confirmPassword: confirmPassword);
    result.fold((signupEntity) {
      if (signupEntity.error != null) {
        emit(SignupErrorState(signupEntity.error!));
      } else if (signupEntity.message != null) {
        emit(SignupErrorState(signupEntity.message!));
      } else {
        emit(SignupSuccessState(signupEntity));
      }
    }, (error) {
      emit(SignupErrorState(error));
    });
  }
}
