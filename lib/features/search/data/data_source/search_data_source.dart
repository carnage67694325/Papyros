import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/search/data/models/search_model/search_model.dart';

abstract class SearchDataSource {
  Future<SearchModel> search(String query);
}
