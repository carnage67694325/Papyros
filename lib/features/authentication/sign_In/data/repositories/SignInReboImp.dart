import 'package:dartz/dartz.dart';
import 'package:papyros/core/network/InternetChecker.dart';

import '../../domain/entities/SignInEntity.dart';
import '../../domain/repositories/SignInRepo.dart';
import '../data_sources/SignInDau.dart';

class SignInRepoImpl extends SignInRepo {
  SignInDao apiDao;

  SignInRepoImpl(this.apiDao);
  @override
  Future<Either<SignInEntity, String>> SignIn(
      {required String email, required String password}) async {
    bool isConnected = await InternetChecker.CheckNetwork();
    if (isConnected) {
      var result = await apiDao.SignIn(email: email, password: password);
      return result.fold((response) {
        return Left(response.toSignInEntity());
      }, (error) {
        return Right(error);
      });
    } else {
      return Right("No Internet Connection");
    }
  }
}
