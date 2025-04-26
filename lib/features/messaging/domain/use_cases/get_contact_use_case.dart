import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';
import 'package:papyros/features/messaging/domain/repos/messaging_repo.dart';

class GetContactUseCase {
  final MessagingRepo messagingRepo;

  GetContactUseCase({required this.messagingRepo});
  Future<Either<Failure, List<ContactEntity>>> call() async {
    return await messagingRepo.getContacts();
  }
}
