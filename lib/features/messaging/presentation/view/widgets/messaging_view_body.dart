import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_list.dart';

class MessagingViewBody extends StatelessWidget {
  const MessagingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [ContactList()],
    );
  }
}
