import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/presentation/manager/get_groups_cubit/get_groups_cubit.dart';
import 'package:shimmer/shimmer.dart';

class GroupsList extends StatefulWidget {
  const GroupsList({super.key});

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGroupsCubit, GetGroupsState>(
      listener: (context, state) {
        if (state is GetGroupsFailure) {
          log(state.errMessage);
          errorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is GetGroupsSuccess) {
          final groupsList = state.groups.groups ?? [];

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildGroupCard(context, groupsList[index]);
              },
              childCount: groupsList.length,
            ),
          );
        } else if (state is GetGroupsFailure) {
          return const SliverToBoxAdapter(child: Text('Error loading groups'));
        } else {
          // Shimmer loading
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const GroupCardShimmer(),
              childCount: 5,
            ),
          );
        }
      },
    );
  }

  Widget _buildGroupCard(BuildContext context, Group group) {
    final String groupName = group.name ?? "Unnamed";
    final String groupInitial =
        groupName.isNotEmpty ? groupName[0].toUpperCase() : "?";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: group.coverImages?.backgroundImage != null
              ? CachedNetworkImageProvider(group.coverImages!.backgroundImage!)
              : null,
          backgroundColor: AppColors.getLightPeach(context),
          child: group.coverImages?.backgroundImage == null
              ? Text(
                  groupInitial,
                  style: TextStyle(
                    color: AppColors.getDarkBrown(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              : null,
        ),
        title: Text(
          groupName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ThemeHelper.isDarkMode(context)
                ? Colors.white
                : AppColors.getDarkBrown(context),
          ),
        ),
        subtitle: Text(
          group.description ?? "No description",
          style: TextStyle(
            color: AppColors.getIconColor(context),
            fontSize: 12.sp,
          ),
        ),
        trailing: Icon(
          Icons.more_vert,
          color: AppColors.getIconColor(context),
        ),
        onTap: () {
          GoRouter.of(context).push(AppRouter.kGroupView, extra: group);
        },
      ),
    );
  }
}

class GroupCardShimmer extends StatelessWidget {
  const GroupCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.getLightGreyBlue(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: ThemeHelper.isDarkMode(context)
            ? const Color(0xffFAEBD7)
            : Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: Container(
            width: 50.w,
            height: 50.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          title: Container(
            width: 100.w,
            height: 14.h,
            color: Colors.white,
          ),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 8),
            width: 150.w,
            height: 12.h,
            color: Colors.white,
          ),
          trailing: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
