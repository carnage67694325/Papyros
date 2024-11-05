import 'package:dartz/dartz.dart';

import 'package:papyros/features/authentication/sign_up/domain/repositories/signup_repo.dart';

import '../entities/Sigup entity/signup_entity.dart';

// @injectable
class SignUpUseCase {
  final SignupRebo signupRebo;
  // @factoryMethod
  SignUpUseCase(this.signupRebo);
  Future<Either<SignupEntity, String>> call({
    required String firstname,
    required String lastname,
    required String password,
    required String email,
    required String phone,
    required String dob,
    required String gender,
  }) async =>
      await signupRebo.signup(
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          phone: phone,
          dob: dob,
          gender: gender);
}
