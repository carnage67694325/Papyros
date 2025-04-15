import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_in/data/model/sign_in_model.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';

abstract class SignInDataSource {
  Future<SignInEntity> signIn({required String email, required String pass});
}

class SignInDataSourceImpl implements SignInDataSource {
  final ApiService apiService;

  SignInDataSourceImpl({required this.apiService});
  @override
  Future<SignInEntity> signIn(
      {required String email, required String pass}) async {
    var response = await apiService.post(
        endpoint: Endpiont.signInEndpiont,
        body: {"email": email, "password": pass});
    if (response['token'] != null) {
      final token = response['token'];
      await PrefasHandelr.storeToken(
          token); // Store the token in SharedPreferences
    }
    return SigninModel.fromJson(response);
  }
}
