import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/repos/verfiy_otp_repo.dart';

class VerfiyOtpRepoImp implements VerfiyOtpRepo {
  final ApiService apiService;

  VerfiyOtpRepoImp(this.apiService);

  @override
  Future<Either<Failure, void>> verfiyOtp(VerfiyOtpEntity verfiyOtpImp) async {
    try {
      // Use the apiService to make a POST request to the send OTP endpoint
      Response response = await apiService.post(
        endpoint: Endpiont
            .verfiyOtpEndpoint, // Ensure this endpoint is correctly defined
        body: {
          "email": verfiyOtpImp.email,
          "otp": verfiyOtpImp.otp,
        },
      );

      return right(Void); // Left indicates success with the response
    } catch (e) {
      return Left(ServerFailure(
          e.toString())); // Right indicates failure with error message
    }
  }
}
