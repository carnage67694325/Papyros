import 'package:dio/dio.dart';
import 'package:papyros/features/profile%20managment/data/data_sources/profile%20managment%20dau.dart';

import '../../../../core/errors/failure.dart';
import '../models/Userprofile model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> fetchUserProfile(String token) async {
    try {
      final response = await dio.get(
        '/myprofile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {

    }
  }

  @override
  Future<void> updateUserProfile(UserProfileModel profileModel, String token) async {
    try {
      final formData = FormData.fromMap({
        'bio': profileModel.bio,
        'location': profileModel.location,
        'profileimage': await MultipartFile.fromFile(profileModel.profileImage),
        'backimage': await MultipartFile.fromFile(profileModel.backgroundImage),
      });

      await dio.put(
        '/myprofile',
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {

    }
  }

  @override
  Future<void> deleteUserProfile(String password, String token) async {
    try {
      await dio.delete(
        '/myprofile',
        data: {'password': password},
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    } catch (e) {

    }
  }
}
