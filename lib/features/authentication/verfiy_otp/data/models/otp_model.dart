import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';

class Otp extends VerfiyOtpEntity {
  String? email;
  String? otp;

  Otp({this.email, this.otp}) : super(emailEntity: email, otpEntity: otp);

  factory Otp.fromJson(Map<String, dynamic> json) {
    final email = json['email'] as String?;
    final otp = json['otp'] as String?;

    if (email == null || otp == null) {
      throw Exception("Invalid response: email or otp is null");
    }

    return Otp(email: email, otp: otp);
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'otp': otp,
      };
}
