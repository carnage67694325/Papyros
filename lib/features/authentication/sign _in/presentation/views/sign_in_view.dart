import 'package:flutter/material.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInBody(),
      ),
    );
  }
}
