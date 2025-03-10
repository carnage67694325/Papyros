import 'Posts.dart';

/// message : "sucess"
/// posts : [{"_id":"67c9005370010b64dee69558","description":"ay haga","createdBy":"674a41a8a6571c2474c73797","createdAt":"2025-03-06T01:54:27.667Z","isEdited":false,"tag":"cairo","likes":[],"mention":[],"images":[{"imageId":"67c90a32432c4764161efbaa","image":"e82e9ba9-d7ec-44cd-87ec-b824993a5e92-20240702_141012_Kz2lQ7yUG.jpg","_id":"67c90a32a33dc28744a7b363"}],"updatedAt":"2025-03-06T02:36:34.153Z"}]

class Allpostsmodel {
  Allpostsmodel({
      this.message, 
      this.posts,});

  Allpostsmodel.fromJson(dynamic json) {
    message = json['message'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
  }
  String? message;
  List<Posts>? posts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}