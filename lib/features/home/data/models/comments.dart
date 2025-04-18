import 'package:papyros/features/home/domain/entities/comment_entity.dart';

class CommentModel {
  final String id;
  final String post;
  final String createdBy;
  final String createdAt;
  final bool isEdited;
  final String description;
  final List<String> likes;
  final List<CommentModel> replies;
  final String updatedAt;

  CommentModel({
    required this.id,
    required this.post,
    required this.createdBy,
    required this.createdAt,
    required this.isEdited,
    required this.description,
    required this.likes,
    required this.replies,
    required this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'],
      post: json['post'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      isEdited: json['isEdited'],
      description: json['description'],
      likes: List<String>.from(json['likes'] ?? []),
      replies: (json['reply'] as List<dynamic>?)
              ?.map((reply) => CommentModel.fromJson(reply))
              .toList() ??
          [],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'post': post,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'isEdited': isEdited,
      'description': description,
      'likes': likes,
      'reply': replies.map((reply) => reply.toJson()).toList(),
      'updatedAt': updatedAt,
    };
  }

  // Convert Model to Entity
  CommentEntity toEntity() {
    return CommentEntity(
      id: id,
      post: post,
      createdBy: createdBy,
      createdAt: createdAt,
      isEdited: isEdited,
      description: description,
      likes: likes,
      replies: replies.map((reply) => reply.toEntity()).toList(),
      updatedAt: updatedAt,
    );
  }

  // Convert Entity to Model
  static CommentModel fromEntity(CommentEntity entity) {
    return CommentModel(
      id: entity.id,
      post: entity.post,
      createdBy: entity.createdBy,
      createdAt: entity.createdAt,
      isEdited: entity.isEdited,
      description: entity.description,
      likes: entity.likes,
      replies: entity.replies
          .map((reply) => CommentModel.fromEntity(reply))
          .toList(),
      updatedAt: entity.updatedAt,
    );
  }
}
