import 'cover_images.dart';

class Group {
  CoverImages? coverImages;
  String? id;
  String? name;
  String? description;
  String? createdBy;

  Group({
    this.coverImages,
    this.id,
    this.name,
    this.description,
    this.createdBy,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        coverImages: json['coverImages'] == null
            ? null
            : CoverImages.fromJson(json['coverImages'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        createdBy: json['createdBy'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'coverImages': coverImages?.toJson(),
        '_id': id,
        'name': name,
        'description': description,
        'createdBy': createdBy,
      };
}
