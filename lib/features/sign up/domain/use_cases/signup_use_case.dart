import 'package:dartz/dartz.dart';

import 'package:papyros/features/sign%20up/domain/repositories/signup_repo.dart';

import '../entities/Sigup entity/signup_entity.dart';

// @injectable
class SignUpUseCase {
  Signuorebo rebo;
  // @factoryMethod
  SignUpUseCase(this.rebo) {}
  Future<Either<SignupEntity, String>> call(
          {required String firstname,
          required String lastname,
          required String password,
          required String confirmPassword,
          required String email,
          required String phone}) =>
      rebo.signup(
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone);
}
