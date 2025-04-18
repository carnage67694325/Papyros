import 'package:papyros/features/home/data/models/Images.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/data/models/createdby.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';

class PostModel extends PostsEntity {
  PostModel({
    String? id,
    String? description,
    CreatedBy? createdBy,
    String? createdAt,
    bool? isEdited,
    String? tag,
    List<String>? likes,
    List<String>? mention,
    List<Images>? images,
    String? updatedAt,
    List<CommentModel>? comments,
  }) : super(
          id: id ?? '',
          description: description ?? '',
          createdBy: createdBy ?? CreatedBy(),
          createdAt: createdAt ?? '',
          isEdited: isEdited ?? false,
          tag: tag ?? '',
          likes: likes ?? [],
          mention: mention ?? [],
          images: images ?? [],
          updatedAt: updatedAt ?? '',
          comments: comments ?? [],
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      description: json['description'],
      createdBy: json['createdBy'] != null
          ? CreatedBy.fromJson(json['createdBy'])
          : null,
      createdAt: json['createdAt'],
      isEdited: json['isEdited'] ?? false,
      tag: json['tag'] ?? '',
      likes: (json['likes'] as List?)?.map((e) => e.toString()).toList() ?? [],
      mention:
          (json['mention'] as List?)?.map((e) => e.toString()).toList() ?? [],
      images:
          (json['images'] as List?)?.map((v) => Images.fromJson(v)).toList() ??
              [],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List?)
              ?.map((v) => CommentModel.fromJson(v))
              .toList() ??
          [],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'description': description,
      'createdBy': createdBy?.toJson(),
      'createdAt': createdAt,
      'isEdited': isEdited,
      'tag': tag,
      'likes': likes,
      'mention': mention,
      'images': images?.map((v) => v.toJson()).toList(),
      'updatedAt': updatedAt,
      'comments': comments?.map((v) => v.toJson()).toList(),
    };
  }
}
