import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/messaging/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:papyros/features/messaging/presentation/manager/get_contacts_cubit/get_contacts_cubit.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/messaging_view_body.dart';

class MessagingView extends StatefulWidget {
  const MessagingView({super.key});

  @override
  State<MessagingView> createState() => _MessagingViewState();
}

class _MessagingViewState extends State<MessagingView> {
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

      BlocProvider.of<GetContactsCubit>(context).getContacts();
      BlocProvider.of<ChatCubit>(context).connectToSocket(token, userId);
      BlocProvider.of<ChatCubit>(context)
          .sendMessage('673ef6243ebec6fda14bbd2b', 'hello', token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const MessagingViewBody(),
    );
  }
}
