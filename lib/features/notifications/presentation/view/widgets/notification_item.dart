import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/action_button.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/notification_model.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/profile_avatar.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        color:
            notification.isRead ? Colors.white : Colors.blue.withOpacity(0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User avatar
            ProfileAvatar(imageUrl: notification.userImage),
            SizedBox(width: 12.w),

            // Notification content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          notification.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        notification.handle,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notification.content,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notification.timeAgo,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Action button
            SizedBox(width: 8.w),
            ActionButton(
              onPressed: () {},
              isFollowing: false,
            ),
          ],
        ),
      ),
    );
  }
}
