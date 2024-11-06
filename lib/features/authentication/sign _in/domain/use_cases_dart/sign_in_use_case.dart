import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/core/use_case/use_case.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/domain/entities/sign_in_entity.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/domain/repos/sign_in_repo.dart';

class SignInUseCase implements UseCase<SignInEntity, String> {
  final SignInRepo signInRepo;

  SignInUseCase({required this.signInRepo});

  @override
  Future<Either<Failure, SignInEntity>> call(
      [String email = '', String pass = '']) async {
    return signInRepo.signIn(email: email, pass: pass);
  }
}
