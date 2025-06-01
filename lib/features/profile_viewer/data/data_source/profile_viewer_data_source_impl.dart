import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/profile_viewer/data/data_source/profile_viewer_data_source.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';

class ProfileViewerDataSourceImpl implements ProfileViewerDataSource {
  final Dio dio;

  ProfileViewerDataSourceImpl({required this.dio});
  @override
  Future<UserViewer> getUserProfile(String userId) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.profileViewer}$userId',
    );
    log('${ApiService.baseUrl}${Endpiont.profileViewer}$userId');
    final data = response.data;
    return UserViewer.fromJson(data);
  }
}
