import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/presentation/view/manager/add_like_cubit/add_like_cubit.dart';

Future<void> likePost(BuildContext context, String postId) async {
  String? token = await PrefasHandelr.getAuthToken();
  BlocProvider.of<AddLikeCubit>(context).addLike(token: token!, postId: postId);
}
