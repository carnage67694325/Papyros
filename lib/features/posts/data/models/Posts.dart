import 'Images.dart';

/// _id : "67c9005370010b64dee69558"
/// description : "ay haga"
/// createdBy : "674a41a8a6571c2474c73797"
/// createdAt : "2025-03-06T01:54:27.667Z"
/// isEdited : false
/// tag : "cairo"
/// likes : []
/// mention : []
/// images : [{"imageId":"67c90a32432c4764161efbaa","image":"e82e9ba9-d7ec-44cd-87ec-b824993a5e92-20240702_141012_Kz2lQ7yUG.jpg","_id":"67c90a32a33dc28744a7b363"}]
/// updatedAt : "2025-03-06T02:36:34.153Z"

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
      this.updatedAt,});

  Posts.fromJson(dynamic json) {
    id = json['_id'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    isEdited = json['isEdited'];
    tag = json['tag'];
    if (json['likes'] != null) {
      likes = [];
      json['likes'].forEach((v) {
        likes?.add(Dynamic.fromJson(v));
      });
    }
    if (json['mention'] != null) {
      mention = [];
      json['mention'].forEach((v) {
        mention?.add(Dynamic.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
  }
  String? id;
  String? description;
  String? createdBy;
  String? createdAt;
  bool? isEdited;
  String? tag;
  List<dynamic>? likes;
  List<dynamic>? mention;
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
      map['likes'] = likes?.map((v) => v.toJson()).toList();
    }
    if (mention != null) {
      map['mention'] = mention?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['updatedAt'] = updatedAt;
    return map;
  }

}