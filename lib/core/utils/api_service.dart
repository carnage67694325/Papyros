import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:injectable/injectable.dart';
// @singleton
class ApiService {
  static final _baseUrl = dotenv.env['Base_Url'];
  final Dio _dio;
  ApiService(this._dio);
  Future<List<dynamic>> get({required String endPoints}) async {
    Response response = await _dio.get('$_baseUrl$endPoints');
    return response.data;
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) {
    return _dio.post(endpoint, data: body);
  }
}
