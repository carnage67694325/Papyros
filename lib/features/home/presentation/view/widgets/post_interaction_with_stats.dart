import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/functions/like_post.dart';

class PostInteractSectionWithStats extends StatefulWidget {
  const PostInteractSectionWithStats(
      {super.key,
      required this.numberOfLikes,
      required this.numberOfComments,
      required this.postId,
      required this.likes});
  final int numberOfLikes;
  final int numberOfComments;
  final String postId;
  final List<dynamic> likes; // Replace with actual post ID
  @override
  State<PostInteractSectionWithStats> createState() =>
      _PostInteractSectionWithStatsState();
}

class _PostInteractSectionWithStatsState
    extends State<PostInteractSectionWithStats> {
  Map<int, bool> isClicked = {};
  String? currentUserId;
  @override
  void initState() {
    initFavoriteStatus(
      state: this,
      likes: widget.likes,
      isClicked: isClicked,
      onUserIdFetched: (id) {
        currentUserId = id;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 2.w,
        ),
        Row(
          children: [
            _buildIconButton(0, Assets.assetsShareIcon, 20, () {
              log("Share clicked");
            }),
            Text("2",
                style: TextStyle(
                  color: AppColors.iconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
        _buildIconButton(1, Assets.assetsBookMarkIcon, 25, () {
          log("Bookmark clicked");
        }),
        Row(children: [
          IconButton(
            icon: Icon(
              isClicked[2] == true ? Icons.favorite : Icons.favorite_border,
              color: isClicked[2] == true
                  ? AppColors.lightPeach
                  : AppColors.iconColor,
            ),
            onPressed: () async {
              changeIconColor(2);
              log("Favorite clicked");
              await likePost(context, widget.postId);
            },
          ),
          Text(
            widget.numberOfLikes.toString(),
            style: TextStyle(
              color: AppColors.iconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]),
        Row(children: [
          _buildIconButton(3, Assets.assetsCommentIcon, 20, () {
            log("Comment clicked");
          }),
          Text(
            widget.numberOfComments.toString(),
            style: TextStyle(
              color: AppColors.iconColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ]),
        Row(
          children: [
            _buildIconButton(4, Assets.assetsRepostIcon, 30, () {
              log("Repost clicked");
            }),
            Text(
              "50",
              style: TextStyle(
                color: AppColors.iconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }

  Widget _buildIconButton(
      int index, String asset, double height, VoidCallback onTap) {
    return IconButton(
      icon: SvgPicture.asset(
        asset,
        colorFilter: ColorFilter.mode(
          isClicked[index] == true ? AppColors.lightPeach : AppColors.iconColor,
          BlendMode.srcIn,
        ),
        height: height.h,
      ),
      onPressed: () {
        changeIconColor(index);
        onTap();
      },
    );
  }

  void changeIconColor(int index) {
    setState(() {
      isClicked[index] = !(isClicked[index] ?? false);
    });
  }
}
