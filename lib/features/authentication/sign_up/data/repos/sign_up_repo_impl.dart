import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/sign_up/data/data_source/sign_up_data_source.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/features/authentication/sign_up/domain/repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpDataSource signUpDataSource;

  SignUpRepoImpl({required this.signUpDataSource});
  @override
  Future<Either<Failure, SignUpEntity>> signIn({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  }) async {
    try {
      var response = await signUpDataSource.signUp(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          phone: phone,
          gender: gender,
          dob: dob);
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
