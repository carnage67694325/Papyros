import 'package:dartz/dartz.dart';
import 'package:papyros/features/sign%20up/domain/entities/Sigup%20entity/signup_entity.dart';

abstract class Signuorebo {
  Future<Either<SignupEntity, String>> signup(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone});
}
