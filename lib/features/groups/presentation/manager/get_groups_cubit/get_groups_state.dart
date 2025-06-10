part of 'get_groups_cubit.dart';

@immutable
sealed class GetGroupsState {}

final class GetGroupsInitial extends GetGroupsState {}

final class GetGroupsLoading extends GetGroupsState {}

final class GetGroupsSuccess extends GetGroupsState {
  final Groups groups;

  GetGroupsSuccess({required this.groups});
}

final class GetGroupsFailure extends GetGroupsState {
  final String errMessage;

  GetGroupsFailure({required this.errMessage});
}
