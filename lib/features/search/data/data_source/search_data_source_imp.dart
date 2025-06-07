import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/search/data/data_source/search_data_source.dart';
import 'package:papyros/features/search/data/models/search_model/search_model.dart';

class SearchDataSourceImp implements SearchDataSource {
  final Dio dio;

  SearchDataSourceImp({required this.dio});

  @override
  Future<SearchModel> search(String query) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.search}$query',
    );
    final data = response.data;

    return SearchModel.fromMap(response.data);
  }
}
