import 'package:papyros/features/home/data/models/createdby.dart';

class CommentEntity {
  final String id;
  final String post;
  final CreatedBy createdBy;
  final String createdAt;
  final bool isEdited;
  final String description;
  final List<String> likes;
  final List<CommentEntity> replies;
  final String updatedAt;

  CommentEntity({
    required this.id,
    required this.post,
    required this.createdBy,
    required this.createdAt,
    required this.isEdited,
    required this.description,
    required this.likes,
    required this.replies,
    required this.updatedAt,
  });
}
