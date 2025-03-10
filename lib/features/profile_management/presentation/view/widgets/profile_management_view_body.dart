import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:papyros/features/profile_management/presentation/manager/update_user_cubit/update_user_cubit.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/back_ground_profile_image.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/custom_profile_app_bar.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/edit_profile_birth_date.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_data_profile_info.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_avatar.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class ProfileManagementViewBody extends StatelessWidget {
  const ProfileManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> updatingLoading = ValueNotifier<bool>(false);
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateUserCubit, UpdateUserState>(
          listener: (context, state) {
            if (state is UpdateUserFailure) {
              log(state.errMessage);
              updatingLoading.value = false;
              errorSnackBar(context, state.errMessage);
            } else if (state is UpdateUserSuccess) {
              log('success');
              updatingLoading.value = false;

              // Optionally show success snackbar or perform other actions
              successSnackBar(context, 'updated successfully!');
            } else {
              updatingLoading.value = true;
            }
          },
        )
      ],
      child: BlocConsumer<GetUserProfileCubit, GetUserProfileState>(
        listener: (context, state) {
          if (state is GetUserProfileSuccess) {
          } else if (state is GetUserProfileFailure) {
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          if (state is GetUserProfileSuccess) {
            return ValueListenableBuilder(
              valueListenable: updatingLoading,
              builder: (context, isloading, child) => ModalProgressHUD(
                inAsyncCall: isloading,
                progressIndicator: const AppLoadingAnimation(),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomProfileAppBar(
                            userProfileEntity: state.userProfileEntity,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.34,
                            child: Stack(
                              children: [
                                BackGroundProfileImage(
                                  image:
                                      state.userProfileEntity.backgroundImage!,
                                ),
                                Positioned(
                                  right: isArabic() ? 10.w : 265.w,
                                  top: 160.h,
                                  child: UserProfileAvatar(
                                    userProfileImage:
                                        state.userProfileEntity.profileImage!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          UserProfileDataInfo(
                              name: state.userProfileEntity.userName!,
                              bio: state.userProfileEntity.bio!,
                              location: state.userProfileEntity.location!,
                              gender: state.userProfileEntity.gender!),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: EditProfileBirthDate(
                              date: state.userProfileEntity.dob!,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: CustomTextButton(
                              onTap: () {},
                              buttonText: S.of(context).accountSettings,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 105.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const AppLoadingAnimation();
          }
        },
      ),
    );
  }
}
