import 'package:papyros/features/profile_viewer/data/model/user_viewer/Images.dart';

import 'like.dart';

class Post {
  String? id;
  String? description;
  String? createdBy;
  bool? isEdited;
  String? tag;
  List<Like>? likes;
  List<dynamic>? mention;
  DateTime? createdAt;
  List<Images>? images;
  DateTime? updatedAt;
  int? likescount;
  String? postId;

  Post({
    this.id,
    this.description,
    this.createdBy,
    this.isEdited,
    this.tag,
    this.likes,
    this.mention,
    this.createdAt,
    this.images,
    this.updatedAt,
    this.likescount,
    this.postId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['_id'] as String?,
        description: json['description'] as String?,
        createdBy: json['createdBy'] as String?,
        isEdited: json['isEdited'] as bool?,
        tag: json['tag'] as String?,
        likes: (json['likes'] as List<dynamic>?)
            ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
            .toList(),
        mention: json['mention'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        likescount: json['likescount'] as int?,
        postId: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'description': description,
        'createdBy': createdBy,
        'isEdited': isEdited,
        'tag': tag,
        'likes': likes?.map((e) => e.toJson()).toList(),
        'mention': mention,
        'createdAt': createdAt?.toIso8601String(),
        'images': images?.map((e) => e.toJson()).toList(),
        'updatedAt': updatedAt?.toIso8601String(),
        'likescount': likescount,
        'id': id,
      };
}
