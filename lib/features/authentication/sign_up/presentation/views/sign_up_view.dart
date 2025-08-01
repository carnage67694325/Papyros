import 'package:flutter/material.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/widgets/sign_up_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignUpBody(),
      ),
    );
  }
}
