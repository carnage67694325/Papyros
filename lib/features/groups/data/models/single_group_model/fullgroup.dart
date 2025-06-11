import 'admin.dart';
import 'cover_images.dart';
import 'created_by.dart';
import 'member.dart';
import 'post.dart';

class Fullgroup {
  CoverImages? coverImages;
  String? id;
  String? name;
  String? description;
  List<Admin>? admins;
  List<Member>? members;
  CreatedBy? createdBy;
  List<Post>? posts;
  DateTime? createdAt;
  DateTime? updatedAt;

  Fullgroup({
    this.coverImages,
    this.id,
    this.name,
    this.description,
    this.admins,
    this.members,
    this.createdBy,
    this.posts,
    this.createdAt,
    this.updatedAt,
  });

  factory Fullgroup.fromJson(Map<String, dynamic> json) => Fullgroup(
        coverImages: json['coverImages'] == null
            ? null
            : CoverImages.fromJson(json['coverImages'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        admins: (json['admins'] as List<dynamic>?)
            ?.map((e) => Admin.fromJson(e as Map<String, dynamic>))
            .toList(),
        members: (json['members'] as List<dynamic>?)
            ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdBy: json['createdBy'] == null
            ? null
            : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        posts: (json['posts'] as List<dynamic>?)
            ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'coverImages': coverImages?.toJson(),
        '_id': id,
        'name': name,
        'description': description,
        'admins': admins?.map((e) => e.toJson()).toList(),
        'members': members?.map((e) => e.toJson()).toList(),
        'createdBy': createdBy?.toJson(),
        'posts': posts?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
