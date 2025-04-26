class MessageEntity {
  final String id;
  final String from;
  final String to;
  final String content;
  final DateTime timestamp;

  MessageEntity({
    required this.id,
    required this.from,
    required this.to,
    required this.content,
    required this.timestamp,
  });
}
