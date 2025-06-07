part of 'repost_cubit.dart';

@immutable
sealed class RepostState {}

final class RepostInitial extends RepostState {}

final class RepostLoading extends RepostState {}

final class RepostFaiulre extends RepostState {
  final String errMessage;

  RepostFaiulre(this.errMessage);
}

final class RepostSuccess extends RepostState {}
