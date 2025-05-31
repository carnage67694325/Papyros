import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/profile_management/data/models/User_profile_model.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/search/data/data_source/search_data_source.dart';

class SearchDataSourceImp implements SearchDataSource {
  final Dio dio;

  SearchDataSourceImp({required this.dio});

  @override
  Future<UserProfileEntity> search(String query) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.search}$query',
    );
    final data = response.data;

    return UserProfileModel.fromJson(data);
  }
}
