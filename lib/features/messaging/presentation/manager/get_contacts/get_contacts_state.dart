part of 'get_contacts_cubit.dart';

@immutable
sealed class GetContactsState {}

final class GetContactsInitial extends GetContactsState {}

final class GetContactsLoading extends GetContactsState {}

final class GetContactsFaliure extends GetContactsState {}

final class GetContactsSuccess extends GetContactsState {
  final List<ContactEntity> contacts;
  GetContactsSuccess(this.contacts);
}
