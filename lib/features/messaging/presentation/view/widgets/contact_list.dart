import 'package:flutter/material.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ContactItem(
          userName: 'Contact Name',
          userImage:
              "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-color-icon.png",
          lastMessage: 'Last message preview',
          timeOfLastMessage: '10:30 AM',
        );
      },
    );
  }
}
