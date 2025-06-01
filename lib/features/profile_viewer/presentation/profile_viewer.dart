import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/profile_viewer/presentation/manager/cubit/profile_view_cubit.dart';
import 'package:papyros/features/profile_viewer/presentation/widgets/profile_viewer_body.dart';

class ProfileViewer extends StatefulWidget {
  const ProfileViewer({super.key});

  @override
  State<ProfileViewer> createState() => _ProfileViewerState();
}

class _ProfileViewerState extends State<ProfileViewer> {
  @override
  void initState() {
    BlocProvider.of<ProfileViewCubit>(context)
        .getUserProfile(userId: "673ef6243ebec6fda14bbd2b");
  }

  @override
  Widget build(BuildContext context) {
    return const ProfileViewerBody();
  }
}
