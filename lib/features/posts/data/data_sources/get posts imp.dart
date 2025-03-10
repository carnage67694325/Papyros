import 'package:dio/dio.dart';
import 'package:papyros/features/posts/data/data_sources/get%20posts.dart';

import '../../../../core/endpoints/endpiont.dart';
import '../../../../core/utils/api_service.dart';

class Getpostsimp implements Getpostsdatasource{
  final Dio dio;
  Getpostsimp(this.dio);
  @override
  Future<Map<String, dynamic>> getallposts(String token)async {
    final response = await dio.get('${ApiService.baseUrl}${Endpiont.allpostsEndpoint}', options: Options(headers: {'token': token}),
    );
    return response.data;
  }




  @override

    Future<Map<String, dynamic>> getonepost(String token,String id)async {
      final response = await dio.get('${ApiService.baseUrl}${Endpiont.allpostsEndpoint}', options: Options(headers: {'token': token,}),
      );
      return response.data;
    }


  }

