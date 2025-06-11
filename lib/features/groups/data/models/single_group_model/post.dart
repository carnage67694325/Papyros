import 'package:papyros/features/home/data/models/comments.dart';

import 'comment.dart';
import 'image.dart';

class Post {
  String? id;
  String? description;
  String? createdBy;
  String? tag;
  List<dynamic>? likes;
  List<dynamic>? mention;
  DateTime? createdAt;
  List<Image>? images;
  List<CommentModel>? comments;
  String? postId;

  Post({
    this.postId,
    this.description,
    this.createdBy,
    this.tag,
    this.likes,
    this.mention,
    this.createdAt,
    this.images,
    this.comments,
    this.id,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['_id'] as String?,
        description: json['description'] as String?,
        createdBy: json['createdBy'] as String?,
        tag: json['tag'] as String?,
        likes: json['likes'] as List<dynamic>?,
        mention: json['mention'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        comments: (json['comments'] as List?)
                ?.map((v) => CommentModel.fromJson(v))
                .toList() ??
            [],
        postId: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'description': description,
        'createdBy': createdBy,
        'tag': tag,
        'likes': likes,
        'mention': mention,
        'createdAt': createdAt?.toIso8601String(),
        'images': images?.map((e) => e.toJson()).toList(),
        'comments': comments?.map((v) => v.toJson()).toList(),
        'id': id,
      };
}
