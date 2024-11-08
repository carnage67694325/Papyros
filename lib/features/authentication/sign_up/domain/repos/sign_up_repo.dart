import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpEntity>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  });
}
