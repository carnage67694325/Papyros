import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/service_locator.dart';
import 'package:papyros/features/home/presentation/view/widgets/add_post_view_body.dart';
import 'package:papyros/features/profile_management/domain/use_cases/get_user_use_case.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_profile_image_cubit/update_profile_image_cubit.dart';

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
            GoRouter.of(context).go('/');
          },
        ),
      ),
      body: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                GetUserProfileCubit(getIt.get<GetUserProfileUseCase>()))
      ], child: const AddPostViewBody()),
    );
  }
}
