import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_interact_seaction.dart';
import 'package:papyros/features/home/presentation/view/widgets/user_profile_home_avatar.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.description,
    this.imageUrl,
    required this.userName,
    required this.userProfileImageUrl,
  });
  final String userName;
  final String userProfileImageUrl;
  final String description;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: AppColors.backGroundColor, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                UserProfileHomeAvatar(
                  userProfileImage: userProfileImageUrl ??
                      "https://images.immediate.co.uk/production/volatile/sites/3/2017/12/yoda-the-empire-strikes-back-28a7558.jpg?quality=90&webp=true&resize=800,534",
                  height: 55.h,
                  width: 55.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Yoda",
                      style: AppStyles.chatHeader.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        description,
                        maxLines: 4,
                        style: AppStyles.postContent,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                          color: AppColors.iconColor, Icons.more_horiz),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 65.0.h, right: 32.h, top: 16.h, bottom: 6.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl ??
                        "https://www.thetimes.com/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2F99fb9468-4b44-406d-a4c2-5646791b6367.jpg?crop=1600%2C900%2C0%2C0&resize=1200"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const PostInteractSection()
        ],
      ),
    );
  }
}
