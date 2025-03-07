/// post : "67c9005370010b64dee69558"
/// createdBy : "674a41a8a6571c2474c73797"
/// createdAt : "2025-03-07T19:17:58.426Z"
/// isEdited : false
/// description : "tohfaa "
/// likes : []
/// _id : "67cb4666b15de7e0052a7ebc"
/// reply : []
/// updatedAt : "2025-03-07T19:17:58.426Z"

class Data {
  Data({
      this.post, 
      this.createdBy, 
      this.createdAt, 
      this.isEdited, 
      this.description, 
      this.likes, 
      this.id, 
      this.reply, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    post = json['post'];
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    isEdited = json['isEdited'];
    description = json['description'];
    if (json['likes'] != null) {
      likes = [];
      json['likes'].forEach((v) {
        likes?.add(Dynamic.fromJson(v));
      });
    }
    id = json['_id'];
    if (json['reply'] != null) {
      reply = [];
      json['reply'].forEach((v) {
        reply?.add(Dynamic.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
  }
  String? post;
  String? createdBy;
  String? createdAt;
  bool? isEdited;
  String? description;
  List<dynamic>? likes;
  String? id;
  List<dynamic>? reply;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post'] = post;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    map['isEdited'] = isEdited;
    map['description'] = description;
    if (likes != null) {
      map['likes'] = likes?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    if (reply != null) {
      map['reply'] = reply?.map((v) => v.toJson()).toList();
    }
    map['updatedAt'] = updatedAt;
    return map;
  }

}