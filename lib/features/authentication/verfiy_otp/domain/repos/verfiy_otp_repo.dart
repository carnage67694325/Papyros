import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';

abstract class VerfiyOtpRepo {
  Future<Either<Failure, VerfiyOtpEntity>> verfiyOtp(VerfiyOtpEntity otp);
}
