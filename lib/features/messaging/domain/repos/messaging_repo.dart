import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';

abstract class MessagingRepo {
  Future<Either<Failure, List<ContactEntity>>> getContacts();
}
