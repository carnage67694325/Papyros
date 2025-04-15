import 'createdBy.dart';

class CommentModel {
  final String id;
  final String post;
  final CreatedBy createdBy;
  final String description;
  final bool isEdited;
  final List<String> likes;
  final List<String> reply;
  final String createdAt;
  final String updatedAt;

  CommentModel({
    required this.id,
    required this.post,
    required this.createdBy,
    required this.description,
    required this.isEdited,
    required this.likes,
    required this.reply,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'],
      post: json['post'],
      createdBy: CreatedBy.fromJson(json['createdBy']),
      description: json['description'],
      isEdited: json['isEdited'] ?? false,
      likes: (json['likes'] as List?)?.map((e) => e.toString()).toList() ?? [],
      reply: (json['reply'] as List?)?.map((e) => e.toString()).toList() ?? [],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'post': post,
      'createdBy': createdBy.toJson(),
      'description': description,
      'isEdited': isEdited,
      'likes': likes,
      'reply': reply,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
