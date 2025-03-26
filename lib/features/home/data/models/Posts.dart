import 'Images.dart';

class Posts {
  Posts({
    this.id,
    this.description,
    this.createdBy,
    this.createdAt,
    this.isEdited,
    this.tag,
    this.likes,
    this.mention,
    this.images,
    this.updatedAt,
  });

  Posts.fromJson(dynamic json) {
    id = json['_id'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    isEdited = json['isEdited'];
    tag = json['tag'];

    // Fixing likes list
    if (json['likes'] != null) {
      likes = List<String>.from(json['likes']);
    }

    // Fixing mention list
    if (json['mention'] != null) {
      mention = List<String>.from(json['mention']);
    }

    // Fixing images list
    if (json['images'] != null) {
      images = (json['images'] as List).map((v) => Images.fromJson(v)).toList();
    }

    updatedAt = json['updatedAt'];
  }

  String? id;
  String? description;
  String? createdBy;
  String? createdAt;
  bool? isEdited;
  String? tag;
  List<String>? likes;
  List<String>? mention;
  List<Images>? images;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['description'] = description;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    map['isEdited'] = isEdited;
    map['tag'] = tag;

    if (likes != null) {
      map['likes'] = likes;
    }
    if (mention != null) {
      map['mention'] = mention;
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }

    map['updatedAt'] = updatedAt;
    return map;
  }
}
