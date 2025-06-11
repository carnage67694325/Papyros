part of 'add_group_cubit.dart';

@immutable
sealed class AddGroupState {}

final class AddGroupInitial extends AddGroupState {}

final class AddGroupLoading extends AddGroupState {}

final class AddGroupSuccess extends AddGroupState {}

final class AddGroupFailure extends AddGroupState {
  final String errMessage;

  AddGroupFailure({required this.errMessage});
}
