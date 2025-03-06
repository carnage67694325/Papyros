import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:papyros/features/home/presentation/view/widgets/home_screen_app_bar.dart';
import 'package:papyros/features/home/presentation/view/widgets/post_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            spacing: 14,
            children: [
              HomeScreenAppBar(),
            ],
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => const PostCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
