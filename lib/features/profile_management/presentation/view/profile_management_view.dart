import 'package:flutter/material.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/profile_management_view_body.dart';

class ProfileManagementView extends StatelessWidget {
  const ProfileManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ProfileManagementViewBody(),
    );
  }
}
