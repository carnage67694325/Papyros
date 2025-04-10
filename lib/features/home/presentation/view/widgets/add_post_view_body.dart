import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/manager/pick_post_image/pick_post_image_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final TextEditingController _postController = TextEditingController();
  bool _hasText = false;
  List<File> selectedImages = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserProfileCubit>(context).getUserProfile();
    _postController.addListener(() {
      setState(() {
        _hasText = _postController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserProfileCubit, GetUserProfileState>(
      listener: (context, profileState) {},
      builder: (context, profileState) {
        return BlocConsumer<PickPostImageCubit, PickPostImageState>(
          listener: (context, imageState) {
            if (imageState is PickPostImageSuccess) {
              setState(() {
                selectedImages = [File(imageState.imagePath)];
              });
            } else if (imageState is PickPostImageFaliure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(imageState.errMessage)),
              );
            }
          },
          builder: (context, imageState) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Divider(height: 1, color: Colors.grey[300]),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileState is GetUserProfileSuccess
                                    ? UserProfileHomeAvatar(
                                        userProfileImage: profileState
                                            .userProfileEntity.profileImage!,
                                        height: 65.h,
                                        width: 65.w,
                                      )
                                    : CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: TextField(
                                    controller: _postController,
                                    decoration: InputDecoration(
                                      hintText: 'What is happening?!',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(fontSize: 16.sp),
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),

                            // Image preview
                            if (selectedImages.isNotEmpty)
                              Container(
                                height: 150.h,
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 16.h),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: DecorationImage(
                                    image: FileImage(selectedImages.first),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey[300]),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.photo_camera_outlined,
                            color: AppColors.lightPeach,
                            size: 34.sp,
                          ),
                          onPressed: () {
                            context
                                .read<PickPostImageCubit>()
                                .pickImageFromCamera();
                          },
                        ),
                        SizedBox(width: 16.w),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: AppColors.lightPeach,
                            size: 34.sp,
                          ),
                          onPressed: () {
                            context
                                .read<PickPostImageCubit>()
                                .pickImageFromGallery();
                          },
                        ),
                        SizedBox(width: 155.w),
                        ElevatedButton(
                          onPressed: _hasText
                              ? () {
                                  // Handle post
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBrown,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: AppColors.lightBrown,
                            disabledForegroundColor:
                                Colors.white.withOpacity(0.7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 8.h),
                          ),
                          child: Text(
                            'post',
                            style: AppStyles.chatHeader.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 400.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
