import 'package:flutter/material.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/getting_started_body.dart';

class GettingStartedView extends StatelessWidget {
  const GettingStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GettingStartedBody(),
      ),
    );
  }
}
