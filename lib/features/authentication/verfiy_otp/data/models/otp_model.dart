class Otp {
  String? email;
  String? otp;

  Otp({this.email, this.otp});

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        email: json['email'] as String?,
        otp: json['otp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'otp': otp,
      };
}
