import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/home/data/data_sources/add_like.dart';

class AddLikeImp extends AddLike {
  final ApiService apiService;

  AddLikeImp({required this.apiService});

  @override
  Future<void> addLike({required String token, required String postId}) async {
    apiService.addLike(
        endpoint: Endpiont.addLikeEndpoint + postId, token: token);
  }
}
