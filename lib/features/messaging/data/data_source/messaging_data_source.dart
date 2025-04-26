import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';

abstract class MessagingDataSource {
  Future<List<ContactEntity>> getContacts();
}
