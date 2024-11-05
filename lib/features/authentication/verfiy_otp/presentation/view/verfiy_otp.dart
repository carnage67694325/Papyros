import 'package:flutter/material.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/view/widgets/verfiy_otp_body.dart';

class VerfiyOtp extends StatelessWidget {
  const VerfiyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: VerfiyOtpBody(),
        ),
      ),
    );
  }
}
