import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/assets.dart';

class PostInteractSectionWithStats extends StatefulWidget {
  const PostInteractSectionWithStats({super.key, required this.numberOfLikes});
  final int numberOfLikes;
  @override
  State<PostInteractSectionWithStats> createState() =>
      _PostInteractSectionWithStatsState();
}

class _PostInteractSectionWithStatsState
    extends State<PostInteractSectionWithStats> {
  Map<int, bool> isClicked = {};

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10.w,
        ),
        _buildIconButton(0, Assets.assetsShareIcon, 20, () {
          log("Share clicked");
        }),
        _buildIconButton(1, Assets.assetsBookMarkIcon, 25, () {
          log("Bookmark clicked");
        }),
        Row(children: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: isClicked[2] == true
                  ? AppColors.lightPeach
                  : AppColors.iconColor,
            ),
            onPressed: () {
              changeIconColor(2);
              log("Favorite clicked");
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
        _buildIconButton(3, Assets.assetsCommentIcon, 20, () {
          log("Comment clicked");
        }),
        _buildIconButton(4, Assets.assetsRepostIcon, 30, () {
          log("Repost clicked");
        }),
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
