import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';

abstract class SignInDataSource {
  Future<Response> signIn({required String email, required String pass});
}

class SignInDataSourceImpl implements SignInDataSource {
  final ApiService apiService;

  SignInDataSourceImpl({required this.apiService});
  @override
  Future<Response> signIn({required String email, required String pass}) async {
    var response = apiService.post(
        endpoint: Endpiont.signInEndpiont,
        body: {"email": email, "password": pass});
    return response;
  }
}
