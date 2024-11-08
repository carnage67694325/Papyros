import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/features/authentication/sign_up/domain/repos/sign_up_repo.dart';

class SignUpUsecase {
  final SignUpRepo signUpRepo;

  SignUpUsecase({required this.signUpRepo});
  Future<Either<Failure, SignUpEntity>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  }) {
    return signUpRepo.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        gender: gender,
        dob: dob);
  }
}
