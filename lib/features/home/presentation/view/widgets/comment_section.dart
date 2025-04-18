import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/presentation/view/manager/add_comment/add_comment_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/comment_item.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({
    super.key,
    required this.comments,
    required this.userProfileImageUrl,
    required this.postId,
  });

  final List<CommentModel> comments;
  final String userProfileImageUrl;
  final String postId;

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;
  bool _hasText = false;

  // Add a list to track all comments including newly added ones
  late List<CommentModel> _allComments;

  @override
  void initState() {
    super.initState();
    // Initialize with the comments passed from parent
    _allComments = List<CommentModel>.from(widget.comments);

    _commentController.addListener(() {
      setState(() {
        _hasText = _commentController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitComment() async {
    if (!_hasText) return;

    final comment = CommentModel(
      description: _commentController.text,
    );

    final token = await PrefasHandelr.getAuthToken();

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Authentication required')),
      );
      return;
    }

    context.read<AddCommentCubit>().addComment(
          token: token,
          comment: comment,
          postId: widget.postId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCommentCubit, AddCommentState>(
      listener: (context, state) {
        if (state is AddCommentLoading) {
          setState(() {
            _isSubmitting = true;
          });
        } else if (state is AddCommentSuccess) {
          setState(() {
            _isSubmitting = false;
            // Add the new comment to our local list
            _allComments.add(state.comment);
            _commentController.clear();
          });
          successSnackBar(context, 'Comment added successfully!');
        } else if (state is AddCommentFailure) {
          setState(() {
            _isSubmitting = false;
          });
          errorSnackBar(context, state.errorMessage);
          log(state.errorMessage);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comments',
                  style: AppStyles.chatHeader.copyWith(fontSize: 18),
                ),
                if (_allComments.isNotEmpty)
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.backGroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
              ],
            ),
          ),

          // Only show comments list if there are comments
          if (_allComments.isNotEmpty)
            SizedBox(
              height:
                  _allComments.length > 2 ? 300.h : _allComments.length * 150.h,
              child: ListView.builder(
                itemCount: _allComments.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommentItem(
                    userName: "userName",
                    comment: _allComments[index].description!,
                    timeAgo: _allComments[index].createdAt ??
                        DateTime.now().toString(),
                    avatarUrl: "avatarUrl",
                  );
                },
              ),
            ),

          // Add comment field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.userProfileImageUrl),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide:
                            const BorderSide(color: AppColors.backGroundColor),
                      ),
                      contentPadding: EdgeInsets.all(12.r),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  onPressed: _isSubmitting || !_hasText ? null : _submitComment,
                  icon: _isSubmitting
                      ? SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: AppLoadingAnimation(
                            size: 15.w,
                          ))
                      : Icon(
                          Icons.send_rounded,
                          color: _hasText
                              ? AppColors.lightBrown
                              : AppColors.lightBrown,
                          size: 24.r,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
