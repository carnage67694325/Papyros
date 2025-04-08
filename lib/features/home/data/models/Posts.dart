import 'package:papyros/features/home/data/models/createdBy.dart';

import 'Images.dart';
import '../../domain/entities/posts_entity.dart';

class Posts extends PostsEntity {
  Posts({
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
        );

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
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
    );
  }

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
      'images': images?.map((v) => v.toJson()).toList() ?? [],
      'updatedAt': updatedAt,
    };
  }
}
