import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_in/data/data_source/sign_in_data_source.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';
import 'package:papyros/features/authentication/sign_in/domain/repos/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final SignInDataSource signInDataSource;

  SignInRepoImpl({required this.signInDataSource});
  @override
  Future<Either<Failure, SignInEntity>> signIn(
      {required String email, required String pass}) async {
    try {
      var response = await signInDataSource.signIn(email: email, pass: pass);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
