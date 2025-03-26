part of 'get_all_posts_cubit.dart';

@immutable
sealed class GetAllPostsState {}

final class GetAllPostsInitial extends GetAllPostsState {}

final class GetAllPostsLoading extends GetAllPostsState {}

final class GetAllPostsSuccess extends GetAllPostsState {
  final List<PostsEntity> posts;
  GetAllPostsSuccess({required this.posts});
}

final class GetAllPostsFailure extends GetAllPostsState {
  final String errMessage;
  GetAllPostsFailure({required this.errMessage});
}
