import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/sign%20up/data/data_sources/Signupdao.dart';
import 'package:papyros/features/sign%20up/data/models/Signup%20Response/signup_response.dart';

import '../../../../../core/endpoints/endpiont.dart';

// @Injectable(as: SignupDao)
class SignupApiImp extends SignupDao {
  ApiService apiService;
  // @factoryMethod
  SignupApiImp(this.apiService);
  @override
  Future<Either<SignupResponse, String>> signup(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone}) async {
    try {
      Response response = await apiService.post(Endpiont.signupEndpiont, body: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phone
      });
      SignupResponse signUpResponse = SignupResponse.fromJson(response.data);
      return Left(signUpResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
