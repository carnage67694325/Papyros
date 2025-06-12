import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/chat_room/presentation/manager/group_chat_cubit.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/chat_room_view_body.dart';
import 'package:papyros/features/chat_room/presentation/view/widgets/group_chat_app_bar.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';

class ChatRoomView extends StatefulWidget {
  const ChatRoomView({super.key, required this.fullgroup});
  final SingleGroupModel fullgroup;
  @override
  State<ChatRoomView> createState() => _ChatRoomViewBodyState();
}

class _ChatRoomViewBodyState extends State<ChatRoomView> {
  String token = '';
  String userId = '';

  @override
  void initState() {
    super.initState();
    _loadUserPrefs(); // load prefs first
  }

  Future<void> _loadUserPrefs() async {
    final loadedToken = await PrefasHandelr.getAuthToken();
    final loadedUserId = await PrefasHandelr.getUserId();

    if (mounted) {
      setState(() {
        token = loadedToken ?? '';
        userId = loadedUserId ?? '';
      });

      BlocProvider.of<GroupChatCubit>(context).connectToSocket(token, userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GroupChatAppBar(
            groupImage: widget.fullgroup.fullgroup!.coverImages!.frontImage!,
            groupName: widget.fullgroup.fullgroup!.name!),
      ),
      body: GroupChatViewBody(
          groupName: widget.fullgroup.fullgroup!.name!,
          groupImage: widget.fullgroup.fullgroup!.coverImages!.frontImage!,
          groupId: widget.fullgroup.fullgroup!.id!,
          token: token,
          userId: userId),
    );
  }
}
