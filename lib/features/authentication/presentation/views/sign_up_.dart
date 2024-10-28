import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/features/authentication/presentation/widgets/sign_up.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}
