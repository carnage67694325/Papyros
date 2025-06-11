part of 'get_single_group_cubit.dart';

@immutable
sealed class GetSingleGroupState {}

final class GetSingleGroupInitial extends GetSingleGroupState {}

final class GetSingleGroupLoading extends GetSingleGroupState {}

final class GetSingleGroupSuccess extends GetSingleGroupState {
  final SingleGroupModel group;

  GetSingleGroupSuccess({required this.group});
}

final class GetSingleGroupFailure extends GetSingleGroupState {
  final String errMessage;

  GetSingleGroupFailure({required this.errMessage});
}
