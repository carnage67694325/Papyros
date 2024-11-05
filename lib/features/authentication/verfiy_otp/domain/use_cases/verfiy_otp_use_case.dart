import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/repos/verfiy_otp_repo.dart';

class VerfiyOtpUseCase {
  final VerfiyOtpRepo verfiyOtpRepo;

  VerfiyOtpUseCase(this.verfiyOtpRepo);

  Future<Either<Failure, void>> call(VerfiyOtpEntity verfiyOtpEntity) {
    if (!verfiyOtpEntity.isValidOtp()) {
      throw Exception("Invalid OTP format");
    }
    return verfiyOtpRepo.verfiyOtp(verfiyOtpEntity);
  }
}
