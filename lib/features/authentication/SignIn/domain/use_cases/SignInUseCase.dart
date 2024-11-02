import 'package:dartz/dartz.dart';

import '../entities/SignInEntity.dart';
import '../repositories/SignInRepo.dart';

class SignInUseCase{
  SignInRepo repo;

  SignInUseCase(this.repo);
  Future<Either<SignInEntity, String>> call({required String email,required String password})
  =>repo.SignIn(email: email, password: password);
}