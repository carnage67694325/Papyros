import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:injectable/injectable.dart';
// @singleton
class ApiService {
  static final _baseUrl = dotenv.env['Base_Url'];
  final Dio dio;

  ApiService(this.dio) {
    // Setting up Dio timeouts
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.sendTimeout = const Duration(seconds: 10);
  }

  Future<List<dynamic>> get({required String endPoints}) async {
    Response response = await dio.get('$_baseUrl$endPoints');
    return response.data;
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? body}) {
    return dio.post(
      '$_baseUrl$endpoint',
      data: body,
    );
  }
}
