import 'package:dartz/dartz.dart';
import 'package:papyros/core/utils/api_service.dart';

import '../../../../../../core/endpoints/endpiont.dart';
import '../../models/SignInResponse.dart';
import '../SignInDau.dart';

class SignInDaoApiImpl extends SignInDao {
  ApiService apiManager;

  SignInDaoApiImpl(this.apiManager);
  @override
  Future<Either<SignInResponse, String>> SignIn(
      {required String email, required String password}) async {
    try {
      var response = await apiManager.post(Endpiont.signipEndpiont,
          body: {"email": email, "password": password});
      return Left(SignInResponse.fromJson(response.data));
    } catch (e) {
      return Right(e.toString());
    }
  }
}
