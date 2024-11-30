import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/profile_management_view_body.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class ProfileManagementView extends StatefulWidget {
  const ProfileManagementView({super.key});

  @override
  State<ProfileManagementView> createState() => _ProfileManagementViewState();
}

class _ProfileManagementViewState extends State<ProfileManagementView> {
  @override
  void initState() {
    BlocProvider.of<GetUserProfileCubit>(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileManagementViewBody(),
    );
  }
}
