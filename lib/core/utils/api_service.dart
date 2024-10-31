import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final _baseUrl = dotenv.env['Base_Url'];
  final Dio _dio;
  ApiService(this._dio);
  Future<List<dynamic>> get({required String endPoints}) async {
    Response response = await _dio.get('$_baseUrl$endPoints');
    return response.data;
  }
}
