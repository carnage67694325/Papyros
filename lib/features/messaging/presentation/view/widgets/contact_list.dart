import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/messaging/presentation/manager/get_contacts_cubit/get_contacts_cubit.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_item.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_shimmer_loading.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetContactsCubit, GetContactsState>(
      listener: (context, state) {
        if (state is GetContactsFaliure) {
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is GetContactsSuccess) {
          return SliverList.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              return ContactItem(
                userName: state.contacts[index].name ?? 'Unknown',
                userImage: state.contacts[index].profileImage ??
                    "https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-color-icon.png",
                lastMessage: 'Last message preview',
                timeOfLastMessage: '10:30 AM',
                userId: state.contacts[index].id ?? 'Unknown',
                token: token,
              );
            },
          );
        } else {
          return const ContactListShimmer(
            itemCount: 10,
          );
        }
      },
    );
  }
}
