import 'package:flutter/material.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/sign_in_body.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInBody(),
      ),
    );
  }
}
