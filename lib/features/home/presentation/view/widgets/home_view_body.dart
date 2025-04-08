import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_screen_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllPostsCubit, GetAllPostsState>(
        listener: (context, state) {
      if (state is GetAllPostsFailure) {
        errorSnackBar(context, state.errMessage);
        log(state.errMessage);
      }
    }, builder: (context, state) {
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              spacing: 14,
              children: [
                HomeScreenAppBar(),
              ],
            ),
          ),
          state is GetAllPostsSuccess
              ? SliverList.builder(
                  itemBuilder: (context, index) => PostCard(
                    description: state.posts[index].description!,
                    userName: state.posts[index].createdBy!.userName!,
                    userProfileImageUrl:
                        state.posts[index].createdBy!.profileImage!,
                    imageUrl: state.posts[index].images![0].image,
                  ),
                  itemCount: state.posts.length,
                )
              : const SliverToBoxAdapter(child: SizedBox()),
        ],
      );
    });
  }
}
