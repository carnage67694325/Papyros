import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_up/data/data_sources/Signupdao.dart';
import 'package:papyros/features/authentication/sign_up/data/models/Signup%20Response/signup_response.dart';
import '../../../../../../core/endpoints/endpiont.dart';

class SignupApiImp extends SignupDao {
  ApiService apiService;

  SignupApiImp(this.apiService);

  @override
  Future<Either<SignupResponse, String>> signup({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String phone,
    required String dob,
    required String gender,
  }) async {
    try {
      Response response = await apiService.post(Endpiont.signupEndpiont, body: {
        "firstName": firstname,
        "lastName": lastname,
        "email": email,
        "phone": phone,
        "DOB": dob,
        "gender": gender,
        "password": password,
      });

      if (response.statusCode == 200) {
        SignupResponse signUpResponse = SignupResponse.fromJson(response.data);
        return Left(signUpResponse);
      } else {
        // Log server response message in case of non-200 responses.
        return Right('Unexpected server error: ${response.data}');
      }
    } on DioException catch (error) {
      // Catch Dio errors and log them for debugging.
      if (error.response != null) {
        // Server responded with an error status code (like 500)
        return Right(
            'Server error: ${error.response?.statusCode} - ${error.response?.data}');
      } else {
        // Error occurred without server response (e.g., network issue)
        return Right('Network error: ${error.message}');
      }
    } catch (error) {
      return Right('Unexpected error: ${error.toString()}');
    }
  }
}
