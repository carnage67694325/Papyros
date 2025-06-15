import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/chat_bot/data/data_source/send_prompt_data_source.dart';

class SendPromptDataSourceImpl implements SendPromptDataSource {
  final Dio dio;

  SendPromptDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> sendPrompt(
      {required String prompt, String? image}) async {
    final Map<String, dynamic> formDataMap = {
      'text': prompt,
    };
    if (image != null) {
      formDataMap['frontimage'] = await MultipartFile.fromFile(
        image,
        filename: image.split('/').last,
        contentType: MediaType.parse(
          lookupMimeType(image) ?? 'image/png',
        ),
      );
    }
    final formData = FormData.fromMap(formDataMap);
    final response = await dio.post(
        '${ApiService.baseUrl}${Endpiont.chatPotEndpoint}',
        data: formData);

    return response.data;
  }
}
