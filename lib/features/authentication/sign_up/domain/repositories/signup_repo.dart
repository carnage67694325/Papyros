import 'package:dartz/dartz.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/Sigup%20entity/signup_entity.dart';

abstract class SignupRebo {
  Future<Either<SignupEntity, String>> signup({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String phone,
    required String dob,
    required String gender,
  });
}
