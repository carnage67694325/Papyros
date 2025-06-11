import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';

class GroupViewAppbar extends StatelessWidget {
  final SingleGroupModel group;

  const GroupViewAppbar({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.mediumBrown,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          group.fullgroup!.name ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: AppColors.buildLinearGradient(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(
                    group.fullgroup!.coverImages!.frontImage!),
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Text(
                  (group.fullgroup!.name?.isNotEmpty == true
                          ? group.fullgroup!.name![0]
                          : '?')
                      .toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${group.fullgroup!.members?.length ?? 0} members',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chat_bubble_outline),
          tooltip: 'Group Chat',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
