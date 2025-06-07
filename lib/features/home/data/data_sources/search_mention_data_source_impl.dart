import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/home/data/data_sources/search_mention_data_source.dart';
import 'package:papyros/features/home/data/models/mention_model/mention_model.dart';

class SearchMentionDataSourceImpl implements SearchMentionDataSource {
  final Dio dio;

  SearchMentionDataSourceImpl({required this.dio});
  @override
  Future<MentionModel> searchMention(
      {required String query, required String token}) async {
    final response = await dio.get(
        '${ApiService.baseUrl}${Endpiont.searchMention}$query',
        options: Options(headers: {'token': token}));
    final data = response.data;

    return MentionModel.fromJson(data);
  }
}
