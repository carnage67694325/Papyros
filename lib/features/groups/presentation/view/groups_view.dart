import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/groups/domain/use_case/get_groups_usecase.dart';
import 'package:papyros/features/groups/presentation/manager/get_groups_cubit/get_groups_cubit.dart';
import 'package:papyros/features/groups/presentation/view/widgets/groups_view_body.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetGroupsCubit(getIt.get<GetGroupsUsecase>()),
      child: const GroupsViewBody(),
    );
  }
}
