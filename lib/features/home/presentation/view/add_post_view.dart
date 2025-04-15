import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/data/data_sources/add_like_data_source_imp.dart';
import 'package:papyros/features/home/data/data_sources/add_post_impl.dart';
import 'package:papyros/features/home/data/data_sources/get_posts_imp.dart';
import 'package:papyros/features/home/data/repositories/posts_entity_imp.dart';
import 'package:papyros/features/home/domain/use_cases/add_post_usecase.dart';
import 'package:papyros/features/home/presentation/view/manager/add_post_cubit/add_post_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/pick_post_image/pick_post_image_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/add_post_view_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post",
          style: AppStyles.chatHeader.copyWith(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kNavigation);
          },
        ),
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => PickPostImageCubit()),
        BlocProvider(
            create: (context) => AddPostCubit(AddPostUseCase(
                  GetPostsRepoimp(
                    GetPostsImp(
                      Dio(),
                    ),
                    AddPostImpl(dio: Dio()),
                    AddLikeImp(apiService: ApiService(Dio())),
                  ),
                )))
      ], child: const AddPostViewBody()),
    );
  }
}
