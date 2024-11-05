import 'dart:developer';

import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/repos/verfiy_otp_repo.dart';

class VerfiyOtpUseCase {
  final VerfiyOtpRepo verfiyOtpRepo;

  VerfiyOtpUseCase(this.verfiyOtpRepo);

  Future<void> call(VerfiyOtpEntity VerfiyOtpEntity) {
    if (!VerfiyOtpEntity.isValidOtp()) {
      throw Exception("Invalid OTP format");
    }
    return verfiyOtpRepo.sendOtp(VerfiyOtpEntity);
  }
}
