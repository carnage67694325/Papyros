import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/data_source/verfiy_otp_data_source.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/repos/verfiy_otp_repo.dart';

class VerfiyOtpRepoImp implements VerfiyOtpRepo {
  final VerfiyOtpDataSource verfiyOtpDataSource;
  VerfiyOtpRepoImp(this.verfiyOtpDataSource);

  @override
  Future<Either<Failure, VerfiyOtpEntity>> verfiyOtp(
      VerfiyOtpEntity otp) async {
    try {
      var response = await verfiyOtpDataSource.verfiyOtp(
          email: otp.emailEntity!, otp: otp.otpEntity!);
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
