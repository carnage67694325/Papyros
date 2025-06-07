import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/core/utils/golabls/mentionId.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/data/models/Images.dart';
import 'package:papyros/features/home/presentation/view/manager/add_post_cubit/add_post_cubit.dart';
import 'package:papyros/features/home/presentation/view/manager/pick_post_image/pick_post_image_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/image_previewer.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_action_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_input_area.dart';
import 'package:papyros/features/home/presentation/view/widgets/tag_carousel.dart';
import 'package:papyros/features/home/presentation/view/widgets/title_section.dart';
import 'package:papyros/features/profile_management/presentation/manager/get_user_profile_cubit/get_user_profile_cubit.dart';

// Main AddPostViewBody widget
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
  String? selectedTag;

  // List of Egyptian historic tags
  final List<String> egyptianTags = [
    'Pharaoh',
    'Pyramid',
    'Sphinx',
    'Nile',
    'Tutankhamun',
    'Hieroglyphs',
    'Mummy',
    'Cleopatra',
    'Papyrus',
    'Obelisk',
    'Other'
  ];

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

  void _handleTagSelected(String tag) {
    setState(() {
      selectedTag = tag;
    });
  }

  void _removeImage() {
    setState(() {
      selectedImages.clear();
    });
  }

  void _submitPost() async {
    // Create post model with tag and images
    final post = PostModel(
      description: _postController.text,
      tag: selectedTag ?? '', // Send selected tag
      images: selectedImages.isNotEmpty
          ? [
              Images(
                image: selectedImages.first.path,
              )
            ]
          : null,
      mention: mentIonId, // Use global mentionId list
    );

    // Get token
    final token = await PrefasHandelr.getAuthToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication required')),
      );
      return;
    }

    // Call the add post function
    await context.read<AddPostCubit>().addPost(
          token: token,
          post: post,
        );
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
                selectedTag = null;
              });
              successSnackBar(context, 'Post added successfully!');
            } else if (state is AddPostFailure) {
              setState(() {
                _isSubmitting = false;
              });
              errorSnackBar(context, state.errMessage);
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
                color: ThemeHelper.isDarkMode(context)
                    ? AppColors.darkBackGroundColor
                    : AppColors.backGroundColor,
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
                              // Post Input Area
                              PostInputArea(
                                postController: _postController,
                                profileState: profileState,
                              ),

                              SizedBox(height: 16.h),

                              // Image preview
                              if (selectedImages.isNotEmpty)
                                ImagePreview(
                                  imagePath: selectedImages.first.path,
                                  onRemove: _removeImage,
                                ),
                              SizedBox(height: 52.h),
                              // Tags section
                              const SectionTitle(
                                  title: 'Select a historic tag:'),
                              SizedBox(height: 12.h),

                              // Horizontal Carousel Tag List
                              TagCarousel(
                                tags: egyptianTags,
                                selectedTag: selectedTag,
                                onTagSelected: _handleTagSelected,
                              ),

                              // SizedBox(height: 12.h),
                              // if (selectedTag != null)
                              //   SelectedTagIndicator(tagName: selectedTag!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey[300]),
                    // Bottom Action Bar
                    PostActionBar(
                      postController: _postController,
                      isSubmitting: _isSubmitting,
                      canSubmit: _hasText,
                      onSubmit: _submitPost,
                      onCameraTap: () {
                        context
                            .read<PickPostImageCubit>()
                            .pickImageFromCamera();
                      },
                      onGalleryTap: () {
                        context
                            .read<PickPostImageCubit>()
                            .pickImageFromGallery();
                      },
                    ),
                    SizedBox(height: 15.h),
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

// 9. Post Button
