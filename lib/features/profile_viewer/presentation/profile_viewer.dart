import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_viewer_body.dart';

class ProfileViewer extends StatefulWidget {
  const ProfileViewer({super.key, required this.userId});
  final String userId;
  @override
  State<ProfileViewer> createState() => _ProfileViewerState();
}

class _ProfileViewerState extends State<ProfileViewer> {
  @override
  void initState() {
    BlocProvider.of<ProfileViewCubit>(context)
        .getUserProfile(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return const ProfileViewerBody();
  }
}
