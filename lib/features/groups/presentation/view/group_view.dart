import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source_imp.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/data/repos/groups_rep_imp.dart';
import 'package:papyros/features/groups/domain/use_case/get_single_group_usecase.dart';
import 'package:papyros/features/groups/presentation/manager/get_single_group_cubit/get_single_group_cubit.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_body.dart';

class GroupView extends StatelessWidget {
  const GroupView({super.key, required this.groupId});
  final String groupId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetSingleGroupCubit(GetSingleGroupUsecase(
          groupRepo: GroupsRepoImp(
              groupsDataSource: GroupsDataSourceImp(dio: Dio())))),
      child: GroupViewBody(
        groupId: groupId,
      ),
    );
  }
}
