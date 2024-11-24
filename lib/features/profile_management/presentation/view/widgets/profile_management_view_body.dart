import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/add_image_button.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/remove_image_button.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_data_profile_info.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_avatar.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_profile_text_form_field.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class ProfileManagementViewBody extends StatelessWidget {
  const ProfileManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.34,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReLD4P3O8RByhrHas25UgVcCDF0CucrSAP5A&s',
                    ),
                    const Positioned(
                      right: 220,
                      top: 90,
                      child: AddImageButton(),
                    ),
                    const Positioned(
                      right: 140,
                      top: 90,
                      child: RemoveImageButton(),
                    ),
                    Positioned(
                      right: isArabic() ? 10 : 265,
                      top: 160,
                      child: const UserProfileAvatar(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const UserProfileDataInfo()
            ],
          ),
        )
      ],
    );
  }
}
