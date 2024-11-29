import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/features/profile_management/data/data_sources/profile_managment_dau.dart';

import '../../../../core/errors/failure.dart';
import '../models/Userprofile_model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> fetchUserProfile(String token) async {
    final response = await dio.get(
      '/myprofile',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data;
  }

  @override
  Future<void> updateUserProfile(
      UserProfileModel profileModel, String token) async {
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
  }

  @override
  Future<void> deleteUserProfile(String password, String token) async {
    await dio.delete(
      '/myprofile',
      data: {'password': password},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
