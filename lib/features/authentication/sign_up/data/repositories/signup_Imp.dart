import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
import 'package:papyros/features/authentication/sign_up/data/data_sources/Signupdao.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/Sigup%20entity/signup_entity.dart';
import 'package:papyros/features/authentication/sign_up/domain/repositories/signup_repo.dart';

// @Injectable(as: Signuorebo)
class SignupRepoImp extends SignupRebo {
  SignupDao signupApi;
  // @factoryMethod
  SignupRepoImp(this.signupApi);
  @override
  Future<Either<SignupEntity, String>> signup({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String dob,
    required String gender,
  }) async {
    var result = await signupApi.signup(
      email: email,
      password: password,
      phone: phone,
      firstname: firstname,
      lastname: lastname,
      confirmPassword: confirmPassword,
    );
    return result.fold((response) {
      var signupEntity = response.toSignupEntity();
      return Left(signupEntity);
    }, (error) {
      return Right(error);
    });
  }
}
