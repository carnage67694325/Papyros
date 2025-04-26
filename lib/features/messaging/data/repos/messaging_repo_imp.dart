import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/messaging/data/data_source/messaging_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';
import 'package:papyros/features/messaging/domain/repos/messaging_repo.dart';

class MessagingRepoImp implements MessagingRepo {
  final MessagingDataSource dataSource;

  MessagingRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, List<ContactEntity>>> getContacts() async {
    try {
      final response =
          await dataSource.getContacts(); // response is Map<String, dynamic>

      final List<ContactEntity> contacts = (response['data'] as List)
          .map((item) => ContactEntity(
                id: item['_id'] as String?,
                name: item['userName'] as String?,
                profileImage: item['profileImage'] as String?,
              ))
          .toList();

      return Right(contacts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
