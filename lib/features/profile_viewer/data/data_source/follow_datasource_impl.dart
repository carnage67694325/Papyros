import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/profile_viewer/data/data_source/follow_datascoure.dart';

class FollowDatasourceImpl implements FollowDatascoure {
  final Dio dio;
  FollowDatasourceImpl({required this.dio});
  @override
  Future<void> follow({required String token, required String userId}) async {
    log(userId);
    await dio.get('${ApiService.baseUrl}${Endpiont.followUser}$userId',
        options: Options(headers: {'token': token}));
  }
}
