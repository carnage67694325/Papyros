import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/presentation/manager/get_groups_cubit/get_groups_cubit.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_header.dart';
import 'package:papyros/features/groups/presentation/view/widgets/groups_list.dart';
import 'package:papyros/features/groups/presentation/view/widgets/groups_quick_action.dart';
import 'package:papyros/features/groups/presentation/view/widgets/suggested_groups_list.dart';

class GroupsViewBody extends StatefulWidget {
  const GroupsViewBody({super.key});

  @override
  State<GroupsViewBody> createState() => _GroupsViewBodyState();
}

class _GroupsViewBodyState extends State<GroupsViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetGroupsCubit>(context).getGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackGroundColor(context),
      body: CustomScrollView(
        slivers: [
          const GroupsHeader(),

          // Quick Actions
          const GroupsQuickAction(),

          // Your Groups Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16).r,
              child: Text(
                'Your Groups',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightPeach,
                ),
              ),
            ),
          ),

          // Groups List
          const GroupsList(),

          // Suggested Groups Section
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Suggested for You',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightPeach,
                ),
              ),
            ),
          ),

          const SuggestedGroupsList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          )
        ],
      ),
    );
  }
}

// Sample data
