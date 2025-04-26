import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/contact_avatar.dart';
import 'package:papyros/features/messaging/presentation/view/widgets/message_chat_view.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(
      {super.key,
      required this.userImage,
      required this.userName,
      required this.lastMessage,
      required this.timeOfLastMessage,
      required this.userId});
  final String userImage;
  final String userName;
  final String lastMessage;
  final String timeOfLastMessage;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MessageChatView(
                  userName: userName,
                  userImage: userImage,
                  userID: userId,
                ),
              ));
          log('contact tapped');
        },
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: ContactAvatar(userImage: userImage),
            ),
            SizedBox(width: 25.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 7.h),
                Text(userName,
                    style: AppStyles.header.copyWith(fontSize: 16.sp)),
                SizedBox(height: 10.h),
                Text('Last message preview',
                    style: AppStyles.subHeader.copyWith(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    )),
              ],
            ),
            SizedBox(width: 75.w),
            Padding(
              padding: EdgeInsets.only(top: 10.0.h),
              child: Text(
                timeOfLastMessage,
                style: AppStyles.subHeader.copyWith(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
