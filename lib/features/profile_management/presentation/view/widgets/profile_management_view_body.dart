import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/edit_profile_birth_date.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/remove_image_button.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_data_profile_info.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_avatar.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class ProfileManagementViewBody extends StatelessWidget {
  const ProfileManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserProfileCubit, GetUserProfileState>(
      listener: (context, state) {
        if (state is GetUserProfileSuccess) {
        } else if (state is GetUserProfileFailure) {
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is GetUserProfileSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.34,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReLD4P3O8RByhrHas25UgVcCDF0CucrSAP5A&s',
                          ),
                          const Positioned(
                            right: 220,
                            top: 90,
                            child: AddImageButton(),
                          ),
                          const Positioned(
                            right: 140,
                            top: 90,
                            child: RemoveImageButton(),
                          ),
                          Positioned(
                            right: isArabic() ? 10 : 265,
                            top: 160,
                            child: const UserProfileAvatar(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    UserProfileDataInfo(
                      name: state.userProfileEntity.userName,
                      bio: state.userProfileEntity.bio,
                      location: state.userProfileEntity.location,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: EditProfileBirthDate(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: CustomTextButton(
                        onTap: () {},
                        buttonText: S.of(context).accountSettings,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 105,
                    ),
                  ],
                ),
              )
            ],
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
