import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';

class Otp extends VerfiyOtpEntity {
  String? email;
  String? otp;

  Otp({this.email, this.otp}) : super(emailEntity: email!, otpEntity: otp!);

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        email: json['email'] as String?,
        otp: json['otp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'otp': otp,
      };
}
