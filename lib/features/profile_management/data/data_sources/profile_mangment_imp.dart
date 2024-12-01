import 'dart:io';
import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/profile_management/data/data_sources/profile_managment_dau.dart';
import '../models/User_profile_model.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> fetchUserProfile(String token) async {
    final response = await dio.get(
      '${ApiService.baseUrl}${Endpiont.myProflieEndpoint}',
      options: Options(headers: {'token': token}),
    );
    return response.data;
  }

  @override
  Future<void> updateUserProfile(
      UserProfileModel profileModel, String token) async {
    // Prepare the form data
    final formData = FormData.fromMap({
      'bio': profileModel.bio,
      'location': profileModel.location,
      // Ensure profile image is valid before adding to the form
      if (await File(profileModel.profileImage!).exists())
        'profileimage': await MultipartFile.fromFile(
          profileModel.profileImage!,
          filename: profileModel.profileImage!.split('/').last,
        ),
      // Ensure background image is valid before adding to the form
      if (await File(profileModel.backgroundImage!).exists())
        'backimage': await MultipartFile.fromFile(
          profileModel.backgroundImage!,
          filename: profileModel.backgroundImage!.split('/').last,
        ),
    });

    await dio.put(
      '${ApiService.baseUrl}${Endpiont.myProflieEndpoint}',
      data: formData,
      options: Options(headers: {'token': token}),
    );
  }

  @override
  Future<void> deleteUserProfile(String password, String token) async {
    await dio.delete(
      '${ApiService.baseUrl}${Endpiont.myProflieEndpoint}',
      data: {'password': password},
      options: Options(headers: {'token': token}),
    );
  }
}
