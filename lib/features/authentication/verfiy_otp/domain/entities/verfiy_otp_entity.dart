class VerfiyOtpEntity {
  final String email;
  final String otp;

  VerfiyOtpEntity({required this.email, required this.otp});

  // Add any validation or helper methods if needed
  bool isValidOtp() {
    // Basic example: ensure OTP is 6 digits
    return otp.length == 6 && int.tryParse(otp) != null;
  }
}
