import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/functions/like_post.dart';
import 'package:share_plus/share_plus.dart';

class PostInteractSection extends StatefulWidget {
  const PostInteractSection(
      {super.key, required this.postId, required this.likes});
  final String postId;
  final List<String> likes; // Replace with actual post ID
  @override
  State<PostInteractSection> createState() => _PostInteractSectionState();
}

class _PostInteractSectionState extends State<PostInteractSection> {
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
          width: 10.w,
        ),
        _buildIconButton(0, Assets.assetsShareIcon, 20, () async {
          log("Share clicked");
          await SharePlus.instance.share(ShareParams(
            uri: Uri.parse(
                "https://paramedia.onrender.com/posts/one/${widget.postId}"),
          ));
        }),
        _buildIconButton(1, Assets.assetsBookMarkIcon, 25, () {
          log("Bookmark clicked");
        }),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
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
