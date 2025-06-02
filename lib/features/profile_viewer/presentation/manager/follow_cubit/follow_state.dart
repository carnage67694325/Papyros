part of 'follow_cubit.dart';

@immutable
sealed class FollowState {}

final class FollowInitial extends FollowState {}

final class FollowLoading extends FollowState {}

final class FollowSuccess extends FollowState {}

final class FollowFailure extends FollowState {
  final String errMessage;

  FollowFailure({required this.errMessage});
}
