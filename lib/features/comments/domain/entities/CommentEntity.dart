import '../../data/models/Addcommentmodel.dart';

class CommentEntity {
  final String id;
  final String post;
  final String createdBy;
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

  // ✅ Convert Entity to Model
  CommentModel toModel() {
    return CommentModel(
      id: id,
      post: post,
      createdBy: createdBy,
      createdAt: createdAt,
      isEdited: isEdited,
      description: description,
      likes: likes,
      replies: replies.map((reply) => reply.toModel()).toList(),
      updatedAt: updatedAt,
    );
  }

  // ✅ Convert Model to Entity
  static CommentEntity fromModel(CommentModel model) {
    return CommentEntity(
      id: model.id,
      post: model.post,
      createdBy: model.createdBy,
      createdAt: model.createdAt,
      isEdited: model.isEdited,
      description: model.description,
      likes: model.likes,
      replies: model.replies.map((reply) => CommentEntity.fromModel(reply)).toList(),
      updatedAt: model.updatedAt,
    );
  }
}

