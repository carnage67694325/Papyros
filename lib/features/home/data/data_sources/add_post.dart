import 'package:papyros/features/home/data/models/Posts.dart';

abstract class AddPost {
  Future<void> addPost({String token, PostModel post});
}
