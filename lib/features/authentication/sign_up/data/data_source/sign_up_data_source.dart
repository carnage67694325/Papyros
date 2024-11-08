import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_up/data/models/sign_up_model.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpDataSource {
  Future<SignUpEntity> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String dob,
  });
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final ApiService apiService;

  SignUpDataSourceImpl({required this.apiService});
  @override
  Future<SignUpEntity> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone,
      required String gender,
      required String dob}) async {
    var response =
        await apiService.post(endpoint: Endpiont.signInEndpiont, body: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'DOB': dob,
      'gender': gender,
      'password': password,
    });
    return SignUpModel.fromJson(response);
  }
}
