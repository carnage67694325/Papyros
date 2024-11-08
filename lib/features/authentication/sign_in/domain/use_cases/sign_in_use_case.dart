import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';
import 'package:papyros/features/authentication/sign_in/domain/repos/sign_in_repo.dart';

class SignInUseCase {
  final SignInRepo signInRepo;

  SignInUseCase({required this.signInRepo});

  Future<Either<Failure, SignInEntity>> call(
      {required String email, required String pass}) {
    return signInRepo.signIn(email: email, pass: pass);
  }
}
