import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';
import 'package:papyros/features/groups/presentation/manager/get_single_group_cubit/get_single_group_cubit.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_tab_bar.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_tab_bar_view.dart';
import 'package:papyros/features/groups/presentation/view/widgets/group_view_app_bar.dart';

class GroupViewBody extends StatefulWidget {
  final String groupId;

  const GroupViewBody({super.key, required this.groupId});

  @override
  State<GroupViewBody> createState() => _GroupViewBodyState();
}

class _GroupViewBodyState extends State<GroupViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // fetch group on load
    context.read<GetSingleGroupCubit>().getSingleGroup(groupId: widget.groupId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleGroupCubit, GetSingleGroupState>(
      builder: (context, state) {
        if (state is GetSingleGroupLoading) {
          return const Center(child: AppLoadingAnimation());
        } else if (state is GetSingleGroupFailure) {
          return Center(child: Text('Error: ${state.errMessage}'));
        } else if (state is GetSingleGroupSuccess) {
          final SingleGroupModel group = state.group;

          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  GroupViewAppbar(group: group),
                  GroupViewTabBar(tabController: _tabController),
                ];
              },
              body: GroupTabBarView(
                tabController: _tabController,
                groupModel: group,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // open chat logic
              },
              backgroundColor: AppColors.getPrimaryBlue(context),
              child: const Icon(Icons.chat, color: Colors.white),
            ),
          );
        }

        return const SizedBox(); // initial fallback
      },
    );
  }
}
