part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure({required this.errMessage});
}

final class SearchSuccess extends SearchState {
  final List<UserEntity> userProfileEntityList;

  SearchSuccess({required this.userProfileEntityList});
}
