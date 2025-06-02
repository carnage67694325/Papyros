import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_header.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_tab_bar.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_tab_view_bar.dart';

class ProfileViewerBody extends StatefulWidget {
  const ProfileViewerBody({super.key});

  @override
  State<ProfileViewerBody> createState() => _ProfileViewerBodyState();
}

class _ProfileViewerBodyState extends State<ProfileViewerBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      log('Reached the bottom of the list');
      // Implement pagination logic here if needed
    }
  }

  Future<void> _refreshProfile() async {
    log('Refreshing profile...');
    // Add your refresh logic here
    // await context.read<ProfileViewCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileViewCubit, ProfileViewState>(
        listener: (context, state) {
          if (state is ProfileViewFailure) {
            errorSnackBar(context, state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refreshProfile,
            color: AppColors.lightPeach,
            backgroundColor: Colors.white,
            strokeWidth: 2.5,
            displacement: 40,
            child: NestedScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    ProfileHeader(state: state),
                    SliverToBoxAdapter(
                      child: ProfileTabBar(tabController: _tabController),
                    ),
                  ];
                },
                body: ProfileTabView(
                  tabController: _tabController,
                  state: state,
                )),
          );
        },
      ),
    );
  }
}
