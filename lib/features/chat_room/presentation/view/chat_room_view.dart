import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/chat_room_view_body.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/group_chat_app_bar.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({super.key, required this.fullgroup});
  final SingleGroupModel fullgroup;

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  String token = '';
  String userId = '';
  bool isPrefsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadUserPrefs();
  }

  Future<void> _loadUserPrefs() async {
    final loadedToken = await PrefasHandelr.getAuthToken();
    final loadedUserId = await PrefasHandelr.getUserId();

    if (mounted) {
      setState(() {
        token = loadedToken ?? '';
        userId = loadedUserId ?? '';
        isPrefsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading indicator while waiting for token and userId
    if (!isPrefsLoaded) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: GroupChatAppBar(
          groupImage: widget.fullgroup.fullgroup!.coverImages!.frontImage!,
          groupName: widget.fullgroup.fullgroup!.name!,
        ),
      ),
      body: GroupChatViewBody(
        groupName: widget.fullgroup.fullgroup!.name!,
        groupImage: widget.fullgroup.fullgroup!.coverImages!.frontImage!,
        groupId: widget.fullgroup.fullgroup!.id!,
        token: token,
        userId: userId,
      ),
    );
  }
}
