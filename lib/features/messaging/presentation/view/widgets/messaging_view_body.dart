import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_list.dart';

class MessagingViewBody extends StatelessWidget {
  const MessagingViewBody(
      {super.key, required this.token, required this.userId});
  final String token;
  final String userId; // Replace with actual user ID
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ContactList(
          token: token,
          userId: userId,
        )
      ],
    );
  }
}
