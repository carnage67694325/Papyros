part of 'add_like_cubit.dart';

@immutable
sealed class AddLikeState {}

final class AddLikeInitial extends AddLikeState {}

final class AddLikeLoading extends AddLikeState {}

final class AddLikeSuccess extends AddLikeState {}

final class AddLikeFailure extends AddLikeState {
  final String errorMessage;

  AddLikeFailure(this.errorMessage);
}
