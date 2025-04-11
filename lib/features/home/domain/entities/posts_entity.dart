import 'package:papyros/features/home/data/models/createdBy.dart';

import '../../data/models/Images.dart';

class PostsEntity {
  String? id;
  String? description;
  CreatedBy? createdBy;
  String? createdAt;
  bool? isEdited;
  String? tag;
  List<String>? likes;
  List<String>? mention;
  List<Images>? images;
  String? updatedAt;

  PostsEntity({
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
}
