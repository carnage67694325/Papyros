import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/features/authentication/sign_up/domain/use_cases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUsecase) : super(SignUpInitial());
  final SignUpUsecase signUpUsecase;

  Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  }) async {
    emit(SignUpLoading());
    var response = await signUpUsecase.call(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        dob: dob);

    response.fold(
      (failure) {
        emit(SignUpFailure(errMessage: failure.errMessage));
      },
      (signUpEntity) {
        emit(SignUpSuccess(signUpEntity: signUpEntity));
      },
    );
  }
}
