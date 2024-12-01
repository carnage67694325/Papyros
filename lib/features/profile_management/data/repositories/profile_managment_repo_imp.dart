import 'dart:developer';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/Prefernces/Shaerdperefeancses.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repositories/profile_managment_repo.dart';
import '../data_sources/profile_managment_dau.dart';
import '../models/User_profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final PrefasHandelr tokenHandler;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenHandler,
  });

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile() async {
    try {
      final token = await tokenHandler.getAuthToken();

      final data = await remoteDataSource.fetchUserProfile(token!);
      return right(UserProfileModel.fromJson(data['user']));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile(
    UserProfileEntity profile,
  ) async {
    try {
      final token = await tokenHandler.getAuthToken();
      final profileModel = UserProfileModel(
        userName: profile.userName!,
        firstName: profile.firstName!,
        lastName: profile.lastName!,
        email: profile.email!,
        phone: profile.phone!,
        bio: profile.bio!,
        profileImage: profile.profileImage,
        backgroundImage: profile.backgroundImage,
        location: profile.location!,
        dob: profile.dob!,
        gender: profile.gender!,
      );

      await remoteDataSource.updateUserProfile(profileModel, token!);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserProfile(
      {required String password, required String token}) async {
    try {
      await remoteDataSource.deleteUserProfile(password, token);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
