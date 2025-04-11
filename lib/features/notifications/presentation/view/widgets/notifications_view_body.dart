import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/notification_item.dart';
import 'package:papyros/features/notifications/presentation/view/widgets/notification_model.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});
  static const List<NotificationModel> notifications = [
    NotificationModel(
      id: "1",
      username: "hala",
      handle: "@hala",
      userImage: "https://randomuser.me/api/portraits/women/12.jpg",
      content: "liked your post",
      timeAgo: "2m ago",
      isRead: false,
      type: NotificationType.like,
    ),
    NotificationModel(
      id: "2",
      username: "Mohamed sayed",
      handle: "@mohamedsayed",
      userImage: "https://randomuser.me/api/portraits/men/32.jpg",
      content: "started following you",
      timeAgo: "5m ago",
      isRead: false,
      type: NotificationType.follow,
    ),
    NotificationModel(
      id: "3",
      username: "arwa ibrahim",
      handle: "@arwaibrahim7",
      userImage: "https://randomuser.me/api/portraits/women/22.jpg",
      content: "commented on your post: 'Great content!'",
      timeAgo: "15m ago",
      isRead: true,
      type: NotificationType.comment,
    ),
    NotificationModel(
      id: "4",
      username: "The Grand Egyptian Museum",
      handle: "@GEM",
      userImage: "https://randomuser.me/api/portraits/lego/5.jpg",
      content: "mentioned you in a post",
      timeAgo: "1h ago",
      isRead: true,
      type: NotificationType.mention,
    ),
    NotificationModel(
      id: "5",
      username: "Nouran mohsan",
      handle: "@nouranmohsan",
      userImage: "https://randomuser.me/api/portraits/women/32.jpg",
      content: "shared your post",
      timeAgo: "3h ago",
      isRead: true,
      type: NotificationType.share,
    ),
    NotificationModel(
      id: "6",
      username: "Alec",
      handle: "@alec11",
      userImage: "https://randomuser.me/api/portraits/men/42.jpg",
      content: "replied to your comment: 'Thanks for the info!'",
      timeAgo: "5h ago",
      isRead: true,
      type: NotificationType.reply,
    ),
    NotificationModel(
      id: "7",
      username: "Egypt مصر",
      handle: "@Egypt_2030",
      userImage: "https://randomuser.me/api/portraits/lego/1.jpg",
      content: "invited you to follow their page",
      timeAgo: "1d ago",
      isRead: true,
      type: NotificationType.invite,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              Text(
                'All notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),

        Divider(height: 1, thickness: 1, color: Colors.grey.withOpacity(0.2)),

        // Notifications list
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: notifications.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            itemBuilder: (context, index) {
              return NotificationItem(
                notification: notifications[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
