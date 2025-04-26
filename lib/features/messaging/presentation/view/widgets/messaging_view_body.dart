import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_list.dart';

class MessagingViewBody extends StatelessWidget {
  const MessagingViewBody({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [ContactList(token: token)],
    );
  }
}
