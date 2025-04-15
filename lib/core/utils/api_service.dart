import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:injectable/injectable.dart';
// @singleton
class ApiService {
  static final baseUrl = dotenv.env['Base_Url'];
  static final baseChatBotUrl = dotenv.env['Base_Chat_Bot_Url'];

  final Dio dio;

  ApiService(this.dio) {
    // Setting up Dio timeouts
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.sendTimeout = const Duration(seconds: 60);
  }

  Future<List<dynamic>> get({required String endPoints}) async {
    Response response = await dio.get('$baseUrl$endPoints');
    return response.data;
  }

  Future<Map<String, dynamic>> postPrompt(
      {required String endPoint, required Map<String, dynamic>? body}) async {
    var response = await dio.post('$baseChatBotUrl$endPoint',
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}));
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic>? body}) async {
    var response = await dio.post('$baseUrl$endpoint',
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}));
    return response.data;
  }

  Future<Map<String, dynamic>> addLike(
      {required String endpoint, required token}) async {
    var response = await dio.post('$baseUrl$endpoint',
        options: Options(headers: {'token': 'token'}));
    return response.data;
  }
}
