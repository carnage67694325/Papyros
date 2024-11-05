import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/verfiy_otp.dart';

abstract class VerfiyOtpRepo {
  Future<Either<Failure, void>> VerfiyOtp(VerfiyOtpEntity otp);
}
