import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/messaging/data/data_source/messaging_data_source.dart';
import 'package:papyros/features/messaging/domain/entites/contact_entity.dart';

class MessagingDataSourceimp extends MessagingDataSource {
  final Dio dio;

  MessagingDataSourceimp({required this.dio});
  @override
  Future<Map<String, dynamic>> getContacts() async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.getAllusers}',
    );
    final data = response.data;
    return data;
  }
}
