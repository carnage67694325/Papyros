import 'package:dartz/dartz.dart';

import '../entities/SignInEntity.dart';

abstract class SignInRepo {
  Future<Either<SignInEntity, String>> SignIn(
      {required String email, required String password});
}
