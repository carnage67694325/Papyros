import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source.dart';

class GroupsDataSourceImp implements GroupsDataSource {
  final Dio dio;

  GroupsDataSourceImp({required this.dio});
  @override
  Future<Map<String, dynamic>> getGroups({required String token}) async {
    final String url = '${ApiService.baseUrl}${Endpiont.getGroups}';

    final response =
        await dio.get(url, options: Options(headers: {'token': token}));

    return response.data;
  }
}
