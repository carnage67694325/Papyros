// File: post/utils/time_formatter.dart
class TimeFormatter {
  static String timeAgo(String createdAtString) {
    DateTime createdAt = DateTime.parse(createdAtString);
    Duration diff = DateTime.now().difference(createdAt);

    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 30) return '${diff.inDays}d ago';

    int months = (diff.inDays / 30).floor();
    if (months < 12) return '$months mo ago';

    return '${(diff.inDays / 365).floor()}y ago';
  }
}
