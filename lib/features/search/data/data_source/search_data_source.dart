import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';

abstract class SearchDataSource {
  Future<UserProfileEntity> search(String query);
}
