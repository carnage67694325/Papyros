import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_up/data/models/Signup%20Response/signup_response.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/models/otp_model.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/verfiy_otp.dart';

class VerfiyOtpImp {
  final ApiService apiService;

  VerfiyOtpImp(this.apiService);

  @override
  Future<Either<SignupResponse, String>> verfiyOtp(
      VerfiyOtpEntity verfiyOtpImp) async {
    try {
      // Use the apiService to make a POST request to the send OTP endpoint
      Response response = await apiService.post(
        Endpiont.verfiyOtpEndpoint, // Ensure this endpoint is correctly defined
        body: {
          "email": verfiyOtpImp.email,
          "otp": verfiyOtpImp.otp,
        },
      );

      // Assuming the response can be parsed into a `SignupResponse` object
      SignupResponse signupResponse = SignupResponse.fromJson(response.data);
      return Left(signupResponse); // Left indicates success with the response
    } catch (error) {
      return Right(
          error.toString()); // Right indicates failure with error message
    }
  }
}
