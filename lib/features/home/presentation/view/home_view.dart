import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/home/data/repositories/posts_entity_imp.dart';
import 'package:papyros/features/home/domain/use_cases/add_like_usecase.dart';
import 'package:papyros/features/home/presentation/view/manager/add_like_cubit/add_like_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/get_all_posts/get_all_posts_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<GetAllPostsCubit>(context).getAllPosts();
    BlocProvider.of<GetUserProfileCubit>(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddLikeCubit(
          getIt.get<AddLikeUscase>(),
        ),
        child: const HomeViewBody(),
      ),
    );
  }
}
