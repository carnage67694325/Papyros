import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';

abstract class SignInRepo {
  Future<Either<Failure, SignInEntity>> signIn(
      {required String email, required String pass});
}
