import 'package:papyros/features/home/data/models/Images.dart';
import 'package:papyros/features/home/data/models/createdby.dart';

class PostsEntity {
  final String id;
  final String description;
  final CreatedBy createdBy;
  final String createdAt;
  final bool isEdited;
  final String tag;
  final List<String> likes;
  final List<String> mention;
  final List<Images> images;
  final String updatedAt;
  final List<String> comments;

  const PostsEntity({
    required this.id,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.isEdited,
    required this.tag,
    required this.likes,
    required this.mention,
    required this.images,
    required this.updatedAt,
    required this.comments,
  });
}
