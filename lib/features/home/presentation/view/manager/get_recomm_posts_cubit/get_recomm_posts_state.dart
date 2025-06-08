part of 'get_recomm_posts_cubit.dart';

@immutable
sealed class GetRecommPostsState {}

final class GetRecommPostsInitial extends GetRecommPostsState {}

final class GetRecommPostsLoading extends GetRecommPostsState {}

final class GetRecommPostsSuccess extends GetRecommPostsState {
  final List<PostsEntity> posts;

  GetRecommPostsSuccess({required this.posts});
}

final class GetRecommPostsFailure extends GetRecommPostsState {
  final String errMessage;

  GetRecommPostsFailure({required this.errMessage});
}
