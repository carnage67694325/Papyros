// Notification Model
enum NotificationType {
  like,
  comment,
  follow,
  mention,
  share,
  reply,
  invite,
}

class NotificationModel {
  final String id;
  final String username;
  final String handle;
  final String userImage;
  final String content;
  final String timeAgo;
  final bool isRead;
  final NotificationType type;

  const NotificationModel({
    required this.id,
    required this.username,
    required this.handle,
    required this.userImage,
    required this.content,
    required this.timeAgo,
    required this.isRead,
    required this.type,
  });
}
