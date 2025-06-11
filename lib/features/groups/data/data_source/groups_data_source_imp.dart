import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';

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

  @override
  Future<void> addGroup({required String token, required Group group}) async {
    final Map<String, dynamic> formDataMap = {
      'name': group.name,
      'description': group.description,
    };

    // Add frontImage if it exists
    if (group.coverImages?.frontImage != null) {
      formDataMap['frontimage'] = await MultipartFile.fromFile(
        group.coverImages!.frontImage!,
        filename: group.coverImages!.frontImage!.split('/').last,
        contentType: MediaType.parse(
          lookupMimeType(group.coverImages!.frontImage!) ?? 'image/png',
        ),
      );
    }

    // Add backgroundImage if it exists
    if (group.coverImages?.backgroundImage != null) {
      formDataMap['backimage'] = await MultipartFile.fromFile(
        group.coverImages!.backgroundImage!,
        filename: group.coverImages!.backgroundImage!.split('/').last,
        contentType: MediaType.parse(
          lookupMimeType(group.coverImages!.backgroundImage!) ?? 'image/png',
        ),
      );
    }

    final formData = FormData.fromMap(formDataMap);

    log('${ApiService.baseUrl}${Endpiont.addGroup}');

    await dio.post(
      '${ApiService.baseUrl}${Endpiont.addGroup}',
      data: formData,
      options: Options(
        headers: {'token': token},
      ),
    );
  }
}
