import 'package:papyros/features/search/data/models/search_model/search_model.dart';

abstract class SearchDataSource {
  Future<SearchModel> search(String query);
}
