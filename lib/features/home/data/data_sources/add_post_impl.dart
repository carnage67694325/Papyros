import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/home/data/data_sources/add_post.dart';
import 'package:papyros/features/home/data/models/Posts.dart';

class AddPostImpl extends AddPost {
  final Dio dio;

  AddPostImpl({required this.dio});

  @override
  Future<void> addPost({String? token, PostModel? post}) async {
    final formData = FormData.fromMap({
      'tag': post!.tag,
      'description': post.description,
      'image': await MultipartFile.fromFile(
        post.images![0].image!,
        filename: post.images![0].image!.split('/').last,
        contentType: MediaType.parse(
            lookupMimeType(post.images![0].image!) ?? 'image/png'),
      )
    });
    await dio.put(
      '${ApiService.baseUrl}${Endpiont.myProflieEndpoint}',
      data: formData,
      options: Options(
        headers: {'token': token},
      ),
    );
  }
}
