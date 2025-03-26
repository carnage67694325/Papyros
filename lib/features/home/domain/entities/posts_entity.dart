import '../../data/models/Images.dart';

class PostsEntity {
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
  PostsEntity(
      this.id,
      this.description,
      this.createdBy,
      this.createdAt,
      this.isEdited,
      this.tag,
      this.likes,
      this.mention,
      this.images,
      this.updatedAt);
}
