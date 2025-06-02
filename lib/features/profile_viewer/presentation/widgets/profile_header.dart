import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_name_n_bio.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_viewer_image.dart';
import 'follow_stats.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileViewState state;

  const ProfileHeader({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    String? userName;
    String? bio;
    String? profileImage;
    String? backgroundImage;
    User? user;

    if (state is ProfileViewSuccess) {
      final successState = state as ProfileViewSuccess;
      userName = successState.userViewer.user?.userName ?? "Unknown User";
      bio = successState.userViewer.user?.bio ?? "No bio available";
      profileImage = successState.userViewer.user?.profileImage ??
          "https://uxwing.com/wp-content/themes/uxwing/download/peoples";
      backgroundImage = successState.userViewer.user?.backGroungImage ??
          "https://uxwing.com/wp-content/themes/uxwing/download/peoples";
      user = successState.userViewer.user;
    }

    return SliverAppBar(
      title: Text(userName ?? "Profile"),
      floating: true,
      expandedHeight: 450.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100), // Account for app bar
            ProfileViewerImage(
              profileImage: profileImage ?? "",
              backgroundImage: backgroundImage ?? "",
            ),
            SizedBox(height: 20.h),
            ProfileNameNBio(
              name: userName ?? "",
              bio: bio ?? "",
            ),
            SizedBox(height: 10.h),
            if (state is ProfileViewSuccess) FollowStats(user: user),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
