import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/home/data/data_sources/repost_data_source.dart';

class RepostDataSourceImp implements RepostDataSource {
  final Dio dio;

  RepostDataSourceImp({required this.dio});
  @override
  Future<void> repost({required String token, required String postId}) async {
    await dio.post('${ApiService.baseUrl}${Endpiont.repost}$postId',
        options: Options(headers: {
          'token': token,
        }));
  }
}
