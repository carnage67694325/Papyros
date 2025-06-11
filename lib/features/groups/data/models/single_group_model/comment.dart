import 'created_by.dart';

class Comment {
  String? id;
  String? post;
  CreatedBy? createdBy;
  bool? isEdited;
  String? description;
  List<dynamic>? likes;
  DateTime? createdAt;
  List<dynamic>? reply;
  DateTime? updatedAt;

  Comment({
    this.id,
    this.post,
    this.createdBy,
    this.isEdited,
    this.description,
    this.likes,
    this.createdAt,
    this.reply,
    this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['_id'] as String?,
        post: json['post'] as String?,
        createdBy: json['createdBy'] == null
            ? null
            : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        isEdited: json['isEdited'] as bool?,
        description: json['description'] as String?,
        likes: json['likes'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        reply: json['reply'] as List<dynamic>?,
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'post': post,
        'createdBy': createdBy?.toJson(),
        'isEdited': isEdited,
        'description': description,
        'likes': likes,
        'createdAt': createdAt?.toIso8601String(),
        'reply': reply,
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
