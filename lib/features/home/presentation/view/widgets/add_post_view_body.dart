import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/data/models/Images.dart';
import 'package:papyros/features/home/presentation/view/manager/add_post_cubit/add_post_cubit.dart';
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
  bool _isSubmitting = false;

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
    return MultiBlocListener(
      listeners: [
        BlocListener<GetUserProfileCubit, GetUserProfileState>(
          listener: (context, profileState) {},
        ),
        BlocListener<PickPostImageCubit, PickPostImageState>(
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
        ),
        BlocListener<AddPostCubit, AddPostState>(
          listener: (context, state) {
            if (state is AddPostLoading) {
              setState(() {
                _isSubmitting = true;
              });
            } else if (state is AddPostSuccess) {
              setState(() {
                _isSubmitting = false;
                _postController.clear();
                selectedImages.clear();
                GoRouter.of(context).push(AppRouter.kChatBot);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post added successfully!')),
              );
            } else if (state is AddPostFailure) {
              setState(() {
                _isSubmitting = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage)),
              );
              log(state.errMessage);
            }
          },
        ),
      ],
      child: BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
        builder: (context, profileState) {
          return BlocBuilder<PickPostImageCubit, PickPostImageState>(
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
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          selectedImages.clear();
                                        });
                                      },
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
                            onPressed: _isSubmitting
                                ? null
                                : () {
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
                            onPressed: _isSubmitting
                                ? null
                                : () {
                                    context
                                        .read<PickPostImageCubit>()
                                        .pickImageFromGallery();
                                  },
                          ),
                          SizedBox(width: 155.w),
                          ElevatedButton(
                            onPressed: (_hasText && !_isSubmitting)
                                ? () async {
                                    // Create post model with empty images list
                                    // The actual image will be sent via FormData
                                    final post = PostModel(
                                      description: _postController.text,
                                      tag: '', // Add tag if needed
                                      images: selectedImages.isNotEmpty
                                          ? [
                                              Images(
                                                image:
                                                    selectedImages.first.path,
                                              )
                                            ]
                                          : null,
                                    );

                                    // Get token
                                    final token =
                                        await PrefasHandelr().getAuthToken();

                                    if (token == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Authentication required')),
                                      );
                                      return;
                                    }

                                    // Call the add post function
                                    await context.read<AddPostCubit>().addPost(
                                          token: token,
                                          post: post,
                                        );
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
                            child: _isSubmitting
                                ? SizedBox(
                                    width: 20.w,
                                    height: 20.h,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
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
      ),
    );
  }
}
