import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';

abstract class VerfiyOtpRepo {
  Future<void> sendOtp(VerfiyOtpEntity otp);
}
