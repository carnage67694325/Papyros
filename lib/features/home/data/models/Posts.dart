import '../../domain/entities/posts_entity.dart';
import 'Images.dart';

class Posts extends PostsEntity {
  Posts({
    String? id,
    String? description,
    String? createdBy,
    String? createdAt,
    bool? isEdited,
    String? tag,
    List<String>? likes,
    List<String>? mention,
    List<Images>? images,
    String? updatedAt,
  }) : super(
          id ?? '', // Default empty string if null
          description ?? '',
          createdBy ?? '',
          createdAt ?? '',
          isEdited ?? false,
          tag ?? '',
          likes ?? [],
          mention ?? [],
          images ?? [],
          updatedAt ?? '',
        );

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['_id'],
      description: json['description'],
      createdBy: json['createdBy'],
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
      'createdBy': createdBy,
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
