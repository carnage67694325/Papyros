import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_name_n_bio.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_viewer_image.dart';

class ProfileViewerBody extends StatelessWidget {
  const ProfileViewerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Profile Viewer'),
            floating: true,
          ),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileViewerImage(),
              SizedBox(height: 20.h),
              const ProfileNameNBio(),
              SizedBox(height: 20.h),
              PageView(
                children: [
                  SizedBox(
                    width: 15,
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
