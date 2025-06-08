import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:papyros/features/home/data/data_sources/get_posts.dart';

import '../../../../core/endpoints/endpiont.dart';
import '../../../../core/utils/api_service.dart';

class GetPostsImp implements Getpostsdatasource {
  final Dio dio;
  GetPostsImp(this.dio);
  @override
  Future<Map<String, dynamic>> getallposts() async {
    final String url = '${ApiService.baseUrl}${Endpiont.allpostsEndpoint}';
    log(url);
    final response = await dio.get(
      url,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getonepost(String token, String id) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.allpostsEndpoint}',
      options: Options(headers: {
        'token': token,
      }),
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getRecommendPosts(
      {required String token}) async {
    final String url = '${ApiService.baseUrl}${Endpiont.recommePostsEndpoint}';
    log(url);
    final response =
        await dio.get(url, options: Options(headers: {'token': token}));

    return response.data;
  }
}
