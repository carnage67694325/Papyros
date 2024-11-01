import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
import 'package:papyros/features/sign%20up/data/data_sources/Signupdao.dart';
import 'package:papyros/features/sign%20up/domain/entities/Sigup%20entity/signup_entity.dart';
import 'package:papyros/features/sign%20up/domain/repositories/signup_repo.dart';

// @Injectable(as: Signuorebo)
class SignuprepoImp extends Signuorebo {
  SignupDao signupApi;
  // @factoryMethod
  SignuprepoImp(this.signupApi);
  @override
  Future<Either<SignupEntity, String>> signup(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone}) async {
    var result = await signupApi.signup(
        email: email,
        password: password,
        phone: phone,
        firstname: firstname,
        lastname: lastname,
        confirmPassword: confirmPassword);
    return result.fold((response) {
      var signupEntity = response.toSignupEntity();
      return Left(signupEntity);
    }, (error) {
      return Right(error);
    });
  }
}
