import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/presentation/view/manager/add_like_cubit/add_like_cubit.dart';

Future<void> likePost(BuildContext context, String postId) async {
  String? token = await PrefasHandelr.getAuthToken();
  BlocProvider.of<AddLikeCubit>(context).addLike(token: token!, postId: postId);
}

Future<void> initFavoriteStatus({
  required State state,
  required List<dynamic> likes,
  required Map<int, bool> isClicked,
  required void Function(String userId) onUserIdFetched,
}) async {
  final userId = await PrefasHandelr.geUserId(); // Fetch current user ID

  state.setState(() {
    onUserIdFetched(userId!); // Save userId if needed
    isClicked[2] = likes.contains(userId); // Check if liked
  });
}
