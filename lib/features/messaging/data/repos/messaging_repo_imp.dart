import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/data/data_source/messaging_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';
import 'package:papyros/features/messaging/domain/repos/messaging_repo.dart';

class MessagingRepoImp extends MessagingRepo {
  final MessagingDataSource dataSource;

  MessagingRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, List<ContactEntity>>> getContacts() async {
    try {
      final contacts = await dataSource.getContacts();
      return Right(contacts);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
