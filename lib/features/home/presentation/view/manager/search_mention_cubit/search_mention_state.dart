part of 'search_mention_cubit.dart';

@immutable
sealed class SearchMentionState {}

final class SearchMentionInitial extends SearchMentionState {}

final class SearchMentionLoading extends SearchMentionState {}

final class SearchMentionFailure extends SearchMentionState {
  final String errMessage;

  SearchMentionFailure({required this.errMessage});
}

final class SearchMentionSuccess extends SearchMentionState {
  final List<Datum> userToMention;

  SearchMentionSuccess({required this.userToMention});
}
