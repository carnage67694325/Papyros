import 'package:dartz/dartz.dart';

import '../models/SignInResponse.dart';

abstract class SignInDao {
  Future<Either<SignInResponse, String>> SignIn(
      {required String email, required String password});
}
